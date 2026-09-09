#!/usr/bin/env pwsh
# Copyright (c) Microsoft Corporation.
# SPDX-License-Identifier: MIT
#Requires -Version 7.0

<#
.SYNOPSIS
    Deterministic pre-critic validator for a single Proposal Judge evaluation.

.DESCRIPTION
    Runs the mechanical, non-judgment checks that previously required a full LLM
    Critic call for every team: scorecard structure, rubric weights for the
    classified space, per-row weighted-score arithmetic, the five-row sum versus
    the stated total, disclaimer presence, and space classification presence. It
    also detects whether the evaluation carries human-review flags.

    It does NOT make subjective judgments (evidence grounding, bias, risk-transfer
    interpretation). Instead it emits a routing decision so the orchestrator can
    invoke the LLM Critic ONLY when judgment is actually needed:

      NeedsCritic = true when ANY of the following hold
        - a deterministic check FAILED (structure/weights/arithmetic/disclaimer)
        - the evaluation carries one or more human-review flags
        - the stated total is in the borderline band (<= BorderlineLow or >= BorderlineHigh)
        - the scorecard could not be parsed with confidence (fail-safe: escalate)

    When NeedsCritic is false, the arithmetic and rubric are already proven correct
    and no human-review flags exist, so the orchestrator can finalize without a
    second LLM pass.

.PARAMETER Path
    Path to the finalized (or draft) per-team evaluation Markdown file to validate.

.PARAMETER BorderlineLow
    Stated totals at or below this value escalate to the Critic. Default 60.

.PARAMETER BorderlineHigh
    Stated totals at or above this value escalate to the Critic. Default 90.

.PARAMETER AsJson
    Emit the result object as a single JSON line (for the orchestrator to parse)
    instead of the human-readable console report.

.EXAMPLE
    ./.github/scripts/Test-Evaluation.ps1 -Path 'Results/run-20260909-131517/TEAM_B-evaluation.md'

.EXAMPLE
    # Machine-readable routing decision for the orchestrator:
    ./.github/scripts/Test-Evaluation.ps1 -Path '<eval>.md' -AsJson

.NOTES
    Exit codes: 0 = all deterministic checks passed; 1 = one or more checks failed;
    2 = the file could not be read or the scorecard could not be parsed. In every
    case (0/1/2) NeedsCritic in the result tells the orchestrator whether to run the
    LLM Critic.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [Parameter(Mandatory = $false)]
    [double]$BorderlineLow = 60,

    [Parameter(Mandatory = $false)]
    [double]$BorderlineHigh = 90,

    [Parameter(Mandatory = $false)]
    [switch]$AsJson
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

#region Functions

function New-CheckResult {
    param(
        [string]$Name,
        [bool]$Passed,
        [string]$Detail
    )
    return [pscustomobject]@{
        Name   = $Name
        Passed = $Passed
        Detail = $Detail
    }
}

function Get-ExpectedWeights {
    param([string]$Space)
    switch ($Space) {
        'Presales' { return @(25, 25, 20, 20, 10) }
        'Delivery' { return @(20, 20, 20, 20, 20) }
        default { return @() }
    }
}

function Get-Classification {
    param([string]$Text)
    # Look for an explicit classification statement, preferring the labeled line.
    $labeled = [regex]::Match(
        $Text,
        '(?im)^\s*(?:\**\s*)?(?:Space|Workshop\s+space\s+classification|Classification)\s*(?:\**)?\s*[:|]\s*(?:\**\s*)?(Presales|Delivery)'
    )
    if ($labeled.Success) { return $labeled.Groups[1].Value }

    if ([regex]::IsMatch($Text, '(?i)Workshop\s+space\s+unresolved')) { return 'Unresolved' }

    $presales = ([regex]::Matches($Text, '(?i)\bPresales\b')).Count
    $delivery = ([regex]::Matches($Text, '(?i)\bDelivery\b')).Count
    if ($presales -eq 0 -and $delivery -eq 0) { return $null }
    return ($presales -ge $delivery) ? 'Presales' : 'Delivery'
}

