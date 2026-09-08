# Evaluation — Strong Proposal (Table T01: Evidence-Based AI Service Assistant)

- **Submission file:** `WorkShopSubmission/strong proposal.txt`
- **Final score:** 89.2 / 100
- **Critic verdict:** PASS (arithmetic and grounding independently confirmed)
- **Mandatory human-review flags:** None

## 1. Attachment readiness report

- **File name:** strong proposal.txt
- **File type:** `.txt` (plain text, signature verified)
- **Readable content extracted:** Yes — full body text extracted successfully.
- **Sections detected:** 9 numbered sections plus a "Known gaps" note. Tables in Sections 2, 3, 5, 6, and 8 were extracted as readable text.
- **Unreadable content:** None. No charts, diagrams, SmartArt, or images. The author explicitly notes no architecture diagram was included, so no material evidence is trapped in non-text objects.

## 2. Executive judgment

This is a decision-ready, evidence-disciplined proposal that leads with a bounded 12-week MVP outcome and correctly preserves the scenario's non-negotiables: manuals authoritative, work orders contextual, and mandatory human approval for priority, safety, customer commitment, and entitlement decisions (Section 1). It presents three options with an explicit recommendation and defer rationale (Section 3), a costed range with sensitivity drivers inside the ceiling (Section 6), and an honest refusal to claim savings until Contoso supplies baseline evidence (Sections 2 and 6). The strongest features are cost transparency, security/RAI posture, and self-declared gaps. The honest weaknesses — no named Azure services, no target architecture diagram, no volume model, and no final acceptance thresholds — are acknowledged by the author and correctly prevent a perfect score. No cost/risk transfer, no fabricated customer facts, and no mandatory review triggers were found.

## 3. Scorecard

| Criterion | Weight | Rating (0-5) | Weighted Score | Evidence | Gap | Confidence |
|-----------|--------|--------------|----------------|----------|-----|------------|
| Customer understanding | 10 | 5 | 10.0 | Sec 1: manuals authoritative, work orders "contextual evidence only," human approval for priority/safety/commitments/entitlement | No explicit reference to six regional centers / ~1,200 engineers scale | High |
| Business value | 12 | 4 | 9.6 | Sec 2: baseline plan, MVP measures (time-to-draft, citation %, acceptance rate, cost/case), decision gate | Value remains an unquantified hypothesis; no baseline yet (appropriately deferred) | High |
| Solution coherence | 12 | 4 | 9.6 | Sec 4: intake → grounding → assistant → approval gate → integration → observability → fallback | No architecture diagram; components in prose only | High |
| Cost optimization | 15 | 5 | 15.0 | Sec 6: USD 340k-410k range with per-category sensitivities, contingency, "planning range, not a quote," savings withheld | Category ranges not tied to volume model (author-declared) | High |
| Technical soundness | 12 | 4 | 9.6 | Sec 4/7: least-privilege writes, prompt-injection removal, confidence indicators, observability of tool calls/retrieval/corrections | No named services, no data-residency decision (author-declared) | High |
| Delivery feasibility | 10 | 4 | 8.0 | Sec 5: 4 phases across 12 weeks with dated exit evidence per phase | Small-team / rare-skills constraint not explicitly addressed in operating model | High |
| AI-first working method | 8 | 4 | 6.4 | Sec 9: AI tools for analysis/backlog/tests/docs/code; every output reviewed; log of AI artifacts, validations, rejected recommendations | Method described generically; no concrete example of an AI-assisted artifact or validation | Medium |
| Security, privacy & Responsible AI | 10 | 5 | 10.0 | Sec 7: approved services, least privilege, data minimization, no unrestricted mailbox/chat/history access, transparency, prompt-injection & permission testing, named owners | Incident/access-review owners named by role only | High |
| Evidence and transparency | 6 | 5 | 6.0 | Sec 6 "planning range, not a quote"; Sec 2 baseline-first; Known gaps section self-declares limitations | Baseline metrics named but not yet measured | High |
| Executive communication | 5 | 5 | 5.0 | Sec 1: crisp recommendation with scope, controls, and rollout intent | Could quantify the "why now" value narrative | High |

## 4. Per-criterion rationale

