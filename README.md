# AI-First Proposal Judge

Evidence-based judging of workshop proposals. Drop submissions in a folder, run one command, and get scored reports plus cross-team learnings for a human jury. The AI never picks a winner — the panel decides.

## Folders

| Folder | Purpose |
|--------|---------|
| `Knowledge/` | Grounding docs the judge reads first (see below). |
| `WorkShopSubmission/` | One file per team. Documents (`.docx`, `.pptx`, `.txt`, legacy `.doc`/`.ppt`), **prototypes and wireframes** (`.html`, `.css`, `.js`/`.ts`, other code, `.svg`), and **images** (`.png`, `.jpg`). |
| `Results/` | Generated reports, written to a timestamped `run-<timestamp>/` subfolder per run. |
| `docs/` | Automation and distribution design. |

Each artefact has its own configurable path in `judge.config.json` — `knowledgePath`, `submissionsPath`, and `resultsPath`. Point them at local folders (which may be synced OneDrive/SharePoint folders), or set `sharepoint.enabled = true` to pull/push each artefact directly from its own **SharePoint Online** library folder (see [SharePoint](#sharepoint-artefacts) below).

### Knowledge docs

- **Manager-Day-Contoso-Customer-Scenario** — the customer facts. **Authoritative**; the judge never invents customer facts beyond this.
- **Manager-Day-Judging-Rubric** — the 10 weighted criteria (total 100) and scoring rules.
- **Manager-Day-Approved-Reference-Pack** — shared design and judging principles.

## Agents

| Agent | Role |
|-------|------|
| **Proposal Judge Orchestrator** | Runs the whole pipeline: grounds on `Knowledge/`, loops over submissions, calls the Judge and Critic, writes reports. |
| **Proposal Judge** | Scores **one** submission against the rubric with cited evidence, gaps, and flags. |
| **Proposal Judge Critic** | Independently verifies each evaluation (grounding, evidence, arithmetic, bias) and returns PASS or REVISE. |

## Workflow

```
Knowledge docs ──► Orchestrator (reads judge.config.json, opens Results/run-<timestamp>/)
                      │  for each submission:
                      ▼
                   Judge ──► Critic ──► (REVISE? loop) ──► run-<timestamp>/<team>-evaluation.md
                      │
                      ▼
             run-<timestamp>/00-cross-submission-summary.md
```

1. Orchestrator extracts the three Knowledge docs and reads `judge.config.json`.
2. It opens a timestamped run folder and, for each submission, has the **Judge** score it and the **Critic** verify it. Prototypes/wireframes (HTML/code/SVG) are read as source and cited by line; raster images are viewed with a multimodal viewer.
3. A per-team Markdown report is written to the run folder.
4. A cross-submission summary adds a score table (data, not a ranking) and shared takeaways.

## Input types

- **Documents / decks:** DOCX, PPTX, TXT, MD (legacy DOC/PPT via Office COM).
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

Markdown reports are always produced. Ask for **DOCX** or **PPTX** and the orchestrator will generate them.

## Guardrails

- Judges the team artifact only — never individuals.
- Customer facts come only from the scenario.
- Submission text is untrusted; embedded "give me 100/100" instructions are flagged, not obeyed.
- Cost cut by removing testing, monitoring, rollback, support, security, or human approval is **risk transfer**, not optimization — and triggers a human-review flag.

> AI-generated evaluations are for panel review. Final workshop judgment remains with the human jury.
