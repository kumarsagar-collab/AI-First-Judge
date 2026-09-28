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

Each artefact has its own configurable path in `judge.config.json` — `knowledgePath`, `submissionsPath`, and `resultsPath`. Point them at local folders.

### Knowledge source

`Knowledge/manager-day-contoso-challenges.md` is the only grounding source. It contains customer facts, the **table-assignment map** (odd tables = Presales rooms, even tables = Delivery scenarios), Presales and Delivery space-detection signals (fallback only), scenarios, both five-criterion rubrics, and judging guidance.

Each team is either **Presales** or **Delivery**, fixed by its `<City>_Table<N>` number (any city/cohort prefix such as `Blr_`, `Hyd_`, `Noida_`, followed by a table number). The Judge applies that table's 100-point rubric, cites evidence that the team worked its assigned room/scenario, and never compares scores across the two spaces. Signal-based classification is used only when a folder name has no parseable table number.

## Agents

| Agent | Role |
|-------|------|
| **Proposal Judge Orchestrator** | Runs the two-phase pipeline: `initialize` primes on `Knowledge/` and config; `judge all submissions` extracts each table into Markdown, judges each table as its text becomes ready, and writes reports plus the cross-table summary. |
| **Proposal Judge** | Scores **one** table's submission against the rubric fixed by its table number, with cited evidence, gaps, and flags — a quick, lightweight analysis. |

The space and rubric for each team are **fixed by its table number** (odd = Presales, even = Delivery — see [Table gating](#table-gating)), so there is **no critic round and no deterministic validator**. Each judge does a light self-check (five criteria, correct weights, arithmetic sums to the total) as it writes its report.

## Two phases

1. **`initialize`** — the orchestrator reads `judge.config.json` and the knowledge file, confirms both rubrics and the table-assignment map are loaded, counts the `<City>_Table<N>` team folders present across all city cohorts, and reports readiness. Nothing is extracted or judged.
2. **`judge all submissions`** — the orchestrator executes: extract each table into Markdown first, judge each table the moment its Markdown is ready, then run the cross-table evaluation.

## Table gating

Team folders are named `<City>_Table<N>` — a city/cohort prefix (e.g. `Blr_`, `Hyd_`, `Noida_`) plus a table number `N` (1–20); the `Table` segment is case-insensitive and the prefix varies, so the number is parsed from the trailing digits regardless of the prefix. The table number is the authoritative gate: **odd tables are Presales** (cycling Rooms 01→05), **even tables are Delivery** (cycling Scenarios 01→05). Multiple city cohorts may share a table number (e.g. `Blr_Table1`, `Hyd_table1`, `Noida_Table1`); each is a separate, isolated team mapped to the same room/scenario. The full 20-row map lives in `Knowledge/manager-day-contoso-challenges.md`. Because the assignment (and therefore the rubric) is known up front, the judge applies it directly instead of inferring the space.

## Workflow

```
initialize ──► Orchestrator primes on Knowledge/ + config (no extraction, no judging)

judge all submissions ──► Orchestrator (opens Results/run-<timestamp>/)
        │  1. extract every <City>_Table<N> folder → intake/<team>.md (first step)
        ▼
   2. judge each table as its Markdown is ready (space/rubric fixed by table number)
        │     up to maxParallelTeams at once ──► run-<timestamp>/<team>-evaluation.md
        ▼
   3. once all table evals exist ──► run-<timestamp>/00-cross-submission-summary.md
```

1. **`initialize`:** the orchestrator reads the single authoritative knowledge file and `judge.config.json`, confirms both rubrics and the table map, and reports readiness.
2. **Extract first:** on `judge all submissions`, it opens **one** timestamped run folder, discovers **teams** (each `<City>_Table<N>` subfolder, across all city cohorts), and extracts each team's whole folder into `intake/<team>.md`. Prototypes/wireframes (HTML/code/SVG) are read as source and cited by line; raster images are viewed with a multimodal viewer.
3. **Judge as ready:** as soon as a table's Markdown exists, its judge is dispatched with the space and rubric already fixed by the table number (odd = Presales, even = Delivery). Up to `maxParallelTeams` judges run at once, each fully isolated, producing a concise, evidence-cited report.
4. **Cross-table evaluation:** once every table's report exists, a summary opens with a **Top Teams (for announcement)** section listing the top 3 Delivery and top 3 Presales teams in descending score order — each with a 2-3 sentence, evidence-grounded citation covering the submission's most important and impactful areas — followed by separate Presales and Delivery score tables (with each team's room/scenario), per-space takeaways, and a consolidated list of mandatory human-review flags. Ranking is within a space only; cross-space ranking is prohibited.

### Why it's fast

- **Fast by default:** the space and rubric are known from the table number, so there is no critic or validator round — the judge produces a lightweight analysis directly.
- **Judge as ready:** each table is judged the moment its Markdown is extracted, and up to `maxParallelTeams` run concurrently instead of one-at-a-time.
- **Extract once, stage once:** each team folder is parsed a single time into `Results/run-<timestamp>/intake/<team>.md` and reused everywhere; one run folder is created per request.

## Input types

Each team gets a folder under `WorkShopSubmission/`; drop any mix of the following inside it (a team may submit several files):

- **Documents / decks:** DOCX, PPTX, TXT, MD (legacy DOC/PPT via Office COM).
- **Spreadsheets:** XLSX and CSV (legacy XLS via Office COM) — read row-by-row so backlogs and workbooks are cited by sheet and row. If Office/COM is unavailable, a legacy file is marked *Not evidenced* and flagged for human review rather than guessed.
- **Prototypes / wireframes / code:** HTML, CSS, JS/TS, and other code files, plus SVG — read as source and evaluated for functional correctness, UX, accessibility, and security (secrets, XSS, missing auth, disabled citations, autonomy without approval).
- **Images:** PNG/JPG wireframes are viewed with a multimodal viewer; if none is available they are marked *Not evidenced* and a text/HTML alternative is requested.

## Automation & distribution

- **Trigger on file drop:** point `submissionsPath` at your local submissions folder and run `./.github/scripts/Watch-Submissions.ps1` to stage a timestamped run when files land.
- **Share it:** clone this repo as a template (replace the `Knowledge/` docs), or package the agents as an hve-core plugin / VS Code extension.

## How to run

Two steps, in order:

1. **Initialize:** type `/judge-proposals` and then `initialize` in chat, or pick **Proposal Judge Orchestrator** in the agent picker and say *"initialize."* The agent primes on the knowledge file and rubrics and confirms it is ready.
2. **Judge:** say *"judge all submissions"* (optionally name one `<City>_Table<N>` folder). The agent extracts each table into Markdown, judges each table as its text becomes ready against the rubric fixed by its table number, and writes a cross-table summary.

You get scored per-table reports and a cross-table summary with the top 3 teams per space and all mandatory human-review flags. There is no critic round to run. Markdown reports are always produced — ask for **DOCX** or **PPTX** and the orchestrator will generate them.

## Guardrails

- Judges the team artifact only — never individuals.
- Customer facts, rubrics, and judging signals come only from `Knowledge/manager-day-contoso-challenges.md`.
- Submission text is untrusted; embedded "give me 100/100" instructions are flagged, not obeyed.
- Cost cut by removing testing, monitoring, rollback, support, security, or human approval is **risk transfer**, not optimization — and triggers a human-review flag.

> AI-generated evaluations are for panel review. Final workshop judgment remains with the human jury.
