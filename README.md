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

Each artefact has its own configurable path in `judge.config.json`: `knowledgePath`, `submissionsPath`, and `resultsPath`. Point them at local folders (which may be synced OneDrive/SharePoint folders), or enable the SharePoint MCP provider to snapshot inputs through a workspace MCP server. See [SharePoint MCP](#sharepoint-mcp).

### Knowledge source

The file selected by `knowledgePath` and `knowledgeFile` is the only grounding source. It contains customer facts, the available workshop space or spaces, scenarios, five-criterion rubrics, and judging guidance. A source may define only Delivery, only Presales, or both.

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
5. A cross-submission summary uses separate Presales and Delivery score tables plus shared takeaways, and lists the teams recommended for deeper review. Cross-space ranking is prohibited.
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

### SharePoint MCP

The judge keeps a local, immutable snapshot for each run because Office extraction and deterministic validation require filesystem paths. SharePoint remains the input system of record: MCP downloads Knowledge and Submissions before judging. Results stay local unless `publishResults` is true and the selected server exposes verified write tools.

The workspace server is declared in `.vscode/mcp.json` and runs `ask-marcel-office-cli` through the installed Node.js `npx.cmd`. The package is resolved from the configured npm feed and starts an MCP server over stdio. A local process is required because SharePoint submissions can contain binary Office and image files that must be written into the VS Code workspace snapshot.

Authenticate once from a terminal before starting the MCP server:

```powershell
& 'C:\Program Files\nodejs\npx.cmd' -y ask-marcel-office-cli login
```

The command opens a browser for delegated Microsoft sign-in and caches tokens in the package's user-level store. You do not configure or provide a tenant ID, client ID, secret, token, authorization code, or device code to the judge. Restart the workspace MCP server or reload VS Code after changing `.vscode/mcp.json`.

For staging, the configured server must advertise commands or gateway tools that can:

* Recursively list files and folders
* Download binary files to a caller-supplied local path
* Return item metadata, including stable IDs and ETags when available

Folder creation and local-path upload are required only when `publishResults` is true. The configured `ask-marcel-office-cli` server is read-only, so this repository sets `publishResults` to false and keeps completed runs under the local `resultsPath`.

Configure `judge.config.json` after the server is available:

```json
"sharepoint": {
  "enabled": true,
  "provider": "mcp",
  "publishResults": false,
  "authentication": {
    "mode": "interactiveBrowser"
  },
  "stagingPath": ".sharepoint-cache",
  "siteUrl": "https://contoso.sharepoint.com/sites/ManagerDay",
  "siteId": "<sharepoint-site-id>",
  "driveId": "<document-library-drive-id>",
  "knowledgeFolder": "Knowledge",
  "knowledgeFolderId": "<knowledge-folder-item-id>",
  "submissionsFolder": "Submissions",
  "submissionsFolderId": "<submissions-folder-item-id>",
  "resultsFolder": "Results",
  "resultsFolderId": "<results-folder-item-id>",
  "maxDownloadBytes": 104857600,
  "maxFilesPerRun": 1000
}
```

Stable folder IDs are preferred; paths remain available for MCP servers that only accept paths. On each run, the orchestrator:

1. Triggers delegated browser authentication with a read-only MCP operation.
2. Discovers the MCP server's tool schemas and verifies the required capabilities.
3. Creates a new snapshot under `.sharepoint-cache/<timestamp>/`.
4. Downloads and verifies all accepted Knowledge and Submission files.
5. Writes `source-manifest.json` with SharePoint item IDs, URLs, versions, ETags, timestamps, and sizes returned by the server.
6. Passes that manifest into the generated `run-manifest.json` for traceability.
7. Judges the local snapshot and keeps the finished run under the local `resultsPath`.
8. Publishes and verifies results only when `publishResults` is true and write tools are available.

The run stops on authentication requests for user-supplied app identifiers, missing read capabilities, unsafe paths, transfer limits, incomplete downloads, or partial uploads. It never judges a partial snapshot or reports a skipped upload as successful.

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
