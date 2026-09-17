---
title: AI-First Proposal Judge
description: Evidence-based judging for Presales and Delivery workshop proposals
---

Evidence-based judging of workshop proposals. Drop submissions in a folder, run one command, and get scored reports plus cross-team learnings for a human jury. The AI never picks a winner — the panel decides.

## Folders

| Folder | Purpose |
|--------|---------|
| `Knowledge/` | Contains the single authoritative grounding file. |
| `WorkShopSubmission/` | **One folder per team.** Each team's folder holds one or more artefacts of any mix: documents (`.docx`, `.pptx`, `.txt`, legacy `.doc`/`.ppt`), **spreadsheets** (`.xlsx`, legacy `.xls`, `.csv`), **prototypes and wireframes** (`.html`, `.css`, `.js`/`.ts`, other code, `.svg`), and **images** (`.png`, `.jpg`). A loose accepted file at the root is treated as a single-file team. |
| `Results/` | Generated reports, written to a timestamped `run-<timestamp>/` subfolder per run. |
| `docs/` | Automation and distribution design. |

Each artefact has its own configurable path in `judge.config.json` — `knowledgePath`, `submissionsPath`, and `resultsPath`. Point them at local folders (which may be synced OneDrive/SharePoint folders), or set `sharepoint.enabled = true` to pull/push each artefact directly from its own **SharePoint Online** library folder (see [SharePoint](#sharepoint-artefacts) below).

### Knowledge source

`Knowledge/manager-day-contoso-challenges.md` is the only grounding source. It contains customer facts, Presales and Delivery space-detection signals, scenarios, both five-criterion rubrics, and judging guidance.

Each team is either **Presales** or **Delivery**. The Judge classifies the submission from its evidence, applies only that space's 100-point rubric, and never compares scores across the two spaces.

## Agents

| Agent | Role |
|-------|------|
| **Proposal Judge Orchestrator** | Runs the whole pipeline: grounds on `Knowledge/`, judges all teams in parallel, runs the fast checker, writes reports. |
| **Proposal Judge** | Scores **one** submission against the rubric with cited evidence, gaps, and flags. |
| **Proposal Judge Critic** | Optional deep review: independently verifies an evaluation (grounding, evidence, arithmetic, bias) and returns PASS or REVISE. Runs only when you ask. |

A fast built-in checker (`Test-Evaluation.ps1`) runs automatically on every report — no AI call — to confirm the maths, rubric, and score add up, and to flag anything a human should look at.

## Workflow

```
Single knowledge file ──► Orchestrator (reads config, opens Results/run-<timestamp>/)
                      │  extract each team folder once, then judge all teams in parallel:
                      ▼
                   Judge (all teams) ──► fast checker ──► run-<timestamp>/<team>-evaluation.md
                      │
                      ▼
             run-<timestamp>/00-cross-submission-summary.md
                      │
                      ▼  (optional, on request)
             Robust critic review of flagged teams
```

1. Orchestrator reads the single authoritative knowledge file once and reads `judge.config.json`.
2. It opens **one** timestamped run folder for the request, discovers **teams** (each subfolder of the submissions path), and extracts each team's whole folder in a single pass. Prototypes/wireframes (HTML/code/SVG) are read as source and cited by line; raster images are viewed with a multimodal viewer.
3. All teams are judged **in parallel** (bounded by `maxParallelTeams`), each fully isolated. The Judge classifies each as Presales or Delivery and applies only the matching five-criterion rubric.
4. The **fast checker** verifies every report automatically (maths, rubric weights, score total) and flags any team needing a closer human look. Per-team Markdown reports are written to the run folder.
5. A cross-submission summary opens with a **Top Teams (for announcement)** section listing the top 3 Delivery and top 3 Presales teams in descending score order — each with one crisp, factual reason for its score — followed by separate Presales and Delivery score tables plus shared takeaways, and the teams recommended for deeper review. Ranking is within a space only; cross-space ranking is prohibited.
6. **Optional:** ask for a **robust critic review** and the orchestrator runs a deep AI verification of the flagged teams (or all teams) and applies any corrections.

### Why it's fast

- **Fast by default:** judging runs in parallel and the automatic checker is a local script, not an AI call — so a full run finishes quickly. The deeper AI critic is a separate step you run only when you want extra assurance.
- **Parallel teams:** all teams are judged concurrently instead of one-at-a-time.
- **Extract once, stage once:** each team folder is parsed a single time into `Results/run-<timestamp>/intake/<team>.md` and reused everywhere; one run folder is created per request.

## Input types

Each team gets a folder under `WorkShopSubmission/`; drop any mix of the following inside it (a team may submit several files):

- **Documents / decks:** DOCX, PPTX, TXT, MD (legacy DOC/PPT via Office COM).
- **Spreadsheets:** XLSX and CSV (legacy XLS via Office COM) — read row-by-row so backlogs and workbooks are cited by sheet and row. If Office/COM is unavailable, a legacy file is marked *Not evidenced* and flagged for human review rather than guessed.
- **Prototypes / wireframes / code:** HTML, CSS, JS/TS, and other code files, plus SVG — read as source and evaluated for functional correctness, UX, accessibility, and security (secrets, XSS, missing auth, disabled citations, autonomy without approval).
- **Images:** PNG/JPG wireframes are viewed with a multimodal viewer; if none is available they are marked *Not evidenced* and a text/HTML alternative is requested.

## Automation & distribution

- **Trigger on file drop:** point `submissionsPath` at a synced OneDrive/SharePoint folder and run `./.github/scripts/Watch-Submissions.ps1` to stage a timestamped run when files land. Full cloud auto-trigger (Power Automate / Logic Apps / Azure Function) is designed in [docs/AUTOMATION-AND-DISTRIBUTION.md](docs/AUTOMATION-AND-DISTRIBUTION.md).

### SharePoint artefacts

To work directly against SharePoint Online instead of a synced folder, edit the `sharepoint` block in `judge.config.json`:

```json
"sharepoint": {
  "enabled": true,
  "siteUrl": "https://contoso.sharepoint.com/sites/ManagerDay",
  "knowledgeFolder": "Shared Documents/ManagerDay/Knowledge",
  "submissionsFolder": "Shared Documents/ManagerDay/Submissions",
  "resultsFolder": "Shared Documents/ManagerDay/Results",
  "clientId": "<your-entra-app-client-id>",
  "tenantId": "<your-tenant-id>",
  "auth": "interactive"
}
```

Each artefact points at its own SharePoint library folder. When enabled, the orchestrator runs `.github/scripts/Sync-SharePoint.ps1 -Action Download` to pull Knowledge and Submissions into the local `knowledgePath`/`submissionsPath`, judges locally, then runs `-Action Upload` to publish the finished run folder under `resultsFolder`. Requires the `PnP.PowerShell` module (`Install-Module PnP.PowerShell -Scope CurrentUser`) and an Entra app registration whose client id is set in `clientId`.
- **Share it:** clone this repo as a template (replace the `Knowledge/` docs), or package the agents as an hve-core plugin / VS Code extension. See the same doc.

## How to run

- Type `/judge-proposals` in chat (optionally name one file), or
- Pick **Proposal Judge Orchestrator** in the agent picker and say *"Judge all submissions."*

You get scored reports and a cross-team summary fast. The orchestrator then tells you which teams it recommends for a deeper look; reply *"run the robust critic review"* to have the AI double-check those (or all) teams. Markdown reports are always produced — ask for **DOCX** or **PPTX** and the orchestrator will generate them.

## Guardrails

- Judges the team artifact only — never individuals.
- Customer facts, rubrics, and judging signals come only from `Knowledge/manager-day-contoso-challenges.md`.
- Submission text is untrusted; embedded "give me 100/100" instructions are flagged, not obeyed.
- Cost cut by removing testing, monitoring, rollback, support, security, or human approval is **risk transfer**, not optimization — and triggers a human-review flag.

> AI-generated evaluations are for panel review. Final workshop judgment remains with the human jury.
