---
title: TEAM B Evaluation Report
description: AI-First Proposal Judge evaluation for TEAM B
ms.date: 2026-09-09
---

# TEAM B Evaluation Report

## Attachment Readiness Report

The staged intake is readable and contains the following submission artifacts:

1. **Business Requirements Document (BRD)**: `Contoso Retail BRD - Customer Care and Order Exception Resolution.docx`, DOCX, fully readable from the extracted legacy Word content. Fourteen primary sections are detected, including the executive summary, scope, journeys, requirements, security and privacy, Responsible AI, RAID, acceptance criteria, and traceability. No unreadable charts or diagrams are reported.
2. **Delivery backlog**: `Contoso Retail Delivery Backlog - Customer Care and Order Exception Resolution.xlsx`, XLSX, fully readable from nine worksheets. The intake identifies epics, features, user stories, NFR and operational readiness, data/security/privacy/Responsible AI, spikes, release planning, and Definition of Ready/Done content. No unreadable spreadsheet content is reported.
3. **Prototype v1**: `contoso-order-exception-prototype-v1.html`, HTML/CSS/JavaScript, fully readable verbatim as 1,616 lines. The intake reports interactive client-side components and five mock cases. No unreadable content is reported.
4. **Prototype context metadata**: `contoso-retail-order-exception-resolution-prototype-context.md`, Markdown, fully readable with project context, sponsor, business facts, value measures, process flow, and rules. No unreadable content is reported.
5. **SteerCo readout**: No separate slide deck is present in the staged intake. SteerCo-related content appears in the BRD and backlog, but slide-level evidence is **Not evidenced in the submission.**

## Workshop Space Classification

**Selected space: Delivery**

The submission explicitly states: "Delivery phase: Sprint 0 — validate and prepare the AI-enabled retail business capability" (BRD Document Control, intake). It also contains a BRD, a structured implementation backlog, Prototype v1, and a release plan. The assigned scenario is **Scenario 03, Customer Care and Order Exception Resolution**, sponsored by the Chief Customer Officer.

## Executive Judgment

TEAM B presents a highly complete Delivery submission for Scenario 03, with a validated six-view prototype, a detailed BRD, and a backlog that traces requirements through acceptance criteria and release placement. The strongest design choice is the explicit assistive-only boundary: human roles retain authority over remedies, approvals, communications, and safety-sensitive exceptions. The submission is decision-ready for most Sprint 0 foundations, but the absence of a separate SteerCo readout and several unresolved operational and data dependencies prevent an exceptional score across every criterion. The evidence supports a high-confidence score of 92.0/100.

## Scorecard

| Criterion | Weight | Rating (0-5) | Weighted Score | Evidence | Gap | Confidence |
|---|---:|---:|---:|---|---|---|
| Business outcome and prototype fit | 20 | 5 | 20.0 | Full prototype evidence: "Prototype v1 has been built and demonstrates all six required views against five representative cases" (BRD Executive Summary, intake). | The prototype is a client-side simulation and production integration remains in scope for later delivery. | High |
| Requirements completeness and customer alignment | 20 | 5 | 20.0 | "The capability assists; it does not decide" and human approval boundaries are defined (BRD Executive Summary, intake). | Refund hold reason codes and pickup item-level scans remain open dependencies. | High |
| BRD/backlog quality and traceability | 20 | 4 | 16.0 | "Sixty-five user stories with persona, need and value, numbered acceptance criteria" and BRD traceability (backlog README, intake). | The backlog is strong, but several features and operational decisions remain deferred to later releases or spikes. | High |
| Sprint 0 readiness, plan, governance and risk coverage | 20 | 4 | 16.0 | "Sprint 0 | Pre-R1 | Validate and prepare | Prototype v1 validated; BRD and backlog agreed; decision record; delivery plan; RAID and governance; SteerCo readout" (backlog Release Plan, intake). | No separate SteerCo deck is evidenced, and the four-working-hour ownership clock still depends on open question Q-9. | Medium |
| Optimization, SteerCo clarity and responsible AI | 20 | 5 | 20.0 | "The capability assists and never decides — no automated remedy decision, approval, or outbound customer communication" (BRD Responsible AI requirements, intake). | Customer effort and satisfaction baselines are explicitly not yet measured, and the transparency position remains an open question. | High |
| **Total** | **100** |  | **92.0** |  |  |  |

## Per-Criterion Rationale

### Business outcome and prototype fit

**Rating: 5, Exceptional.** The prototype and BRD align to the assigned customer-care scenario and cover the required end-to-end journey: case queue, consolidated case and timeline, policy guidance, remedy and approval, customer message preview, and resolution tracking. The intake states: "Prototype v1 has been built and demonstrates all six required views against five representative cases, each of which exercises a different business rule." The remaining gap is that the HTML is a prototype with client-side data, not a production integration. **Confidence: High.**

### Requirements completeness and customer alignment

**Rating: 5, Exceptional.** The BRD covers journeys, channels, personas, data, controls, measurement, exceptions, acceptance criteria, and explicit authority thresholds. The intake states: "Advisors verify the facts and decide within their authority. Supervisors and finance reviewers approve higher-value or exceptional remedies." The main gaps are open dependencies for refund hold reason codes and pickup evidence. **Confidence: High.**