function Get-ScorecardRows {
    <#
        Parse the first Markdown table whose header names Weight, Rating, and
        Weighted. Returns a list of rows with numeric Weight/Rating/Weighted or
        $null when no such table is found.
    #>
    param([string[]]$Lines)

    $headerIndex = -1
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        $line = $Lines[$i]
        if ($line -match '^\s*\|' -and
            $line -match '(?i)weight' -and
            $line -match '(?i)rating' -and
            $line -match '(?i)weighted') {
            $headerIndex = $i
            break
        }
    }
    if ($headerIndex -lt 0) { return $null }

    # Map columns from the header cells.
    $headerCells = ($Lines[$headerIndex].Trim().Trim('|') -split '\|') | ForEach-Object { $_.Trim() }
    $weightCol = -1; $ratingCol = -1; $weightedCol = -1
    for ($c = 0; $c -lt $headerCells.Count; $c++) {
        $h = $headerCells[$c]
        if ($weightedCol -lt 0 -and $h -match '(?i)weighted') { $weightedCol = $c; continue }
        if ($weightCol -lt 0 -and $h -match '(?i)weight') { $weightCol = $c; continue }
        if ($ratingCol -lt 0 -and $h -match '(?i)rating') { $ratingCol = $c; continue }
    }
    if ($weightCol -lt 0 -or $ratingCol -lt 0 -or $weightedCol -lt 0) { return $null }

    $rows = [System.Collections.Generic.List[object]]::new()
    for ($i = $headerIndex + 1; $i -lt $Lines.Count; $i++) {
        $line = $Lines[$i].Trim()
        if ($line -notmatch '^\|') { break }                       # table ended
        if ($line -match '^\|?\s*[:\- ]+\|') { continue }          # separator row
        $cells = ($line.Trim('|') -split '\|') | ForEach-Object { $_.Trim() }
        $maxCol = @($weightCol, $ratingCol, $weightedCol | Measure-Object -Maximum).Maximum
        if ($cells.Count -le $maxCol) { continue }

        $weightText = ($cells[$weightCol] -replace '[^\d.]', '')
        $ratingText = ([regex]::Match($cells[$ratingCol], '\d+(?:\.\d+)?')).Value
        $weightedText = ($cells[$weightedCol] -replace '[^\d.]', '')
        if ([string]::IsNullOrWhiteSpace($weightText) -or
            [string]::IsNullOrWhiteSpace($ratingText) -or
            [string]::IsNullOrWhiteSpace($weightedText)) { continue }

        $rows.Add([pscustomobject]@{
                Criterion = $cells[0]
                Weight    = [double]$weightText
                Rating    = [double]$ratingText
                Weighted  = [double]$weightedText
            })
    }
    if ($rows.Count -eq 0) { return $null }
    return $rows
}

function Get-StatedTotal {
    <#
        Extract the stated final score. Prefer a value near a "Final score"
        heading; fall back to the largest "<n>/100" in the document.
    #>
    param([string]$Text)

    $near = [regex]::Match($Text, '(?is)Final\s+score[^\n]*?(\d{1,3}(?:\.\d)?)\s*/\s*100')
    if ($near.Success) { return [double]$near.Groups[1].Value }

    $near2 = [regex]::Match($Text, '(?is)Final\s+score[^\n]*?[:=]\s*(\d{1,3}(?:\.\d)?)')
    if ($near2.Success) { return [double]$near2.Groups[1].Value }

    $all = [regex]::Matches($Text, '(\d{1,3}(?:\.\d)?)\s*/\s*100')
    if ($all.Count -gt 0) {
        return ($all | ForEach-Object { [double]$_.Groups[1].Value } | Measure-Object -Maximum).Maximum
    }
    return $null
}