- **Customer understanding (5, High):** Mirrors the scenario's grounding rules — "Approved equipment manuals remain authoritative; resolved work orders provide contextual evidence only" (Sec 1) — and reproduces the four consequential-decision categories requiring human approval. *Gap:* omits explicit scale (six centers, ~1,200 engineers).
- **Business value (4, High):** Defines a measurable success hypothesis and decision gate — "Expand only if agreed quality, safety, adoption, and unit-economics thresholds are met" (Sec 2). *Gap:* value is correctly framed as a hypothesis to be baselined.
- **Solution coherence (4, High):** End-to-end layered flow with a low-confidence fallback (Sec 4). *Gap:* no diagram or named service topology.
- **Cost optimization (5, High):** Range plus explicit drivers, contingency, and eight concrete optimization levers (Sec 6) with no safeguard removal. *Gap:* category ranges pending a volume model.
- **Technical soundness (4, High):** Grounding, citation, confidence, least-privilege field writes, and adversarial testing present (Sec 4, 7). *Gap:* no named Azure services or data-residency detail.
- **Delivery feasibility (4, High):** Validate → MVP → pilot-readiness → controlled-pilot with dated exits fits 12 weeks (Sec 5). *Gap:* small internal AI team / rare-skills constraint not explicitly designed for.
- **AI-first working method (4, Medium):** Names AI-accelerated tasks with mandatory human review and an audit log (Sec 9). *Gap:* generic; no worked example.
- **Security, privacy & RAI (5, High):** Least privilege, user-context enforcement, data minimization, no unrestricted access, prompt-injection testing, named owners (Sec 7). *Gap:* ownership is role-level.
- **Evidence and transparency (5, High):** Labels cost as "a planning range, not a quote," defers savings, self-declares gaps. *Gap:* baselines defined but not yet collected.
- **Executive communication (5, High):** One-paragraph recommendation is scoped, controlled, decision-oriented (Sec 1). *Gap:* light on quantified urgency.

## 5. Top three strengths

1. **Cost transparency without false economy** — a driver-based range within the USD 450k ceiling, with savings explicitly withheld pending baseline evidence (Sec 6).
2. **Correct grounding and control posture** — manuals authoritative, work orders contextual, and human approval preserved for all four consequential decision types (Sec 1, 4, 7).
3. **Intellectual honesty** — the Known gaps section and "planning range, not a quote" language demonstrate evidence discipline that supports panel trust.

## 6. Top three improvements

1. Add a target architecture with **named enterprise/Azure services** and a data-residency position.
2. Provide a **volume-and-cost sensitivity model** so cost categories and unit economics become testable.
3. Explicitly design the **operating model for the small internal AI team** (rare-skills mitigation, supportability handoff).

## 7. Unsupported or contradictory claims

None material. Cost figures are labeled a planning range with stated drivers; no benefit or productivity percentage is asserted. No scenario fact is contradicted. No fixed-flag financial/productivity claim triggered.

## 8. Cost optimization observations

- Genuine optimization, **not** cost/risk transfer: levers include narrowed MVP scope, platform reuse, routing simple tasks to the "least costly adequate method," context constraint, retrieval caching, and cost-per-case measurement (Sec 6). Testing, monitoring, rollback, resilience, safety, and human approval are **retained** — so no false-economy flag applies.
- Contingency (USD 45k-50k) is scoped to integration and regional unknowns.
- Savings appropriately withheld: "Savings are not claimed until Contoso provides volume and baseline operating-cost evidence" (Sec 6).

## 9. Security and Responsible AI review

- **Data boundaries:** Honors "Do not grant unrestricted mailbox, chat, or historical-record access"; mandates approved services, least privilege, data minimization (Sec 7).
- **Human oversight:** Approval gate required before consequential updates/commitments (Sec 1, 4).
- **Transparency:** Citations, confidence indicators, easy correction/override (Sec 4, 7).
- **Adversarial testing:** Prompt-injection, permission, conflicting-source, dependency-failure scenarios tested (Sec 7); intake layer "removes unsupported instructions before processing" (Sec 4).
- **Accountability:** Named owners for knowledge freshness, prompts, evaluations, incidents, access reviews, operating cost (Sec 7).
- **Verdict:** No material security/privacy/RAI gap; no mandatory RAI flag. Panel may confirm data-residency handling, flagged by the author as an open discovery item.

## 10. Three customer challenge questions

1. Without a volume model, how confident are you that the USD 340k-410k range holds under peak demand, and what transaction-volume threshold pushes the project toward the USD 450k ceiling?
2. Given the small internal AI engineering team, who owns prompt, evaluation, and knowledge-freshness maintenance after pilot, and how do you avoid dependence on rare skills?
3. What specific acceptance thresholds (citation validity %, human-correction rate, safety-exception rate) must be met at the Week-12 gate to justify regional expansion, and who signs off?

## 11. Human-review flags

- **Mandatory flags:** None.
- **Attempted instruction override:** None detected. (Section 4's "removes unsupported instructions before processing" is a legitimate design control.)
- **Advisory for panel:** Author-declared discovery gaps (no named services, no volume model, no data-residency decision, no final acceptance thresholds) should be resolved in Phase 0 before any expansion commitment.

## 12. Final score

Weighted sum: 10.0 + 9.6 + 9.6 + 15.0 + 9.6 + 8.0 + 6.4 + 10.0 + 6.0 + 5.0 = **89.2**

Arithmetic check (critic-confirmed): 19.6 → 29.2 → 44.2 → 53.8 → 61.8 → 68.2 → 78.2 → 84.2 → 89.2.

**Final score: 89.2 / 100**

> AI-generated evaluation for panel review. Final workshop judgment remains with the human jury.