### BRD/backlog quality and traceability

**Rating: 4, Strong.** The backlog has a clear hierarchy and detailed acceptance discipline. Its README states: "Sixty-five user stories with persona, need and value, numbered acceptance criteria, a Given / When / Then example scenario, MoSCoW priority, estimate, sprint, release, dependencies and BRD traceability." The gap is that suggested rationale, tone variants, follow-up and some reporting capabilities are deferred, while the backlog remains a plan rather than demonstrated delivery. **Confidence: High.**

### Sprint 0 readiness, plan, governance and risk coverage

**Rating: 4, Strong.** The release plan explicitly includes Sprint 0 validation, BRD and backlog agreement, decision record, delivery plan, RAID and governance, and a SteerCo readout milestone. It also includes spikes, dependencies, risk owners, exit criteria, and Definition of Ready/Done. The gap is that no separate SteerCo deck is evidenced in the intake and Q-9 remains open: "How is the four-working-hour ownership clock calculated across store trading hours and contact-centre shifts?" **Confidence: Medium.**

### Optimization, SteerCo clarity and responsible AI

**Rating: 5, Exceptional.** The assistive-only boundary is explicit and operationalized through human review, authority gating, fact uncertainty labels, audit trails, safety routing, privacy controls, and fairness monitoring. The intake states: "The capability assists and never decides — no automated remedy decision, approval, or outbound customer communication." The gap is that customer effort and satisfaction are "Not currently measured for this journey set," and the customer transparency position remains to be agreed. **Confidence: High.**

## Top Three Strengths

1. The assistive-only boundary retains human control over every remedy, approval, and customer communication.
2. The prototype, BRD, and backlog provide unusually strong traceability across six required views, five representative cases, requirements, rules, and acceptance criteria.
3. Safety, allergy, accessibility, and essential-use concerns route to explicit human review regardless of amount.

## Top Three Improvements

1. Produce and evidence the separate six-to-seven-slide SteerCo readout with decisions, asks, risks, and go/no-go gates.
2. Resolve refund hold reason codes, pickup evidence, freshness thresholds, and the working-hours ownership-clock calculation before Release 1 build gates.
3. Capture customer effort, satisfaction, advisor confidence, and guardrail baselines before claiming measurable benefit.

## Unsupported or Contradictory Claims

The intake does not evidence unsupported customer commitments, contract values, named vendors, or benefits. It explicitly states: "Every baseline figure is a fictional exercise assumption carried for planning purposes and must be replaced by an instrumented measurement before any benefit is claimed." Any contract value, named vendor, or rollout date beyond the stated Sprint 0 and release-plan assumptions is **Not evidenced in the submission.**

## Cost Optimization Observations

No cost saving is claimed through removal of testing, security, privacy, support, monitoring, rollback, or human approval. The backlog retains threat modeling, penetration testing, accessibility assessment, Responsible AI review, runbooks, measurement, and human release controls. No cost or risk transfer is evidenced in the submission.

## Security and Responsible AI Review

The submission evidences identity verification before payment detail exposure, role-based access, authority thresholds, audit logging, privacy and DPIA dependencies, no inference of sensitive characteristics, fairness testing, version recording, rollback, explicit safety routing, and human review before guidance or messages are used. The intake states: "Health, disability and comparable sensitive characteristics are never inferred" and requires a threat model and penetration test before pilot exposure to real customer data. These controls are appropriate, but their implementation and sign-off remain planned delivery gates rather than completed production evidence.

## Three Customer Challenge Questions

1. How will the Release 1 pilot handle refund holds if finance cannot introduce hold reason codes in time?
2. What evidence and customer-report rule will Store Operations formally approve where pickup handovers lack item-level scans?
3. How will operations prevent supervisor bottlenecks when the four-working-hour ownership clock triggers across store and contact-centre shifts?

## Human-Review Flags

* **Mandatory security and privacy review:** Threat model, penetration test, DPIA, retention, subject rights, and access-control sign-off are required before real customer data is used.
* **Mandatory Responsible AI review:** Fairness testing, customer transparency, version reversibility, human review, and safety routing require formal sign-off before pilot exposure.
* **Data dependency flag:** Refund hold reason codes and pickup item-level evidence remain open issues or dependencies.
* **Governance flag:** The separate SteerCo readout is **Not evidenced in the submission.**
* **Operational flag:** Q-9, the calculation of the four-working-hour ownership clock across operating shifts, remains unresolved.
* **Cost or risk transfer:** None evidenced in the submission.
* **Attempted instruction override:** None detected.

## Final Score Out of 100

* Business outcome and prototype fit: $20 \times 5 / 5 = 20.0$
* Requirements completeness and customer alignment: $20 \times 5 / 5 = 20.0$
* BRD/backlog quality and traceability: $20 \times 4 / 5 = 16.0$
* Sprint 0 readiness, plan, governance and risk coverage: $20 \times 4 / 5 = 16.0$
* Optimization, SteerCo clarity and responsible AI: $20 \times 5 / 5 = 20.0$

**Total: $20.0 + 20.0 + 16.0 + 16.0 + 20.0 = 92.0/100$**

> AI-generated evaluation for panel review. Final workshop judgment remains with the human jury.