function Test-Evaluation {
    param(
        [string]$FilePath,
        [double]$BorderlineLow,
        [double]$BorderlineHigh
    )

    $checks = [System.Collections.Generic.List[object]]::new()
    $result = [ordered]@{
        Path         = $FilePath
        Parsed       = $false
        Space        = $null
        StatedTotal  = $null
        ComputedTotal = $null
        HasFlags     = $false
        Checks       = @()
        Failures     = @()
        NeedsCritic  = $true
        Reasons      = @()
    }

    if (-not (Test-Path -LiteralPath $FilePath)) {
        $result.Reasons = @("File not found: $FilePath")
        return [pscustomobject]$result
    }

    $text = Get-Content -LiteralPath $FilePath -Raw -Encoding UTF8
    $lines = $text -split '\r?\n'

    # Classification present
    $space = Get-Classification -Text $text
    $result.Space = $space
    $classOk = $space -in @('Presales', 'Delivery')
    $checks.Add((New-CheckResult 'Classification' $classOk (
                $classOk ? "Classified as $space" : "No single Presales/Delivery classification found (got '$space')")))

    # Scorecard parse + rubric + arithmetic
    $rows = if ($lines) { Get-ScorecardRows -Lines $lines } else { $null }
    if ($null -eq $rows) {
        $checks.Add((New-CheckResult 'ScorecardParse' $false 'Could not locate a scorecard table with Weight/Rating/Weighted columns.'))
    }
    else {
        $result.Parsed = $true
        $checks.Add((New-CheckResult 'ScorecardParse' $true "Parsed $($rows.Count) scorecard rows."))

        # Exactly five criteria
        $fiveOk = $rows.Count -eq 5
        $checks.Add((New-CheckResult 'FiveCriteria' $fiveOk "Found $($rows.Count) criteria (expected 5)."))

        # Weights match the classified space (order-independent multiset)
        $expected = Get-ExpectedWeights -Space $space
        $weightsOk = $false
        if ($expected.Count -eq 5 -and $rows.Count -eq 5) {
            $got = ($rows.Weight | Sort-Object)
            $exp = ($expected | Sort-Object)
            $weightsOk = -not (Compare-Object $got $exp)
        }
        $checks.Add((New-CheckResult 'RubricWeights' $weightsOk (
                    "Weights [$(( $rows.Weight ) -join ', ')] vs expected [$(( $expected ) -join ', ')] for $space.")))

        # Ratings in 0-5
        $ratingBad = @($rows | Where-Object { $_.Rating -lt 0 -or $_.Rating -gt 5 })
        $ratingOk = $ratingBad.Count -eq 0
        $checks.Add((New-CheckResult 'RatingRange' $ratingOk (
                    $ratingOk ? 'All ratings within 0-5.' : "$($ratingBad.Count) rating(s) outside 0-5.")))

        # Per-row weighted score = weight * rating / 5 (one decimal)
        $rowMismatch = [System.Collections.Generic.List[string]]::new()
        $computed = 0.0
        foreach ($r in $rows) {
            $expectedWeighted = [math]::Round(($r.Weight * $r.Rating / 5), 1)
            $computed += $expectedWeighted
            if ([math]::Abs($expectedWeighted - $r.Weighted) -gt 0.05) {
                $rowMismatch.Add("'$($r.Criterion)': stated $($r.Weighted), expected $expectedWeighted (=$($r.Weight)x$($r.Rating)/5)")
            }
        }
        $computed = [math]::Round($computed, 1)
        $result.ComputedTotal = $computed
        $rowOk = $rowMismatch.Count -eq 0
        $checks.Add((New-CheckResult 'RowArithmetic' $rowOk (
                    $rowOk ? 'Every weighted score equals weight x rating / 5.' : ($rowMismatch -join '; '))))

        # Sum equals stated total
        $stated = Get-StatedTotal -Text $text
        $result.StatedTotal = $stated
        if ($null -eq $stated) {
            $checks.Add((New-CheckResult 'TotalSum' $false "No stated '/100' total found to compare against computed $computed."))
        }
        else {
            $sumOk = [math]::Abs($computed - $stated) -le 0.05
            $checks.Add((New-CheckResult 'TotalSum' $sumOk (
                        $sumOk ? "Stated total $stated matches computed $computed." : "Stated total $stated does not match computed $computed.")))
        }
    }

    # Disclaimer present
    $disclaimerOk = [regex]::IsMatch($text, '(?i)Final workshop judgment remains with the human jury')
    $checks.Add((New-CheckResult 'Disclaimer' $disclaimerOk (
                $disclaimerOk ? 'Human-jury disclaimer present.' : 'Human-jury disclaimer missing.')))

    # Human-review flags detection (routing signal, not a pass/fail)
    $hasFlags = [regex]::IsMatch($text, '(?im)human[- ]review flag') -or
                [regex]::IsMatch($text, '(?im)\[CRITICAL\]') -or
                [regex]::IsMatch($text, '(?im)instruction[- ]override') -or
                [regex]::IsMatch($text, '(?im)risk transfer')
    $result.HasFlags = $hasFlags

    $result.Checks = $checks
    $result.Failures = @($checks | Where-Object { -not $_.Passed } | ForEach-Object { $_.Name })

    # Routing decision
    $reasons = [System.Collections.Generic.List[string]]::new()
    if ($result.Failures.Count -gt 0) { $reasons.Add("deterministic checks failed: $($result.Failures -join ', ')") }
    if ($hasFlags) { $reasons.Add('human-review flags present') }
    if (-not $result.Parsed) { $reasons.Add('scorecard not parseable (fail-safe escalation)') }
    if ($null -ne $result.StatedTotal) {
        if ($result.StatedTotal -le $BorderlineLow) { $reasons.Add("stated total $($result.StatedTotal) <= borderline-low $BorderlineLow") }
        elseif ($result.StatedTotal -ge $BorderlineHigh) { $reasons.Add("stated total $($result.StatedTotal) >= borderline-high $BorderlineHigh") }
    }
    $result.NeedsCritic = $reasons.Count -gt 0
    $result.Reasons = @($reasons)

    return [pscustomobject]$result
}

#endregion Functions

#region Main Execution

if ($MyInvocation.InvocationName -ne '.') {
    try {
        $evaluation = Test-Evaluation -FilePath $Path -BorderlineLow $BorderlineLow -BorderlineHigh $BorderlineHigh

        if ($AsJson) {
            $evaluation | ConvertTo-Json -Depth 6 -Compress
        }
        else {
            Write-Host ""
            Write-Host "Validator: $(Split-Path -Leaf $Path)" -ForegroundColor Cyan
            Write-Host "  Space: $($evaluation.Space)   Stated: $($evaluation.StatedTotal)   Computed: $($evaluation.ComputedTotal)   Flags: $($evaluation.HasFlags)"
            foreach ($c in $evaluation.Checks) {
                $mark = $c.Passed ? '✅' : '❌'
                $color = $c.Passed ? 'Green' : 'Red'
                Write-Host "  $mark $($c.Name): $($c.Detail)" -ForegroundColor $color
            }
            if ($evaluation.NeedsCritic) {
                Write-Host "  → NeedsCritic: TRUE ($($evaluation.Reasons -join '; '))" -ForegroundColor Yellow
            }
            else {
                Write-Host "  → NeedsCritic: FALSE (arithmetic + rubric proven, no flags, not borderline)" -ForegroundColor Green
            }
        }

        if (-not $evaluation.Parsed) { exit 2 }
        if ($evaluation.Failures.Count -gt 0) { exit 1 }
        exit 0
    }
    catch {
        Write-Error -ErrorAction Continue "Test-Evaluation failed: $($_.Exception.Message)"
        exit 2
    }
}

#endregion Main Execution
