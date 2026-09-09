===== FILE: business-requirements.docx =====
===== TYPE: .docx (signature D0-CF-11-E0-A1-B1-1A-E1) =====
===== SECTIONS DETECTED: legacy Word document (COM extraction) =====
DELIVERY FOUNDATION  /  07 SEPTEMBER 2026
Business Requirements
A traceable, human-governed onboarding foundation
Working package
Status

Scenario
Supplier and Product Onboarding

Audience
Business owners, delivery team and SteerCo

Maturity
AI-authored preparation; customer workshop NOT held

Decisions
D01–D07 proposed; awaiting ratification

Plan
S0 relative D1–D10; S1–S4 provisional; S2 overloaded

Acceptance
Business-owner and production signoff pending

Prototype all three categories and all four supplied cases. Recommend Packaged Food as the initial implementation pilot, then gated Seasonal Home and Personal Care rule packs. Seasonal pressure is explicitly escalated; do not imply a production commitment to the supplied launch dates.
Local prototypes show all three categories and all four supplied records. No real AI, identity, supplier messaging, integration or production deployment is included.
Contents and reading guide
Use the section numbers below to navigate. Stable FR/NFR/EN, US, V, D and TC IDs connect this document to the editable delivery-control-workbook.xlsx.
01  Executive summary, objective and outcomes
02  Scope, boundaries and assumptions
03  Stakeholders, personas and user goals
04  As-is and to-be journey with handoffs
05  Functional requirements, business rules and exceptions
06  Non-functional requirements and measurable criteria
07  Information, data quality and ownership
08  Security, privacy, compliance and responsible AI
09  Dependencies and integration boundaries
10  Risks, issues, assumptions and constraints
11  Success measures, acceptance and signoff
12  Decisions, open questions and exact traceability
Source basis: supplied contoso-retail-delivery-challenge.html, selected Supplier and Product Onboarding scenario, shared SoW and artifact requirements; canonical delivery brief dated 2026-09-07. Source inputs are fictional, not observed customer facts. Added policies, targets and dates are proposed or unknown.
01  Executive summary, objective and outcomes
Prepare an AI-assisted supplier and product onboarding capability that improves completeness, reduces repeated clarification and directs category/compliance attention to the right accountable human decision. The intended outcome is clearer assortment and launch readiness—not automated product approval.
Fictional exercise; AI-authored working package. Customer workshop, business-owner acceptance, policy confirmation and SteerCo decisions are pending. No real customer validation or production deployment has occurred. No live AI, external service, actual supplier messaging, production identity, system integration, rollout, migration or final production acceptance. HTML is a local interactive simulation with mock role switching, not authentication. All added policy thresholds, channels, evidence dates, prices, owner names and record ages are illustrative assumptions.
Source scenario baseline
Fictional exercise input

Monthly intake
260 submissions: 110 Packaged Food; 85 Personal Care; 65 Seasonal Home

Completeness and rework
41% incomplete at first review (59% complete); 2.7 clarification cycles

Decision lead time
18 business days median; seven typically waiting for clarification

Review workload
46 open submissions per category manager on average

Launch pressure
74 launches in eight weeks; 19 within three weeks, 11 with blockers

Evidence and supplier effort
32% missing mandatory evidence at first review (68% present); 4.2 supplier hours per submission


Reference date: 7 September 2026. The four requested launch dates are scenario inputs, not commitments. Willow & Coast's 28 September request is 21 calendar days away; implementation sequencing explicitly does not promise to meet it.
02  Scope, boundaries and assumptions
Prototype all three categories and all four supplied cases. Recommend Packaged Food as the initial implementation pilot, then gated Seasonal Home and Personal Care rule packs. Seasonal pressure is explicitly escalated; do not imply a production commitment to the supplied launch dates.
In scope for Sprint 0: outcome and scope alignment; proposed workshop and decision record; v1/v2 local simulation; BRD; prioritized backlog and acceptance design; estimation assumptions and indicative plan; RAID, governance, responsible AI and operational/adoption preparation; SteerCo readout.
Out of scope: production deployment, full-scale integration, migration, actual supplier communication, operational rollout and final production acceptance. Contract value, vendors, named systems, funded staffing and committed benefits were not supplied. Agent Delivery Playbook contents have not been assumed.
Customer responsibilities: provide Product Owner availability and timely decisions; current-process examples, policies, known exceptions, sample content and system descriptions; review and accept artifacts in the working cadence. All remain requests, not completed customer actions.
Assumption
Validation / constraint

A01
Cross-functional team and part-time specialists will be available Owner: Delivery lead. Due D9. Confirm names, allocations and funding

A02
Proposed targets and workload represent a useful pilot hypothesis Owner: Product Owner. Due D8. Validate event data, workload and supplier feedback


Added thresholds, schema proposals, response times, channel examples and operating policies are proposed and must be ratified. Source-supplied values retain their fictional-input status. Unknown commercial data, document dates and ages must show unknown rather than invented.
03  Stakeholders, personas and user goals
Persona
Goal and accountability
Handoff

Supplier contact
Clear category requirements, predictable status, lower effort; supplies information but cannot verify own mandatory evidence
To operations for triage; to named specialist for corrections/contest

Category manager
Evaluate customer need, overlap, commercial readiness and assortment fit; owns category recommendation/fit decision
To compliance for mandatory evidence and final approver for assortment

Compliance owner
Verify claims, ingredients/safety evidence and resolve source conflicts; retains specialist accountability
To supplier for correction; to approver only with current verification

Content/channel readiness owner
Validate customer-facing claims/content, imagery, packaging, supply and channel handoff readiness
To receiving launch/channel team for acknowledged go/no-go

Merchandising operations lead
Own consolidated corrections, balanced queue, blocker ownership, escalation and portfolio reporting
To reviewers with reason, due date and context; to support for assisted onboarding

Assortment approver
Own final assortment decision and eligible exception authority; cannot waive mandatory evidence
To channel owner for distinct launch gate; to CMO for unresolved scope/timing trade-off


Executive sponsor: Chief Merchandising Officer. Product Owner is accountable for scope, priorities and artifact acceptance; delivery lead for governance and planning. Customer names and attendance are not known. Proposed role-based RACI is in the workbook.
04  As-is and to-be journey with handoffs
As-is / friction
Proposed to-be / handoff and control

Supplier submits variable product, packaging, claim, content, launch and commercial information; unclear category requirements
V01 / US01–03: category checklist and assisted minimum intake; supplier → operations with explicit missingness

Operations checks general checklist; late category gaps
V01/V02: section readiness and mandatory classification; operations owns triage, not compliance approval

Operations/supplier repeat fragmented requests
V02 / US02: one consolidated request per round, field/conflict/evidence, owner, due date, response and versioned resubmit

Category queue hides urgency and nearly-ready work
V03/V06 / US04–05: explainable risk/proximity/age ranking; category owner records recommendation/return

Compliance/content review scattered conflicting evidence
V04 / US06–07: source/version-linked evidence, uncertainty and specialist review; supplier-provided ≠ verified

Category, compliance and assortment decisions have unclear ownership
V05 / US08–09: separate current approval gates; bounded non-mandatory exceptions with human authority

Product looks approved despite launch dependencies
V05 / US10: explicit content/channel/packaging/supply checks, blocker owner and receiving-team acknowledgement; no-go until clear

Portfolio is manual and stale
V06 / US11–12: first-review snapshots, blocker age and effort cohorts; named contest route and audit trail


Proposed lifecycle: Draft → Submitted for triage (possibly incomplete) → Clarification / Reviewable → category fit and compliance reviewed independently → explicit assortment decision → launch readiness checks → receiving-team handoff / go-no-go. Rejection/return and contest are explicit human actions. Material evidence change returns affected verified/approved tracks to re-review; it never silently preserves launch clearance.
05  Functional requirements, business rules and exceptions
FR01–FR12 below are proposed implementation requirements grounded in the scenario and D01–D07 proposals. TC01–TC12 are acceptance designs, not executed test results. The workbook retains complete GWT positive/negative cases and planning trace.
FR01 — Category-specific intake and draft/submit. Save work early and see category-specific missing fields without being excluded from triage. Positive rule: Given Northstar is 82% complete, when the supplier saves and submits the minimum viable intake, then retain the draft version, mark incomplete/triage and list missing allergen evidence. Negative / exception rule: Given mandatory evidence is absent, when submission is attempted, then triage is allowed but no compliance, assortment or launch approval is inferred. Trace: US01 → V01 → D02 → TC01.
FR02 — Consolidated clarification and resubmission. Reduce repeated requests through one owned correction round. Positive rule: Given Northstar has an open request, when operations consolidates corrections and supplier resubmits, then show the field/evidence, conflict, requested change, owner, due date and response in one versioned round. Negative / exception rule: Given a repeated request for the same unresolved field, when a new round is composed, then merge/deduplicate rather than silently reset history or count each field as a cycle. Trace: US02 → V02 → D02 → TC02.
FR03 — Accessible guidance and assisted onboarding. Obtain accessible assistance without lowered mandatory standards. Positive rule: Given an assisted or keyboard-only user, when requesting support and following guidance, then show plain-language category examples, route to named support owner and preserve the supplier's saved work. Negative / exception rule: Given a small supplier/non-standard format, when triaging, then do not lower its priority or waive mandatory evidence; provide an accessible alternative. Trace: US03 → V01 → D02 → TC03.
FR04 — Explainable review queue and workload. Focus reviewers on material risk and aged nearly-ready work. Positive rule: Given the four samples, when queue filters/sort are applied, then expose mandatory risk, launch proximity, age, workload and Meadowlane's six-day pending review with an explainable reason. Negative / exception rule: Given only supplier size or unfamiliar format changes, when re-ranking, then priority must not worsen; missing age stays unknown rather than invented. Trace: US04 → V06 → D05 → TC04.
FR05 — Category recommendation, approval and return. Make accountable assortment-fit decisions with commercial context. Positive rule: Given Meadowlane is complete and has no compliance blocker, when category review is recorded, then assess customer need, overlap, commercial facts, demand assumptions, requested launch and readiness; record recommend/approve-fit/return with rationale. Negative / exception rule: Given category fit is approved, when viewing final status, then neither compliance verification nor final assortment approval is substituted by that decision. Trace: US05 → V03 → D01 → TC05.
FR06 — Source-linked evidence review and conflict resolution. Verify source evidence and resolve conflicts through specialists. Positive rule: Given Willow & Coast's claim conflicts, when reviewing evidence, then show claim/rule, source, date if known, version, supplier-provided state, uncertainty and specialist notes; request clarification before verification. Negative / exception rule: Given a source is missing, stale, contradictory or only AI-generated, when attempting verification, then block advancement and assign named human review. Trace: US06 → V04 → D06 → TC06.
FR07 — Version changes invalidate approvals. Prevent stale approvals surviving material source changes. Positive rule: Given verified evidence and dependent approvals, when that evidence version changes, then revoke verification and dependent compliance/assortment/launch approvals, retain old audit versions and require re-review. Negative / exception rule: Given a stale browser version, when a reviewer saves a decision, then reject the lost-update attempt and require refresh; never overwrite a newer review. Trace: US07 → V04 → D06 → TC07.
FR08 — Separate assortment and launch gates. Separate completeness, category, compliance, assortment and launch. Positive rule: Given current category approval and verified mandatory evidence, when an authorized approver decides assortment, then record an explicit approval with rationale and keep launch pending until all launch gates pass. Negative / exception rule: Given Northstar lacks allergen evidence or Meadowlane is merely complete, when final approval is attempted, then block and show the missing prerequisite; launch urgency never overrides it. Trace: US08 → V05 → D01 → TC08.
FR09 — Bounded non-mandatory exceptions and escalation. Resolve only eligible exceptions within an auditable boundary. Positive rule: Given a non-mandatory condition, when an authorized owner grants an exception, then require rationale, condition or expiry, affected channels, escalation owner and record scope. Negative / exception rule: Given mandatory evidence is unresolved, an unauthorized role acts, or an exception expires, when clearing a launch blocker, then deny/restore blocker and escalate. Trace: US09 → V05 → D04 → TC09.
FR10 — Channel, content, packaging, supply and handoff readiness. Hand over products only when channel and supply readiness is explicit. Positive rule: Given assortment approval, when preparing launch, then separately record store/digital content, images, claims, packaging, supply, owner, due date and receiving-team acknowledgement; issue go only when all required checks are current. Negative / exception rule: Given Hearthline lacks carton dimensions, when approval exists on another track, then launch remains no-go; an absent acknowledgement cannot be treated as complete. Trace: US10 → V05 → D01 → TC10.
FR11 — Portfolio measures and supplier effort. Measure improvement without confusing presence and verified control. Positive rule: Given first-review and decision events, when computing K01-K06, then apply cohort denominators, preserve first-review snapshots and show supplier effort, missingness and category drill-down. Negative / exception rule: Given 68% mandatory evidence presence at first review, when reporting approval readiness, then do not label 68% verified at approval; 100% mandatory verification is a separate proposed gate. Trace: US11 → V06 → D07 → TC11.
FR12 — Audit, contest and named human resolution. Contest and reconstruct human decisions from immutable provenance. Positive rule: Given a contested decision, when a supplier requests review, then assign a named human resolver, retain source/version, actor, timestamp, rationale, prior and new state and communicate outcome. Negative / exception rule: Given a user edits history or AI proposes approval, when persisting, then deny audit mutation/AI authority and log the attempted action without exposing another supplier's data. Trace: US12 → V04 → D06 → TC12.
Record
Supplied state
Required distinction / example

ONB-8101 · Northstar Foods
Harvest Trail Granola / Packaged Food
12 Oct 2026; 82% complete.
Allergen declaration missing; nutrition panel supplied
Mandatory evidence blocks compliance and assortment approval.

ONB-8102 · Willow & Coast
CalmLeaf Hand Lotion / Personal Care
28 Sep 2026; 91% complete.
“48-hour moisture” claim conflicts across label and evidence
Clarify and verify claim; never infer compliance from 91% completeness.

ONB-8103 · Hearthline Goods
WinterGlow Lantern Set / Seasonal Home
20 Oct 2026; 76% complete.
Battery safety declaration and carton dimensions missing
Urgency cannot remove mandatory blockers; downstream packaging readiness remains separate.

ONB-8104 · Meadowlane Pantry
Garden Cup Soup / Packaged Food
16 Nov 2026; 100% complete.
Category review pending 6 days; no compliance blocker
Complete is not category-approved, assortment-approved or launch-ready.


Completeness counts supplied required information; it is neither truth nor approval. A provided document stays supplier-provided until verified. Category fit approval, compliance verification, final assortment approval and launch go/no-go are distinct states. No conflict, mandatory gap or expired exception may be hidden by a percentage.
06  Non-functional requirements and measurable criteria
All thresholds below are proposed release criteria, not measured prototype capabilities. The production load model, support objectives and toolchain require customer validation.
NFR01 — Identity, supplier isolation and authorization. Acceptance: Given two supplier tenants and each mock/business role, when exercising read/write/export and decision APIs, then all unauthorized cross-supplier actions are denied and logged in the production design test suite. Stop/failure behavior: Given a supplier guesses another record ID or changes the UI role, when requesting data, then server authorization still denies access; local role switch is never authentication evidence. Assumptions: Production identity provider and tenant boundary are unknown; security tests are planned. Trace US13 / TC13.
NFR02 — Privacy, retention and secure evidence handling. Acceptance: Given evidence ingestion, when stored/transferred, then use approved encryption in transit/at rest, restrict access, scan files, inventory personal data and apply approved deletion/legal-hold policies. Stop/failure behavior: Given retention/encryption choices are unapproved, when release is requested, then stop at the privacy/security gate; do not invent a retention period. Assumptions: Encryption algorithms, residency, retention duration, lawful basis and DLP design TBD. Trace US14 / TC14.
NFR03 — Grounded AI, uncertainty and injection evaluation. Acceptance: Given 100 proposed curated source-linked cases, when evaluating suggestions, then 100% of evidence assertions have source/version citations or explicit abstention and zero automatic approvals occur. Stop/failure behavior: Given hostile evidence, contradictory claims or no source, when AI is asked to override rules/reveal data, then ignore document instructions, abstain/escalate and retain mandatory blockers. Assumptions: Evaluation sample size and zero-critical-failure stop gate are proposed; model/vendor unspecified. Trace US15 / TC15.
NFR04 — Accessibility and supplier fairness evaluation. Acceptance: Given the six views, when independent keyboard/screen-reader/zoom and automated checks run, then satisfy WCAG 2.2 AA with zero critical task blockers; paired supplier-size/format variants have identical eligibility/priority. Stop/failure behavior: Given supplier-size or format-only counterfactual changes, when outcomes differ or a task is inaccessible, then halt release and remediate before approval. Assumptions: Cohort sample sizes and supported assistive technologies must be confirmed. Trace US16 / TC16.
NFR05 — Performance, concurrency, resilience and recovery. Acceptance: Given a proposed 50 concurrent users, 260 submissions/month and 10 MB evidence files, when testing 30 minutes, then p95 non-AI read <2s and write <3s, AI response/abstention <10s; zero lost approved decisions. Stop/failure behavior: Given conflicting saves or integration outage, when retrying, then return a conflict, keep durable queue/idempotency keys and never duplicate approval; proposed RTO 4h/RPO 15m must be ratified. Assumptions: Burst shape, file limit, response budgets and recovery objectives are proposed assumptions. Trace US17 / TC17.
NFR06 — Operability, adoption, support and rollback. Acceptance: Given pilot readiness, when service rehearsal runs, then named support owners triage an incident, disable AI without disabling manual controls, reconcile queues and restore the last approved rule/model version. Stop/failure behavior: Given missing on-call owner, runbook, training or unresolved critical incident, when launch gate is reviewed, then block release; production support must not be implied by the prototype. Assumptions: Support hours, SLAs, monitoring platform and adoption coverage targets are proposed. Trace US18 / TC18.
NFR01 owns RBAC/supplier isolation; NFR02 security/privacy/retention; NFR03 grounded AI; NFR04 accessibility/fairness; NFR05 latency/concurrency/recovery; NFR06 operability/adoption. This naming is fixed across workbook, prototype trace and UAT.
07  Information, data quality and ownership
The source contains four sample records and aggregate fictional baselines, not an approved schema. Proposed dictionary below must be confirmed by US19. Unknown values are null/unknown, not inferred. Raw evidence and its extracted summary remain separate.
Data object / key fields
Quality/provenance rule
Proposed accountable owner

Submission: submissionId, supplierId/contact, productName, category, channels[], requestedLaunchDate, created/submitted/firstReviewed timestamps
Stable IDs; category enum Packaged Food/Personal Care/Seasonal Home; ISO date in implementation; first-review snapshot immutable; PII minimum necessary
Supplier experience lead; supplier is source

Product details: ingredients, claims, packaging dimensions/units, commercial facts, demand assumptions, content/imagery
Required fields depend on versioned category/channel rule pack; units and conflicting source values retained; commercial unknowns remain unknown
Category manager; content/channel owner

Evidence: evidenceId, sourceURI/file reference, sourceType, received/source dates, version/hash, rule/claim link, supplierProvided flag, verification status
Retain source/version and timestamps; scan and authorize uploads; missing source date shown unknown; AI extraction never replaces source
Compliance owner

Rule pack: ruleId, category, mandatory flag, policySource, version, validity, effective date, owner
Only customer-approved authoritative policies activate production; validity periods TBD
Compliance owner

Review/decision: actorId/role, source versions, decision type, outcome, rationale, timestamp
Separate category, compliance, assortment and launch decisions; reject stale writes; immutable history
Responsible human decision owner

Clarification: roundId, field/evidence/conflicting values, requested correction, owner, due, response, resubmit version
One consolidated outbound round; preserve chronology; do not count each field as a cycle
Merchandising operations lead

Exception/blocker: mandatory flag, scope, channels, owner, rationale, condition/expiry, escalation, resolution
Mandatory cannot be excepted; expiry/changed condition restores blocker; no unowned issue clears gate
Assortment approver

Readiness/handoff: channel, content, packaging, supply, current gate status, recipient, acknowledgement/time
Explicit unknown/pending/blocked/ready states; receiving acknowledgement separate from approval
Content/channel readiness owner

Audit/contest: eventId, actor, prior/new state, source version, reason, resolver, appeal outcome
Append-only, supplier-scoped access; correction adds new event, not destructive edit; retention TBD
Compliance owner / security

Metrics: firstReviewComplete, evidenceRequired/present, decision duration, clarification rounds, blocker proximity, effort/cohort
Snapshot numerator/denominator; expose missingness; no unverified control claims; cohort privacy thresholds TBD
Product Owner / data lead


Source of truth for original records: supplied challenge scenario; source of proposed planning IDs/points/placement: canonical delivery brief dated 2026-09-07. A production source-of-truth mapping and named data stewards are discovery outputs, not known vendor assignments.
08  Security, privacy, compliance and responsible AI
AI is advisory: checklist guidance, missing/conflicting information detection, evidence summarization, explainable queue support and blocker summaries. Authorized people verify sources and make every category, compliance, assortment and exception decision. A deterministic rule gate, not an LLM answer, determines whether mandatory prerequisites are satisfied.
Treat supplier evidence and retrieved text as untrusted data, never instructions. Isolate retrieval by supplier and authorization; allow-list source types; show citations/version and uncertainty; redact/minimize PII; log safe audit metadata; reject hidden instructions and requests to reveal another supplier's records. External AI/model/provider and deployment architecture are unspecified.
Proposed stop gates: any unauthorized disclosure/action, mandatory-bypass suggestion accepted by workflow, automatic approval, critical accessibility blocker or discriminatory paired-test outcome stops release and triggers security/compliance review. An unsupported assertion or conflict must abstain/escalate; required control evidence cannot be overridden for launch urgency.
Proposed evaluation: 100 curated normal/missing/conflicting/stale/hostile cases plus paired supplier-size/format variants; cover every category, role and four source records. Require source citation or abstention on every material evidence assertion, zero cross-supplier leaks and zero automatic approvals. Exact cohort sample sufficiency and language coverage require D6/D8 review.
Monitor supplier effort, corrections, appeals/reversals, false blockers, ungrounded outputs, subgroup differences and drift. Human reviewers can contest and correct with retained provenance. Pause AI, retain manual standards, rollback approved rule/model version and rerun regression before resuming. No evaluation or production test is claimed executed by this package.
09  Dependencies and integration boundaries
Boundary
Contract to discover (US20)
Ownership / stop condition

Supplier/product master and intake
Record identity, field schema, duplicate handling, supplier tenant key, validation and authoritative writes
Technical lead + customer master-data owner TBD; no integration commitment without schema

Evidence/document storage and policy repository
Upload/file scanning, source versions, ACL, expiry/legal hold, citations and audit retrieval
Compliance + security + system owner TBD

Content and store/digital channels
Approved facts/claims only, readiness status, channel-specific checks, publish acknowledgement
Content/channel owner; no auto-publish from prototype

Supply/packaging/launch orchestration
Packaging units, supply readiness, blocker changes, recipient handoff acknowledgement
Supply/launch owner TBD; no-go without receiving owner

Identity, audit, notification and monitoring
Server RBAC/supplier isolation, actor IDs, event correlation, delivery retries, incident observability
Security/service owners TBD; no real messages or identity in simulation


Proposed reliability contract: version/ETag checks, correlation IDs, idempotency keys, durable outbox, bounded retry then visible failed queue, replay/reconciliation with source totals and least-privilege credentials. Payloads, SLAs, vendors, API limits and environment access remain unknown. No live endpoints or vendor selection are implied.
10  Risks, issues, assumptions and constraints
ID / type / rating
Exposure
Owner / due / response

R01 / Risk / High
Seasonal dates precede unvalidated category delivery capacity
CMO / D5: Ratify D03; accept risk or fund re-estimation. Trigger: Requested launch threatened while rules/capacity unapproved

R02 / Risk / Critical
Mandatory evidence or claim conflicts produce unsafe approval
Compliance owner / D2: D01/D06 gates; source-linked specialist review. Trigger: Any unresolved mandatory blocker or stale version

R03 / Risk / High
Supplier burden or accessibility excludes smaller suppliers
Supplier experience lead / D3: D02/D05; consolidated assistance and paired fairness tests. Trigger: Repeated corrections or format/size affects priority

R04 / Risk / Critical
AI injection, unsupported claim or cross-supplier leakage
AI/security lead / D6: Untrusted-source isolation; server RBAC; abstain and stop gates. Trigger: One critical failure in evaluation or incident

R05 / Risk / High
S2 backlog concentration exceeds available capacity
Delivery lead / D9: Validate capacity, split/resequence stories; no four-sprint commitment. Trigger: Sprint load exceeds effective capacity

A01 / Assumption / High
Cross-functional team and part-time specialists will be available
Delivery lead / D9: Confirm names, allocations and funding. Trigger: Missing critical role at G0

A02 / Assumption / Medium
Proposed targets and workload represent a useful pilot hypothesis
Product Owner / D8: Validate event data, workload and supplier feedback. Trigger: Baseline/denominator not reproducible

I01 / Issue / High
Customer workshop, D01-D07 ratification and acceptance have not happened
Product Owner / D10: Schedule review; record actual decisions with blank signoff slots. Trigger: G0 approached without business review

I02 / Issue / High
Production policies, vendor contracts and retention decisions absent
Technical lead / D4: Run US19/US20; keep TBD and block affected release gate. Trigger: Implementation commitment requested without discovery

DEP01 / Dependency / High
Authoritative category policies and sample evidence
Compliance owner / D2: Obtain versioned samples and assign authoritative owner. Trigger: Source owner unavailable

DEP02 / Dependency / High
System ownership, identity, integration and environment access
Technical lead / D3: Contract/permission spikes; explicit acceptance from owners. Trigger: API/auth/tenant boundary unknown

DEP03 / Dependency / High
Human acceptance, operational ownership and support funding
Product Owner / D10: RACI, UAT slots, training and support coverage. Trigger: Gate without named accountable owner


S0 is a relative ten-business-day preparation plan. S1–S4 are provisional dependency placements only. Story points are not hours; S2 is overloaded against the illustrative capacity model and must be rebalanced. The source supplies no committed implementation dates, funded staffing or benefit guarantee.
11  Success measures, acceptance and signoff
KPI
Source baseline
Proposed target / definition

K01 Complete at first review
59%
75% proposed pilot hypothesis. Complete first-reviewed submissions / all first-reviewed submissions

K02 Clarification cycles
2.7
2.0 or fewer proposed. Consolidated outbound correction rounds per decisioned submission

K03 Median decision time
18 business days
14 or fewer proposed. Business-day elapsed initial submit to assortment decision; holiday calendar TBD

K04 Evidence present at first review
68% among evidence-required submissions
90% proposed; 100% verified mandatory items at approval is a control. Separate presence from verified compliance; denominator evidence-required submissions

K05 Launch blockers within three weeks
11 of 19 planned launches
Reduce; target ratified D8. Distinct products with unresolved blockers and requested launch within 21 calendar days

K06 Supplier clarification effort
4.2 hours / submission
3 hours or fewer proposed. Supplier-reported active effort; segment assisted/unassisted and supplier cohorts


K04 resolves the ambiguous source label: 68% is evidence presence at FIRST REVIEW among evidence-required submissions, not verified compliance at approval. Proposed approval control is 100% of mandatory items verified against current evidence; show both measures separately. All KPI benefits and pilot targets await ratification and observation.
Proposed sampling: capture event timestamps and first-review snapshot per submission; report weekly by category and submission cohort, assisted/unassisted path and supplier cohorts only where privacy permits. Define holiday calendar, exclusions, missing observations and cohort closure before comparing medians. Supplier effort is voluntary active-time feedback, not elapsed waiting time.
Acceptance layer
Evidence required
Current status

Artifact technical QA
OOXML validation, Excel formulas/caches, PDF visual review and local prototype test evidence
Recorded separately in QA report; not business signoff

Sprint 0 business acceptance / G0
Business owner confirms prototype direction; traceable requirements; credible staffed backlog/plan; visible assumptions/dependencies; decision-ready SteerCo
Pending customer workshop, reviews, decisions and S2 rebalance

Pilot release / G1
Passed implementation functional/security/RAI/accessibility/performance tests, business UAT, verified policies, support/adoption readiness and human signoff
Not performed; outside this preparation package

Expansion / G2–G3
Approved category rule packs, regression, specialist capacity and explicit readiness/timing decision
Provisional only


Acceptance record — Business owner name: __________________; role: __________________; reviewed version: __________________; date: __________________; outcome (accepted/conditional/rejected): __________________; conditions/actions and owners: __________________. No signature or customer acceptance has been recorded.
12  Decisions, open questions and exact traceability
D01–D07 are proposed exercise decisions awaiting ratification. CR01 = compliance constraint; CR02 = supplier burden; CR03 = multi-category seasonal pressure. These are supplied scenario change requests, not evidence that an actual customer workshop took place.
Decision / change request
Recommendation
Owner / due / status

D01 / CR01
Mandatory evidence cannot be excepted; distinct category, compliance and assortment decisions; launch is a separate gate.
Compliance owner / Sprint 0 D2 / Proposed exercise decision — awaiting ratification

D02 / CR02
Minimum viable intake may be saved and submitted for triage while incomplete. Consolidate corrections; assisted path preserves all mandatory standards.
Supplier experience lead / Sprint 0 D3 / Proposed exercise decision — awaiting ratification

D03 / CR03
Pilot Packaged Food; phase Seasonal Home then Personal Care after rule approval. SteerCo explicitly accepts seasonal timing risk or funds re-estimation; no date promise.
Chief Merchandising Officer / Sprint 0 D5 / Proposed exercise decision — awaiting ratification

D04 / CR01
Non-mandatory exceptions require authorized assortment owner, rationale, condition or expiry, channels and escalation. Expired exceptions cease to clear launch blockers.
Assortment approver / Sprint 0 D4 / Proposed exercise decision — awaiting ratification

D05 / CR02
Queue priority uses mandatory risk, launch proximity and age, never supplier size or format. Category queue highlights nearly ready aged items.
Merchandising operations lead / Sprint 0 D4 / Proposed exercise decision — awaiting ratification

D06 / CR01
Evidence provenance and versions retained; changed evidence revokes verification and dependent approvals. AI supports humans and never approves.
Compliance owner / Sprint 0 D4 / Proposed exercise decision — awaiting ratification

D07 / CR02
Baseline and targets must be validated with category/cohort measures and supplier-effort feedback before pilot launch.
Product Owner / Sprint 0 D8 / Proposed exercise decision — awaiting ratification


Question
Open issue
Owner / due

Q01
Which rules, mandatory fields, accepted evidence, version validity and minimum intake apply per category?
Compliance owner / D2

Q02
Who can approve category fit, compliance, assortment, launch and exceptions; how are appeals handled?
Product Owner / D2

Q03
Which systems own product, supplier, evidence, content, supply and identity; what APIs and acknowledgement exist?
Technical lead / D3

Q04
Can source baselines and proposed targets be measured from agreed first-review/cohort events?
Product Owner / D8

Q05
What privacy basis, residency, encryption standards, retention and legal-hold rules apply?
Security/privacy lead / D4

Q06
Which support/notification channels, SLAs, service hours and run owners are funded?
Service owner / D7

Q07
What review-priority weights, tie-breaks, unknown-age handling and workload SLAs are acceptable?
Merchandising operations lead / D4

Q08
Which languages, accessible formats and supplier cohorts must the pilot support?
Supplier experience lead / D3

Q09
Which AI tasks/model, source boundaries, evaluation corpus and stop gates are approved?
AI evaluation lead / D6

Q10
What staffed capacity, burst workload, recovery objectives and integration availability are real?
Delivery lead / D9

Q11
Does SteerCo accept seasonal timing risk or fund parallel scope discovery and re-estimation?
Chief Merchandising Officer / D5

Q12
Who will accept each Sprint 0 artifact, prototype direction and implementation release?
Product Owner / D1; confirm D10


Requirement
Story / prototype view
Decision / acceptance test

FR01
US01 / V01
D02 / TC01

FR02
US02 / V02
D02 / TC02

FR03
US03 / V01
D02 / TC03

FR04
US04 / V06
D05 / TC04

FR05
US05 / V03
D01 / TC05

FR06
US06 / V04
D06 / TC06

FR07
US07 / V04
D06 / TC07

FR08
US08 / V05
D01 / TC08

FR09
US09 / V05
D04 / TC09

FR10
US10 / V05
D01 / TC10

FR11
US11 / V06
D07 / TC11

FR12
US12 / V04
D06 / TC12

NFR01
US13 / V01
D01 / TC13

NFR02
US14 / V04
D06 / TC14

NFR03
US15 / V04
D06 / TC15

NFR04
US16 / V01
D02 / TC16

NFR05
US17 / V05
D01 / TC17

NFR06
US18 / V06
D07 / TC18

EN01
US19 / V04
D01 / TC19

EN02
US20 / V05
D03 / TC20

EN03
US21 / V06
D07 / TC21

EN04
US22 / V01
D03 / TC22

EN05
US23 / V04
D03 / TC23

EN06
US24 / V06
D03 / TC24


Trace IDs are stable across BRD, handbook and workbook. TC01–TC24 are proposed test cases mapped one-to-one to stories; each has positive and negative examples. A technical prototype test pass, if separately evidenced, is not a production implementation pass or business-owner acceptance.


===== FILE: delivery-control-workbook.xlsx =====
===== TYPE: .xlsx (signature D0-CF-11-E0-A1-B1-1A-E1) =====
===== SECTIONS DETECTED: 15 worksheet(s) (legacy Excel, COM extraction) =====

----- SHEET Overview -----
Item | Value / instruction
Purpose | Editable delivery control register for the fictional supplier/product onboarding exercise
As of | 2026-09-07; S0 days are relative, not elapsed work
Status | Fictional exercise; AI-authored working package. Customer workshop, business-owner acceptance, policy confirmation and SteerCo decisions are pending. No real customer validation or production deployment has occurred.
Scope | Prototype all three categories and all four supplied cases. Recommend Packaged Food as the initial implementation pilot, then gated Seasonal Home and Personal Care rule packs. Seasonal pressure is explicitly escalated; do not imply a production commitment to the supplied launch dates.
Boundary | No live AI, external service, actual supplier messaging, production identity, system integration, rollout, migration or final production acceptance. HTML is a local interactive simulation with mock role switching, not authentication. All added policy thresholds, channels, evidence dates, prices, owner names and record ages are illustrative assumptions.
Story count | 24
Total points | 104
S2 load | 62
S2 planning warning | OVERLOADED — REBALANCE
Planning | S1–S4 are provisional dependency buckets. S2 overloaded until capacity validated; no four-sprint or launch-date promise.
Reading order | Overview → Decisions/Open Questions → Backlog/Requirements trace → Sprint0 Plan/Release Plan/Estimation → RAID/RACI → UAT/Acceptance → Adoption/Handoff
Legend: blue input | Blue-font pale-blue cells = editable capacity assumptions. Change these to explore sensitivity; values are proposed.
Legend: teal formula | Teal text/pale-teal cells = formula output. Do not overwrite. Backlog points remain editable after governed re-estimation.
Legend: source/status | Black/navy = supplied IDs/source or proposed narrative. All business acceptance Pending; technical test coverage is not falsely passed.
Change control | Keep exact IDs; log rationale, owner, approval and capacity effect before rebaselining. Additions require formula/table range extension.
PDF companion | Read-only export repeats IDs/headers across horizontal page bands for wide registers. The XLSX is the complete editable source.
Definition of Ready | Named persona/value; stable FR/US/V/D/TC trace; applicable rule/data owner; positive/negative acceptance; dependencies/questions owned; estimate and staffed placement. Unapproved mandatory policy remains a spike.
Definition of Done | Implementation acceptance with evidence, peer review, no critical controls/privacy/accessibility defects, relevant RAI/RBAC/version tests, telemetry/runbook/training, rollback and explicit PO acceptance. Prototype/format QA alone is not production DoD.
Source operating inputs | 260 monthly submissions: 110 Packaged Food, 85 Personal Care, 65 Seasonal Home; 46 open submissions per category manager; 74 planned launches in eight weeks. Fictional exercise baselines, not observed customer facts.
ONB-8101 source sample | Northstar Foods — Harvest Trail Granola / Packaged Food. Requested 12 Oct 2026; 82% complete; Allergen declaration missing; nutrition panel supplied. Mandatory evidence blocks compliance and assortment approval.
ONB-8102 source sample | Willow & Coast — CalmLeaf Hand Lotion / Personal Care. Requested 28 Sep 2026; 91% complete; “48-hour moisture” claim conflicts across label and evidence. Clarify and verify claim; never infer compliance from 91% completeness.
ONB-8103 source sample | Hearthline Goods — WinterGlow Lantern Set / Seasonal Home. Requested 20 Oct 2026; 76% complete; Battery safety declaration and carton dimensions missing. Urgency cannot remove mandatory blockers; downstream packaging readiness remains separate.
ONB-8104 source sample | Meadowlane Pantry — Garden Cup Soup / Packaged Food. Requested 16 Nov 2026; 100% complete; Category review pending 6 days; no compliance blocker. Complete is not category-approved, assortment-approved or launch-ready.

----- SHEET Epics -----
Epic | Name | Business outcome | Story count | Points | Proposed accountable role
EP01 | Supplier collaboration | Lower supplier rework | 3 | 13 | Supplier experience lead
EP02 | Category decisions | Accountable fit and workload decisions | 2 | 10 | Category manager
EP03 | Evidence and governed approvals | Evidence-grounded human approval | 5 | 28 | Compliance owner
EP04 | Launch and portfolio | Explicit launch readiness and measurement | 2 | 8 | Content/channel readiness owner
EP05 | Trust and service readiness | Trustworthy accessible operable service | 6 | 24 | Technical lead
EP06 | Discovery and phased expansion | Discovery and gated category expansion | 6 | 21 | Delivery lead

----- SHEET Backlog -----
Story | Epic | Feature / story | Persona | Need / business value | GWT positive acceptance | GWT negative acceptance | Dependencies | Priority | Sprint | Points | Proposed owner | Requirement | View | Decision | Test | Milestone | Assumptions | Open question | Status
US01 | EP01 | Category-specific intake and draft/submit | Supplier contact | Save work early and see category-specific missing fields without being excluded from triage. | Given Northstar is 82% complete, when the supplier saves and submits the minimum viable intake, then retain the draft version, mark incomplete/triage and list missing allergen evidence. | Given mandatory evidence is absent, when submission is attempted, then triage is allowed but no compliance, assortment or launch approval is inferred. | US19; US13; US14 | Must | S1 | 5 | Supplier experience lead | FR01 | V01 | D02 | TC01 | G1 prerequisite | Minimum viable intake proposed: supplier identity/contact, product name/category and requested channels; exact mandatory schema Q01. | Q01 | Proposed / not started
US02 | EP01 | Consolidated clarification and resubmission | Supplier contact | Reduce repeated requests through one owned correction round. | Given Northstar has an open request, when operations consolidates corrections and supplier resubmits, then show the field/evidence, conflict, requested change, owner, due date and response in one versioned round. | Given a repeated request for the same unresolved field, when a new round is composed, then merge/deduplicate rather than silently reset history or count each field as a cycle. | US01 | Must | S1 | 5 | Supplier experience lead | FR02 | V02 | D02 | TC02 | G1 prerequisite | Notification channel and response service target are proposed; no message actually sent by mock. | Q06 | Proposed / not started
US03 | EP01 | Accessible guidance and assisted onboarding | Supplier contact | Obtain accessible assistance without lowered mandatory standards. | Given an assisted or keyboard-only user, when requesting support and following guidance, then show plain-language category examples, route to named support owner and preserve the supplier's saved work. | Given a small supplier/non-standard format, when triaging, then do not lower its priority or waive mandatory evidence; provide an accessible alternative. | US01 | Must | S1 | 3 | UX/accessibility lead | FR03 | V01 | D02 | TC03 | G1 prerequisite | Languages, support hours and supported evidence formats require validation. | Q08 | Proposed / not started
US04 | EP02 | Explainable review queue and workload | Merchandising operations lead | Focus reviewers on material risk and aged nearly-ready work. | Given the four samples, when queue filters/sort are applied, then expose mandatory risk, launch proximity, age, workload and Meadowlane's six-day pending review with an explainable reason. | Given only supplier size or unfamiliar format changes, when re-ranking, then priority must not worsen; missing age stays unknown rather than invented. | US01; US21 | Must | S2 | 5 | Merchandising operations lead | FR04 | V06 | D05 | TC04 | G1 candidate; rebalance | Ranking weights, tie-break and service targets proposed; owner must ratify. | Q07 | Proposed / not started
US05 | EP02 | Category recommendation, approval and return | Category manager | Make accountable assortment-fit decisions with commercial context. | Given Meadowlane is complete and has no compliance blocker, when category review is recorded, then assess customer need, overlap, commercial facts, demand assumptions, requested launch and readiness; record recommend/approve-fit/return with rationale. | Given category fit is approved, when viewing final status, then neither compliance verification nor final assortment approval is substituted by that decision. | US01; US04 | Must | S2 | 5 | Category manager | FR05 | V03 | D01 | TC05 | G1 candidate; rebalance | Commercial values are not supplied; display unknown, never fabricate prices/demand. | Q01 | Proposed / not started
US06 | EP03 | Source-linked evidence review and conflict resolution | Compliance owner | Verify source evidence and resolve conflicts through specialists. | Given Willow & Coast's claim conflicts, when reviewing evidence, then show claim/rule, source, date if known, version, supplier-provided state, uncertainty and specialist notes; request clarification before verification. | Given a source is missing, stale, contradictory or only AI-generated, when attempting verification, then block advancement and assign named human review. | US19; US14 | Must | S2 | 8 | Compliance owner | FR06 | V04 | D06 | TC06 | G1 candidate; rebalance | Applicable evidence validity periods and authoritative policies are TBD. | Q01 | Proposed / not started
US07 | EP03 | Version changes invalidate approvals | Compliance owner | Prevent stale approvals surviving material source changes. | Given verified evidence and dependent approvals, when that evidence version changes, then revoke verification and dependent compliance/assortment/launch approvals, retain old audit versions and require re-review. | Given a stale browser version, when a reviewer saves a decision, then reject the lost-update attempt and require refresh; never overwrite a newer review. | US06; US05 | Must | S2 | 5 | Technical lead | FR07 | V04 | D06 | TC07 | G1 candidate; rebalance | Material-change rules require policy ownership; default safe re-review is proposed. | Q01 | Proposed / not started
US08 | EP03 | Separate assortment and launch gates | Assortment approver | Separate completeness, category, compliance, assortment and launch. | Given current category approval and verified mandatory evidence, when an authorized approver decides assortment, then record an explicit approval with rationale and keep launch pending until all launch gates pass. | Given Northstar lacks allergen evidence or Meadowlane is merely complete, when final approval is attempted, then block and show the missing prerequisite; launch urgency never overrides it. | US05; US06; US07 | Must | S2 | 5 | Assortment approver | FR08 | V05 | D01 | TC08 | G1 candidate; rebalance | Authority matrix and segregation controls await customer approval. | Q02 | Proposed / not started
US09 | EP03 | Bounded non-mandatory exceptions and escalation | Assortment approver | Resolve only eligible exceptions within an auditable boundary. | Given a non-mandatory condition, when an authorized owner grants an exception, then require rationale, condition or expiry, affected channels, escalation owner and record scope. | Given mandatory evidence is unresolved, an unauthorized role acts, or an exception expires, when clearing a launch blocker, then deny/restore blocker and escalate. | US08; US12 | Must | S2 | 5 | Assortment approver | FR09 | V05 | D04 | TC09 | G1 candidate; rebalance | Eligible exception catalogue and response SLAs are TBD; no mandatory exception. | Q02 | Proposed / not started
US10 | EP04 | Channel, content, packaging, supply and handoff readiness | Content/channel readiness owner | Hand over products only when channel and supply readiness is explicit. | Given assortment approval, when preparing launch, then separately record store/digital content, images, claims, packaging, supply, owner, due date and receiving-team acknowledgement; issue go only when all required checks are current. | Given Hearthline lacks carton dimensions, when approval exists on another track, then launch remains no-go; an absent acknowledgement cannot be treated as complete. | US08; US09; US20 | Must | S2 | 5 | Content/channel readiness owner | FR10 | V05 | D01 | TC10 | G1 candidate; rebalance | Channel-specific fields, supply system and launch authority are unknown. | Q03 | Proposed / not started
US11 | EP04 | Portfolio measures and supplier effort | Merchandising operations lead | Measure improvement without confusing presence and verified control. | Given first-review and decision events, when computing K01-K06, then apply cohort denominators, preserve first-review snapshots and show supplier effort, missingness and category drill-down. | Given 68% mandatory evidence presence at first review, when reporting approval readiness, then do not label 68% verified at approval; 100% mandatory verification is a separate proposed gate. | US04; US21 | Should | S2 | 3 | Product Owner | FR11 | V06 | D07 | TC11 | G1 candidate; rebalance | Targets are hypotheses, calendar/cohort rules and baselines require D8 validation. | Q04 | Proposed / not started
US12 | EP03 | Audit, contest and named human resolution | Compliance owner | Contest and reconstruct human decisions from immutable provenance. | Given a contested decision, when a supplier requests review, then assign a named human resolver, retain source/version, actor, timestamp, rationale, prior and new state and communicate outcome. | Given a user edits history or AI proposes approval, when persisting, then deny audit mutation/AI authority and log the attempted action without exposing another supplier's data. | US06; US14 | Must | S2 | 5 | Compliance owner | FR12 | V04 | D06 | TC12 | G1 candidate; rebalance | Appeal SLA, retention and identity audit fields are pending. | Q02 | Proposed / not started
US13 | EP05 | Identity, supplier isolation and authorization | Supplier contact | Keep supplier records isolated and actions role-authorized. | Given two supplier tenants and each mock/business role, when exercising read/write/export and decision APIs, then all unauthorized cross-supplier actions are denied and logged in the production design test suite. | Given a supplier guesses another record ID or changes the UI role, when requesting data, then server authorization still denies access; local role switch is never authentication evidence. | US19 | Must | S1 | 5 | Security lead | NFR01 | V01 | D01 | TC13 | G1 prerequisite | Production identity provider and tenant boundary are unknown; security tests are planned. | Q02 | Proposed / not started
US14 | EP05 | Privacy, retention and secure evidence handling | Compliance owner | Protect evidence and minimize personal data. | Given evidence ingestion, when stored/transferred, then use approved encryption in transit/at rest, restrict access, scan files, inventory personal data and apply approved deletion/legal-hold policies. | Given retention/encryption choices are unapproved, when release is requested, then stop at the privacy/security gate; do not invent a retention period. | US19 | Must | S1 | 3 | Security/privacy lead | NFR02 | V04 | D06 | TC14 | G1 prerequisite | Encryption algorithms, residency, retention duration, lawful basis and DLP design TBD. | Q05 | Proposed / not started
US15 | EP05 | Grounded AI, uncertainty and injection evaluation | Compliance owner | Use grounded assistance without delegating human authority. | Given 100 proposed curated source-linked cases, when evaluating suggestions, then 100% of evidence assertions have source/version citations or explicit abstention and zero automatic approvals occur. | Given hostile evidence, contradictory claims or no source, when AI is asked to override rules/reveal data, then ignore document instructions, abstain/escalate and retain mandatory blockers. | US06; US14; US21 | Must | S2 | 5 | AI evaluation lead | NFR03 | V04 | D06 | TC15 | G1 candidate; rebalance | Evaluation sample size and zero-critical-failure stop gate are proposed; model/vendor unspecified. | Q09 | Proposed / not started
US16 | EP05 | Accessibility and supplier fairness evaluation | Supplier contact | Meet accessibility and equitable treatment requirements. | Given the six views, when independent keyboard/screen-reader/zoom and automated checks run, then satisfy WCAG 2.2 AA with zero critical task blockers; paired supplier-size/format variants have identical eligibility/priority. | Given supplier-size or format-only counterfactual changes, when outcomes differ or a task is inaccessible, then halt release and remediate before approval. | US03; US21 | Must | S2 | 3 | UX/accessibility lead | NFR04 | V01 | D02 | TC16 | G1 candidate; rebalance | Cohort sample sizes and supported assistive technologies must be confirmed. | Q08 | Proposed / not started
US17 | EP05 | Performance, concurrency, resilience and recovery | Assortment approver | Preserve responsiveness and decision integrity under failure. | Given a proposed 50 concurrent users, 260 submissions/month and 10 MB evidence files, when testing 30 minutes, then p95 non-AI read <2s and write <3s, AI response/abstention <10s; zero lost approved decisions. | Given conflicting saves or integration outage, when retrying, then return a conflict, keep durable queue/idempotency keys and never duplicate approval; proposed RTO 4h/RPO 15m must be ratified. | US07; US13; US20 | Must | S2 | 5 | Technical lead | NFR05 | V05 | D01 | TC17 | G1 candidate; rebalance | Burst shape, file limit, response budgets and recovery objectives are proposed assumptions. | Q10 | Proposed / not started
US18 | EP05 | Operability, adoption, support and rollback | Merchandising operations lead | Run, support, train and roll back safely. | Given pilot readiness, when service rehearsal runs, then named support owners triage an incident, disable AI without disabling manual controls, reconcile queues and restore the last approved rule/model version. | Given missing on-call owner, runbook, training or unresolved critical incident, when launch gate is reviewed, then block release; production support must not be implied by the prototype. | US10; US15; US16; US17 | Must | S2 | 3 | Service owner | NFR06 | V06 | D07 | TC18 | G1 candidate; rebalance | Support hours, SLAs, monitoring platform and adoption coverage targets are proposed. | Q06 | Proposed / not started
US19 | EP06 | Policy and data discovery spike | Compliance owner | Discover policy, data definitions and evidence authority. | Given customer policies and four samples, when the spike ends, then produce a versioned category-rule inventory, data dictionary, missing/unknown fields and owner approvals required for G0. | Given missing policy or contradictory evidence rules, when the spike is reviewed, then record open questions/risks and do not mark rules approved. | None | Must | S0 | 3 | Business analyst | EN01 | V04 | D01 | TC19 | G0 | Customer policy and data access not yet provided. | Q01 | Proposed / not started
US20 | EP06 | Integration contract and system ownership spike | Content/channel readiness owner | Understand system contracts before integration estimation. | Given customer system-owner interviews, when discovery ends, then document intake, evidence, product master, content/channel, supply and identity boundaries with schemas, auth, retry and ownership. | Given absent vendor/API or ambiguous ownership, when estimating integration, then retain TBD and re-estimation dependency; do not invent system names. | None | Must | S0 | 3 | Technical lead | EN02 | V05 | D03 | TC20 | G0 | No named systems/vendors/contracts in source; spike does not build live integrations. | Q03 | Proposed / not started
US21 | EP06 | Baseline, evaluation and acceptance design | Merchandising operations lead | Design defensible measures and acceptance evidence. | Given source baselines and cohort examples, when designing acceptance, then confirm denominator/time rules, proposed targets, RAI corpus and business signoff slots for K01-K06 and TC01-TC24. | Given prototype outputs only, when assessing success, then do not report achieved benefit, completed customer UAT or validated performance. | None | Must | S0 | 3 | Product Owner | EN03 | V06 | D07 | TC21 | G0 | Baseline event availability and representative data are unverified. | Q04 | Proposed / not started
US22 | EP06 | Seasonal Home rule pack and requalification | Supplier contact | Expand Seasonal Home only after safety rules are approved. | Given G1 candidate controls and approved Seasonal Home rule pack, when Hearthline is replayed, then battery safety and packaging gaps remain blockers until verified/resolved and category regression passes. | Given the 20 Oct request or unapproved rules, when expansion is proposed, then escalate timing risk rather than waive controls or promise that date. | US19; US20; US24; US08; US17 | Should | S3 | 5 | Category manager | EN04 | V01 | D03 | TC22 | G2 | S3 is provisional; seasonal risk decision and capacity re-estimate required. | Q11 | Proposed / not started
US23 | EP06 | Personal Care rule pack and claim-specialist review | Compliance owner | Add Personal Care with specialist claim verification. | Given approved Personal Care rules and claim specialist, when Willow & Coast is replayed, then the 48-hour moisture conflict cannot advance until reconciled and verified by a human. | Given the 28 Sep request or missing specialist, when go-live is discussed, then record risk/no-go; S4 is not a promise to meet September demand. | US22; US06; US15 | Should | S4 | 5 | Compliance owner | EN05 | V04 | D03 | TC23 | G3 | S4 after gated Seasonal Home is recommended, not customer agreed. | Q11 | Proposed / not started
US24 | EP06 | Sprint 0 handoff, decisions and gate review | Merchandising operations lead | Hand over a decision-ready, governable implementation foundation. | Given D1-D9 outputs, when G0 is held at D10, then verify traceability, prototype-direction acceptance, owned dependencies, staffed re-estimate and explicit SteerCo decisions. | Given missing business approval, funding, policy or capacity evidence, when gate is reviewed, then mark conditional/no-go with owners and due actions, never fabricate signoff. | US19; US20; US21 | Must | S0 | 2 | Delivery lead | EN06 | V06 | D03 | TC24 | G0 | The current package is preparation, not completed Sprint 0 or accepted delivery. | Q12 | Proposed / not started

----- SHEET Requirements trace -----
Requirement | Story | Epic / feature | View | Decision | Change request | Test | Requirement / rule summary | Test layer | Acceptance status
FR01 | US01 | EP01 / Category-specific intake and draft/submit | V01 | D02 | CR02 | TC01 | Given Northstar is 82% complete, when the supplier saves and submits the minimum viable intake, then retain the draft version, mark incomplete/triage and list missing allergen evidence. | Prototype business walkthrough | Pending; tests not executed
FR02 | US02 | EP01 / Consolidated clarification and resubmission | V02 | D02 | CR02 | TC02 | Given Northstar has an open request, when operations consolidates corrections and supplier resubmits, then show the field/evidence, conflict, requested change, owner, due date and response in one versioned round. | Prototype business walkthrough | Pending; tests not executed
FR03 | US03 | EP01 / Accessible guidance and assisted onboarding | V01 | D02 | CR02 | TC03 | Given an assisted or keyboard-only user, when requesting support and following guidance, then show plain-language category examples, route to named support owner and preserve the supplier's saved work. | Prototype business walkthrough | Pending; tests not executed
FR04 | US04 | EP02 / Explainable review queue and workload | V06 | D05 | CR02 | TC04 | Given the four samples, when queue filters/sort are applied, then expose mandatory risk, launch proximity, age, workload and Meadowlane's six-day pending review with an explainable reason. | Prototype business walkthrough | Pending; tests not executed
FR05 | US05 | EP02 / Category recommendation, approval and return | V03 | D01 | CR01 | TC05 | Given Meadowlane is complete and has no compliance blocker, when category review is recorded, then assess customer need, overlap, commercial facts, demand assumptions, requested launch and readiness; record recommend/approve-fit/return with rationale. | Prototype business walkthrough | Pending; tests not executed
FR06 | US06 | EP03 / Source-linked evidence review and conflict resolution | V04 | D06 | CR01 | TC06 | Given Willow & Coast's claim conflicts, when reviewing evidence, then show claim/rule, source, date if known, version, supplier-provided state, uncertainty and specialist notes; request clarification before verification. | Prototype business walkthrough | Pending; tests not executed
FR07 | US07 | EP03 / Version changes invalidate approvals | V04 | D06 | CR01 | TC07 | Given verified evidence and dependent approvals, when that evidence version changes, then revoke verification and dependent compliance/assortment/launch approvals, retain old audit versions and require re-review. | Prototype business walkthrough | Pending; tests not executed
FR08 | US08 | EP03 / Separate assortment and launch gates | V05 | D01 | CR01 | TC08 | Given current category approval and verified mandatory evidence, when an authorized approver decides assortment, then record an explicit approval with rationale and keep launch pending until all launch gates pass. | Prototype business walkthrough | Pending; tests not executed
FR09 | US09 | EP03 / Bounded non-mandatory exceptions and escalation | V05 | D04 | CR01 | TC09 | Given a non-mandatory condition, when an authorized owner grants an exception, then require rationale, condition or expiry, affected channels, escalation owner and record scope. | Prototype business walkthrough | Pending; tests not executed
FR10 | US10 | EP04 / Channel, content, packaging, supply and handoff readiness | V05 | D01 | CR01 | TC10 | Given assortment approval, when preparing launch, then separately record store/digital content, images, claims, packaging, supply, owner, due date and receiving-team acknowledgement; issue go only when all required checks are current. | Prototype business walkthrough | Pending; tests not executed
FR11 | US11 | EP04 / Portfolio measures and supplier effort | V06 | D07 | CR02 | TC11 | Given first-review and decision events, when computing K01-K06, then apply cohort denominators, preserve first-review snapshots and show supplier effort, missingness and category drill-down. | Prototype business walkthrough | Pending; tests not executed
FR12 | US12 | EP03 / Audit, contest and named human resolution | V04 | D06 | CR01 | TC12 | Given a contested decision, when a supplier requests review, then assign a named human resolver, retain source/version, actor, timestamp, rationale, prior and new state and communicate outcome. | Prototype business walkthrough | Pending; tests not executed
NFR01 | US13 | EP05 / Identity, supplier isolation and authorization | V01 | D01 | CR01 | TC13 | Given two supplier tenants and each mock/business role, when exercising read/write/export and decision APIs, then all unauthorized cross-supplier actions are denied and logged in the production design test suite. | Implemented service required | Pending; tests not executed
NFR02 | US14 | EP05 / Privacy, retention and secure evidence handling | V04 | D06 | CR01 | TC14 | Given evidence ingestion, when stored/transferred, then use approved encryption in transit/at rest, restrict access, scan files, inventory personal data and apply approved deletion/legal-hold policies. | Implemented service required | Pending; tests not executed
NFR03 | US15 | EP05 / Grounded AI, uncertainty and injection evaluation | V04 | D06 | CR01 | TC15 | Given 100 proposed curated source-linked cases, when evaluating suggestions, then 100% of evidence assertions have source/version citations or explicit abstention and zero automatic approvals occur. | Implemented service required | Pending; tests not executed
NFR04 | US16 | EP05 / Accessibility and supplier fairness evaluation | V01 | D02 | CR02 | TC16 | Given the six views, when independent keyboard/screen-reader/zoom and automated checks run, then satisfy WCAG 2.2 AA with zero critical task blockers; paired supplier-size/format variants have identical eligibility/priority. | Implemented service required | Pending; tests not executed
NFR05 | US17 | EP05 / Performance, concurrency, resilience and recovery | V05 | D01 | CR01 | TC17 | Given a proposed 50 concurrent users, 260 submissions/month and 10 MB evidence files, when testing 30 minutes, then p95 non-AI read <2s and write <3s, AI response/abstention <10s; zero lost approved decisions. | Implemented service required | Pending; tests not executed
NFR06 | US18 | EP05 / Operability, adoption, support and rollback | V06 | D07 | CR02 | TC18 | Given pilot readiness, when service rehearsal runs, then named support owners triage an incident, disable AI without disabling manual controls, reconcile queues and restore the last approved rule/model version. | Implemented service required | Pending; tests not executed
EN01 | US19 | EP06 / Policy and data discovery spike | V04 | D01 | CR01 | TC19 | Given customer policies and four samples, when the spike ends, then produce a versioned category-rule inventory, data dictionary, missing/unknown fields and owner approvals required for G0. | Discovery/expansion artifact | Pending; tests not executed
EN02 | US20 | EP06 / Integration contract and system ownership spike | V05 | D03 | CR03 | TC20 | Given customer system-owner interviews, when discovery ends, then document intake, evidence, product master, content/channel, supply and identity boundaries with schemas, auth, retry and ownership. | Discovery/expansion artifact | Pending; tests not executed
EN03 | US21 | EP06 / Baseline, evaluation and acceptance design | V06 | D07 | CR02 | TC21 | Given source baselines and cohort examples, when designing acceptance, then confirm denominator/time rules, proposed targets, RAI corpus and business signoff slots for K01-K06 and TC01-TC24. | Discovery/expansion artifact | Pending; tests not executed
EN04 | US22 | EP06 / Seasonal Home rule pack and requalification | V01 | D03 | CR03 | TC22 | Given G1 candidate controls and approved Seasonal Home rule pack, when Hearthline is replayed, then battery safety and packaging gaps remain blockers until verified/resolved and category regression passes. | Discovery/expansion artifact | Pending; tests not executed
EN05 | US23 | EP06 / Personal Care rule pack and claim-specialist review | V04 | D03 | CR03 | TC23 | Given approved Personal Care rules and claim specialist, when Willow & Coast is replayed, then the 48-hour moisture conflict cannot advance until reconciled and verified by a human. | Discovery/expansion artifact | Pending; tests not executed
EN06 | US24 | EP06 / Sprint 0 handoff, decisions and gate review | V06 | D03 | CR03 | TC24 | Given D1-D9 outputs, when G0 is held at D10, then verify traceability, prototype-direction acceptance, owned dependencies, staffed re-estimate and explicit SteerCo decisions. | Discovery/expansion artifact | Pending; tests not executed

----- SHEET Sprint0 Plan -----
Day | Activity | Proposed roles | Output / evidence | Stories | Dependencies | Checkpoint / status
D1 | Mobilize and align SoW/outcomes | Delivery lead / Product Owner | Scope, six personas, acceptance owners; requests for data/policies | US19; US20; US21; US24 | Customer attendance/access | G0 acceptance responsibility pending
D2 | Map as-is and mandatory policies | Business analyst / Compliance owner | Policy/data inventory, role authority, FR baseline; review D01 | US19 | Q01/Q02 sources | D01 proposal due; mandatory rule gaps logged
D3 | Walk through v1; supplier burden workshop | UX lead / Supplier experience lead | Six-view demo, four cases, feedback capture, minimum intake/accessibility | US19; US20 | Supplier representative availability | D02 proposal due; actual workshop pending
D4 | Refine v2 controls and evidence lifecycle | Technical lead / Compliance owner | D04-D06 proposals, exception/version/RBAC test design | US19; US20 | Policy and identity owners | Resolve or escalate authority/privacy gaps
D5 | Scope and seasonal trade-off review | CMO / Delivery lead | D03 proposal, phased rule packs, risk/funding options | US20; US24 | Seasonal business priorities | SteerCo risk decision pending
D6 | Refine BRD/backlog and evaluation suite | Business analyst / QA / AI lead | FR/NFR/EN trace, GWT tests, injection/grounding/fairness corpus | US19; US21 | V2 direction and policy feedback | No actual RAI validation claimed
D7 | Integrations and operational readiness | Technical lead / Service owner | Contract sketches, support/runbook, adoption and rollback rehearsal plan | US20; US21 | System owners, security/privacy input | Dependencies owned or escalated
D8 | Baseline and acceptance design review | Product Owner / Data lead | D07 proposal, K01-K06 definitions/targets, v2 UAT script | US21 | Event data and business representatives | Targets/signoff remain pending
D9 | Estimate, capacity and risk challenge | Delivery lead / Technical lead / QA | Staffed capacity, S2 overload resolution, estimation ranges, RAID | US19; US20; US21; US24 | Funding, availability, spike findings | Rebalance before any release commitment
D10 | G0 handoff and SteerCo review | Product Owner / Delivery lead / CMO | Artifact acceptance slots, open decisions, next-team handoff, conditional/no-go record | US24 | Customer review and staffed re-estimate | G0 not yet held; record decision and evidence

----- SHEET Release Plan -----
Bucket | Scope / dependency intent | Points | Milestone / gate | Dependencies | Capacity / date qualification | Status
S0 | Policy/data/integration/baseline discovery and handoff | 11 | G0 at relative D10 | Customer policy/data and attendance | Ten business days; actual work not yet occurred | Provisional; not committed
S1 | Intake, assistance, identity and privacy foundations | 21 | G1 prerequisite | G0 direction/policy owners and staffed re-estimate | 21 points; must validate staffing/capacity | Provisional; not committed
S2 | Review/evidence/approval/launch controls; RAI and operability | 62 | G1 only if all controls, UAT, operations and human signoff pass | US19–21 discoveries; S1 foundations | 62 points concentrated here; OVERLOADED until capacity validated; rebalance | Provisional; not committed
S3 | Seasonal Home rule pack / requalification | 5 | G2 approved rules and regression | G1 controls; policy/safety/supply owner | 5 points excluding unresolved implementation uncertainty; no Oct promise | Provisional; not committed
S4 | Personal Care rule pack / specialist claims | 5 | G3 approved rules and regression | G2 sequencing; claim specialist and G1 controls | 5 points provisional; 28 Sep request not a delivery promise | Provisional; not committed

----- SHEET Estimation -----
Assumption / bucket | Input / load | Meaning / capacity | Equivalents / check | Warning
Baseline velocity (points / 2 weeks) | 20 | Proposed, not observed |  |
Staffing availability factor | 1 | Editable 0–1; named staffing unconfirmed |  |
Focus factor | 0.8 | Editable 0–1; other duties/interruptions |  |
Reserve fraction | 0.2 | Editable 0–0.9; uncertainty reserve |  |
Effective capacity | 12.8 | Points per two-week bucket; no time guarantee |  |
Optimistic multiplier | 0.8 | Proposed sensitivity |  |
Pessimistic multiplier | 1.5 | Proposed sensitivity |  |
Total backlog | 104 | Formula from actual 24-story range |  |
Bucket | Load points | Effective capacity | Sprint-equivalents | Capacity warning
S0 | 11 | 12.8 | 0.859375 | Within illustrative capacity; validate
S1 | 21 | 12.8 | 1.640625 | OVERLOADED — REBALANCE
S2 | 62 | 12.8 | 4.84375 | OVERLOADED — REBALANCE
S3 | 5 | 12.8 | 0.390625 | Within illustrative capacity; validate
S4 | 5 | 12.8 | 0.390625 | Within illustrative capacity; validate
Total load | 104 | 104 | MATCH | S0 discovery points included
Optimistic size | 83.2 | Multiplier scenario, not a commitment |  |
Pessimistic size | 156 | Multiplier scenario, not a commitment |  |
High-velocity sensitivity | 30 | Alternate proposed baseline points |  |
S2 sprint-equivalents at high velocity | 3.22916666666667 | Hold other factors constant; still requires rebalance |  |
S2 whole-bucket equivalent | 5 | Not a schedule; split by dependencies and skills |  |
Commitment rule | Do not claim a feasible four-sprint release. | D9 staffed capacity, spike findings and velocity evidence required |  |

----- SHEET RAID -----
ID | Type | Exposure / item | Rating | Proposed owner | Relative due | Mitigation / validation | Trigger / escalation | Status
R01 | Risk | Seasonal dates precede unvalidated category delivery capacity | High | CMO | D5 | Ratify D03; accept risk or fund re-estimation | Requested launch threatened while rules/capacity unapproved | Open
R02 | Risk | Mandatory evidence or claim conflicts produce unsafe approval | Critical | Compliance owner | D2 | D01/D06 gates; source-linked specialist review | Any unresolved mandatory blocker or stale version | Open
R03 | Risk | Supplier burden or accessibility excludes smaller suppliers | High | Supplier experience lead | D3 | D02/D05; consolidated assistance and paired fairness tests | Repeated corrections or format/size affects priority | Open
R04 | Risk | AI injection, unsupported claim or cross-supplier leakage | Critical | AI/security lead | D6 | Untrusted-source isolation; server RBAC; abstain and stop gates | One critical failure in evaluation or incident | Open
R05 | Risk | S2 backlog concentration exceeds available capacity | High | Delivery lead | D9 | Validate capacity, split/resequence stories; no four-sprint commitment | Sprint load exceeds effective capacity | Open
A01 | Assumption | Cross-functional team and part-time specialists will be available | High | Delivery lead | D9 | Confirm names, allocations and funding | Missing critical role at G0 | Unvalidated
A02 | Assumption | Proposed targets and workload represent a useful pilot hypothesis | Medium | Product Owner | D8 | Validate event data, workload and supplier feedback | Baseline/denominator not reproducible | Unvalidated
I01 | Issue | Customer workshop, D01-D07 ratification and acceptance have not happened | High | Product Owner | D10 | Schedule review; record actual decisions with blank signoff slots | G0 approached without business review | Open
I02 | Issue | Production policies, vendor contracts and retention decisions absent | High | Technical lead | D4 | Run US19/US20; keep TBD and block affected release gate | Implementation commitment requested without discovery | Open
DEP01 | Dependency | Authoritative category policies and sample evidence | High | Compliance owner | D2 | Obtain versioned samples and assign authoritative owner | Source owner unavailable | Open
DEP02 | Dependency | System ownership, identity, integration and environment access | High | Technical lead | D3 | Contract/permission spikes; explicit acceptance from owners | API/auth/tenant boundary unknown | Open
DEP03 | Dependency | Human acceptance, operational ownership and support funding | High | Product Owner | D10 | RACI, UAT slots, training and support coverage | Gate without named accountable owner | Open

----- SHEET Decisions -----
ID | Source CR | Proposed decision | Accountable role | Relative due | Options | Recommendation | Rationale | Status | Actual owner / date / outcome
D01 | CR01 | Mandatory evidence cannot be excepted; distinct category, compliance and assortment decisions; launch is a separate gate. | Compliance owner | Sprint 0 D2 | Permit urgent override / prohibit mandatory override | Prohibit mandatory override | Prevents commercial pressure bypassing required evidence. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded
D02 | CR02 | Minimum viable intake may be saved and submitted for triage while incomplete. Consolidate corrections; assisted path preserves all mandatory standards. | Supplier experience lead | Sprint 0 D3 | Complete-only gate / minimum intake plus consolidated assistance | Minimum intake for triage; unchanged approval standards | Reduces burden without confusing triage with approval. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded
D03 | CR03 | Pilot Packaged Food; phase Seasonal Home then Personal Care after rule approval. SteerCo explicitly accepts seasonal timing risk or funds re-estimation; no date promise. | Chief Merchandising Officer | Sprint 0 D5 | Narrow pilot / parallel categories / accept explicit timing risk | Packaged Food then gated Seasonal Home and Personal Care | Contains rule uncertainty; expose seasonal timing risk and funding trade-off. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded
D04 | CR01 | Non-mandatory exceptions require authorized assortment owner, rationale, condition or expiry, channels and escalation. Expired exceptions cease to clear launch blockers. | Assortment approver | Sprint 0 D4 | Unbounded override / bounded authorized non-mandatory exception | Bounded exception with expiry or condition | Prevents stale and unauthorized exceptions clearing launch. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded
D05 | CR02 | Queue priority uses mandatory risk, launch proximity and age, never supplier size or format. Category queue highlights nearly ready aged items. | Merchandising operations lead | Sprint 0 D4 | FIFO / opaque score / explainable risk-proximity-age queue | Explainable queue with aged nearly-ready view | Balances urgency and workload without disadvantaging smaller suppliers. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded
D06 | CR01 | Evidence provenance and versions retained; changed evidence revokes verification and dependent approvals. AI supports humans and never approves. | Compliance owner | Sprint 0 D4 | AI approval / advisory AI and version-bound human review | Advisory AI; reverify changed evidence | Preserves provenance and prevents stale approvals. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded
D07 | CR02 | Baseline and targets must be validated with category/cohort measures and supplier-effort feedback before pilot launch. | Product Owner | Sprint 0 D8 | Promise targets now / validate cohort baselines and targets | Validate with supplier-effort feedback before pilot | Avoids unverified benefits and shifted supplier burden. | Proposed exercise decision — awaiting ratification | Pending; no customer decision recorded

----- SHEET Open Questions -----
ID | Open question | Proposed owner | Due | Evidence to close | Status
Q01 | Which rules, mandatory fields, accepted evidence, version validity and minimum intake apply per category? | Compliance owner | D2 | Rule pack and customer policy sources | Open
Q02 | Who can approve category fit, compliance, assortment, launch and exceptions; how are appeals handled? | Product Owner | D2 | Named authority and segregation matrix | Open
Q03 | Which systems own product, supplier, evidence, content, supply and identity; what APIs and acknowledgement exist? | Technical lead | D3 | System owners and contract samples | Open
Q04 | Can source baselines and proposed targets be measured from agreed first-review/cohort events? | Product Owner | D8 | Baseline sample, denominators and holiday calendar | Open
Q05 | What privacy basis, residency, encryption standards, retention and legal-hold rules apply? | Security/privacy lead | D4 | Customer policy/DPIA/security approval | Open
Q06 | Which support/notification channels, SLAs, service hours and run owners are funded? | Service owner | D7 | Operating model and escalation rota | Open
Q07 | What review-priority weights, tie-breaks, unknown-age handling and workload SLAs are acceptable? | Merchandising operations lead | D4 | Queue replay and category-owner approval | Open
Q08 | Which languages, accessible formats and supplier cohorts must the pilot support? | Supplier experience lead | D3 | Supplier research and accessibility plan | Open
Q09 | Which AI tasks/model, source boundaries, evaluation corpus and stop gates are approved? | AI evaluation lead | D6 | RAI evaluation and security signoff | Open
Q10 | What staffed capacity, burst workload, recovery objectives and integration availability are real? | Delivery lead | D9 | Capacity model and performance workload | Open
Q11 | Does SteerCo accept seasonal timing risk or fund parallel scope discovery and re-estimation? | Chief Merchandising Officer | D5 | D03 recorded decision; no launch-date promise | Open
Q12 | Who will accept each Sprint 0 artifact, prototype direction and implementation release? | Product Owner | D1; confirm D10 | Named signatories and evidence checklist | Open

----- SHEET KPIs -----
ID | Measure | Source baseline | Proposed target | Definition / denominator | Owner | Cadence / cohort | Status
K01 | Complete at first review | 0.59 | 75% proposed pilot hypothesis | Complete first-reviewed submissions / all first-reviewed submissions | Product Owner / data lead | Weekly proposed; category and first-review cohort; assisted path/supplier cohorts where privacy permits | Baseline/target ratification pending
K02 | Clarification cycles | 2.7 | 2.0 or fewer proposed | Consolidated outbound correction rounds per decisioned submission | Product Owner / data lead | Weekly proposed; category and first-review cohort; assisted path/supplier cohorts where privacy permits | Baseline/target ratification pending
K03 | Median decision time | 18 business days | 14 or fewer proposed | Business-day elapsed initial submit to assortment decision; holiday calendar TBD | Product Owner / data lead | Weekly proposed; category and first-review cohort; assisted path/supplier cohorts where privacy permits | Baseline/target ratification pending
K04 | Evidence present at first review | 68% among evidence-required submissions | 90% proposed; 100% verified mandatory items at approval is a control | Separate presence from verified compliance; denominator evidence-required submissions | Product Owner / data lead | Weekly proposed; category and first-review cohort; assisted path/supplier cohorts where privacy permits | Baseline/target ratification pending
K05 | Launch blockers within three weeks | 11 of 19 planned launches | Reduce; target ratified D8 | Distinct products with unresolved blockers and requested launch within 21 calendar days | Product Owner / data lead | Weekly proposed; category and first-review cohort; assisted path/supplier cohorts where privacy permits | Baseline/target ratification pending
K06 | Supplier clarification effort | 4.2 hours / submission | 3 hours or fewer proposed | Supplier-reported active effort; segment assisted/unassisted and supplier cohorts | Product Owner / data lead | Weekly proposed; category and first-review cohort; assisted path/supplier cohorts where privacy permits | Baseline/target ratification pending

----- SHEET RACI -----
Activity | Accountable (one role) | Responsible | Consulted | Informed
Scope and benefit hypotheses | Product Owner | Business analyst | CMO; category/compliance | Delivery team
Category policy and evidence verification | Compliance owner | Compliance specialists | Category manager; security | Supplier; assortment approver
Category fit decision | Category manager | Category manager | Supplier; content owner | Assortment approver
Final assortment and exception decision | Assortment approver | Assortment approver | Category; compliance; operations | Supplier; channel owner
Launch readiness and receiving handoff | Content/channel readiness owner | Content/channel team; operations | Assortment; supply owner | Product Owner
Supplier clarification/support | Supplier experience lead | Operations coordinator | Supplier; UX/accessibility | Category; compliance
Architecture, integration and data | Technical lead | Engineers; data lead | Security; system owners | Delivery lead
RAI/security release controls | Security lead | AI evaluation lead; QA | Compliance; privacy; accessibility | Product Owner
Backlog/estimate/release governance | Product Owner | Delivery lead; technical lead | Team; CMO | Business owners
Business UAT and Sprint 0 acceptance | Product Owner | Named business testers (TBD) | All six personas; delivery lead | CMO
Production support and incident recovery | Service owner | Support/on-call team (TBD) | Technical lead; security; compliance | Product Owner; affected suppliers
Seasonal scope/funding/risk decision | CMO | Delivery lead | Product Owner; category; compliance | Delivery team

----- SHEET UAT Acceptance -----
Test | Story / requirement | View / decision | Business tester role | Positive script / expected | Negative script / expected | Test layer | Technical result | Business signoff | Actual result / evidence | Tester / date | Defect / follow-up
TC01 | US01 / FR01 | V01 / D02 | Supplier contact | Given Northstar is 82% complete, when the supplier saves and submits the minimum viable intake, then retain the draft version, mark incomplete/triage and list missing allergen evidence. | Given mandatory evidence is absent, when submission is attempted, then triage is allowed but no compliance, assortment or launch approval is inferred. | Prototype walkthrough | Not run | Pending |  |  |
TC02 | US02 / FR02 | V02 / D02 | Supplier contact | Given Northstar has an open request, when operations consolidates corrections and supplier resubmits, then show the field/evidence, conflict, requested change, owner, due date and response in one versioned round. | Given a repeated request for the same unresolved field, when a new round is composed, then merge/deduplicate rather than silently reset history or count each field as a cycle. | Prototype walkthrough | Not run | Pending |  |  |
TC03 | US03 / FR03 | V01 / D02 | Supplier contact | Given an assisted or keyboard-only user, when requesting support and following guidance, then show plain-language category examples, route to named support owner and preserve the supplier's saved work. | Given a small supplier/non-standard format, when triaging, then do not lower its priority or waive mandatory evidence; provide an accessible alternative. | Prototype walkthrough | Not run | Pending |  |  |
TC04 | US04 / FR04 | V06 / D05 | Merchandising operations lead | Given the four samples, when queue filters/sort are applied, then expose mandatory risk, launch proximity, age, workload and Meadowlane's six-day pending review with an explainable reason. | Given only supplier size or unfamiliar format changes, when re-ranking, then priority must not worsen; missing age stays unknown rather than invented. | Prototype walkthrough | Not run | Pending |  |  |
TC05 | US05 / FR05 | V03 / D01 | Category manager | Given Meadowlane is complete and has no compliance blocker, when category review is recorded, then assess customer need, overlap, commercial facts, demand assumptions, requested launch and readiness; record recommend/approve-fit/return with rationale. | Given category fit is approved, when viewing final status, then neither compliance verification nor final assortment approval is substituted by that decision. | Prototype walkthrough | Not run | Pending |  |  |
TC06 | US06 / FR06 | V04 / D06 | Compliance owner | Given Willow & Coast's claim conflicts, when reviewing evidence, then show claim/rule, source, date if known, version, supplier-provided state, uncertainty and specialist notes; request clarification before verification. | Given a source is missing, stale, contradictory or only AI-generated, when attempting verification, then block advancement and assign named human review. | Prototype walkthrough | Not run | Pending |  |  |
TC07 | US07 / FR07 | V04 / D06 | Compliance owner | Given verified evidence and dependent approvals, when that evidence version changes, then revoke verification and dependent compliance/assortment/launch approvals, retain old audit versions and require re-review. | Given a stale browser version, when a reviewer saves a decision, then reject the lost-update attempt and require refresh; never overwrite a newer review. | Prototype walkthrough | Not run | Pending |  |  |
TC08 | US08 / FR08 | V05 / D01 | Assortment approver | Given current category approval and verified mandatory evidence, when an authorized approver decides assortment, then record an explicit approval with rationale and keep launch pending until all launch gates pass. | Given Northstar lacks allergen evidence or Meadowlane is merely complete, when final approval is attempted, then block and show the missing prerequisite; launch urgency never overrides it. | Prototype walkthrough | Not run | Pending |  |  |
TC09 | US09 / FR09 | V05 / D04 | Assortment approver | Given a non-mandatory condition, when an authorized owner grants an exception, then require rationale, condition or expiry, affected channels, escalation owner and record scope. | Given mandatory evidence is unresolved, an unauthorized role acts, or an exception expires, when clearing a launch blocker, then deny/restore blocker and escalate. | Prototype walkthrough | Not run | Pending |  |  |
TC10 | US10 / FR10 | V05 / D01 | Content/channel readiness owner | Given assortment approval, when preparing launch, then separately record store/digital content, images, claims, packaging, supply, owner, due date and receiving-team acknowledgement; issue go only when all required checks are current. | Given Hearthline lacks carton dimensions, when approval exists on another track, then launch remains no-go; an absent acknowledgement cannot be treated as complete. | Prototype walkthrough | Not run | Pending |  |  |
TC11 | US11 / FR11 | V06 / D07 | Merchandising operations lead | Given first-review and decision events, when computing K01-K06, then apply cohort denominators, preserve first-review snapshots and show supplier effort, missingness and category drill-down. | Given 68% mandatory evidence presence at first review, when reporting approval readiness, then do not label 68% verified at approval; 100% mandatory verification is a separate proposed gate. | Prototype walkthrough | Not run | Pending |  |  |
TC12 | US12 / FR12 | V04 / D06 | Compliance owner | Given a contested decision, when a supplier requests review, then assign a named human resolver, retain source/version, actor, timestamp, rationale, prior and new state and communicate outcome. | Given a user edits history or AI proposes approval, when persisting, then deny audit mutation/AI authority and log the attempted action without exposing another supplier's data. | Prototype walkthrough | Not run | Pending |  |  |
TC13 | US13 / NFR01 | V01 / D01 | Supplier contact | Given two supplier tenants and each mock/business role, when exercising read/write/export and decision APIs, then all unauthorized cross-supplier actions are denied and logged in the production design test suite. | Given a supplier guesses another record ID or changes the UI role, when requesting data, then server authorization still denies access; local role switch is never authentication evidence. | Implementation/specialist test | Not run | Pending |  |  |
TC14 | US14 / NFR02 | V04 / D06 | Compliance owner | Given evidence ingestion, when stored/transferred, then use approved encryption in transit/at rest, restrict access, scan files, inventory personal data and apply approved deletion/legal-hold policies. | Given retention/encryption choices are unapproved, when release is requested, then stop at the privacy/security gate; do not invent a retention period. | Implementation/specialist test | Not run | Pending |  |  |
TC15 | US15 / NFR03 | V04 / D06 | Compliance owner | Given 100 proposed curated source-linked cases, when evaluating suggestions, then 100% of evidence assertions have source/version citations or explicit abstention and zero automatic approvals occur. | Given hostile evidence, contradictory claims or no source, when AI is asked to override rules/reveal data, then ignore document instructions, abstain/escalate and retain mandatory blockers. | Implementation/specialist test | Not run | Pending |  |  |
TC16 | US16 / NFR04 | V01 / D02 | Supplier contact | Given the six views, when independent keyboard/screen-reader/zoom and automated checks run, then satisfy WCAG 2.2 AA with zero critical task blockers; paired supplier-size/format variants have identical eligibility/priority. | Given supplier-size or format-only counterfactual changes, when outcomes differ or a task is inaccessible, then halt release and remediate before approval. | Implementation/specialist test | Not run | Pending |  |  |
TC17 | US17 / NFR05 | V05 / D01 | Assortment approver | Given a proposed 50 concurrent users, 260 submissions/month and 10 MB evidence files, when testing 30 minutes, then p95 non-AI read <2s and write <3s, AI response/abstention <10s; zero lost approved decisions. | Given conflicting saves or integration outage, when retrying, then return a conflict, keep durable queue/idempotency keys and never duplicate approval; proposed RTO 4h/RPO 15m must be ratified. | Implementation/specialist test | Not run | Pending |  |  |
TC18 | US18 / NFR06 | V06 / D07 | Merchandising operations lead | Given pilot readiness, when service rehearsal runs, then named support owners triage an incident, disable AI without disabling manual controls, reconcile queues and restore the last approved rule/model version. | Given missing on-call owner, runbook, training or unresolved critical incident, when launch gate is reviewed, then block release; production support must not be implied by the prototype. | Implementation/specialist test | Not run | Pending |  |  |
TC19 | US19 / EN01 | V04 / D01 | Compliance owner | Given customer policies and four samples, when the spike ends, then produce a versioned category-rule inventory, data dictionary, missing/unknown fields and owner approvals required for G0. | Given missing policy or contradictory evidence rules, when the spike is reviewed, then record open questions/risks and do not mark rules approved. | Discovery/future expansion review | Not run | Pending |  |  |
TC20 | US20 / EN02 | V05 / D03 | Content/channel readiness owner | Given customer system-owner interviews, when discovery ends, then document intake, evidence, product master, content/channel, supply and identity boundaries with schemas, auth, retry and ownership. | Given absent vendor/API or ambiguous ownership, when estimating integration, then retain TBD and re-estimation dependency; do not invent system names. | Discovery/future expansion review | Not run | Pending |  |  |
TC21 | US21 / EN03 | V06 / D07 | Merchandising operations lead | Given source baselines and cohort examples, when designing acceptance, then confirm denominator/time rules, proposed targets, RAI corpus and business signoff slots for K01-K06 and TC01-TC24. | Given prototype outputs only, when assessing success, then do not report achieved benefit, completed customer UAT or validated performance. | Discovery/future expansion review | Not run | Pending |  |  |
TC22 | US22 / EN04 | V01 / D03 | Supplier contact | Given G1 candidate controls and approved Seasonal Home rule pack, when Hearthline is replayed, then battery safety and packaging gaps remain blockers until verified/resolved and category regression passes. | Given the 20 Oct request or unapproved rules, when expansion is proposed, then escalate timing risk rather than waive controls or promise that date. | Discovery/future expansion review | Not run | Pending |  |  |
TC23 | US23 / EN05 | V04 / D03 | Compliance owner | Given approved Personal Care rules and claim specialist, when Willow & Coast is replayed, then the 48-hour moisture conflict cannot advance until reconciled and verified by a human. | Given the 28 Sep request or missing specialist, when go-live is discussed, then record risk/no-go; S4 is not a promise to meet September demand. | Discovery/future expansion review | Not run | Pending |  |  |
TC24 | US24 / EN06 | V06 / D03 | Merchandising operations lead | Given D1-D9 outputs, when G0 is held at D10, then verify traceability, prototype-direction acceptance, owned dependencies, staffed re-estimate and explicit SteerCo decisions. | Given missing business approval, funding, policy or capacity evidence, when gate is reviewed, then mark conditional/no-go with owners and due actions, never fabricate signoff. | Discovery/future expansion review | Not run | Pending |  |  |

----- SHEET Adoption -----
ID | Audience | Training / enablement | Proposed owner | Timing | Readiness evidence | Proposed target | Status
AD01 | Supplier contacts | Plain-language checklist, evidence examples, assisted path and single correction round | Supplier experience lead | D7 design; before pilot | Observed save/submit/respond task and effort feedback | Proposed target: 90% task completion; ratify D8 | Pending
AD02 | Category managers and operations | Queue reasons, aged nearly-ready work, handoffs and fit decision | Merchandising operations lead | D7 design; before pilot | Replay Meadowlane and prioritize all four cases without size bias | Proposed target: all assigned pilot reviewers trained | Pending
AD03 | Compliance and approvers | Source/version verification, conflict resolution, exception boundary, appeal | Compliance owner | D7 design; before pilot | Block mandatory override and stale approval in rehearsal | Zero critical control failure proposed | Pending
AD04 | Content/channel and support | Launch gates, queue reconciliation, incident escalation and manual fallback | Service owner | D7 design; before pilot | No-go/rollback exercise; named coverage confirmed | Coverage/support SLAs TBD | Pending
AD05 | Product Owner and data lead | KPI definitions, cohort denominator, supplier effort and benefit interpretation | Product Owner | D8 | Reconcile presence vs verification and baseline missingness | Targets ratified only after evidence review | Pending

----- SHEET Handoff -----
ID | Finish line | Artifact / location | Proposed accepting role | Required acceptance evidence | Current status
H01 | Outcome and scope alignment | BRD sections 1–2; D03 | Product Owner | Written scope/benefit agreement | Draft prepared; acceptance pending
H02 | Validated prototype direction | prototype-v1.html; prototype-v2.html; handbook UAT | Product Owner | Six-persona walkthrough and recorded direction acceptance | Local simulation only; customer validation pending
H03 | BRD and backlog ready | BRD; Backlog; Requirements trace | Product Owner | All 24 items traceable with criteria and owned dependencies | Prepared; business acceptance pending
H04 | Plan agreed and credible | Sprint0 Plan; Estimation; Release Plan | Delivery lead | Staffed re-estimate and S2 overload resolution | Provisional; not capacity validated
H05 | Dependencies and RAID visible | RAID; Open Questions; RACI | Delivery lead | Named owners acknowledge mitigation/due dates | Proposed role owners; acknowledgements pending
H06 | SteerCo decisions prepared | D01-D07; deck; seasonal risk | CMO | Ratified decisions with rationale and date | Proposals only
H07 | Responsible AI and support ready | TC13-TC18; adoption/runbook | Service owner | Security/RAI/accessibility gates, training, support and rollback evidence | Implementation tests and rollout not performed
H08 | G0 actual acceptance record | Reviewer name: ______; date: ______; outcome: ______ | Product Owner | Accepted / conditional / rejected with action owners and dates | Pending — no signature or approval recorded

===== FILE: index.html =====
===== TYPE: .html (signature 3C-21-64-6F-63-74-79-70) =====
===== SECTIONS DETECTED: HTML wireframe/markup, 114 lines (cite by line number) =====
<!doctype html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Supplier and Product Onboarding | Delivery pack</title><script>
  (() => {
    const param = new URLSearchParams(window.location.search).get("scoutTheme");
    const theme =
      param || (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    document.documentElement.setAttribute("data-theme", theme);
  })();
</script><style>
:root {
  color-scheme: light;
  --cp-bg: #f7f4ef;
  --cp-bg-elevated: #fcfbf8;
  --cp-surface: #ffffff;
  --cp-surface-soft: #f5f5f5;
  --cp-border: #dedede;
  --cp-border-strong: #919191;
  --cp-text: #242424;
  --cp-text-muted: #5c5c5c;
  --cp-text-soft: #6f6f6f;
  --cp-accent: #b11f4b;
  --cp-accent-hover: #9a1a41;
  --cp-accent-soft: rgba(177, 31, 75, 0.08);
  --cp-accent-fg: #ffffff;
  --cp-success: #16a34a;
  --cp-danger: #dc2626;
  --cp-warning: #f59e0b;
  --cp-link: #0078d4;
  --cp-shadow: 0 18px 48px rgba(0, 0, 0, 0.12);
  --cp-overlay: rgba(255, 255, 255, 0.8);
  --cp-panel: rgba(255, 255, 255, 0.86);
  --cp-panel-strong: rgba(255, 255, 255, 0.96);
  --cp-sheen: rgba(255, 255, 255, 0.55);
  --cp-highlight: rgba(177, 31, 75, 0.12);
}
html[data-theme="dark"] {
  color-scheme: dark;
  --cp-bg: #3d3b3a;
  --cp-bg-elevated: #343231;
  --cp-surface: #292929;
  --cp-surface-soft: #2e2e2e;
  --cp-border: #474747;
  --cp-border-strong: #5f5f5f;
  --cp-text: #dedede;
  --cp-text-muted: #919191;
  --cp-text-soft: #b0b0b0;
  --cp-accent: #fd8ea1;
  --cp-accent-hover: #fb7b91;
  --cp-accent-soft: rgba(253, 142, 161, 0.14);
  --cp-accent-fg: #1a1a1a;
  --cp-success: #4ade80;
  --cp-danger: #f87171;
  --cp-warning: #fbbf24;
  --cp-link: #4da6ff;
  --cp-shadow: 0 18px 48px rgba(0, 0, 0, 0.32);
  --cp-overlay: rgba(41, 41, 41, 0.88);
  --cp-panel: rgba(41, 41, 41, 0.72);
  --cp-panel-strong: rgba(41, 41, 41, 0.96);
  --cp-sheen: rgba(255, 255, 255, 0.04);
  --cp-highlight: rgba(253, 142, 161, 0.12);
}
*{box-sizing:border-box}
body{margin:0;background:var(--cp-bg);color:var(--cp-text);font:16px/1.55 "Segoe UI",Aptos,Calibri,-apple-system,BlinkMacSystemFont,sans-serif}
a{color:var(--cp-link)}
button,input,select,textarea{font:inherit;border:1px solid var(--cp-border-strong);border-radius:.625rem;padding:9px 12px;background:var(--cp-surface);color:var(--cp-text)}
button{cursor:pointer;font-weight:600}
button:hover{background:var(--cp-accent-soft);border-color:var(--cp-accent)}
button:disabled{cursor:not-allowed;color:var(--cp-text-muted);opacity:.65}
button.primary{background:var(--cp-accent);color:var(--cp-accent-fg);border-color:var(--cp-accent)}
button:focus-visible,a:focus-visible,input:focus-visible,select:focus-visible,textarea:focus-visible,summary:focus-visible{outline:3px solid var(--cp-accent);outline-offset:3px}
input,select,textarea{max-width:100%}textarea{min-height:88px;resize:vertical;width:100%}
h1{font-size:32px;line-height:1.15;letter-spacing:-1px;margin:8px 0 12px}h2{font-size:24px;line-height:1.25;margin:0 0 12px}h3{font-size:18px;margin:0 0 12px}
p{margin:8px 0 16px}small,.muted{color:var(--cp-text-muted)}.eyebrow{font-size:12px;text-transform:uppercase;letter-spacing:2px;font-weight:700;color:var(--cp-accent)}
.skip{position:absolute;left:-10000px}.skip:focus{left:16px;top:8px;background:var(--cp-surface);z-index:4}
header{padding:24px 32px 20px;background:var(--cp-surface);border-bottom:1px solid var(--cp-border)}
.headrow,.toolbar,.actions{display:flex;gap:12px;align-items:center;flex-wrap:wrap}.headrow{justify-content:space-between}.headrow p{max-width:820px}
.disclaimer{padding:12px 32px;background:var(--cp-accent-soft);border-bottom:1px solid var(--cp-border);font-size:13px}
.toolbar{padding:16px 32px;background:var(--cp-bg-elevated)}.toolbar label{font-size:13px;font-weight:600}.toolbar label select,.toolbar label input{display:block;margin-top:4px}
.toolbar .spacer{flex:1}.layout{display:grid;grid-template-columns:272px minmax(0,1fr);max-width:1640px;margin:auto}
aside{padding:24px 16px;border-right:1px solid var(--cp-border)}
.case{display:block;width:100%;text-align:left;padding:16px;margin-bottom:12px;background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px;font-weight:400}
.case.selected{border:2px solid var(--cp-accent);background:var(--cp-accent-soft)}
.case strong,.case small{display:block}.case strong{margin:4px 0}.case small{font-size:12px}.case .id{font:12px Consolas,"Courier New",Courier,monospace;color:var(--cp-accent)}
main{min-width:0;padding:24px 28px 56px}
nav{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:24px}nav button{font-size:13px}nav button[aria-current="page"]{background:var(--cp-accent);color:var(--cp-accent-fg)}
.card{background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px;padding:24px;margin-bottom:20px}
.grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:20px}.grid .card{margin-bottom:0}.metrics{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:12px;margin:20px 0}
.metric{padding:20px;background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px}.metric strong{font-size:32px;display:block;line-height:1.3;color:var(--cp-accent)}.metric span{font-size:12px;color:var(--cp-text-muted)}
.badge{display:inline-block;padding:3px 9px;border:1px solid var(--cp-border);border-radius:8px;font-size:12px;background:var(--cp-surface-soft)}
.warn{border-left:4px solid var(--cp-warning);padding:12px 16px;background:var(--cp-surface-soft);margin:12px 0}
.good{color:var(--cp-success)}.bad{color:var(--cp-danger)}.full{grid-column:1/-1}
.field{display:block;margin:12px 0;font-size:14px;font-weight:600}.field input,.field select,.field textarea{display:block;width:100%;margin-top:6px;font-weight:400}
.progress{height:8px;background:var(--cp-border);border-radius:8px;overflow:hidden;margin:8px 0}.progress span{display:block;height:100%;background:var(--cp-accent)}
.table-scroll{overflow:auto}table{width:100%;border-collapse:collapse;text-align:left;font-size:14px}th,td{padding:12px 10px;border-bottom:1px solid var(--cp-border);vertical-align:top}th{background:var(--cp-surface-soft);font-weight:600}td .actions{gap:6px}td button{font-size:12px;padding:6px 8px}
.gate{display:flex;justify-content:space-between;gap:16px;padding:14px 0;border-bottom:1px solid var(--cp-border)}.gate strong{display:block}
#notice{margin:0 0 16px;min-height:0}#notice:not(:empty){padding:14px 16px;border:1px solid var(--cp-accent);border-radius:10px;background:var(--cp-accent-soft)}
.evidence-item{border-top:1px solid var(--cp-border);padding:20px 0}.evidence-item:first-of-type{border-top:0}.evidence-meta{font-size:13px;color:var(--cp-text-muted)}
details{margin:12px 0}summary{cursor:pointer;font-weight:600}.audit{max-height:320px;overflow:auto}.step{padding:12px;background:var(--cp-surface-soft);border-radius:10px;margin:8px 0}
footer{padding:24px 32px;border-top:1px solid var(--cp-border);font-size:12px;color:var(--cp-text-muted)}
@media(max-width:1050px){.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}.grid{grid-template-columns:1fr}.layout{grid-template-columns:240px minmax(0,1fr)}main{padding:20px}}
@media(max-width:760px){.layout{display:block}aside{border-right:0;display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:8px;padding:16px}aside h2,aside p{grid-column:1/-1}.case{margin:0}.toolbar,header,.disclaimer{padding-left:16px;padding-right:16px}h1{font-size:26px}.card{padding:16px}main{padding:16px}.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}}
@media print{.toolbar,aside,nav,button,.disclaimer{display:none}.layout{display:block}main{padding:0}.card{break-inside:avoid}body{font-size:11pt}header{padding:12px}}

.wrap{max-width:1240px;margin:auto;padding:40px 28px}.hero{padding:48px 0 24px}.hero h1{font-size:48px;max-width:900px}.hero p{max-width:860px}.index-nav{display:flex;gap:16px;flex-wrap:wrap}.source-note{max-width:900px}.index-section{margin-top:40px}code{font-family:Consolas,"Courier New",Courier,monospace;background:var(--cp-surface-soft);padding:2px 6px}.cta{display:inline-block;background:var(--cp-accent);color:var(--cp-accent-fg);padding:12px 20px;text-decoration:none;border-radius:10px;font-weight:600}.secondary{background:var(--cp-surface);color:var(--cp-accent);border:1px solid var(--cp-accent)}@media(max-width:650px){.hero h1{font-size:34px}.wrap{padding:24px 16px}}
</style></head><body><a href="#deliverables" class="skip">Skip to deliverables</a><div class="wrap"><div class="eyebrow">Contoso Retail / Scenario 05 / Sprint 0 delivery pack</div><section class="hero"><h1>Better submissions.<br>Clearer decisions.<br>No shortcuts on evidence.</h1><p>Supplier and Product Onboarding: a complete working exercise package for the core project team, from first prototype to a governed delivery starting point.</p><div class="actions"><a class="cta" href="prototype-v2.html">Launch Prototype v2 &rarr;</a><a class="cta secondary" href="steerco-pitch.pptx">Open SteerCo pitch</a><a href="README.txt">Quick start</a></div></section>
<div class="warn source-note"><strong>Readiness is conditional, not signed off.</strong> All Contoso facts are fictional exercise inputs. These are AI-authored artefacts prepared for customer review; no customer workshop, policy confirmation, business-owner acceptance or SteerCo approval is claimed. No real AI integration or production deployment is included.</div>
<div class="metrics"><div class="metric"><strong>2</strong><span>Self-contained prototype versions</span></div><div class="metric"><strong>6</strong><span>Required end-to-end views</span></div><div class="metric"><strong>24</strong><span>Traceable delivery stories</span></div><div class="metric"><strong>7</strong><span>Decision-led SteerCo slides</span></div></div>
<nav class="index-nav" aria-label="Pack sections"><a href="#deliverables">Deliverables</a><a href="#changes">Customer changes</a><a href="#plan">Delivery approach</a><a href="#trace">Traceability</a><a href="#readiness">Readiness</a></nav>
<section id="deliverables" class="index-section"><h2>Open the delivery artefacts</h2><div class="grid"><article class="card"><div class="eyebrow">Deliverable 01</div><h3><a href="prototype-v1.html">Experience the baseline</a></h3><p>Six-view v1 prototype with all four original sample submissions. Demonstrate this before discussing the source change requests.</p><small>prototype-v1.html</small></article><article class="card"><div class="eyebrow">Deliverable 02</div><h3><a href="prototype-v2.html">Explore the refined experience</a></h3><p>Interactive v2: consolidated supplier correction rounds, assisted intake, human approval gates, evidence provenance, controlled exceptions, escalation and phased scope.</p><small>prototype-v2.html</small></article><article class="card"><div class="eyebrow">Deliverable 03</div><h3><a href="business-requirements.docx">Business Requirements Document</a></h3><p>Business goals, as-is/to-be journeys, requirements, rules, data, NFRs, responsible AI, measures and traceability.</p><small>business-requirements.docx</small><p><a href="business-requirements.pdf">Read PDF version &rarr;</a></p></article><article class="card"><div class="eyebrow">Deliverable 04</div><h3><a href="workshop-and-delivery-handbook.docx">Workshop and delivery handbook</a></h3><p>Walkthrough, simulated critique, proposed decisions, Sprint 0 plan, governance, RAID, acceptance, adoption and handoff. No invented customer acceptance.</p><small>workshop-and-delivery-handbook.docx</small><p><a href="workshop-and-delivery-handbook.pdf">Read PDF version &rarr;</a></p></article><article class="card"><div class="eyebrow">Deliverable 05</div><h3><a href="delivery-control-workbook.xlsx">Delivery control workbook</a></h3><p>Editable epics, 24 stories, acceptance criteria, dependencies, estimates, planning, RAID, decision ownership, metrics and readiness.</p><small>delivery-control-workbook.xlsx</small><p><a href="delivery-control-workbook.pdf">Read PDF version &rarr;</a></p></article><article class="card"><div class="eyebrow">Deliverable 06</div><h3><a href="steerco-pitch.pptx">SteerCo pitch</a></h3><p>Seven decision-led slides with scope recommendations, prototype evidence, risks, release approach and explicit leadership asks.</p><small>steerco-pitch.pptx</small><p><a href="steerco-pitch.pdf">Read PDF version &rarr;</a></p></article></div><p><a href="source-context.txt">Scenario context and source requirements</a> &middot; <a href="prototype-v2-preview.png">Prototype preview</a> &middot; <a href="source/delivery-brief.json">Canonical delivery brief</a></p></section>
<section id="changes" class="index-section"><h2>Three changes. One coherent response.</h2><div class="grid"><article class="card"><span class="eyebrow">CR01 / Compliance constraint</span><h3>Mandatory evidence stays mandatory</h3><p>D01, D04 and D06 preserve separate category and compliance approvals, add explicit owner-based escalation, invalidate approvals when evidence changes, and confine exceptions to non-mandatory items.</p></article><article class="card"><span class="eyebrow">CR02 / Supplier reality</span><h3>Reduce the burden, not the standard</h3><p>D02 and D05 use minimum viable triage intake, a single coordinated correction round, accessible support and queue rules that exclude supplier size and formatting.</p></article><article class="card full"><span class="eyebrow">CR03 / Seasonal scope tension</span><h3>Prototype broadly. Implement through gates.</h3><p>D03 recommends Packaged Food first, then Seasonal Home and Personal Care after approved category rules. All three categories and four source submissions remain in both prototypes. SteerCo must explicitly accept seasonal timing risk or commission a funded re-estimate; the source launch dates are not production commitments.</p></article></div></section>
<section id="plan" class="index-section"><h2>Two weeks to a credible starting point</h2><div class="grid"><article class="card"><h3>Sprint 0 / D1-D10</h3><p>D1-D2 outcomes, policies and owners; D3-D4 v1 workshop and decisions; D5-D6 v2 and traceable requirements; D7-D8 backlog, evaluation and re-estimation; D9-D10 customer review, SteerCo and handoff.</p><p><strong>G0 requires:</strong> accepted prototype direction, confirmed policy/data ownership, a staffed re-estimate, traceable backlog and explicit risk decisions. These are planned activities, not elapsed work.</p></article><article class="card"><h3>Indicative dependency buckets</h3><p><strong>104 relative points</strong> across the canonical backlog. S0: 11 / S1: 21 / S2: 62 / S3: 5 / S4: 5.</p><p>S1-S2: Packaged Food pilot candidate. S3: Seasonal Home. S4: Personal Care. Each bucket is nominally two weeks only as a planning assumption.</p><div class="warn"><strong>S2 is concentrated, not capacity-approved.</strong> Relative points are not hours. Do not commit to these placements until discovery, staffing and observed delivery capacity support a rebalanced plan.</div></article></div></section>
<section id="trace" class="index-section"><h2>Trace from the experience to delivery</h2><p>The workbook expands each row into persona, business value, acceptance criteria, examples, dependencies, ownership and release gates.</p><div class="card table-scroll"><table><thead><tr><th>Story / requirement</th><th>Delivery need</th><th>Prototype</th><th>Decision</th><th>Placement / points</th></tr></thead><tbody><tr><td>US01 / FR01</td><td>Category-specific intake and draft/submit</td><td><a href="prototype-v2.html">V01</a></td><td>D02</td><td>S1 / 5</td></tr><tr><td>US02 / FR02</td><td>Consolidated clarification and resubmission</td><td><a href="prototype-v2.html">V02</a></td><td>D02</td><td>S1 / 5</td></tr><tr><td>US03 / FR03</td><td>Accessible guidance and assisted onboarding</td><td><a href="prototype-v2.html">V01</a></td><td>D02</td><td>S1 / 3</td></tr><tr><td>US04 / FR04</td><td>Explainable review queue and workload</td><td><a href="prototype-v2.html">V06</a></td><td>D05</td><td>S2 / 5</td></tr><tr><td>US05 / FR05</td><td>Category recommendation, approval and return</td><td><a href="prototype-v2.html">V03</a></td><td>D01</td><td>S2 / 5</td></tr><tr><td>US06 / FR06</td><td>Source-linked evidence review and conflict resolution</td><td><a href="prototype-v2.html">V04</a></td><td>D06</td><td>S2 / 8</td></tr><tr><td>US07 / FR07</td><td>Version changes invalidate approvals</td><td><a href="prototype-v2.html">V04</a></td><td>D06</td><td>S2 / 5</td></tr><tr><td>US08 / FR08</td><td>Separate assortment and launch gates</td><td><a href="prototype-v2.html">V05</a></td><td>D01</td><td>S2 / 5</td></tr><tr><td>US09 / FR09</td><td>Bounded non-mandatory exceptions and escalation</td><td><a href="prototype-v2.html">V05</a></td><td>D04</td><td>S2 / 5</td></tr><tr><td>US10 / FR10</td><td>Channel, content, packaging, supply and handoff readiness</td><td><a href="prototype-v2.html">V05</a></td><td>D01</td><td>S2 / 5</td></tr><tr><td>US11 / FR11</td><td>Portfolio measures and supplier effort</td><td><a href="prototype-v2.html">V06</a></td><td>D07</td><td>S2 / 3</td></tr><tr><td>US12 / FR12</td><td>Audit, contest and named human resolution</td><td><a href="prototype-v2.html">V04</a></td><td>D06</td><td>S2 / 5</td></tr><tr><td>US13 / NFR01</td><td>Identity, supplier isolation and authorization</td><td><a href="prototype-v2.html">V01</a></td><td>D01</td><td>S1 / 5</td></tr><tr><td>US14 / NFR02</td><td>Privacy, retention and secure evidence handling</td><td><a href="prototype-v2.html">V04</a></td><td>D06</td><td>S1 / 3</td></tr><tr><td>US15 / NFR03</td><td>Grounded AI, uncertainty and injection evaluation</td><td><a href="prototype-v2.html">V04</a></td><td>D06</td><td>S2 / 5</td></tr><tr><td>US16 / NFR04</td><td>Accessibility and supplier fairness evaluation</td><td><a href="prototype-v2.html">V01</a></td><td>D02</td><td>S2 / 3</td></tr><tr><td>US17 / NFR05</td><td>Performance, concurrency, resilience and recovery</td><td><a href="prototype-v2.html">V05</a></td><td>D01</td><td>S2 / 5</td></tr><tr><td>US18 / NFR06</td><td>Operability, adoption, support and rollback</td><td><a href="prototype-v2.html">V06</a></td><td>D07</td><td>S2 / 3</td></tr><tr><td>US19 / EN01</td><td>Policy and data discovery spike</td><td><a href="prototype-v2.html">V04</a></td><td>D01</td><td>S0 / 3</td></tr><tr><td>US20 / EN02</td><td>Integration contract and system ownership spike</td><td><a href="prototype-v2.html">V05</a></td><td>D03</td><td>S0 / 3</td></tr><tr><td>US21 / EN03</td><td>Baseline, evaluation and acceptance design</td><td><a href="prototype-v2.html">V06</a></td><td>D07</td><td>S0 / 3</td></tr><tr><td>US22 / EN04</td><td>Seasonal Home rule pack and requalification</td><td><a href="prototype-v2.html">V01</a></td><td>D03</td><td>S3 / 5</td></tr><tr><td>US23 / EN05</td><td>Personal Care rule pack and claim-specialist review</td><td><a href="prototype-v2.html">V04</a></td><td>D03</td><td>S4 / 5</td></tr><tr><td>US24 / EN06</td><td>Sprint 0 handoff, decisions and gate review</td><td><a href="prototype-v2.html">V06</a></td><td>D03</td><td>S0 / 2</td></tr></tbody></table><p class="muted">NFR and enabler links show the affected experience, not production implementation. Identity, secure storage, actual AI, integrations and operational service remain future delivery work.</p></div></section>
<section id="readiness" class="index-section"><h2>Prepared evidence versus pending acceptance</h2><div class="card table-scroll"><table><thead><tr><th>Challenge finish line</th><th>Prepared artefact</th><th>Human acceptance still required</th></tr></thead><tbody><tr><td>Outcome and scope aligned</td><td>BRD and D01-D07 proposals</td><td>Product Owner and sponsor ratification</td></tr><tr><td>Prototype validated</td><td>V1/V2, sample journeys, demo controls and walkthrough</td><td>Business-owner demonstration, feedback and direction acceptance</td></tr><tr><td>BRD and backlog ready</td><td>Requirements, 24 stories and acceptance/trace matrix</td><td>Owner review and Definition of Ready assessment</td></tr><tr><td>Dependencies and RAID visible</td><td>Delivery workbook and handbook</td><td>Named policy/system/data owners and risk acceptance</td></tr><tr><td>Plan agreed</td><td>Ten-day Sprint 0 and indicative gated release plan</td><td>Staffing, capacity re-estimate and seasonal scope decision</td></tr><tr><td>SteerCo decisions prepared</td><td>Seven-slide pitch with options, recommendations and asks</td><td>Actual steering decisions and recorded sign-off</td></tr></tbody></table></div></section>
<section class="index-section"><h2>Run the exercise</h2><div class="card"><p>Open <code>prototype-v1.html</code>, demonstrate the four cases, then review the three source change requests. Open <code>prototype-v2.html</code> and use the demo role selector to walk through the refined decisions. Follow the handbook's customer-review and acceptance scripts.</p><p>Use <strong>Export session JSON</strong> to preserve local mock actions. State is otherwise in the current tab only. No supplier messages or data uploads occur. Exported mock activity is not a customer approval record.</p><p>For a complete review, use the workbook's estimates, RAID, UAT and decision sheets alongside the deck. The <code>source</code> folder contains generation scripts and native workflow tests.</p></div></section>
<footer>Prepared 7 September 2026. Source: attached Contoso Retail AI Delivery Sprint 0 Challenge, Scenario 05. Fictional inputs are distinct from proposed decisions and unconfirmed targets. Open HTML files locally for full interaction; Office files also have static PDF reading copies.<p><strong>Managed Office protection:</strong> the Word and Excel files retain enterprise protection applied on this device. Open them using your authorized, signed-in Office account. No protection or policy was removed. The supplied PDF reading copies are also linked above.</p><p><a href="steerco-readiness-summary.txt">Seven-section SteerCo readiness capture</a> &middot; <a href="source/prototype-validation.json">Technical simulation evidence and limitations</a></p></footer></div></body></html>

===== FILE: package-manifest.json =====
===== TYPE: .json (signature 7B-0A-20-20-22-70-61-63) =====
===== SECTIONS DETECTED: code (.json), 323 lines (cite by line number) =====
{
  "package": "Supplier and Product Onboarding",
  "created": "2026-09-07T07:42:31.633Z",
  "sourceReferenceDate": "2026-09-07",
  "status": "Fictional working package; customer acceptance and delivery commitments remain pending",
  "protection": "Enterprise protection retained on Word/Excel files; authorized signed-in Office may be required. No labels or policies changed.",
  "finalNativeOfficeReadOnly": {
    "checked": "2026-09-07",
    "brdPages": 17,
    "handbookPages": 21,
    "workbookSheets": 15,
    "persistedTotalPoints": 104,
    "persistedS2Points": 62,
    "workbookCapacityWarning": "OVERLOADED - REBALANCE"
  },
  "files": [
    {
      "file": "business-requirements.docx",
      "bytes": 167936,
      "sha256": "fe161ca3da59092bb99126a38076bd8ab51aeacd3124a0fbc9222f23d462a0a1"
    },
    {
      "file": "business-requirements.pdf",
      "bytes": 191830,
      "sha256": "3f9ee188df3d1dc216ac92aa852983cb60f7f62ee6c8db24437bb3113a85ccec"
    },
    {
      "file": "delivery-control-workbook.pdf",
      "bytes": 598620,
      "sha256": "9057e1675a5fd28f61ceea242897449f8510231ccfc8319b52e3170b11b38290"
    },
    {
      "file": "delivery-control-workbook.xlsx",
      "bytes": 225792,
      "sha256": "f1aa4fecc7a1c6d82246f7ee770832db66bffbcf300b93901ba6aea9cf1e1e73"
    },
    {
      "file": "index.html",
      "bytes": 22309,
      "sha256": "97e6da0431269102676a07558f4d29790b48e15c842ce02d589df8a7330eb91c"
    },
    {
      "file": "prototype-v1.html",
      "bytes": 57586,
      "sha256": "202b322cc4fef887a5b3f7172be1ca5700730e354bf8aad37eaf0cb9d45038ee"
    },
    {
      "file": "prototype-v2-preview.png",
      "bytes": 277799,
      "sha256": "34192a668f5eef310d09cddbba21fb5e0b402a27b0bba5afe2b01a63c17a13f1"
    },
    {
      "file": "prototype-v2.html",
      "bytes": 57586,
      "sha256": "6777700c4f6cb249f7cddd889fb03b921e00a3382f22da507cce273ab561c642"
    },
    {
      "file": "README.txt",
      "bytes": 7158,
      "sha256": "959597f7d4b4556837453ab035f31299676f5ead388ee93f051d40571c7b410e"
    },
    {
      "file": "source\\build-delivery.py",
      "bytes": 88780,
      "sha256": "8506456fe24ec8c8372f14666f58ec8c870b21cf67e7c65ac471d4de3923cfae"
    },
    {
      "file": "source\\build-documents.cjs",
      "bytes": 6056,
      "sha256": "80bbd446017b58004449e0e1b347e7455792b8a0b1f2b6da737c0ce4b14ae0c8"
    },
    {
      "file": "source\\build-package.cjs",
      "bytes": 17832,
      "sha256": "8ed92fabed41341a538106bd5020baf07bafd1acc250ec6076e1ddee2b70d691"
    },
    {
      "file": "source\\build-prototypes.cjs",
      "bytes": 741,
      "sha256": "ea93214fc0441dd05655420fe30f036c164b810e29b11279ac2133643c0446d6"
    },
    {
      "file": "source\\deck\\deck-input.json",
      "bytes": 8565,
      "sha256": "32577d2778b4c6507bba73addab24423862c7389ccf61fde5e7f20832ea5fa1e"
    },
    {
      "file": "source\\deck\\export-and-qa.ps1",
      "bytes": 2744,
      "sha256": "2d68c1a0e81b71a7d5c28a9e1e576f427589cbf41ed5e75176fd30ebae2160c4"
    },
    {
      "file": "source\\deck\\generate-deck.js",
      "bytes": 24319,
      "sha256": "c54d37c8466ab77d7ebff1e0b8dbee34536665f1e2917f7c39f24283c990e329"
    },
    {
      "file": "source\\deck\\package-lock.json",
      "bytes": 6654,
      "sha256": "d9990cb8cb4c3b135fa1e77919d85138cefce09ddbb3326dd24696e3d26eddc5"
    },
    {
      "file": "source\\deck\\package.json",
      "bytes": 130,
      "sha256": "e1a0e1bab0d83bd5dae50703075034e6ae7ae60c3896aaaff561480fff55d269"
    },
    {
      "file": "source\\deck\\usage.txt",
      "bytes": 1696,
      "sha256": "ea7464ba5b6fcdc4fb6c0e9939e32a0531196f62838d511fb14b38e05e32668a"
    },
    {
      "file": "source\\deck\\validate-deck.py",
      "bytes": 2978,
      "sha256": "0f8fee4addebd905e21b3f3bbb44c0e8b248a2a1fc2f31f194f1aca3af74f956"
    },
    {
      "file": "source\\delivery-brief.json",
      "bytes": 10658,
      "sha256": "4dd5f5bcab4ea83efdce147121d290a602cbafba962329b72ba7af9ad9ad9817"
    },
    {
      "file": "source\\delivery-content.json",
      "bytes": 134282,
      "sha256": "fce941f0dc78ce97270f49582046d8b4a7d63a6a1bd88fc8956e9c489324d6f6"
    },
    {
      "file": "source\\domain.cjs",
      "bytes": 17912,
      "sha256": "1a409940768b0aa511af986b4a75baf8f680a02e31e98cfe4c4bf4e84ad3fbb8"
    },
    {
      "file": "source\\domain.test.cjs",
      "bytes": 7922,
      "sha256": "3caab7aa717a3cd2c5fe431a51eeeaf4414aca41be8c08fe417a158fde74b63e"
    },
    {
      "file": "source\\export-documents.ps1",
      "bytes": 587,
      "sha256": "c9a0d3cc3a8e0155acba78b722ed0c0cef025b407fc353081e6e7d48e2e36af0"
    },
    {
      "file": "source\\extract-scope.py",
      "bytes": 1027,
      "sha256": "bc261e13c2f7738a2cfb311a763f2e2e62b5aa7feadec38450609e2cabee5513"
    },
    {
      "file": "source\\package-lock.json",
      "bytes": 7875,
      "sha256": "a10385ba3bd0aedb3b90720d5d4c8c6ac09f6dab95864c1ff6ffd70bcc56bd85"
    },
    {
      "file": "source\\package-manifest.cjs",
      "bytes": 2721,
      "sha256": "9461d120a2ff7a1b083796c4c0d085a5049dda809cdb83d03d536bc30f4e3faf"
    },
    {
      "file": "source\\package.json",
      "bytes": 49,
      "sha256": "1ad896461fe8445ff4dd51ba2afbe8d116b1a46b8ca4aae721418b5150354e34"
    },
    {
      "file": "source\\prototype-app.js",
      "bytes": 29857,
      "sha256": "ff20bb8c0b3655b2d27c3e42facc0d3292f4f2aff85cebaf63c5480bb30b5962"
    },
    {
      "file": "source\\prototype-template.html",
      "bytes": 9875,
      "sha256": "f58e9b43c10740ea9f16d3241712e7e90da89f41cd4e93ba6a7c8cfddb87406c"
    },
    {
      "file": "source\\prototype-validation.json",
      "bytes": 2088,
      "sha256": "9615b9463e42a70dcf86e55e603adcbc28bd33fa0bfb43411b26e9b51f18550f"
    },
    {
      "file": "source\\qa\\artifact-qa.json",
      "bytes": 4148,
      "sha256": "ecb80ea43024d046204454cf7c2872bdcd329da4bff4348ed555193c185fdadf"
    },
    {
      "file": "source\\qa\\business-requirements-contact-1.png",
      "bytes": 542128,
      "sha256": "003470795a08d47e36cdac14839636ec3bb03d894f81eabbb56f1d2d62a14ee9"
    },
    {
      "file": "source\\qa\\business-requirements-contact-2.png",
      "bytes": 236094,
      "sha256": "acb2313e9f4137504208f8d1f634303e56a6842e31e1dfd55bce76768a58f81c"
    },
    {
      "file": "source\\qa\\business-requirements-page-1.png",
      "bytes": 74719,
      "sha256": "59e42ee59dfbe83c564add9fa5fda4fb98441fdb94eb1e853f6b1b1d4dec6edf"
    },
    {
      "file": "source\\qa\\business-requirements-page-17.png",
      "bytes": 28323,
      "sha256": "6a7b6de0e648c89420a50d73a6d0d7b892c04e16a50bf45713e3928f1b12c14d"
    },
    {
      "file": "source\\qa\\business-requirements-page-9.png",
      "bytes": 225935,
      "sha256": "f3ed833142ab7bb13f42bfa4d1078b8a840c9bf4d460ab6e2926bc58cfc29a3c"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-contact-1.png",
      "bytes": 124947,
      "sha256": "343028a40a6226645643233bca2ad9727d058d2d50baee9ea0716153512f05e6"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-contact-2.png",
      "bytes": 86644,
      "sha256": "1132d3d3f31ac9b65b80c92291bb641e21edf7cb23ad0118722b987cb0099073"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-contact-3.png",
      "bytes": 88414,
      "sha256": "a78cd013c52e4734d92fd9c70b4041055218e8736b9a984be6bc6f86c999b222"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-contact-4.png",
      "bytes": 21505,
      "sha256": "4faa300104a44892fcd146b9881fe0019e3826937b220eb612d4eab3d8629b1c"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-page-1.png",
      "bytes": 148350,
      "sha256": "cd17bedb536ce139639c61d856ecb6e547a9d943042193eb14c46f74fe486d98"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-page-21.png",
      "bytes": 65171,
      "sha256": "7b51af2b7542829fbf88ad29a06c3af3a52aec0ed670686fd1c57320d1d65b53"
    },
    {
      "file": "source\\qa\\delivery-control-workbook-page-40.png",
      "bytes": 51189,
      "sha256": "4e3f122246dc8c8b4cc35c5be8889a49082d00c0df29e77978a0c6a00bd2d7b8"
    },
    {
      "file": "source\\qa\\visual-review.json",
      "bytes": 1608,
      "sha256": "3474cc0f3dd13a22a286b289d62e898b28f5ec4a8ff09d0c084d92d91d0a6c8b"
    },
    {
      "file": "source\\qa\\workshop-and-delivery-handbook-contact-1.png",
      "bytes": 578102,
      "sha256": "30460919752411b6775872a84ab870be14e1d6fde57370b80097eb7ef308eabe"
    },
    {
      "file": "source\\qa\\workshop-and-delivery-handbook-contact-2.png",
      "bytes": 513123,
      "sha256": "cf08c354db91129186077fc1040344b1d1174b8294f2611983ec6b477e105de2"
    },
    {
      "file": "source\\qa\\workshop-and-delivery-handbook-page-1.png",
      "bytes": 78616,
      "sha256": "4a78c2001406d9c020013651c65887678b15387a5f4e0cb0a0ef0458fe4ab86d"
    },
    {
      "file": "source\\qa\\workshop-and-delivery-handbook-page-11.png",
      "bytes": 242344,
      "sha256": "7062b921244165a7223efd4af5613059dd3c823a02d8fe2d8f44d9dd182f2304"
    },
    {
      "file": "source\\qa\\workshop-and-delivery-handbook-page-21.png",
      "bytes": 148164,
      "sha256": "7cb00d44282aa1e417d4dd6398514af28540753078e1152432372abed90be877"
    },
    {
      "file": "source\\qa-artifacts.py",
      "bytes": 4894,
      "sha256": "01c8241fb7b620a8ec9183c9a2bc40fe7bf482d24a6a2064ca644045a82cda12"
    },
    {
      "file": "source\\recalculate-excel.ps1",
      "bytes": 6904,
      "sha256": "9c806b230bf711724ef3760f3f2a83de86cb03044a7843e2140f40bf22bc10be"
    },
    {
      "file": "source\\workbook-model.json",
      "bytes": 95549,
      "sha256": "a2a666c5457c4134b1aceb8a266d77f7200bd433c167eda75883b50f90ad9c86"
    },
    {
      "file": "source\\workbook-recalculation-qa.json",
      "bytes": 474,
      "sha256": "f4e8d00eb2138b253d69cdf228d269475c7cfc763538e2ecf7e9031951ba0786"
    },
    {
      "file": "source-context.txt",
      "bytes": 25229,
      "sha256": "48e70cd2532b95b0a1dc1fedf3585a9c1f373845c4c8fb59aae24d6de66365e8"
    },
    {
      "file": "steerco-pitch.pdf",
      "bytes": 120112,
      "sha256": "1b2868d4069aed410f9822f68da08a07baec5b02ab1c8015922acb03c53d07b7"
    },
    {
      "file": "steerco-pitch.pptx",
      "bytes": 61370,
      "sha256": "0d306c166cf9a325315dbb3cdadbc3635f4ac53394df859e5f85a1a33a58f43e"
    },
    {
      "file": "steerco-readiness-summary.txt",
      "bytes": 8490,
      "sha256": "eb726756ed3060e53c49d559c94e35542282e63545ea352c76f8f7aac095b5f5"
    },
    {
      "file": "workshop-and-delivery-handbook.docx",
      "bytes": 172032,
      "sha256": "35bdaf6d6e13e1fefa8b0f0da91f424a0bdb9f149a4b1413e067fa071b206d04"
    },
    {
      "file": "workshop-and-delivery-handbook.pdf",
      "bytes": 222974,
      "sha256": "04e8e8006a27c92d9f2f9117a9ac4c67b7d368ad16a42e1eb6411fdc5edb80b4"
    }
  ]
}

===== FILE: prototype-v1.html =====
===== TYPE: .html (signature 3C-21-64-6F-63-74-79-70) =====
===== SECTIONS DETECTED: HTML wireframe/markup, 536 lines (cite by line number) =====
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:,">
<title>Contoso | Supplier and Product Onboarding - v1</title>
<script>
  (() => {
    const param = new URLSearchParams(window.location.search).get("scoutTheme");
    const theme =
      param || (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    document.documentElement.setAttribute("data-theme", theme);
  })();
</script>
<style>
:root {
  color-scheme: light;
  --cp-bg: #f7f4ef;
  --cp-bg-elevated: #fcfbf8;
  --cp-surface: #ffffff;
  --cp-surface-soft: #f5f5f5;
  --cp-border: #dedede;
  --cp-border-strong: #919191;
  --cp-text: #242424;
  --cp-text-muted: #5c5c5c;
  --cp-text-soft: #6f6f6f;
  --cp-accent: #b11f4b;
  --cp-accent-hover: #9a1a41;
  --cp-accent-soft: rgba(177, 31, 75, 0.08);
  --cp-accent-fg: #ffffff;
  --cp-success: #16a34a;
  --cp-danger: #dc2626;
  --cp-warning: #f59e0b;
  --cp-link: #0078d4;
  --cp-shadow: 0 18px 48px rgba(0, 0, 0, 0.12);
  --cp-overlay: rgba(255, 255, 255, 0.8);
  --cp-panel: rgba(255, 255, 255, 0.86);
  --cp-panel-strong: rgba(255, 255, 255, 0.96);
  --cp-sheen: rgba(255, 255, 255, 0.55);
  --cp-highlight: rgba(177, 31, 75, 0.12);
}
html[data-theme="dark"] {
  color-scheme: dark;
  --cp-bg: #3d3b3a;
  --cp-bg-elevated: #343231;
  --cp-surface: #292929;
  --cp-surface-soft: #2e2e2e;
  --cp-border: #474747;
  --cp-border-strong: #5f5f5f;
  --cp-text: #dedede;
  --cp-text-muted: #919191;
  --cp-text-soft: #b0b0b0;
  --cp-accent: #fd8ea1;
  --cp-accent-hover: #fb7b91;
  --cp-accent-soft: rgba(253, 142, 161, 0.14);
  --cp-accent-fg: #1a1a1a;
  --cp-success: #4ade80;
  --cp-danger: #f87171;
  --cp-warning: #fbbf24;
  --cp-link: #4da6ff;
  --cp-shadow: 0 18px 48px rgba(0, 0, 0, 0.32);
  --cp-overlay: rgba(41, 41, 41, 0.88);
  --cp-panel: rgba(41, 41, 41, 0.72);
  --cp-panel-strong: rgba(41, 41, 41, 0.96);
  --cp-sheen: rgba(255, 255, 255, 0.04);
  --cp-highlight: rgba(253, 142, 161, 0.12);
}
*{box-sizing:border-box}
body{margin:0;background:var(--cp-bg);color:var(--cp-text);font:16px/1.55 "Segoe UI",Aptos,Calibri,-apple-system,BlinkMacSystemFont,sans-serif}
a{color:var(--cp-link)}
button,input,select,textarea{font:inherit;border:1px solid var(--cp-border-strong);border-radius:.625rem;padding:9px 12px;background:var(--cp-surface);color:var(--cp-text)}
button{cursor:pointer;font-weight:600}
button:hover{background:var(--cp-accent-soft);border-color:var(--cp-accent)}
button:disabled{cursor:not-allowed;color:var(--cp-text-muted);opacity:.65}
button.primary{background:var(--cp-accent);color:var(--cp-accent-fg);border-color:var(--cp-accent)}
button:focus-visible,a:focus-visible,input:focus-visible,select:focus-visible,textarea:focus-visible,summary:focus-visible{outline:3px solid var(--cp-accent);outline-offset:3px}
input,select,textarea{max-width:100%}textarea{min-height:88px;resize:vertical;width:100%}
h1{font-size:32px;line-height:1.15;letter-spacing:-1px;margin:8px 0 12px}h2{font-size:24px;line-height:1.25;margin:0 0 12px}h3{font-size:18px;margin:0 0 12px}
p{margin:8px 0 16px}small,.muted{color:var(--cp-text-muted)}.eyebrow{font-size:12px;text-transform:uppercase;letter-spacing:2px;font-weight:700;color:var(--cp-accent)}
.skip{position:absolute;left:-10000px}.skip:focus{left:16px;top:8px;background:var(--cp-surface);z-index:4}
header{padding:24px 32px 20px;background:var(--cp-surface);border-bottom:1px solid var(--cp-border)}
.headrow,.toolbar,.actions{display:flex;gap:12px;align-items:center;flex-wrap:wrap}.headrow{justify-content:space-between}.headrow p{max-width:820px}
.disclaimer{padding:12px 32px;background:var(--cp-accent-soft);border-bottom:1px solid var(--cp-border);font-size:13px}
.toolbar{padding:16px 32px;background:var(--cp-bg-elevated)}.toolbar label{font-size:13px;font-weight:600}.toolbar label select,.toolbar label input{display:block;margin-top:4px}
.toolbar .spacer{flex:1}.layout{display:grid;grid-template-columns:272px minmax(0,1fr);max-width:1640px;margin:auto}
aside{padding:24px 16px;border-right:1px solid var(--cp-border)}
.case{display:block;width:100%;text-align:left;padding:16px;margin-bottom:12px;background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px;font-weight:400}
.case.selected{border:2px solid var(--cp-accent);background:var(--cp-accent-soft)}
.case strong,.case small{display:block}.case strong{margin:4px 0}.case small{font-size:12px}.case .id{font:12px Consolas,"Courier New",Courier,monospace;color:var(--cp-accent)}
main{min-width:0;padding:24px 28px 56px}
nav{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:24px}nav button{font-size:13px}nav button[aria-current="page"]{background:var(--cp-accent);color:var(--cp-accent-fg)}
.card{background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px;padding:24px;margin-bottom:20px}
.grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:20px}.grid .card{margin-bottom:0}.metrics{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:12px;margin:20px 0}
.metric{padding:20px;background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px}.metric strong{font-size:32px;display:block;line-height:1.3;color:var(--cp-accent)}.metric span{font-size:12px;color:var(--cp-text-muted)}
.badge{display:inline-block;padding:3px 9px;border:1px solid var(--cp-border);border-radius:8px;font-size:12px;background:var(--cp-surface-soft)}
.warn{border-left:4px solid var(--cp-warning);padding:12px 16px;background:var(--cp-surface-soft);margin:12px 0}
.good{color:var(--cp-success)}.bad{color:var(--cp-danger)}.full{grid-column:1/-1}
.field{display:block;margin:12px 0;font-size:14px;font-weight:600}.field input,.field select,.field textarea{display:block;width:100%;margin-top:6px;font-weight:400}
.progress{height:8px;background:var(--cp-border);border-radius:8px;overflow:hidden;margin:8px 0}.progress span{display:block;height:100%;background:var(--cp-accent)}
.table-scroll{overflow:auto}table{width:100%;border-collapse:collapse;text-align:left;font-size:14px}th,td{padding:12px 10px;border-bottom:1px solid var(--cp-border);vertical-align:top}th{background:var(--cp-surface-soft);font-weight:600}td .actions{gap:6px}td button{font-size:12px;padding:6px 8px}
.gate{display:flex;justify-content:space-between;gap:16px;padding:14px 0;border-bottom:1px solid var(--cp-border)}.gate strong{display:block}
#notice{margin:0 0 16px;min-height:0}#notice:not(:empty){padding:14px 16px;border:1px solid var(--cp-accent);border-radius:10px;background:var(--cp-accent-soft)}
.evidence-item{border-top:1px solid var(--cp-border);padding:20px 0}.evidence-item:first-of-type{border-top:0}.evidence-meta{font-size:13px;color:var(--cp-text-muted)}
details{margin:12px 0}summary{cursor:pointer;font-weight:600}.audit{max-height:320px;overflow:auto}.step{padding:12px;background:var(--cp-surface-soft);border-radius:10px;margin:8px 0}
footer{padding:24px 32px;border-top:1px solid var(--cp-border);font-size:12px;color:var(--cp-text-muted)}
@media(max-width:1050px){.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}.grid{grid-template-columns:1fr}.layout{grid-template-columns:240px minmax(0,1fr)}main{padding:20px}}
@media(max-width:760px){.layout{display:block}aside{border-right:0;display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:8px;padding:16px}aside h2,aside p{grid-column:1/-1}.case{margin:0}.toolbar,header,.disclaimer{padding-left:16px;padding-right:16px}h1{font-size:26px}.card{padding:16px}main{padding:16px}.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}}
@media print{.toolbar,aside,nav,button,.disclaimer{display:none}.layout{display:block}main{padding:0}.card{break-inside:avoid}body{font-size:11pt}header{padding:12px}}
</style>
</head>
<body>
<a class="skip" href="#content">Skip to main content</a>
<header><div class="headrow"><div><div class="eyebrow">Contoso Retail / Delivery immersion / v1</div><h1>Supplier &amp; Product Onboarding</h1><p class="muted">From incomplete submission to a reviewable product. Every approval has an owner. Every launch has a gate.</p></div><a href="index.html">Delivery pack &rarr;</a></div></header>
<div class="disclaimer"><strong>Fictional exercise. Local simulation only.</strong> No live AI, supplier messages, uploads or integrations. Roles are demo controls, not authentication. Customer validation and policy approval are pending. Changes are held in this tab; export the session to retain a record.</div>
<section class="toolbar" aria-label="Demo controls">
<label>Act as (demo role)<select id="role"></select></label>
<label>Demo business date<input id="asOf" type="date" value="2026-09-07"></label>
<div class="spacer"></div><button id="export">Export session JSON</button><button id="reset">Reset demo</button><button id="theme">Toggle theme</button>
</section>
<div class="layout"><aside id="cases" aria-label="Sample submissions"></aside><main id="content" tabindex="-1"><nav id="nav" aria-label="Onboarding views"></nav><div id="notice" role="status" aria-live="polite"></div><div id="view"></div></main></div>
<footer>Source: contoso-retail-delivery-challenge.html, Scenario 05. Original four case facts preserved. Added record ages (except ONB-8104), commercial values, channels, evidence dates and policy examples are illustrative. Completeness is not compliance or launch approval. <a href="source-context.txt">Source context</a> &middot; <a href="prototype-v2.html">Open v2</a></footer>
<script>
const PROTOTYPE_VERSION = 'v1';
const Domain = (() => { const module = { exports: {} }; 'use strict';

const ROLES = ['Supplier contact', 'Coordinator', 'Category manager', 'Compliance owner', 'Channel owner', 'Assortment approver', 'Operations lead'];
const AS_OF = '2026-09-07';
const evidence = (id, name, owner, status, text, source, conflict = '') => ({
  id, name, owner, status, text, source, conflict, version: 1,
  date: status === 'missing' ? '' : '2026-09-04',
  note: status === 'verified' ? 'Illustrative prior specialist verification; not real evidence.' : '',
  uncertainty: status === 'missing' ? 'No evidence supplied' : 'Mock content; source and policy must be validated'
});
const common = () => ({
  intake: 'Submitted for review', revision: 1, support: [], questions: [], requests: [], audit: [],
  decisions: { category: 'Pending', compliance: 'Pending', assortment: 'Pending', launch: 'No-go' },
  exceptions: [],
  readiness: {
    content: { label: 'Primary channel content', status: 'Pending', owner: 'Channel owner', mandatory: true, channel: 'Digital' },
    packaging: { label: 'Packaging readiness', status: 'Pending', owner: 'Category manager', mandatory: true, channel: 'Both' },
    supply: { label: 'Supply confirmation', status: 'Pending', owner: 'Category manager', mandatory: true, channel: 'Both' },
    store: { label: 'Store handoff', status: 'Pending', owner: 'Channel owner', mandatory: true, channel: 'Store' },
    digital: { label: 'Digital handoff', status: 'Pending', owner: 'Channel owner', mandatory: true, channel: 'Digital' },
    imagery: { label: 'Additional lifestyle image', status: 'Pending', owner: 'Channel owner', mandatory: false, channel: 'Digital' }
  },
  handoff: { owner: 'Channel owner', due: '2026-09-11', note: 'Illustrative internal review date, not a committed launch.' }
});
function seed() {
  return [
    { ...common(), id: 'ONB-8101', supplier: 'Northstar Foods', product: 'Harvest Trail Granola', category: 'Packaged Food', launch: '2026-10-12', initialCompleteness: 82, age: 9, effort: 4.2,
      customerNeed: 'Convenient breakfast assortment; dietary information must be accurate.', comparison: 'Compare with existing granola range for overlap; buyer decision pending.',
      commercial: 'Illustrative unit cost 2.40; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Oats and seeds; final allergen declaration required', dimensions: '180 x 80 x 240 mm' },
      evidence: [
        evidence('nutrition', 'Nutrition panel', 'Compliance owner', 'provided', 'Nutrition panel supplied; source scenario gives no values.', 'Supplier nutrition panel v1'),
        evidence('allergen', 'Allergen declaration', 'Compliance owner', 'missing', '', 'Not supplied'),
        evidence('ingredients', 'Ingredient specification', 'Compliance owner', 'verified', 'Illustrative ingredient document.', 'Supplier ingredient sheet v1'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'verified', '180 x 80 x 240 mm; illustrative.', 'Supplier packaging sheet v1')
      ] },
    { ...common(), id: 'ONB-8102', supplier: 'Willow & Coast', product: 'CalmLeaf Hand Lotion', category: 'Personal Care', launch: '2026-09-28', initialCompleteness: 91, age: 12, effort: 4.2,
      customerNeed: 'Everyday moisturising care with substantiated customer claims.', comparison: 'Compare equivalent lotion assortment, not supplier size.',
      commercial: 'Illustrative unit cost 3.10; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Supplier ingredient list awaiting specialist confirmation', dimensions: '100 x 60 x 170 mm' },
      evidence: [
        evidence('claim', '48-hour moisture claim', 'Compliance owner', 'conflict', 'Label says 48-hour moisture; supporting evidence wording is inconsistent.', 'Supplier label v1 and claim study v1', 'Source scenario confirms a conflict; the exact conflicting wording was not provided.'),
        evidence('ingredients', 'Ingredient specification', 'Compliance owner', 'provided', 'Mock supplier ingredient list.', 'Supplier ingredient list v1'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'verified', '100 x 60 x 170 mm; illustrative.', 'Supplier packaging sheet v1')
      ] },
    { ...common(), id: 'ONB-8103', supplier: 'Hearthline Goods', product: 'WinterGlow Lantern Set', category: 'Seasonal Home', launch: '2026-10-20', initialCompleteness: 76, age: 8, effort: 4.2,
      customerNeed: 'Seasonal decorative lighting with confirmed battery safety.', comparison: 'Seasonal range gap proposed; safety and pack feasibility require human judgment.',
      commercial: 'Illustrative unit cost 8.20; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Not applicable - non-food', dimensions: '' },
      evidence: [
        evidence('battery', 'Battery safety declaration', 'Compliance owner', 'missing', '', 'Not supplied'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'missing', '', 'Not supplied'),
        evidence('label', 'Product label and safety instructions', 'Compliance owner', 'provided', 'Illustrative label pending specialist review.', 'Supplier label v1')
      ] },
    { ...common(), id: 'ONB-8104', supplier: 'Meadowlane Pantry', product: 'Garden Cup Soup', category: 'Packaged Food', launch: '2026-11-16', initialCompleteness: 100, age: 6, effort: 4.2,
      customerNeed: 'Convenient meal option; fit with current soup range awaits category decision.', comparison: 'Compare portion sizes and range overlap in the category review.',
      commercial: 'Illustrative unit cost 1.80; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Illustrative verified soup specification', dimensions: '120 x 120 x 140 mm' },
      evidence: [
        evidence('nutrition', 'Nutrition panel', 'Compliance owner', 'verified', 'Illustrative approved nutrition panel.', 'Supplier nutrition panel v1'),
        evidence('allergen', 'Allergen declaration', 'Compliance owner', 'verified', 'Illustrative approved allergen declaration.', 'Supplier allergen declaration v1'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'verified', '120 x 120 x 140 mm; illustrative.', 'Supplier packaging sheet v1')
      ],
      decisions: { category: 'Pending', compliance: 'Approved', assortment: 'Pending', launch: 'No-go' }
    }
  ];
}
const text = value => typeof value === 'string' && value.trim().length > 0;
const daysUntil = (date, asOf = AS_OF) => Math.round((Date.parse(date + 'T00:00:00Z') - Date.parse(asOf + 'T00:00:00Z')) / 86400000);
const mandatoryBlockers = record => record.evidence.filter(item => item.status !== 'verified');
function priority(record, asOf = AS_OF) {
  const blockers = mandatoryBlockers(record).length;
  const days = daysUntil(record.launch, asOf);
  const score = (blockers ? 40 : 0) + (days <= 21 ? 30 : 0) + Math.min(record.age, 20) + (!blockers && record.age >= 5 ? 25 : 0);
  return { score, days, reason: `${blockers ? 'Mandatory review required' : 'No mandatory evidence blocker'}; ${days} calendar days to requested launch; ${record.age} days in review${!blockers && record.age >= 5 ? '; nearly ready aged item' : ''}. Supplier size and format are excluded.` };
}
function activeException(record, key, asOf = AS_OF) {
  const item = record.readiness[key];
  if (!item || item.mandatory) return null;
  return record.exceptions.find(exception => exception.key === key && exception.status === 'Active' &&
    exception.expiry >= asOf && exception.channels.includes(item.channel) && text(exception.rationale) &&
    text(exception.condition) && text(exception.escalation) && exception.owner === 'Assortment approver') || null;
}
function launchBlockers(record, asOf = AS_OF) {
  const blockers = [];
  if (mandatoryBlockers(record).length) blockers.push('Mandatory evidence not verified');
  for (const gate of ['category', 'compliance', 'assortment']) if (record.decisions[gate] !== 'Approved') blockers.push(`${gate} approval pending`);
  for (const [key, item] of Object.entries(record.readiness)) if (item.status !== 'Ready' && !activeException(record, key, asOf)) blockers.push(item.label);
  return blockers;
}
function invalidate(record, reopenReadiness = false) {
  record.decisions = { category: 'Pending', compliance: 'Pending', assortment: 'Pending', launch: 'No-go' };
  if (reopenReadiness) {
    Object.values(record.readiness).forEach(item => { item.status = 'Pending'; item.note = 'Source information changed; reconfirm this readiness item.'; });
    record.exceptions.forEach(exception => { exception.status = 'Superseded'; });
  }
}
function log(record, role, action, detail, asOf) {
  record.audit.push({ sequence: record.audit.length + 1, asOf, timestamp: new Date().toISOString(), role, action, detail, revision: record.revision });
}
function act(record, role, action, payload = {}, asOf = AS_OF) {
  if (!ROLES.includes(role)) throw new Error('Unknown demo role.');
  const requireRole = (...allowed) => { if (!allowed.includes(role)) throw new Error(`This action requires ${allowed.join(' or ')}.`); };
  const requireNote = () => { if (!text(payload.note)) throw new Error('Enter a meaningful note or rationale before continuing.'); };
  switch (action) {
    case 'save':
    case 'submit':
      requireRole('Supplier contact', 'Coordinator');
      if (!text(payload.product) || !text(payload.ingredients)) throw new Error('Minimum intake needs a product name and ingredients or a stated not-applicable reason.');
      if (record.product !== payload.product.trim() || record.fields.ingredients !== payload.ingredients.trim() || record.fields.dimensions !== (payload.dimensions || '').trim()) {
        record.product = payload.product.trim();
        record.fields = { ingredients: payload.ingredients.trim(), dimensions: (payload.dimensions || '').trim() };
        record.evidence.forEach(item => { if (item.status === 'verified') { item.status = 'provided'; item.note = 'Product data changed: specialist re-verification required.'; } });
        record.revision += 1; invalidate(record, true);
      }
      if (action === 'save') invalidate(record);
      record.intake = action === 'submit' ? 'Submitted for triage; completeness is not approval' : 'Draft saved';
      break;
    case 'support':
      requireRole('Supplier contact', 'Coordinator'); requireNote();
      record.support.push({ note: payload.note, owner: 'Coordinator', status: 'Requested', due: asOf, mode: payload.mode || 'Assisted submission' });
      break;
    case 'request':
      requireRole('Coordinator', 'Compliance owner', 'Category manager'); requireNote();
      if (!text(payload.due) || payload.due < asOf) throw new Error('Choose a correction due date on or after the demo date.');
      if (payload.consolidated && record.requests.some(request => request.status === 'Open')) throw new Error('An open correction round already exists. Add the supplier response or close that round before opening another.');
      record.requests.push({ id: `CLR-${record.requests.length + 1}`, note: payload.note, due: payload.due, owner: 'Coordinator', status: 'Open', response: '', items: mandatoryBlockers(record).map(item => item.id) });
      break;
    case 'respond':
      requireRole('Supplier contact', 'Coordinator'); requireNote();
      if (!record.requests.some(request => request.status === 'Open')) throw new Error('There is no open clarification request to respond to.');
      record.requests.filter(request => request.status === 'Open').forEach(request => { request.response = payload.note; request.status = 'Responded - human review pending'; });
      record.intake = 'Resubmitted for human review';
      break;
    case 'provide': {
      requireRole('Supplier contact', 'Coordinator'); requireNote();
      const item = record.evidence.find(candidate => candidate.id === payload.id);
      if (!item) throw new Error('Evidence item does not exist.');
      if (!text(payload.source)) throw new Error('A source reference is required; do not fabricate a verified source.');
      item.text = payload.note; item.source = payload.source; item.status = 'provided';
      item.conflict = ''; item.version += 1; item.date = asOf;
      item.note = 'Supplier revision received; prior conflict requires named specialist review.';
      item.uncertainty = 'Supplier provided, not yet verified';
      record.revision += 1; invalidate(record, true);
      break;
    }
    case 'verify':
    case 'rejectEvidence':
    case 'moreEvidence': {
      const item = record.evidence.find(candidate => candidate.id === payload.id);
      if (!item) throw new Error('Evidence item does not exist.');
      requireRole(item.owner); requireNote();
      if (action === 'verify' && (!text(item.text) || item.status === 'missing' || item.status === 'conflict' || text(item.conflict) || item.status === 'rejected')) throw new Error('Missing, rejected or conflicting evidence cannot be verified. Obtain a corrected supplier revision first.');
      item.status = action === 'verify' ? 'verified' : action === 'rejectEvidence' ? 'rejected' : 'needs more';
      item.note = payload.note;
      item.uncertainty = action === 'verify' ? 'Demo specialist confirmed this version; not a real compliance judgment' : 'Further supplier information required';
      invalidate(record);
      break;
    }
    case 'question':
    case 'return':
    case 'recommend':
      requireRole('Category manager'); requireNote();
      record.questions.push({ action, note: payload.note, owner: 'Category manager', status: action === 'return' ? 'Supplier response required' : 'Recorded' });
      if (action === 'return') { invalidate(record); record.intake = 'Returned for changes'; }
      break;
    case 'approveCategory':
      requireRole('Category manager'); requireNote();
      if (record.evidence.some(item => item.owner === role && item.status !== 'verified')) throw new Error('Category-owned mandatory evidence must be verified before category approval.');
      if (record.intake === 'Draft saved' || record.intake === 'Returned for changes') throw new Error('Supplier must submit or resubmit the product before approval.');
      record.decisions.category = 'Approved';
      break;
    case 'approveCompliance':
      requireRole('Compliance owner'); requireNote();
      if (record.evidence.some(item => item.owner === role && item.status !== 'verified')) throw new Error('Compliance-owned mandatory evidence must be verified before compliance approval.');
      record.decisions.compliance = 'Approved';
      break;
    case 'approveAssortment':
      requireRole('Assortment approver'); requireNote();
      if (mandatoryBlockers(record).length || record.decisions.category !== 'Approved' || record.decisions.compliance !== 'Approved') throw new Error('Assortment blocked: obtain all mandatory evidence verification and distinct category AND compliance approvals. Urgency cannot override this gate.');
      record.decisions.assortment = 'Approved';
      break;
    case 'readiness': {
      const item = record.readiness[payload.key];
      if (!item) throw new Error('Unknown readiness item.');
      requireRole(item.owner); requireNote();
      item.status = payload.ready ? 'Ready' : 'Pending'; item.note = payload.note;
      record.decisions.launch = 'No-go';
      break;
    }
    case 'exception': {
      requireRole('Assortment approver'); requireNote();
      const item = record.readiness[payload.key];
      if (!item || item.mandatory) throw new Error('Mandatory evidence and mandatory readiness blockers cannot be excepted.');
      if (!text(payload.expiry) || payload.expiry < asOf || !text(payload.condition) || !text(payload.escalation) || !Array.isArray(payload.channels) || !payload.channels.includes(item.channel)) throw new Error('Exception requires a current/future expiry, condition, escalation owner and all affected channels.');
      record.exceptions.filter(exception => exception.key === payload.key).forEach(exception => { exception.status = 'Superseded'; });
      record.exceptions.push({ id: `EX-${record.exceptions.length + 1}`, key: payload.key, owner: role, rationale: payload.note, expiry: payload.expiry, condition: payload.condition, escalation: payload.escalation, channels: payload.channels, status: 'Active' });
      record.decisions.launch = 'No-go';
      break;
    }
    case 'go':
      requireRole('Assortment approver'); requireNote();
      if (launchBlockers(record, asOf).length) throw new Error('Launch no-go: resolve the listed launch blockers. Assortment approval alone is insufficient.');
      record.decisions.launch = 'Go';
      break;
    case 'nogo':
      requireRole('Assortment approver'); requireNote(); record.decisions.launch = 'No-go'; break;
    case 'escalate':
    case 'contest':
      requireNote();
      record.questions.push({ action, note: payload.note, owner: action === 'contest' ? 'Compliance owner' : 'Operations lead', due: asOf, status: 'Open - named human resolution required' });
      break;
    default: throw new Error('Unknown action.');
  }
  log(record, role, action, payload.note || record.intake, asOf);
  return record;
}
function refreshGates(records, asOf) {
  for (const record of records) if (record.decisions.launch === 'Go' && launchBlockers(record, asOf).length) {
    record.decisions.launch = 'No-go';
    log(record, 'Operations lead', 'gateRecheck', 'Launch revoked because a gate or exception is no longer satisfied.', asOf);
  }
}
module.exports = { ROLES, AS_OF, seed, daysUntil, mandatoryBlockers, priority, activeException, launchBlockers, act, refreshGates };
; return module.exports; })();
'use strict';
const V2 = PROTOTYPE_VERSION === 'v2';
let records = Domain.seed();
let selected = records[0].id;
let viewId = 'V06';
let role = 'Operations lead';
let asOf = Domain.AS_OF;
let filter = 'All categories';
const views = [['V01', 'Supplier checklist'], ['V02', 'Clarification'], ['V03', 'Category review'], ['V04', 'Compliance evidence'], ['V05', 'Approval & launch'], ['V06', 'Portfolio']];
const $ = id => document.getElementById(id);
const esc = value => String(value ?? '').replace(/[&<>"']/g, char => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char]));
const current = () => records.find(record => record.id === selected);
const can = (...roles) => roles.includes(role);
const disabled = allowed => allowed ? '' : ' disabled';
const badge = value => `<span class="badge">${esc(value)}</span>`;
const options = (values, chosen) => values.map(value => `<option${value === chosen ? ' selected' : ''}>${esc(value)}</option>`).join('');
const button = (label, action, allowed = true, extra = '') => `<button type="button" data-action="${action}" ${extra}${disabled(allowed)}>${esc(label)}</button>`;
function notify(message) { $('notice').textContent = message; }
function hint(owners) { return `<p class="muted">Action owner: ${esc(owners)}. Switch the demo role above to exercise their decisions.</p>`; }
function heading(record, title, trace) {
  return `<div class="eyebrow">${esc(record.id)} / ${esc(record.category)} / ${trace}</div><h2>${title}</h2><p>${esc(record.product)} &middot; ${esc(record.supplier)} &middot; requested launch <strong>${esc(record.launch)}</strong></p>`;
}
function audit(record) {
  return `<details><summary>Decision trail (${record.audit.length}) and named follow-up (${record.questions.length})</summary><div class="audit">${record.audit.length ? record.audit.slice().reverse().map(item => `<div class="step"><strong>${esc(item.action)}</strong> / ${esc(item.role)} / revision ${item.revision}<br><small>Business date ${esc(item.asOf)} &middot; click timestamp ${esc(item.timestamp)}</small><p>${esc(item.detail)}</p></div>`).join('') : '<p>No actions taken in this session.</p>'}${record.questions.map(item => `<div class="step"><strong>${esc(item.action)} &rarr; ${esc(item.owner)}</strong><p>${esc(item.note)}</p>${badge(item.status)}</div>`).join('')}</div></details>`;
}
function render() {
  Domain.refreshGates(records, asOf);
  $('role').innerHTML = options(Domain.ROLES, role);
  $('cases').innerHTML = `<h2>Sample submissions</h2><p class="muted">4 fixtures, not the full portfolio.</p>${records.map(record => `<button type="button" class="case${record.id === selected ? ' selected' : ''}" data-case="${record.id}" aria-pressed="${record.id === selected}"><span class="id">${record.id}</span><strong>${esc(record.product)}</strong><small>${esc(record.supplier)}</small><small>${record.initialCompleteness}% initial completeness &middot; ${Domain.mandatoryBlockers(record).length} live evidence blockers</small></button>`).join('')}`;
  $('nav').innerHTML = views.map(([id, name]) => `<button data-view="${id}"${id === viewId ? ' aria-current="page"' : ''}>${id.slice(1)} ${name}</button>`).join('');
  const record = current();
  const renderers = { V01: intake, V02: clarification, V03: categoryReview, V04: compliance, V05: approval, V06: portfolio };
  $('view').innerHTML = renderers[viewId](record);
}
function intake(record) {
  const supplied = record.evidence.filter(item => item.status !== 'missing').length;
  return heading(record, 'Make the next submission easier', 'FR01-03 / US01-03 / D02') +
    `<div class="grid"><section class="card"><h3>Minimum viable intake</h3><p>Save and submit for triage before everything is complete. Mandatory standards still apply before approval.</p>
    <label class="field">Product name *<input id="product" value="${esc(record.product)}" maxlength="160"></label>
    <label class="field">Category / rule pack<input value="${esc(record.category)}" readonly></label>
    <p class="muted">The category is fixed for each fixture. A real category change must reload its rules and revoke dependent approvals.</p>
    <label class="field">Ingredients or explicit not-applicable reason *<textarea id="ingredients" maxlength="1600">${esc(record.fields.ingredients)}</textarea></label>
    <label class="field">Carton dimensions (supplier provided)<input id="dimensions" value="${esc(record.fields.dimensions)}" placeholder="Length x width x height, with units"></label>
    <div class="actions">${button('Save draft', 'save', can('Supplier contact', 'Coordinator'))}${button('Submit for triage', 'submit', can('Supplier contact', 'Coordinator'))}</div>${hint('Supplier contact or Coordinator')}${badge(record.intake)}<p class="muted">Editing product information revokes evidence verification and all approvals. Revision ${record.revision}.</p></section>
    <section class="card"><h3>Category-specific evidence checklist</h3><p><strong>${record.initialCompleteness}%</strong> initial completeness from the source exercise; this is a historical fixture, not a recalculated score.</p><div class="progress"><span style="width:${record.initialCompleteness}%"></span></div><p>Live evidence presence: <strong>${supplied}/${record.evidence.length}</strong>. Verified: <strong>${record.evidence.filter(item => item.status === 'verified').length}/${record.evidence.length}</strong>.</p>
    ${record.evidence.map(item => `<div class="gate"><div><strong>${esc(item.name)} *</strong><small>${esc(item.owner)}</small></div>${badge(item.status === 'provided' ? 'Supplier provided' : item.status)}</div>`).join('')}
    <p>* Mandatory under illustrative category rules. Presence does not mean specialist verification.</p><button data-view="V02">Resolve gaps and conflicts &rarr;</button>
    <details open><summary>Accessible guidance and assisted support</summary><p>Use plain text, not a complex template. Describe the item, source, units and category. Ask the coordinator to transcribe or explain a request. Supplier size, language and unfamiliar format do not reduce queue priority.</p>
    <label class="field">Support preference<select id="supportMode">${options(['Plain-language explanation', 'Assisted submission', 'Accessible format', 'Language support'], '')}</select></label>
    <label class="field">What support would help?<textarea id="supportNote" placeholder="Do not enter real personal or confidential information."></textarea></label>
    ${button('Request assisted support', 'support', can('Supplier contact', 'Coordinator'))}<p class="muted">Demo request stays in this tab. No message is sent. ${record.support.length} request(s) recorded.</p>
    ${record.support.map(item => `<div class="step">${esc(item.mode)} &rarr; ${esc(item.owner)}: ${esc(item.note)} (${esc(item.status)})</div>`).join('')}</details></section></div>${audit(record)}`;
}
function clarification(record) {
  const blockers = Domain.mandatoryBlockers(record);
  return heading(record, V2 ? 'One coordinated correction round' : 'Completeness and correction request', 'FR02 / US02 / D02') +
    `<section class="card"><h3>Readiness by section</h3><div class="table-scroll"><table><thead><tr><th>Section / item</th><th>Status / conflicting value</th><th>Requested correction</th><th>Review owner</th></tr></thead><tbody>${record.evidence.map(item => `<tr><td>${esc(item.name)}</td><td>${badge(item.status)}<p>${esc(item.conflict || (item.status === 'missing' ? 'Not supplied' : item.text))}</p></td><td>${item.status === 'verified' ? 'None for this version' : 'Provide a source-linked, internally consistent revision; then obtain named human verification.'}</td><td>${esc(item.owner)}</td></tr>`).join('')}</tbody></table></div></section>
    <div class="grid"><section class="card"><h3>${V2 ? 'Consolidated request preview' : 'Correction request preview'}</h3><p>${V2 ? 'D02: a coordinator owns one open round. All current evidence gaps are attached to reduce repeated requests.' : 'Baseline: record a missing-information request and its due date.'}</p>
    <label class="field">Requested correction<textarea id="requestNote">${esc(blockers.length ? `Please address these items in one response: ${blockers.map(item => item.name).join('; ')}. Include source references and corrected values.` : 'Please confirm any outstanding category or channel review questions.')}</textarea></label>
    <label class="field">Response due date<input id="requestDue" type="date" value="${asOf}"></label>
    ${button(V2 ? 'Record consolidated request' : 'Record correction request', 'request', can('Coordinator', 'Compliance owner', 'Category manager'))}<p class="muted">Local record only; no supplier message is sent. The request is visible before recording.</p>
    ${record.requests.map(request => `<div class="step"><strong>${request.id} &middot; due ${esc(request.due)}</strong><p>${esc(request.note)}</p><small>Owner: ${esc(request.owner)} / ${esc(request.status)}</small><p>Response: ${esc(request.response || 'Awaiting supplier')}</p></div>`).join('')}
    <label class="field">Supplier response<textarea id="responseNote" placeholder="Explain corrections and reference the mock evidence revisions."></textarea></label>${button('Respond and resubmit', 'respond', can('Supplier contact', 'Coordinator'))}</section>
    <section class="card"><h3>Provide revised mock evidence</h3><p>This substitutes for an upload in the exercise. Nothing is uploaded or sent. Revised content remains supplier provided until a named specialist verifies it.</p>
    <label class="field">Evidence item<select id="provideId">${record.evidence.map(item => `<option value="${item.id}">${esc(item.name)}</option>`).join('')}</select></label>
    <label class="field">Source reference<input id="provideSource" placeholder="e.g. Supplier allergen declaration, revision 2" maxlength="240"></label>
    <label class="field">Corrected evidence / response<textarea id="provideNote" placeholder="Describe the revised mock evidence. Do not use real supplier data."></textarea></label>
    ${button('Attach mock revision', 'provide', can('Supplier contact', 'Coordinator'))}
    <div class="warn">A revision clears the old conflict flag only for re-review; it does not verify the claim. All dependent approvals are revoked.</div><button data-view="V04">Open specialist review &rarr;</button></section></div>${audit(record)}`;
}
function categoryReview(record) {
  const priority = Domain.priority(record, asOf);
  return heading(record, 'Focus the human assortment decision', 'FR04-05 / US04-05 / D01,D05') +
    `<div class="grid"><section class="card"><h3>Product and assortment context</h3>
    <div class="step"><strong>Customer need</strong><p>${esc(record.customerNeed)}</p></div><div class="step"><strong>Assortment comparison</strong><p>${esc(record.comparison)}</p></div>
    <div class="step"><strong>Commercial facts / assumptions</strong><p>${esc(record.commercial)}</p></div>
    <p><strong>Review age:</strong> ${record.age} days${record.id === 'ONB-8104' ? ' (source: category review pending six days)' : ' (illustrative)'}. <strong>Requested launch:</strong> ${esc(record.launch)}.</p>
    <p>${Domain.mandatoryBlockers(record).length} live mandatory evidence blocker(s). No commercial urgency overrides final assortment controls.</p>
    <label class="field">Question, recommendation or decision rationale<textarea id="categoryNote" placeholder="Document assortment fit and any conditions."></textarea></label>
    <div class="actions">${button('Ask a question', 'question', can('Category manager'))}${button('Recommend', 'recommend', can('Category manager'))}${button('Return for changes', 'return', can('Category manager'))}${button('Approve category fit', 'approveCategory', can('Category manager'))}</div>${hint('Category manager')}${badge('Category: ' + record.decisions.category)}</section>
    <section class="card"><h3>Priority explanation</h3><p class="eyebrow">Deterministic AI stand-in / not a predictive model</p><p><strong>Illustrative score ${priority.score}</strong></p><p>${esc(priority.reason)}</p>
    <p>Rule weights: mandatory review +40; launch within 21 days +30; age up to +20; nearly ready and aged five days +25. These proposed weights require D05 ratification.</p>
    <div class="warn">A high score means review sooner, not approve sooner. Supplier size, formatting and inferred quality are not ranking inputs.</div>
    ${V2 ? '<p><strong>D03 proposed:</strong> prototype all categories; implementation pilot Packaged Food. Seasonal Home and Personal Care are gated expansions. Escalate urgent out-of-pilot demand.</p>' : '<p>Initial scope is a bounded prototype across the three source categories. Implementation prioritization is still open.</p>'}
    <label class="field">Contest or correct this priority<textarea id="contestNote" placeholder="Explain incorrect facts or an unintended burden."></textarea></label>${button('Record contest', 'contest')}<p class="muted">Named human owner: Compliance owner; operational routing can be adjusted at review.</p></section></div>${audit(record)}`;
}
function compliance(record) {
  return heading(record, 'Verify the evidence, not the AI summary', 'FR06-07,FR12 / US06-07,US12 / D06') +
    `<section class="card"><h3>Evidence register</h3><p>All items below are mandatory under illustrative policies. Source dates and content are demo assumptions. The responsible owner must verify the exact version; category and compliance approvals remain separate.</p>
    ${record.evidence.map(item => `<article class="evidence-item"><div class="headrow"><h3>${esc(item.name)}</h3>${badge(item.status === 'provided' ? 'Supplier provided - unverified' : item.status)}</div>
    <p class="evidence-meta">Owner: ${esc(item.owner)} &middot; source: ${esc(item.source)} &middot; date: ${esc(item.date || 'Unknown')} &middot; version ${item.version}</p>
    <p><strong>Supplied information:</strong> ${esc(item.text || 'Missing - do not infer or fabricate evidence.')}</p>
    ${item.conflict ? `<div class="warn"><strong>Conflict:</strong> ${esc(item.conflict)}</div>` : ''}
    <p><strong>Uncertainty:</strong> ${esc(item.uncertainty)}</p><p><strong>Specialist note:</strong> ${esc(item.note || 'Not reviewed')}</p>
    <label class="field">Named specialist rationale<textarea id="note-${item.id}" placeholder="Record why the exact source version satisfies the rule, or request/reject it."></textarea></label>
    <div class="actions">${button('Verify this version', 'verify', can(item.owner), `data-evidence="${item.id}"`)}${button('Reject evidence', 'rejectEvidence', can(item.owner), `data-evidence="${item.id}"`)}${button('Request more', 'moreEvidence', can(item.owner), `data-evidence="${item.id}"`)}</div></article>`).join('')}
    <div class="warn">No real model is used. A production assistant must cite evidence, preserve uncertainty, treat supplier documents as untrusted input, and never make approval decisions. Changing evidence revokes earlier approvals.</div>
    <label class="field">Compliance decision rationale<textarea id="complianceNote"></textarea></label>${button('Approve compliance review', 'approveCompliance', can('Compliance owner'))}${hint('Compliance owner')}${badge('Compliance: ' + record.decisions.compliance)}</section>
    <section class="card"><h3>Contest or escalate a claim</h3><label class="field">What needs human resolution?<textarea id="contestNote"></textarea></label><div class="actions">${button('Record contest', 'contest')}${button('Escalate to operations', 'escalate')}</div></section>${audit(record)}`;
}
function approval(record) {
  const blockers = Domain.launchBlockers(record, asOf);
  return heading(record, 'Approved is not the same as launch-ready', 'FR08-10 / US08-10 / D01,D04') +
    `<div class="grid"><section class="card"><h3>Independent decision gates</h3>
    ${[['category', '1. Category fit', 'Category manager'], ['compliance', '2. Mandatory evidence', 'Compliance owner'], ['assortment', '3. Assortment decision', 'Assortment approver'], ['launch', '4. Launch go / no-go', 'Assortment approver']].map(([key, name, owner]) => `<div class="gate"><div><strong>${name}</strong><small>${owner}</small></div>${badge(record.decisions[key])}</div>`).join('')}
    <div class="warn">${blockers.length ? `<strong>Launch blocked:</strong> ${blockers.map(esc).join('; ')}.` : '<strong>All gates satisfied.</strong> An authorized owner can now record launch go.'}</div>
    <label class="field">Decision rationale / conditions<textarea id="approvalNote" placeholder="Document the human decision; urgency is not a compliance exception."></textarea></label>
    <div class="actions">${button('Approve assortment', 'approveAssortment', can('Assortment approver'))}${button('Record launch go', 'go', can('Assortment approver'))}${button('Record no-go', 'nogo', can('Assortment approver'))}${button('Escalate blocker', 'escalate')}</div>${hint('Assortment approver; escalation available to all roles')}</section>
    <section class="card"><h3>Readiness and handoff</h3><p>Owner: ${esc(record.handoff.owner)} &middot; review due ${esc(record.handoff.due)}. ${esc(record.handoff.note)}</p>
    ${Object.entries(record.readiness).map(([key, item]) => `<div class="gate"><div><strong>${esc(item.label)}</strong><small>${esc(item.owner)} / ${esc(item.channel)} / ${item.mandatory ? 'Mandatory' : 'Non-mandatory'}</small><br>${badge(item.status)} ${Domain.activeException(record, key, asOf) ? badge('Active controlled exception') : ''}</div><div>${button(item.status === 'Ready' ? 'Reopen' : 'Mark ready', 'readiness', can(item.owner), `data-key="${key}"`)}</div></div>`).join('')}
    <label class="field">Readiness confirmation note<textarea id="readinessNote" placeholder="Describe the confirmation or unresolved issue before changing status."></textarea></label></section></div>
    <section class="card" style="margin-top:20px"><h3>Controlled exception - never mandatory evidence</h3><p>Only additional lifestyle imagery is exceptable in this demo. Missing allergens, claim conflicts, safety and mandatory packaging are never waivable. All exception fields are required.</p>
    <div class="grid"><div><label class="field">Affected item<select id="exceptionKey"><option value="imagery">Additional lifestyle image (non-mandatory)</option><option value="packaging">Packaging (mandatory - request will be refused)</option><option value="evidence">Mandatory evidence (request will be refused)</option></select></label>
    <label class="field">Rationale<textarea id="exceptionNote"></textarea></label><label class="field">Expiry date<input id="exceptionExpiry" type="date"></label></div>
    <div><label class="field">Condition / remedy<textarea id="exceptionCondition" placeholder="e.g. Complete additional image by the expiry date; primary image remains mandatory."></textarea></label>
    <label class="field">Affected channel<select id="exceptionChannel">${options(['Digital', 'Store'], 'Digital')}</select></label>
    <label class="field">Escalation owner<input id="exceptionEscalation" placeholder="Operations lead"></label></div></div>
    ${button('Authorize bounded exception', 'exception', can('Assortment approver'))}${hint('Assortment approver')}
    ${record.exceptions.map(exception => `<div class="step"><strong>${exception.id} / ${esc(exception.owner)}</strong> &middot; expiry ${esc(exception.expiry)} / ${esc(exception.channels.join(', '))}<p>${esc(exception.rationale)}. Condition: ${esc(exception.condition)}. Escalate: ${esc(exception.escalation)}.</p>${badge(exception.status === 'Superseded' ? 'Superseded' : exception.expiry < asOf ? 'Expired - no longer clears blocker' : 'Active')}</div>`).join('')}
    <p class="muted">${V2 ? 'V2 D04: expiry is rechecked when the demo date changes. An expired exception automatically revokes a recorded launch go.' : 'V1 baseline: record a bounded non-mandatory exception with ownership and escalation.'}</p></section>${audit(record)}`;
}
function portfolio() {
  const list = records.filter(record => filter === 'All categories' || record.category === filter).sort((a, b) => Domain.priority(b, asOf).score - Domain.priority(a, asOf).score);
  const blocked = list.filter(record => Domain.launchBlockers(record, asOf).length).length;
  const near = list.filter(record => Domain.daysUntil(record.launch, asOf) >= 0 && Domain.daysUntil(record.launch, asOf) <= 21).length;
  return `<div class="eyebrow">V06 / FR04,FR11 / US04,US11 / D05,D07</div><h2>A portfolio of decisions, not just percentages</h2><p class="muted">Prioritize human review, expose owners and protect mandatory controls.</p>
    ${V2 ? '<div class="card"><div class="eyebrow">V2 response to the three customer changes</div><div class="grid"><div><strong>CR01 / D01,D04,D06</strong><p>Independent approvals, non-waivable evidence, named escalation and version-sensitive decisions.</p><strong>CR02 / D02,D05</strong><p>Minimum viable intake, one open correction round, accessible assistance and fair queue rules.</p></div><div><strong>CR03 / D03</strong><p>Recommend Packaged Food pilot, then gated Seasonal Home and Personal Care. All three remain visible in this prototype. Seasonal dates are requests, not delivery commitments.</p><span class="badge">Customer ratification pending</span></div></div></div>' : '<div class="card"><strong>V1 baseline</strong><p>Demonstrate the six required views and four source cases before discussing customer changes. Scope and detailed request coordination are still open for workshop decisions.</p></div>'}
    <div class="metrics"><div class="metric"><strong>${list.length}</strong><span>Filtered mock submissions</span></div><div class="metric"><strong>${blocked}</strong><span>With live launch blockers</span></div><div class="metric"><strong>${near}</strong><span>Requested launch in 0-21 days</span></div><div class="metric"><strong>${list.reduce((sum, record) => sum + record.requests.length, 0)}</strong><span>Correction rounds in this session</span></div></div>
    <section class="card"><div class="headrow"><h3>Review worklist</h3><label>Category <select id="categoryFilter">${options(['All categories', 'Packaged Food', 'Personal Care', 'Seasonal Home'], filter)}</select></label></div>
    <div class="table-scroll"><table><thead><tr><th>Submission / supplier</th><th>Readiness &amp; workload</th><th>Priority / launch</th><th>Blocker &amp; owner</th><th>Action</th></tr></thead><tbody>${list.map(record => {
      const priority = Domain.priority(record, asOf);
      const blockers = Domain.mandatoryBlockers(record);
      return `<tr><td><strong>${esc(record.product)}</strong><br>${record.id}<br><small>${esc(record.supplier)} / ${esc(record.category)}</small></td><td>${record.initialCompleteness}% initial completeness<br>${record.age} days in review<br>${record.effort.toFixed(1)}h supplier effort (illustrative)<br>${badge(record.decisions.assortment)}</td><td>Score ${priority.score}<br>${record.launch}<br>${priority.days} days away</td><td>${blockers.length ? blockers.map(item => `${esc(item.name)} (${esc(item.status)}) &rarr; ${esc(item.owner)}`).join('<br>') : 'Evidence verified; category/channel review still required'}</td><td><button data-drill="${record.id}">Review</button><details><summary>Why this rank?</summary>${esc(priority.reason)}</details></td></tr>`;
    }).join('')}</tbody></table></div><p class="muted">Live counts are calculated only from these four fixtures. Record ages are illustrative except the six-day category review for ONB-8104. Source metric totals below describe a different, broader fictional portfolio.</p></section>
    <div class="grid"><section class="card"><h3>Source portfolio - illustrative baselines</h3><div class="gate"><span>Monthly submissions</span><strong>260</strong></div><div class="gate"><span>Packaged Food / Personal Care / Seasonal Home</span><strong>110 / 85 / 65</strong></div><div class="gate"><span>Complete at first review</span><strong>59%</strong></div><div class="gate"><span>Average clarification cycles</span><strong>2.7</strong></div><div class="gate"><span>Median decision time</span><strong>18 business days</strong></div><div class="gate"><span>Mandatory evidence present at first review</span><strong>68%</strong></div><div class="gate"><span>Category manager open workload (average)</span><strong>46</strong></div><div class="gate"><span>Launches in 8 weeks / within 3 weeks</span><strong>74 / 19</strong></div><div class="gate"><span>Within 3 weeks with unresolved blockers</span><strong>11 of 19</strong></div><p>Presence at first review is not verification before approval. Approval control: all mandatory evidence verified.</p></section>
    <section class="card"><h3>Proposed pilot hypotheses</h3><p>75% first-review completeness; no more than 2.0 clarification rounds; median decision time at most 14 business days; supplier effort at most 3 hours.</p><div class="warn">Targets are proposals for D07, not committed benefits. Baselines, cohort definitions and observation windows require customer validation.</div><h3>Category load in these fixtures</h3>${['Packaged Food', 'Personal Care', 'Seasonal Home'].map(category => `<div class="gate"><span>${category}</span><strong>${records.filter(record => record.category === category).length}</strong></div>`).join('')}<h3 style="margin-top:20px">Operating boundaries</h3><p>AI may guide, summarize and prioritize. Humans verify, approve, return, contest and escalate. Manual review remains the fallback.</p><a href="delivery-control-workbook.xlsx">Open backlog, KPI definitions and readiness gates</a></section></div>`;
}
const read = id => $(id)?.value || '';
document.addEventListener('click', event => {
  const target = event.target.closest('button');
  if (!target) return;
  if (target.dataset.case) { selected = target.dataset.case; notify(''); render(); return; }
  if (target.dataset.view) { viewId = target.dataset.view; notify(''); render(); return; }
  if (target.dataset.drill) { selected = target.dataset.drill; viewId = 'V03'; notify(''); render(); return; }
  if (!target.dataset.action) return;
  const action = target.dataset.action;
  const record = current();
  let payload = {};
  if (['save', 'submit'].includes(action)) payload = { product: read('product'), ingredients: read('ingredients'), dimensions: read('dimensions') };
  if (action === 'support') payload = { note: read('supportNote'), mode: read('supportMode') };
  if (action === 'request') payload = { note: read('requestNote'), due: read('requestDue'), consolidated: V2 };
  if (action === 'respond') payload = { note: read('responseNote') };
  if (action === 'provide') payload = { id: read('provideId'), note: read('provideNote'), source: read('provideSource') };
  if (['verify', 'rejectEvidence', 'moreEvidence'].includes(action)) payload = { id: target.dataset.evidence, note: read('note-' + target.dataset.evidence) };
  if (['question', 'return', 'recommend', 'approveCategory'].includes(action)) payload = { note: read('categoryNote') };
  if (action === 'approveCompliance') payload = { note: read('complianceNote') };
  if (['approveAssortment', 'go', 'nogo'].includes(action)) payload = { note: read('approvalNote') };
  if (['contest', 'escalate'].includes(action)) payload = { note: read(viewId === 'V05' ? 'approvalNote' : 'contestNote') };
  if (action === 'readiness') payload = { key: target.dataset.key, ready: record.readiness[target.dataset.key].status !== 'Ready', note: read('readinessNote') };
  if (action === 'exception') payload = { key: read('exceptionKey'), note: read('exceptionNote'), expiry: read('exceptionExpiry'), condition: read('exceptionCondition'), channels: [read('exceptionChannel')], escalation: read('exceptionEscalation') };
  try {
    Domain.act(record, role, action, payload, asOf);
    render(); notify(`${action} recorded for ${record.id}. Local simulation only; no external action was taken.`);
  } catch (error) {
    notify(error.message);
  }
});
document.addEventListener('change', event => {
  if (event.target.id === 'role') { role = event.target.value; render(); notify(`Demo role changed to ${role}. This is not production access control.`); }
  if (event.target.id === 'categoryFilter') { filter = event.target.value; render(); }
  if (event.target.id === 'asOf') {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(event.target.value)) { event.target.value = asOf; notify('Choose a valid demo date.'); return; }
    asOf = event.target.value; render(); notify('Business date changed. Launch gates and exception expiry were re-evaluated.');
  }
});
$('theme').addEventListener('click', () => { document.documentElement.dataset.theme = document.documentElement.dataset.theme === 'dark' ? 'light' : 'dark'; });
$('reset').addEventListener('click', () => {
  records = Domain.seed(); selected = records[0].id; asOf = Domain.AS_OF; $('asOf').value = asOf; filter = 'All categories'; render();
  notify('Demo restored to the four original fixtures. Previous tab-only actions were cleared.');
});
$('export').addEventListener('click', () => {
  const blob = new Blob([JSON.stringify({ version: PROTOTYPE_VERSION, asOf, exportedAt: new Date().toISOString(), disclaimer: 'Fictional simulation, not customer acceptance or actual compliance evidence.', records }, null, 2)], { type: 'application/json' });
  const url = URL.createObjectURL(blob); const anchor = document.createElement('a'); anchor.href = url; anchor.download = `onboarding-${PROTOTYPE_VERSION}-session.json`; anchor.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000); notify('Session JSON exported. Retain it as simulated workshop evidence, not business acceptance.');
});
render();

</script>
</body>
</html>


===== FILE: prototype-v2-preview.png =====
===== TYPE: .png (signature 89-50-4E-47-0D-0A-1A-0A) =====
===== IMAGE SUBMISSION: content is not text-extractable by this script =====
===== ACTION: view this image with a multimodal viewer to read the wireframe/diagram. If multimodal viewing is unavailable, mark it Not evidenced and request a text/HTML alternative or an accessible description. =====
IMAGE_PATH: C:\code\AI-First Proposal Judge\WorkShopSubmission\Team A\prototype-v2-preview.png

===== FILE: prototype-v2.html =====
===== TYPE: .html (signature 3C-21-64-6F-63-74-79-70) =====
===== SECTIONS DETECTED: HTML wireframe/markup, 536 lines (cite by line number) =====
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:,">
<title>Contoso | Supplier and Product Onboarding - v2</title>
<script>
  (() => {
    const param = new URLSearchParams(window.location.search).get("scoutTheme");
    const theme =
      param || (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    document.documentElement.setAttribute("data-theme", theme);
  })();
</script>
<style>
:root {
  color-scheme: light;
  --cp-bg: #f7f4ef;
  --cp-bg-elevated: #fcfbf8;
  --cp-surface: #ffffff;
  --cp-surface-soft: #f5f5f5;
  --cp-border: #dedede;
  --cp-border-strong: #919191;
  --cp-text: #242424;
  --cp-text-muted: #5c5c5c;
  --cp-text-soft: #6f6f6f;
  --cp-accent: #b11f4b;
  --cp-accent-hover: #9a1a41;
  --cp-accent-soft: rgba(177, 31, 75, 0.08);
  --cp-accent-fg: #ffffff;
  --cp-success: #16a34a;
  --cp-danger: #dc2626;
  --cp-warning: #f59e0b;
  --cp-link: #0078d4;
  --cp-shadow: 0 18px 48px rgba(0, 0, 0, 0.12);
  --cp-overlay: rgba(255, 255, 255, 0.8);
  --cp-panel: rgba(255, 255, 255, 0.86);
  --cp-panel-strong: rgba(255, 255, 255, 0.96);
  --cp-sheen: rgba(255, 255, 255, 0.55);
  --cp-highlight: rgba(177, 31, 75, 0.12);
}
html[data-theme="dark"] {
  color-scheme: dark;
  --cp-bg: #3d3b3a;
  --cp-bg-elevated: #343231;
  --cp-surface: #292929;
  --cp-surface-soft: #2e2e2e;
  --cp-border: #474747;
  --cp-border-strong: #5f5f5f;
  --cp-text: #dedede;
  --cp-text-muted: #919191;
  --cp-text-soft: #b0b0b0;
  --cp-accent: #fd8ea1;
  --cp-accent-hover: #fb7b91;
  --cp-accent-soft: rgba(253, 142, 161, 0.14);
  --cp-accent-fg: #1a1a1a;
  --cp-success: #4ade80;
  --cp-danger: #f87171;
  --cp-warning: #fbbf24;
  --cp-link: #4da6ff;
  --cp-shadow: 0 18px 48px rgba(0, 0, 0, 0.32);
  --cp-overlay: rgba(41, 41, 41, 0.88);
  --cp-panel: rgba(41, 41, 41, 0.72);
  --cp-panel-strong: rgba(41, 41, 41, 0.96);
  --cp-sheen: rgba(255, 255, 255, 0.04);
  --cp-highlight: rgba(253, 142, 161, 0.12);
}
*{box-sizing:border-box}
body{margin:0;background:var(--cp-bg);color:var(--cp-text);font:16px/1.55 "Segoe UI",Aptos,Calibri,-apple-system,BlinkMacSystemFont,sans-serif}
a{color:var(--cp-link)}
button,input,select,textarea{font:inherit;border:1px solid var(--cp-border-strong);border-radius:.625rem;padding:9px 12px;background:var(--cp-surface);color:var(--cp-text)}
button{cursor:pointer;font-weight:600}
button:hover{background:var(--cp-accent-soft);border-color:var(--cp-accent)}
button:disabled{cursor:not-allowed;color:var(--cp-text-muted);opacity:.65}
button.primary{background:var(--cp-accent);color:var(--cp-accent-fg);border-color:var(--cp-accent)}
button:focus-visible,a:focus-visible,input:focus-visible,select:focus-visible,textarea:focus-visible,summary:focus-visible{outline:3px solid var(--cp-accent);outline-offset:3px}
input,select,textarea{max-width:100%}textarea{min-height:88px;resize:vertical;width:100%}
h1{font-size:32px;line-height:1.15;letter-spacing:-1px;margin:8px 0 12px}h2{font-size:24px;line-height:1.25;margin:0 0 12px}h3{font-size:18px;margin:0 0 12px}
p{margin:8px 0 16px}small,.muted{color:var(--cp-text-muted)}.eyebrow{font-size:12px;text-transform:uppercase;letter-spacing:2px;font-weight:700;color:var(--cp-accent)}
.skip{position:absolute;left:-10000px}.skip:focus{left:16px;top:8px;background:var(--cp-surface);z-index:4}
header{padding:24px 32px 20px;background:var(--cp-surface);border-bottom:1px solid var(--cp-border)}
.headrow,.toolbar,.actions{display:flex;gap:12px;align-items:center;flex-wrap:wrap}.headrow{justify-content:space-between}.headrow p{max-width:820px}
.disclaimer{padding:12px 32px;background:var(--cp-accent-soft);border-bottom:1px solid var(--cp-border);font-size:13px}
.toolbar{padding:16px 32px;background:var(--cp-bg-elevated)}.toolbar label{font-size:13px;font-weight:600}.toolbar label select,.toolbar label input{display:block;margin-top:4px}
.toolbar .spacer{flex:1}.layout{display:grid;grid-template-columns:272px minmax(0,1fr);max-width:1640px;margin:auto}
aside{padding:24px 16px;border-right:1px solid var(--cp-border)}
.case{display:block;width:100%;text-align:left;padding:16px;margin-bottom:12px;background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px;font-weight:400}
.case.selected{border:2px solid var(--cp-accent);background:var(--cp-accent-soft)}
.case strong,.case small{display:block}.case strong{margin:4px 0}.case small{font-size:12px}.case .id{font:12px Consolas,"Courier New",Courier,monospace;color:var(--cp-accent)}
main{min-width:0;padding:24px 28px 56px}
nav{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:24px}nav button{font-size:13px}nav button[aria-current="page"]{background:var(--cp-accent);color:var(--cp-accent-fg)}
.card{background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px;padding:24px;margin-bottom:20px}
.grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:20px}.grid .card{margin-bottom:0}.metrics{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:12px;margin:20px 0}
.metric{padding:20px;background:var(--cp-surface);border:1px solid var(--cp-border);border-radius:16px}.metric strong{font-size:32px;display:block;line-height:1.3;color:var(--cp-accent)}.metric span{font-size:12px;color:var(--cp-text-muted)}
.badge{display:inline-block;padding:3px 9px;border:1px solid var(--cp-border);border-radius:8px;font-size:12px;background:var(--cp-surface-soft)}
.warn{border-left:4px solid var(--cp-warning);padding:12px 16px;background:var(--cp-surface-soft);margin:12px 0}
.good{color:var(--cp-success)}.bad{color:var(--cp-danger)}.full{grid-column:1/-1}
.field{display:block;margin:12px 0;font-size:14px;font-weight:600}.field input,.field select,.field textarea{display:block;width:100%;margin-top:6px;font-weight:400}
.progress{height:8px;background:var(--cp-border);border-radius:8px;overflow:hidden;margin:8px 0}.progress span{display:block;height:100%;background:var(--cp-accent)}
.table-scroll{overflow:auto}table{width:100%;border-collapse:collapse;text-align:left;font-size:14px}th,td{padding:12px 10px;border-bottom:1px solid var(--cp-border);vertical-align:top}th{background:var(--cp-surface-soft);font-weight:600}td .actions{gap:6px}td button{font-size:12px;padding:6px 8px}
.gate{display:flex;justify-content:space-between;gap:16px;padding:14px 0;border-bottom:1px solid var(--cp-border)}.gate strong{display:block}
#notice{margin:0 0 16px;min-height:0}#notice:not(:empty){padding:14px 16px;border:1px solid var(--cp-accent);border-radius:10px;background:var(--cp-accent-soft)}
.evidence-item{border-top:1px solid var(--cp-border);padding:20px 0}.evidence-item:first-of-type{border-top:0}.evidence-meta{font-size:13px;color:var(--cp-text-muted)}
details{margin:12px 0}summary{cursor:pointer;font-weight:600}.audit{max-height:320px;overflow:auto}.step{padding:12px;background:var(--cp-surface-soft);border-radius:10px;margin:8px 0}
footer{padding:24px 32px;border-top:1px solid var(--cp-border);font-size:12px;color:var(--cp-text-muted)}
@media(max-width:1050px){.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}.grid{grid-template-columns:1fr}.layout{grid-template-columns:240px minmax(0,1fr)}main{padding:20px}}
@media(max-width:760px){.layout{display:block}aside{border-right:0;display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:8px;padding:16px}aside h2,aside p{grid-column:1/-1}.case{margin:0}.toolbar,header,.disclaimer{padding-left:16px;padding-right:16px}h1{font-size:26px}.card{padding:16px}main{padding:16px}.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}}
@media print{.toolbar,aside,nav,button,.disclaimer{display:none}.layout{display:block}main{padding:0}.card{break-inside:avoid}body{font-size:11pt}header{padding:12px}}
</style>
</head>
<body>
<a class="skip" href="#content">Skip to main content</a>
<header><div class="headrow"><div><div class="eyebrow">Contoso Retail / Delivery immersion / v2</div><h1>Supplier &amp; Product Onboarding</h1><p class="muted">From incomplete submission to a reviewable product. Every approval has an owner. Every launch has a gate.</p></div><a href="index.html">Delivery pack &rarr;</a></div></header>
<div class="disclaimer"><strong>Fictional exercise. Local simulation only.</strong> No live AI, supplier messages, uploads or integrations. Roles are demo controls, not authentication. Customer validation and policy approval are pending. Changes are held in this tab; export the session to retain a record.</div>
<section class="toolbar" aria-label="Demo controls">
<label>Act as (demo role)<select id="role"></select></label>
<label>Demo business date<input id="asOf" type="date" value="2026-09-07"></label>
<div class="spacer"></div><button id="export">Export session JSON</button><button id="reset">Reset demo</button><button id="theme">Toggle theme</button>
</section>
<div class="layout"><aside id="cases" aria-label="Sample submissions"></aside><main id="content" tabindex="-1"><nav id="nav" aria-label="Onboarding views"></nav><div id="notice" role="status" aria-live="polite"></div><div id="view"></div></main></div>
<footer>Source: contoso-retail-delivery-challenge.html, Scenario 05. Original four case facts preserved. Added record ages (except ONB-8104), commercial values, channels, evidence dates and policy examples are illustrative. Completeness is not compliance or launch approval. <a href="source-context.txt">Source context</a> &middot; <a href="prototype-v1.html">Open v1</a></footer>
<script>
const PROTOTYPE_VERSION = 'v2';
const Domain = (() => { const module = { exports: {} }; 'use strict';

const ROLES = ['Supplier contact', 'Coordinator', 'Category manager', 'Compliance owner', 'Channel owner', 'Assortment approver', 'Operations lead'];
const AS_OF = '2026-09-07';
const evidence = (id, name, owner, status, text, source, conflict = '') => ({
  id, name, owner, status, text, source, conflict, version: 1,
  date: status === 'missing' ? '' : '2026-09-04',
  note: status === 'verified' ? 'Illustrative prior specialist verification; not real evidence.' : '',
  uncertainty: status === 'missing' ? 'No evidence supplied' : 'Mock content; source and policy must be validated'
});
const common = () => ({
  intake: 'Submitted for review', revision: 1, support: [], questions: [], requests: [], audit: [],
  decisions: { category: 'Pending', compliance: 'Pending', assortment: 'Pending', launch: 'No-go' },
  exceptions: [],
  readiness: {
    content: { label: 'Primary channel content', status: 'Pending', owner: 'Channel owner', mandatory: true, channel: 'Digital' },
    packaging: { label: 'Packaging readiness', status: 'Pending', owner: 'Category manager', mandatory: true, channel: 'Both' },
    supply: { label: 'Supply confirmation', status: 'Pending', owner: 'Category manager', mandatory: true, channel: 'Both' },
    store: { label: 'Store handoff', status: 'Pending', owner: 'Channel owner', mandatory: true, channel: 'Store' },
    digital: { label: 'Digital handoff', status: 'Pending', owner: 'Channel owner', mandatory: true, channel: 'Digital' },
    imagery: { label: 'Additional lifestyle image', status: 'Pending', owner: 'Channel owner', mandatory: false, channel: 'Digital' }
  },
  handoff: { owner: 'Channel owner', due: '2026-09-11', note: 'Illustrative internal review date, not a committed launch.' }
});
function seed() {
  return [
    { ...common(), id: 'ONB-8101', supplier: 'Northstar Foods', product: 'Harvest Trail Granola', category: 'Packaged Food', launch: '2026-10-12', initialCompleteness: 82, age: 9, effort: 4.2,
      customerNeed: 'Convenient breakfast assortment; dietary information must be accurate.', comparison: 'Compare with existing granola range for overlap; buyer decision pending.',
      commercial: 'Illustrative unit cost 2.40; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Oats and seeds; final allergen declaration required', dimensions: '180 x 80 x 240 mm' },
      evidence: [
        evidence('nutrition', 'Nutrition panel', 'Compliance owner', 'provided', 'Nutrition panel supplied; source scenario gives no values.', 'Supplier nutrition panel v1'),
        evidence('allergen', 'Allergen declaration', 'Compliance owner', 'missing', '', 'Not supplied'),
        evidence('ingredients', 'Ingredient specification', 'Compliance owner', 'verified', 'Illustrative ingredient document.', 'Supplier ingredient sheet v1'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'verified', '180 x 80 x 240 mm; illustrative.', 'Supplier packaging sheet v1')
      ] },
    { ...common(), id: 'ONB-8102', supplier: 'Willow & Coast', product: 'CalmLeaf Hand Lotion', category: 'Personal Care', launch: '2026-09-28', initialCompleteness: 91, age: 12, effort: 4.2,
      customerNeed: 'Everyday moisturising care with substantiated customer claims.', comparison: 'Compare equivalent lotion assortment, not supplier size.',
      commercial: 'Illustrative unit cost 3.10; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Supplier ingredient list awaiting specialist confirmation', dimensions: '100 x 60 x 170 mm' },
      evidence: [
        evidence('claim', '48-hour moisture claim', 'Compliance owner', 'conflict', 'Label says 48-hour moisture; supporting evidence wording is inconsistent.', 'Supplier label v1 and claim study v1', 'Source scenario confirms a conflict; the exact conflicting wording was not provided.'),
        evidence('ingredients', 'Ingredient specification', 'Compliance owner', 'provided', 'Mock supplier ingredient list.', 'Supplier ingredient list v1'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'verified', '100 x 60 x 170 mm; illustrative.', 'Supplier packaging sheet v1')
      ] },
    { ...common(), id: 'ONB-8103', supplier: 'Hearthline Goods', product: 'WinterGlow Lantern Set', category: 'Seasonal Home', launch: '2026-10-20', initialCompleteness: 76, age: 8, effort: 4.2,
      customerNeed: 'Seasonal decorative lighting with confirmed battery safety.', comparison: 'Seasonal range gap proposed; safety and pack feasibility require human judgment.',
      commercial: 'Illustrative unit cost 8.20; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Not applicable - non-food', dimensions: '' },
      evidence: [
        evidence('battery', 'Battery safety declaration', 'Compliance owner', 'missing', '', 'Not supplied'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'missing', '', 'Not supplied'),
        evidence('label', 'Product label and safety instructions', 'Compliance owner', 'provided', 'Illustrative label pending specialist review.', 'Supplier label v1')
      ] },
    { ...common(), id: 'ONB-8104', supplier: 'Meadowlane Pantry', product: 'Garden Cup Soup', category: 'Packaged Food', launch: '2026-11-16', initialCompleteness: 100, age: 6, effort: 4.2,
      customerNeed: 'Convenient meal option; fit with current soup range awaits category decision.', comparison: 'Compare portion sizes and range overlap in the category review.',
      commercial: 'Illustrative unit cost 1.80; currency, margin and terms unconfirmed.', owner: 'Category manager', fields: { ingredients: 'Illustrative verified soup specification', dimensions: '120 x 120 x 140 mm' },
      evidence: [
        evidence('nutrition', 'Nutrition panel', 'Compliance owner', 'verified', 'Illustrative approved nutrition panel.', 'Supplier nutrition panel v1'),
        evidence('allergen', 'Allergen declaration', 'Compliance owner', 'verified', 'Illustrative approved allergen declaration.', 'Supplier allergen declaration v1'),
        evidence('dimensions', 'Carton dimensions', 'Category manager', 'verified', '120 x 120 x 140 mm; illustrative.', 'Supplier packaging sheet v1')
      ],
      decisions: { category: 'Pending', compliance: 'Approved', assortment: 'Pending', launch: 'No-go' }
    }
  ];
}
const text = value => typeof value === 'string' && value.trim().length > 0;
const daysUntil = (date, asOf = AS_OF) => Math.round((Date.parse(date + 'T00:00:00Z') - Date.parse(asOf + 'T00:00:00Z')) / 86400000);
const mandatoryBlockers = record => record.evidence.filter(item => item.status !== 'verified');
function priority(record, asOf = AS_OF) {
  const blockers = mandatoryBlockers(record).length;
  const days = daysUntil(record.launch, asOf);
  const score = (blockers ? 40 : 0) + (days <= 21 ? 30 : 0) + Math.min(record.age, 20) + (!blockers && record.age >= 5 ? 25 : 0);
  return { score, days, reason: `${blockers ? 'Mandatory review required' : 'No mandatory evidence blocker'}; ${days} calendar days to requested launch; ${record.age} days in review${!blockers && record.age >= 5 ? '; nearly ready aged item' : ''}. Supplier size and format are excluded.` };
}
function activeException(record, key, asOf = AS_OF) {
  const item = record.readiness[key];
  if (!item || item.mandatory) return null;
  return record.exceptions.find(exception => exception.key === key && exception.status === 'Active' &&
    exception.expiry >= asOf && exception.channels.includes(item.channel) && text(exception.rationale) &&
    text(exception.condition) && text(exception.escalation) && exception.owner === 'Assortment approver') || null;
}
function launchBlockers(record, asOf = AS_OF) {
  const blockers = [];
  if (mandatoryBlockers(record).length) blockers.push('Mandatory evidence not verified');
  for (const gate of ['category', 'compliance', 'assortment']) if (record.decisions[gate] !== 'Approved') blockers.push(`${gate} approval pending`);
  for (const [key, item] of Object.entries(record.readiness)) if (item.status !== 'Ready' && !activeException(record, key, asOf)) blockers.push(item.label);
  return blockers;
}
function invalidate(record, reopenReadiness = false) {
  record.decisions = { category: 'Pending', compliance: 'Pending', assortment: 'Pending', launch: 'No-go' };
  if (reopenReadiness) {
    Object.values(record.readiness).forEach(item => { item.status = 'Pending'; item.note = 'Source information changed; reconfirm this readiness item.'; });
    record.exceptions.forEach(exception => { exception.status = 'Superseded'; });
  }
}
function log(record, role, action, detail, asOf) {
  record.audit.push({ sequence: record.audit.length + 1, asOf, timestamp: new Date().toISOString(), role, action, detail, revision: record.revision });
}
function act(record, role, action, payload = {}, asOf = AS_OF) {
  if (!ROLES.includes(role)) throw new Error('Unknown demo role.');
  const requireRole = (...allowed) => { if (!allowed.includes(role)) throw new Error(`This action requires ${allowed.join(' or ')}.`); };
  const requireNote = () => { if (!text(payload.note)) throw new Error('Enter a meaningful note or rationale before continuing.'); };
  switch (action) {
    case 'save':
    case 'submit':
      requireRole('Supplier contact', 'Coordinator');
      if (!text(payload.product) || !text(payload.ingredients)) throw new Error('Minimum intake needs a product name and ingredients or a stated not-applicable reason.');
      if (record.product !== payload.product.trim() || record.fields.ingredients !== payload.ingredients.trim() || record.fields.dimensions !== (payload.dimensions || '').trim()) {
        record.product = payload.product.trim();
        record.fields = { ingredients: payload.ingredients.trim(), dimensions: (payload.dimensions || '').trim() };
        record.evidence.forEach(item => { if (item.status === 'verified') { item.status = 'provided'; item.note = 'Product data changed: specialist re-verification required.'; } });
        record.revision += 1; invalidate(record, true);
      }
      if (action === 'save') invalidate(record);
      record.intake = action === 'submit' ? 'Submitted for triage; completeness is not approval' : 'Draft saved';
      break;
    case 'support':
      requireRole('Supplier contact', 'Coordinator'); requireNote();
      record.support.push({ note: payload.note, owner: 'Coordinator', status: 'Requested', due: asOf, mode: payload.mode || 'Assisted submission' });
      break;
    case 'request':
      requireRole('Coordinator', 'Compliance owner', 'Category manager'); requireNote();
      if (!text(payload.due) || payload.due < asOf) throw new Error('Choose a correction due date on or after the demo date.');
      if (payload.consolidated && record.requests.some(request => request.status === 'Open')) throw new Error('An open correction round already exists. Add the supplier response or close that round before opening another.');
      record.requests.push({ id: `CLR-${record.requests.length + 1}`, note: payload.note, due: payload.due, owner: 'Coordinator', status: 'Open', response: '', items: mandatoryBlockers(record).map(item => item.id) });
      break;
    case 'respond':
      requireRole('Supplier contact', 'Coordinator'); requireNote();
      if (!record.requests.some(request => request.status === 'Open')) throw new Error('There is no open clarification request to respond to.');
      record.requests.filter(request => request.status === 'Open').forEach(request => { request.response = payload.note; request.status = 'Responded - human review pending'; });
      record.intake = 'Resubmitted for human review';
      break;
    case 'provide': {
      requireRole('Supplier contact', 'Coordinator'); requireNote();
      const item = record.evidence.find(candidate => candidate.id === payload.id);
      if (!item) throw new Error('Evidence item does not exist.');
      if (!text(payload.source)) throw new Error('A source reference is required; do not fabricate a verified source.');
      item.text = payload.note; item.source = payload.source; item.status = 'provided';
      item.conflict = ''; item.version += 1; item.date = asOf;
      item.note = 'Supplier revision received; prior conflict requires named specialist review.';
      item.uncertainty = 'Supplier provided, not yet verified';
      record.revision += 1; invalidate(record, true);
      break;
    }
    case 'verify':
    case 'rejectEvidence':
    case 'moreEvidence': {
      const item = record.evidence.find(candidate => candidate.id === payload.id);
      if (!item) throw new Error('Evidence item does not exist.');
      requireRole(item.owner); requireNote();
      if (action === 'verify' && (!text(item.text) || item.status === 'missing' || item.status === 'conflict' || text(item.conflict) || item.status === 'rejected')) throw new Error('Missing, rejected or conflicting evidence cannot be verified. Obtain a corrected supplier revision first.');
      item.status = action === 'verify' ? 'verified' : action === 'rejectEvidence' ? 'rejected' : 'needs more';
      item.note = payload.note;
      item.uncertainty = action === 'verify' ? 'Demo specialist confirmed this version; not a real compliance judgment' : 'Further supplier information required';
      invalidate(record);
      break;
    }
    case 'question':
    case 'return':
    case 'recommend':
      requireRole('Category manager'); requireNote();
      record.questions.push({ action, note: payload.note, owner: 'Category manager', status: action === 'return' ? 'Supplier response required' : 'Recorded' });
      if (action === 'return') { invalidate(record); record.intake = 'Returned for changes'; }
      break;
    case 'approveCategory':
      requireRole('Category manager'); requireNote();
      if (record.evidence.some(item => item.owner === role && item.status !== 'verified')) throw new Error('Category-owned mandatory evidence must be verified before category approval.');
      if (record.intake === 'Draft saved' || record.intake === 'Returned for changes') throw new Error('Supplier must submit or resubmit the product before approval.');
      record.decisions.category = 'Approved';
      break;
    case 'approveCompliance':
      requireRole('Compliance owner'); requireNote();
      if (record.evidence.some(item => item.owner === role && item.status !== 'verified')) throw new Error('Compliance-owned mandatory evidence must be verified before compliance approval.');
      record.decisions.compliance = 'Approved';
      break;
    case 'approveAssortment':
      requireRole('Assortment approver'); requireNote();
      if (mandatoryBlockers(record).length || record.decisions.category !== 'Approved' || record.decisions.compliance !== 'Approved') throw new Error('Assortment blocked: obtain all mandatory evidence verification and distinct category AND compliance approvals. Urgency cannot override this gate.');
      record.decisions.assortment = 'Approved';
      break;
    case 'readiness': {
      const item = record.readiness[payload.key];
      if (!item) throw new Error('Unknown readiness item.');
      requireRole(item.owner); requireNote();
      item.status = payload.ready ? 'Ready' : 'Pending'; item.note = payload.note;
      record.decisions.launch = 'No-go';
      break;
    }
    case 'exception': {
      requireRole('Assortment approver'); requireNote();
      const item = record.readiness[payload.key];
      if (!item || item.mandatory) throw new Error('Mandatory evidence and mandatory readiness blockers cannot be excepted.');
      if (!text(payload.expiry) || payload.expiry < asOf || !text(payload.condition) || !text(payload.escalation) || !Array.isArray(payload.channels) || !payload.channels.includes(item.channel)) throw new Error('Exception requires a current/future expiry, condition, escalation owner and all affected channels.');
      record.exceptions.filter(exception => exception.key === payload.key).forEach(exception => { exception.status = 'Superseded'; });
      record.exceptions.push({ id: `EX-${record.exceptions.length + 1}`, key: payload.key, owner: role, rationale: payload.note, expiry: payload.expiry, condition: payload.condition, escalation: payload.escalation, channels: payload.channels, status: 'Active' });
      record.decisions.launch = 'No-go';
      break;
    }
    case 'go':
      requireRole('Assortment approver'); requireNote();
      if (launchBlockers(record, asOf).length) throw new Error('Launch no-go: resolve the listed launch blockers. Assortment approval alone is insufficient.');
      record.decisions.launch = 'Go';
      break;
    case 'nogo':
      requireRole('Assortment approver'); requireNote(); record.decisions.launch = 'No-go'; break;
    case 'escalate':
    case 'contest':
      requireNote();
      record.questions.push({ action, note: payload.note, owner: action === 'contest' ? 'Compliance owner' : 'Operations lead', due: asOf, status: 'Open - named human resolution required' });
      break;
    default: throw new Error('Unknown action.');
  }
  log(record, role, action, payload.note || record.intake, asOf);
  return record;
}
function refreshGates(records, asOf) {
  for (const record of records) if (record.decisions.launch === 'Go' && launchBlockers(record, asOf).length) {
    record.decisions.launch = 'No-go';
    log(record, 'Operations lead', 'gateRecheck', 'Launch revoked because a gate or exception is no longer satisfied.', asOf);
  }
}
module.exports = { ROLES, AS_OF, seed, daysUntil, mandatoryBlockers, priority, activeException, launchBlockers, act, refreshGates };
; return module.exports; })();
'use strict';
const V2 = PROTOTYPE_VERSION === 'v2';
let records = Domain.seed();
let selected = records[0].id;
let viewId = 'V06';
let role = 'Operations lead';
let asOf = Domain.AS_OF;
let filter = 'All categories';
const views = [['V01', 'Supplier checklist'], ['V02', 'Clarification'], ['V03', 'Category review'], ['V04', 'Compliance evidence'], ['V05', 'Approval & launch'], ['V06', 'Portfolio']];
const $ = id => document.getElementById(id);
const esc = value => String(value ?? '').replace(/[&<>"']/g, char => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char]));
const current = () => records.find(record => record.id === selected);
const can = (...roles) => roles.includes(role);
const disabled = allowed => allowed ? '' : ' disabled';
const badge = value => `<span class="badge">${esc(value)}</span>`;
const options = (values, chosen) => values.map(value => `<option${value === chosen ? ' selected' : ''}>${esc(value)}</option>`).join('');
const button = (label, action, allowed = true, extra = '') => `<button type="button" data-action="${action}" ${extra}${disabled(allowed)}>${esc(label)}</button>`;
function notify(message) { $('notice').textContent = message; }
function hint(owners) { return `<p class="muted">Action owner: ${esc(owners)}. Switch the demo role above to exercise their decisions.</p>`; }
function heading(record, title, trace) {
  return `<div class="eyebrow">${esc(record.id)} / ${esc(record.category)} / ${trace}</div><h2>${title}</h2><p>${esc(record.product)} &middot; ${esc(record.supplier)} &middot; requested launch <strong>${esc(record.launch)}</strong></p>`;
}
function audit(record) {
  return `<details><summary>Decision trail (${record.audit.length}) and named follow-up (${record.questions.length})</summary><div class="audit">${record.audit.length ? record.audit.slice().reverse().map(item => `<div class="step"><strong>${esc(item.action)}</strong> / ${esc(item.role)} / revision ${item.revision}<br><small>Business date ${esc(item.asOf)} &middot; click timestamp ${esc(item.timestamp)}</small><p>${esc(item.detail)}</p></div>`).join('') : '<p>No actions taken in this session.</p>'}${record.questions.map(item => `<div class="step"><strong>${esc(item.action)} &rarr; ${esc(item.owner)}</strong><p>${esc(item.note)}</p>${badge(item.status)}</div>`).join('')}</div></details>`;
}
function render() {
  Domain.refreshGates(records, asOf);
  $('role').innerHTML = options(Domain.ROLES, role);
  $('cases').innerHTML = `<h2>Sample submissions</h2><p class="muted">4 fixtures, not the full portfolio.</p>${records.map(record => `<button type="button" class="case${record.id === selected ? ' selected' : ''}" data-case="${record.id}" aria-pressed="${record.id === selected}"><span class="id">${record.id}</span><strong>${esc(record.product)}</strong><small>${esc(record.supplier)}</small><small>${record.initialCompleteness}% initial completeness &middot; ${Domain.mandatoryBlockers(record).length} live evidence blockers</small></button>`).join('')}`;
  $('nav').innerHTML = views.map(([id, name]) => `<button data-view="${id}"${id === viewId ? ' aria-current="page"' : ''}>${id.slice(1)} ${name}</button>`).join('');
  const record = current();
  const renderers = { V01: intake, V02: clarification, V03: categoryReview, V04: compliance, V05: approval, V06: portfolio };
  $('view').innerHTML = renderers[viewId](record);
}
function intake(record) {
  const supplied = record.evidence.filter(item => item.status !== 'missing').length;
  return heading(record, 'Make the next submission easier', 'FR01-03 / US01-03 / D02') +
    `<div class="grid"><section class="card"><h3>Minimum viable intake</h3><p>Save and submit for triage before everything is complete. Mandatory standards still apply before approval.</p>
    <label class="field">Product name *<input id="product" value="${esc(record.product)}" maxlength="160"></label>
    <label class="field">Category / rule pack<input value="${esc(record.category)}" readonly></label>
    <p class="muted">The category is fixed for each fixture. A real category change must reload its rules and revoke dependent approvals.</p>
    <label class="field">Ingredients or explicit not-applicable reason *<textarea id="ingredients" maxlength="1600">${esc(record.fields.ingredients)}</textarea></label>
    <label class="field">Carton dimensions (supplier provided)<input id="dimensions" value="${esc(record.fields.dimensions)}" placeholder="Length x width x height, with units"></label>
    <div class="actions">${button('Save draft', 'save', can('Supplier contact', 'Coordinator'))}${button('Submit for triage', 'submit', can('Supplier contact', 'Coordinator'))}</div>${hint('Supplier contact or Coordinator')}${badge(record.intake)}<p class="muted">Editing product information revokes evidence verification and all approvals. Revision ${record.revision}.</p></section>
    <section class="card"><h3>Category-specific evidence checklist</h3><p><strong>${record.initialCompleteness}%</strong> initial completeness from the source exercise; this is a historical fixture, not a recalculated score.</p><div class="progress"><span style="width:${record.initialCompleteness}%"></span></div><p>Live evidence presence: <strong>${supplied}/${record.evidence.length}</strong>. Verified: <strong>${record.evidence.filter(item => item.status === 'verified').length}/${record.evidence.length}</strong>.</p>
    ${record.evidence.map(item => `<div class="gate"><div><strong>${esc(item.name)} *</strong><small>${esc(item.owner)}</small></div>${badge(item.status === 'provided' ? 'Supplier provided' : item.status)}</div>`).join('')}
    <p>* Mandatory under illustrative category rules. Presence does not mean specialist verification.</p><button data-view="V02">Resolve gaps and conflicts &rarr;</button>
    <details open><summary>Accessible guidance and assisted support</summary><p>Use plain text, not a complex template. Describe the item, source, units and category. Ask the coordinator to transcribe or explain a request. Supplier size, language and unfamiliar format do not reduce queue priority.</p>
    <label class="field">Support preference<select id="supportMode">${options(['Plain-language explanation', 'Assisted submission', 'Accessible format', 'Language support'], '')}</select></label>
    <label class="field">What support would help?<textarea id="supportNote" placeholder="Do not enter real personal or confidential information."></textarea></label>
    ${button('Request assisted support', 'support', can('Supplier contact', 'Coordinator'))}<p class="muted">Demo request stays in this tab. No message is sent. ${record.support.length} request(s) recorded.</p>
    ${record.support.map(item => `<div class="step">${esc(item.mode)} &rarr; ${esc(item.owner)}: ${esc(item.note)} (${esc(item.status)})</div>`).join('')}</details></section></div>${audit(record)}`;
}
function clarification(record) {
  const blockers = Domain.mandatoryBlockers(record);
  return heading(record, V2 ? 'One coordinated correction round' : 'Completeness and correction request', 'FR02 / US02 / D02') +
    `<section class="card"><h3>Readiness by section</h3><div class="table-scroll"><table><thead><tr><th>Section / item</th><th>Status / conflicting value</th><th>Requested correction</th><th>Review owner</th></tr></thead><tbody>${record.evidence.map(item => `<tr><td>${esc(item.name)}</td><td>${badge(item.status)}<p>${esc(item.conflict || (item.status === 'missing' ? 'Not supplied' : item.text))}</p></td><td>${item.status === 'verified' ? 'None for this version' : 'Provide a source-linked, internally consistent revision; then obtain named human verification.'}</td><td>${esc(item.owner)}</td></tr>`).join('')}</tbody></table></div></section>
    <div class="grid"><section class="card"><h3>${V2 ? 'Consolidated request preview' : 'Correction request preview'}</h3><p>${V2 ? 'D02: a coordinator owns one open round. All current evidence gaps are attached to reduce repeated requests.' : 'Baseline: record a missing-information request and its due date.'}</p>
    <label class="field">Requested correction<textarea id="requestNote">${esc(blockers.length ? `Please address these items in one response: ${blockers.map(item => item.name).join('; ')}. Include source references and corrected values.` : 'Please confirm any outstanding category or channel review questions.')}</textarea></label>
    <label class="field">Response due date<input id="requestDue" type="date" value="${asOf}"></label>
    ${button(V2 ? 'Record consolidated request' : 'Record correction request', 'request', can('Coordinator', 'Compliance owner', 'Category manager'))}<p class="muted">Local record only; no supplier message is sent. The request is visible before recording.</p>
    ${record.requests.map(request => `<div class="step"><strong>${request.id} &middot; due ${esc(request.due)}</strong><p>${esc(request.note)}</p><small>Owner: ${esc(request.owner)} / ${esc(request.status)}</small><p>Response: ${esc(request.response || 'Awaiting supplier')}</p></div>`).join('')}
    <label class="field">Supplier response<textarea id="responseNote" placeholder="Explain corrections and reference the mock evidence revisions."></textarea></label>${button('Respond and resubmit', 'respond', can('Supplier contact', 'Coordinator'))}</section>
    <section class="card"><h3>Provide revised mock evidence</h3><p>This substitutes for an upload in the exercise. Nothing is uploaded or sent. Revised content remains supplier provided until a named specialist verifies it.</p>
    <label class="field">Evidence item<select id="provideId">${record.evidence.map(item => `<option value="${item.id}">${esc(item.name)}</option>`).join('')}</select></label>
    <label class="field">Source reference<input id="provideSource" placeholder="e.g. Supplier allergen declaration, revision 2" maxlength="240"></label>
    <label class="field">Corrected evidence / response<textarea id="provideNote" placeholder="Describe the revised mock evidence. Do not use real supplier data."></textarea></label>
    ${button('Attach mock revision', 'provide', can('Supplier contact', 'Coordinator'))}
    <div class="warn">A revision clears the old conflict flag only for re-review; it does not verify the claim. All dependent approvals are revoked.</div><button data-view="V04">Open specialist review &rarr;</button></section></div>${audit(record)}`;
}
function categoryReview(record) {
  const priority = Domain.priority(record, asOf);
  return heading(record, 'Focus the human assortment decision', 'FR04-05 / US04-05 / D01,D05') +
    `<div class="grid"><section class="card"><h3>Product and assortment context</h3>
    <div class="step"><strong>Customer need</strong><p>${esc(record.customerNeed)}</p></div><div class="step"><strong>Assortment comparison</strong><p>${esc(record.comparison)}</p></div>
    <div class="step"><strong>Commercial facts / assumptions</strong><p>${esc(record.commercial)}</p></div>
    <p><strong>Review age:</strong> ${record.age} days${record.id === 'ONB-8104' ? ' (source: category review pending six days)' : ' (illustrative)'}. <strong>Requested launch:</strong> ${esc(record.launch)}.</p>
    <p>${Domain.mandatoryBlockers(record).length} live mandatory evidence blocker(s). No commercial urgency overrides final assortment controls.</p>
    <label class="field">Question, recommendation or decision rationale<textarea id="categoryNote" placeholder="Document assortment fit and any conditions."></textarea></label>
    <div class="actions">${button('Ask a question', 'question', can('Category manager'))}${button('Recommend', 'recommend', can('Category manager'))}${button('Return for changes', 'return', can('Category manager'))}${button('Approve category fit', 'approveCategory', can('Category manager'))}</div>${hint('Category manager')}${badge('Category: ' + record.decisions.category)}</section>
    <section class="card"><h3>Priority explanation</h3><p class="eyebrow">Deterministic AI stand-in / not a predictive model</p><p><strong>Illustrative score ${priority.score}</strong></p><p>${esc(priority.reason)}</p>
    <p>Rule weights: mandatory review +40; launch within 21 days +30; age up to +20; nearly ready and aged five days +25. These proposed weights require D05 ratification.</p>
    <div class="warn">A high score means review sooner, not approve sooner. Supplier size, formatting and inferred quality are not ranking inputs.</div>
    ${V2 ? '<p><strong>D03 proposed:</strong> prototype all categories; implementation pilot Packaged Food. Seasonal Home and Personal Care are gated expansions. Escalate urgent out-of-pilot demand.</p>' : '<p>Initial scope is a bounded prototype across the three source categories. Implementation prioritization is still open.</p>'}
    <label class="field">Contest or correct this priority<textarea id="contestNote" placeholder="Explain incorrect facts or an unintended burden."></textarea></label>${button('Record contest', 'contest')}<p class="muted">Named human owner: Compliance owner; operational routing can be adjusted at review.</p></section></div>${audit(record)}`;
}
function compliance(record) {
  return heading(record, 'Verify the evidence, not the AI summary', 'FR06-07,FR12 / US06-07,US12 / D06') +
    `<section class="card"><h3>Evidence register</h3><p>All items below are mandatory under illustrative policies. Source dates and content are demo assumptions. The responsible owner must verify the exact version; category and compliance approvals remain separate.</p>
    ${record.evidence.map(item => `<article class="evidence-item"><div class="headrow"><h3>${esc(item.name)}</h3>${badge(item.status === 'provided' ? 'Supplier provided - unverified' : item.status)}</div>
    <p class="evidence-meta">Owner: ${esc(item.owner)} &middot; source: ${esc(item.source)} &middot; date: ${esc(item.date || 'Unknown')} &middot; version ${item.version}</p>
    <p><strong>Supplied information:</strong> ${esc(item.text || 'Missing - do not infer or fabricate evidence.')}</p>
    ${item.conflict ? `<div class="warn"><strong>Conflict:</strong> ${esc(item.conflict)}</div>` : ''}
    <p><strong>Uncertainty:</strong> ${esc(item.uncertainty)}</p><p><strong>Specialist note:</strong> ${esc(item.note || 'Not reviewed')}</p>
    <label class="field">Named specialist rationale<textarea id="note-${item.id}" placeholder="Record why the exact source version satisfies the rule, or request/reject it."></textarea></label>
    <div class="actions">${button('Verify this version', 'verify', can(item.owner), `data-evidence="${item.id}"`)}${button('Reject evidence', 'rejectEvidence', can(item.owner), `data-evidence="${item.id}"`)}${button('Request more', 'moreEvidence', can(item.owner), `data-evidence="${item.id}"`)}</div></article>`).join('')}
    <div class="warn">No real model is used. A production assistant must cite evidence, preserve uncertainty, treat supplier documents as untrusted input, and never make approval decisions. Changing evidence revokes earlier approvals.</div>
    <label class="field">Compliance decision rationale<textarea id="complianceNote"></textarea></label>${button('Approve compliance review', 'approveCompliance', can('Compliance owner'))}${hint('Compliance owner')}${badge('Compliance: ' + record.decisions.compliance)}</section>
    <section class="card"><h3>Contest or escalate a claim</h3><label class="field">What needs human resolution?<textarea id="contestNote"></textarea></label><div class="actions">${button('Record contest', 'contest')}${button('Escalate to operations', 'escalate')}</div></section>${audit(record)}`;
}
function approval(record) {
  const blockers = Domain.launchBlockers(record, asOf);
  return heading(record, 'Approved is not the same as launch-ready', 'FR08-10 / US08-10 / D01,D04') +
    `<div class="grid"><section class="card"><h3>Independent decision gates</h3>
    ${[['category', '1. Category fit', 'Category manager'], ['compliance', '2. Mandatory evidence', 'Compliance owner'], ['assortment', '3. Assortment decision', 'Assortment approver'], ['launch', '4. Launch go / no-go', 'Assortment approver']].map(([key, name, owner]) => `<div class="gate"><div><strong>${name}</strong><small>${owner}</small></div>${badge(record.decisions[key])}</div>`).join('')}
    <div class="warn">${blockers.length ? `<strong>Launch blocked:</strong> ${blockers.map(esc).join('; ')}.` : '<strong>All gates satisfied.</strong> An authorized owner can now record launch go.'}</div>
    <label class="field">Decision rationale / conditions<textarea id="approvalNote" placeholder="Document the human decision; urgency is not a compliance exception."></textarea></label>
    <div class="actions">${button('Approve assortment', 'approveAssortment', can('Assortment approver'))}${button('Record launch go', 'go', can('Assortment approver'))}${button('Record no-go', 'nogo', can('Assortment approver'))}${button('Escalate blocker', 'escalate')}</div>${hint('Assortment approver; escalation available to all roles')}</section>
    <section class="card"><h3>Readiness and handoff</h3><p>Owner: ${esc(record.handoff.owner)} &middot; review due ${esc(record.handoff.due)}. ${esc(record.handoff.note)}</p>
    ${Object.entries(record.readiness).map(([key, item]) => `<div class="gate"><div><strong>${esc(item.label)}</strong><small>${esc(item.owner)} / ${esc(item.channel)} / ${item.mandatory ? 'Mandatory' : 'Non-mandatory'}</small><br>${badge(item.status)} ${Domain.activeException(record, key, asOf) ? badge('Active controlled exception') : ''}</div><div>${button(item.status === 'Ready' ? 'Reopen' : 'Mark ready', 'readiness', can(item.owner), `data-key="${key}"`)}</div></div>`).join('')}
    <label class="field">Readiness confirmation note<textarea id="readinessNote" placeholder="Describe the confirmation or unresolved issue before changing status."></textarea></label></section></div>
    <section class="card" style="margin-top:20px"><h3>Controlled exception - never mandatory evidence</h3><p>Only additional lifestyle imagery is exceptable in this demo. Missing allergens, claim conflicts, safety and mandatory packaging are never waivable. All exception fields are required.</p>
    <div class="grid"><div><label class="field">Affected item<select id="exceptionKey"><option value="imagery">Additional lifestyle image (non-mandatory)</option><option value="packaging">Packaging (mandatory - request will be refused)</option><option value="evidence">Mandatory evidence (request will be refused)</option></select></label>
    <label class="field">Rationale<textarea id="exceptionNote"></textarea></label><label class="field">Expiry date<input id="exceptionExpiry" type="date"></label></div>
    <div><label class="field">Condition / remedy<textarea id="exceptionCondition" placeholder="e.g. Complete additional image by the expiry date; primary image remains mandatory."></textarea></label>
    <label class="field">Affected channel<select id="exceptionChannel">${options(['Digital', 'Store'], 'Digital')}</select></label>
    <label class="field">Escalation owner<input id="exceptionEscalation" placeholder="Operations lead"></label></div></div>
    ${button('Authorize bounded exception', 'exception', can('Assortment approver'))}${hint('Assortment approver')}
    ${record.exceptions.map(exception => `<div class="step"><strong>${exception.id} / ${esc(exception.owner)}</strong> &middot; expiry ${esc(exception.expiry)} / ${esc(exception.channels.join(', '))}<p>${esc(exception.rationale)}. Condition: ${esc(exception.condition)}. Escalate: ${esc(exception.escalation)}.</p>${badge(exception.status === 'Superseded' ? 'Superseded' : exception.expiry < asOf ? 'Expired - no longer clears blocker' : 'Active')}</div>`).join('')}
    <p class="muted">${V2 ? 'V2 D04: expiry is rechecked when the demo date changes. An expired exception automatically revokes a recorded launch go.' : 'V1 baseline: record a bounded non-mandatory exception with ownership and escalation.'}</p></section>${audit(record)}`;
}
function portfolio() {
  const list = records.filter(record => filter === 'All categories' || record.category === filter).sort((a, b) => Domain.priority(b, asOf).score - Domain.priority(a, asOf).score);
  const blocked = list.filter(record => Domain.launchBlockers(record, asOf).length).length;
  const near = list.filter(record => Domain.daysUntil(record.launch, asOf) >= 0 && Domain.daysUntil(record.launch, asOf) <= 21).length;
  return `<div class="eyebrow">V06 / FR04,FR11 / US04,US11 / D05,D07</div><h2>A portfolio of decisions, not just percentages</h2><p class="muted">Prioritize human review, expose owners and protect mandatory controls.</p>
    ${V2 ? '<div class="card"><div class="eyebrow">V2 response to the three customer changes</div><div class="grid"><div><strong>CR01 / D01,D04,D06</strong><p>Independent approvals, non-waivable evidence, named escalation and version-sensitive decisions.</p><strong>CR02 / D02,D05</strong><p>Minimum viable intake, one open correction round, accessible assistance and fair queue rules.</p></div><div><strong>CR03 / D03</strong><p>Recommend Packaged Food pilot, then gated Seasonal Home and Personal Care. All three remain visible in this prototype. Seasonal dates are requests, not delivery commitments.</p><span class="badge">Customer ratification pending</span></div></div></div>' : '<div class="card"><strong>V1 baseline</strong><p>Demonstrate the six required views and four source cases before discussing customer changes. Scope and detailed request coordination are still open for workshop decisions.</p></div>'}
    <div class="metrics"><div class="metric"><strong>${list.length}</strong><span>Filtered mock submissions</span></div><div class="metric"><strong>${blocked}</strong><span>With live launch blockers</span></div><div class="metric"><strong>${near}</strong><span>Requested launch in 0-21 days</span></div><div class="metric"><strong>${list.reduce((sum, record) => sum + record.requests.length, 0)}</strong><span>Correction rounds in this session</span></div></div>
    <section class="card"><div class="headrow"><h3>Review worklist</h3><label>Category <select id="categoryFilter">${options(['All categories', 'Packaged Food', 'Personal Care', 'Seasonal Home'], filter)}</select></label></div>
    <div class="table-scroll"><table><thead><tr><th>Submission / supplier</th><th>Readiness &amp; workload</th><th>Priority / launch</th><th>Blocker &amp; owner</th><th>Action</th></tr></thead><tbody>${list.map(record => {
      const priority = Domain.priority(record, asOf);
      const blockers = Domain.mandatoryBlockers(record);
      return `<tr><td><strong>${esc(record.product)}</strong><br>${record.id}<br><small>${esc(record.supplier)} / ${esc(record.category)}</small></td><td>${record.initialCompleteness}% initial completeness<br>${record.age} days in review<br>${record.effort.toFixed(1)}h supplier effort (illustrative)<br>${badge(record.decisions.assortment)}</td><td>Score ${priority.score}<br>${record.launch}<br>${priority.days} days away</td><td>${blockers.length ? blockers.map(item => `${esc(item.name)} (${esc(item.status)}) &rarr; ${esc(item.owner)}`).join('<br>') : 'Evidence verified; category/channel review still required'}</td><td><button data-drill="${record.id}">Review</button><details><summary>Why this rank?</summary>${esc(priority.reason)}</details></td></tr>`;
    }).join('')}</tbody></table></div><p class="muted">Live counts are calculated only from these four fixtures. Record ages are illustrative except the six-day category review for ONB-8104. Source metric totals below describe a different, broader fictional portfolio.</p></section>
    <div class="grid"><section class="card"><h3>Source portfolio - illustrative baselines</h3><div class="gate"><span>Monthly submissions</span><strong>260</strong></div><div class="gate"><span>Packaged Food / Personal Care / Seasonal Home</span><strong>110 / 85 / 65</strong></div><div class="gate"><span>Complete at first review</span><strong>59%</strong></div><div class="gate"><span>Average clarification cycles</span><strong>2.7</strong></div><div class="gate"><span>Median decision time</span><strong>18 business days</strong></div><div class="gate"><span>Mandatory evidence present at first review</span><strong>68%</strong></div><div class="gate"><span>Category manager open workload (average)</span><strong>46</strong></div><div class="gate"><span>Launches in 8 weeks / within 3 weeks</span><strong>74 / 19</strong></div><div class="gate"><span>Within 3 weeks with unresolved blockers</span><strong>11 of 19</strong></div><p>Presence at first review is not verification before approval. Approval control: all mandatory evidence verified.</p></section>
    <section class="card"><h3>Proposed pilot hypotheses</h3><p>75% first-review completeness; no more than 2.0 clarification rounds; median decision time at most 14 business days; supplier effort at most 3 hours.</p><div class="warn">Targets are proposals for D07, not committed benefits. Baselines, cohort definitions and observation windows require customer validation.</div><h3>Category load in these fixtures</h3>${['Packaged Food', 'Personal Care', 'Seasonal Home'].map(category => `<div class="gate"><span>${category}</span><strong>${records.filter(record => record.category === category).length}</strong></div>`).join('')}<h3 style="margin-top:20px">Operating boundaries</h3><p>AI may guide, summarize and prioritize. Humans verify, approve, return, contest and escalate. Manual review remains the fallback.</p><a href="delivery-control-workbook.xlsx">Open backlog, KPI definitions and readiness gates</a></section></div>`;
}
const read = id => $(id)?.value || '';
document.addEventListener('click', event => {
  const target = event.target.closest('button');
  if (!target) return;
  if (target.dataset.case) { selected = target.dataset.case; notify(''); render(); return; }
  if (target.dataset.view) { viewId = target.dataset.view; notify(''); render(); return; }
  if (target.dataset.drill) { selected = target.dataset.drill; viewId = 'V03'; notify(''); render(); return; }
  if (!target.dataset.action) return;
  const action = target.dataset.action;
  const record = current();
  let payload = {};
  if (['save', 'submit'].includes(action)) payload = { product: read('product'), ingredients: read('ingredients'), dimensions: read('dimensions') };
  if (action === 'support') payload = { note: read('supportNote'), mode: read('supportMode') };
  if (action === 'request') payload = { note: read('requestNote'), due: read('requestDue'), consolidated: V2 };
  if (action === 'respond') payload = { note: read('responseNote') };
  if (action === 'provide') payload = { id: read('provideId'), note: read('provideNote'), source: read('provideSource') };
  if (['verify', 'rejectEvidence', 'moreEvidence'].includes(action)) payload = { id: target.dataset.evidence, note: read('note-' + target.dataset.evidence) };
  if (['question', 'return', 'recommend', 'approveCategory'].includes(action)) payload = { note: read('categoryNote') };
  if (action === 'approveCompliance') payload = { note: read('complianceNote') };
  if (['approveAssortment', 'go', 'nogo'].includes(action)) payload = { note: read('approvalNote') };
  if (['contest', 'escalate'].includes(action)) payload = { note: read(viewId === 'V05' ? 'approvalNote' : 'contestNote') };
  if (action === 'readiness') payload = { key: target.dataset.key, ready: record.readiness[target.dataset.key].status !== 'Ready', note: read('readinessNote') };
  if (action === 'exception') payload = { key: read('exceptionKey'), note: read('exceptionNote'), expiry: read('exceptionExpiry'), condition: read('exceptionCondition'), channels: [read('exceptionChannel')], escalation: read('exceptionEscalation') };
  try {
    Domain.act(record, role, action, payload, asOf);
    render(); notify(`${action} recorded for ${record.id}. Local simulation only; no external action was taken.`);
  } catch (error) {
    notify(error.message);
  }
});
document.addEventListener('change', event => {
  if (event.target.id === 'role') { role = event.target.value; render(); notify(`Demo role changed to ${role}. This is not production access control.`); }
  if (event.target.id === 'categoryFilter') { filter = event.target.value; render(); }
  if (event.target.id === 'asOf') {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(event.target.value)) { event.target.value = asOf; notify('Choose a valid demo date.'); return; }
    asOf = event.target.value; render(); notify('Business date changed. Launch gates and exception expiry were re-evaluated.');
  }
});
$('theme').addEventListener('click', () => { document.documentElement.dataset.theme = document.documentElement.dataset.theme === 'dark' ? 'light' : 'dark'; });
$('reset').addEventListener('click', () => {
  records = Domain.seed(); selected = records[0].id; asOf = Domain.AS_OF; $('asOf').value = asOf; filter = 'All categories'; render();
  notify('Demo restored to the four original fixtures. Previous tab-only actions were cleared.');
});
$('export').addEventListener('click', () => {
  const blob = new Blob([JSON.stringify({ version: PROTOTYPE_VERSION, asOf, exportedAt: new Date().toISOString(), disclaimer: 'Fictional simulation, not customer acceptance or actual compliance evidence.', records }, null, 2)], { type: 'application/json' });
  const url = URL.createObjectURL(blob); const anchor = document.createElement('a'); anchor.href = url; anchor.download = `onboarding-${PROTOTYPE_VERSION}-session.json`; anchor.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000); notify('Session JSON exported. Retain it as simulated workshop evidence, not business acceptance.');
});
render();

</script>
</body>
</html>


===== FILE: README.txt =====
===== TYPE: .txt (signature 53-55-50-50-4C-49-45-52) =====
===== SECTIONS DETECTED: plain text, 77 lines (cite by line number) =====
SUPPLIER AND PRODUCT ONBOARDING - DELIVERY PACK
Prepared: 7 September 2026

START HERE
Open index.html locally. It links every deliverable, explains scope and marks the human acceptance still outstanding.
Open prototype-v1.html for the baseline, then prototype-v2.html for the response to the three customer changes.
Open Office artefacts in Word, Excel and PowerPoint; PDF reading copies are included.

IMPORTANT STATUS
Fictional exercise; AI-authored working package. Customer workshop, business-owner acceptance, policy confirmation and SteerCo decisions are pending. No real customer validation or production deployment has occurred.
No live AI, external service, actual supplier messaging, production identity, system integration, rollout, migration or final production acceptance. HTML is a local interactive simulation with mock role switching, not authentication. All added policy thresholds, channels, evidence dates, prices, owner names and record ages are illustrative assumptions.
All original source facts are fictional. All added policies, thresholds, evidence content, role assignments, commercial figures and targets are illustrative proposals.

DELIVERABLES
prototype-v1.html
  Experience the baseline: Six-view v1 prototype with all four original sample submissions. Demonstrate this before discussing the source change requests.
prototype-v2.html
  Explore the refined experience: Interactive v2: consolidated supplier correction rounds, assisted intake, human approval gates, evidence provenance, controlled exceptions, escalation and phased scope.
business-requirements.docx
  Business Requirements Document: Business goals, as-is/to-be journeys, requirements, rules, data, NFRs, responsible AI, measures and traceability.
workshop-and-delivery-handbook.docx
  Workshop and delivery handbook: Walkthrough, simulated critique, proposed decisions, Sprint 0 plan, governance, RAID, acceptance, adoption and handoff. No invented customer acceptance.
delivery-control-workbook.xlsx
  Delivery control workbook: Editable epics, 24 stories, acceptance criteria, dependencies, estimates, planning, RAID, decision ownership, metrics and readiness.
steerco-pitch.pptx
  SteerCo pitch: Seven decision-led slides with scope recommendations, prototype evidence, risks, release approach and explicit leadership asks.
business-requirements.pdf, workshop-and-delivery-handbook.pdf, delivery-control-workbook.pdf, steerco-pitch.pdf: static reading copies.
steerco-readiness-summary.txt: the seven capture sections from the source challenge.
source-context.txt: selected source requirements and customer changes.
source/: generators, canonical brief and workflow tests.

MANAGED OFFICE PROTECTION
The final Word and Excel files acquired enterprise protection on this device.
Their protection is retained. Use your authorized, signed-in Office account.
The current final files open successfully in authorized Word/Excel.
No labels, permissions or policies were removed or changed.
The supplied PDF reading copies are also available.
Do not regenerate over protected deliverables to bypass protection.

FIVE-MINUTE DEMONSTRATION
1. V2 Portfolio: compare ONB-8102 inside 21 days with ONB-8104 nearly-ready aged work. Source portfolio totals are not calculated from four samples.
2. Select ONB-8101. Switch to Assortment approver. Approval & launch: enter a decision note and try Approve assortment. Missing mandatory evidence prevents approval.
3. Switch to Supplier contact. Clarification: choose missing allergen evidence, enter a mock source and correction, then Attach mock revision. This is not a real file upload.
4. Switch to Compliance owner. Compliance evidence: enter named review notes and verify nutrition and revised allergen. Then enter a compliance note and approve compliance review.
5. Switch to Category manager. Category review: record the fit rationale and approve category fit. Switch to Assortment approver and approve assortment. Attempt launch go: outstanding channel/supply readiness still blocks launch.
6. In Approval & launch, use Category manager for packaging/supply and Channel owner for content/store/digital and imagery; enter a readiness note before each action. Then Assortment approver may record launch go with rationale.
7. Alternatively, leave only additional lifestyle imagery pending. As Assortment approver, create an exception with rationale, future expiry, condition, Digital channel and escalation owner. Mandatory items cannot be excepted. Launch go is possible only if all other gates pass. Advance the demo date past expiry: launch returns to No-go.
8. Edit evidence again as Supplier contact: all dependent approvals are revoked. Export session JSON to retain the simulated activity.

OTHER CASES
ONB-8102: conflicting moisture claim must be corrected by a supplier revision and verified by Compliance owner.
ONB-8103: missing battery safety and carton dimensions cannot be waived for seasonal urgency. Compliance owner verifies safety; Category manager verifies dimensions.
ONB-8104: 100% source completeness and no compliance blocker do not mean category or launch approval. Six-day queue age is from source.

V1 / V2
Both versions implement the six required views and baseline safety rules.
V2 permits only one open consolidated clarification round and explicitly displays the CR01/CR02/CR03 decisions and phased-scope recommendation.
V2 expiry handling is demonstrated by changing Demo business date. Both versions enforce bounded non-mandatory exceptions.
Customer feedback is sourced from the attachment; the critique and proposed workshop decisions are not evidence of an actual workshop.

PLAN AND ESTIMATES
Scope: Prototype all three categories and all four supplied cases. Recommend Packaged Food as the initial implementation pilot, then gated Seasonal Home and Personal Care rule packs. Seasonal pressure is explicitly escalated; do not imply a production commitment to the supplied launch dates.
104 relative points; S0 11, S1 21, S2 62, S3 5, S4 5.
Story points are relative effort, not hours. Story placement shows dependency intent only and is not capacity-validated. Show per-sprint totals, explicitly flag S2 concentration, and do not claim a feasible four-sprint release until a staffed capacity model supports it.
G0 D10: policy/data owners, accepted prototype direction, traceable BRD/backlog, staffed re-estimate and RAID decisions. G1 after S2 only if controls, UAT, operational readiness and human sign-off pass. G2/G3 expansion requires approved category rule packs and regression.

REBUILD
From the source folder: node build-prototypes.cjs
From the source folder: node build-package.cjs
Workflow tests: node --test domain.test.cjs
Other generation scripts are included by artefact. Office generation/rendering may require installed libraries or Office/LibreOffice as described in those scripts.

HTML USAGE
No network calls or external dependencies are needed for prototypes. Open files locally.
If a locked-down cloud preview suppresses interaction, download/open the HTML locally instead.
The prototype is not a secure multi-user application. Do not use real supplier information.


===== FILE: source-context.txt =====
===== TYPE: .txt (signature 43-4F-4E-54-4F-53-4F-20) =====
===== SECTIONS DETECTED: plain text, 310 lines (cite by line number) =====
CONTOSO RETAIL DELIVERY CHALLENGE - SELECTED SOURCE CONTEXT
Source attachment: contoso-retail-delivery-challenge.html
Only common challenge requirements and Scenario 05 are included.
Source figures, organizations and dates are fictional exercise inputs, not real claims.

SOURCE EXTRACT: text lines 1-80
Contoso Retail — AI Delivery Sprint 0 Challenge
Skip to activity
Delivery immersion assignment · Fictional exercise
Contoso Retail — AI Delivery Sprint 0 Challenge
Turn a signed contract into a validated, governed, delivery-ready starting point before the larger team arrives.
90-minute simulation Five business scenarios Two-week Sprint 0 Four focused steps
Current moment
The core project team is starting Sprint 0.
Readiness horizon
The larger delivery team joins in two weeks.
Mission
Create clarity, alignment, evidence, governance, and decisions for delivery to begin with confidence.
Activity
Use dark theme
i Exercise status: Contoso Retail, its people, contract, scenarios, figures, timelines, metrics, and circumstances are fictional and illustrative assumptions created only for this learning activity. They are not real-company claims, observed facts, committed results, or implementation promises.
Sprint 0 delivery wizard
Move from contract to confident delivery
Step 1 of 4
1 Understand the Project Objectives 2 Build a Rapid Prototype 3 Refine Your Requirements 4 Create the SteerCo Pitch
90-minute session clock
0–10 Scenario, team collaboration and SoW review
10–35 Prototype v1 and customer discussion
35–60 Prototype v2, BRD and backlog
60–70 Plan and SteerCo deck
70–90 Selected presentations and synthesis
Step 1 · Get aligned
Understand the Project Objectives
Welcome to Sprint 0. Before the larger team arrives, your mission is to turn a signed contract into a shared, executable understanding of the customer outcome. Get curious, challenge assumptions, and make the next two weeks count.
About Contoso Retail
Contoso Retail is a fictional omnichannel retailer operating stores and digital channels. Microsoft recently signed an AI implementation contract, and your table is the core team starting Sprint 0. A larger delivery team joins in two weeks and must be able to hit the ground running.
Work as one project team
Divide the work across the table. Have one or two participants act as customer Business/Product Owners. Challenge assumptions, make decisions together, and keep a concise decision log as one cross-functional project team.
Two-week Sprint 0 objective
Establish sufficient clarity on outcomes, scope, requirements, customer decisions, prototype direction, delivery work, governance, risks, dependencies, acceptance, and adoption so the larger project team can hit the ground running.
Shared Statement of Work summary
Purpose: Validate and prepare one assigned AI-enabled retail business capability for implementation, creating an agreed foundation for the larger delivery team.
Sprint 0 duration
Two weeks immediately before the larger delivery team joins.
Customer responsibilities
Provide Product Owner availability and timely decisions.
Share current-process examples, policies, and known exceptions.
Provide sample content and descriptions of relevant data.
Review and accept Sprint 0 artifacts within the working cadence.
In-scope activities
Outcome and scope alignment, customer workshops, and rapid prototype creation.
Requirement validation, BRD development, and a prioritized delivery backlog.
Estimation assumptions and a high-level project, release, and sprint plan.
Governance and ways of working, including decisions, reviews, and escalation.
Risk, assumption, issue, and dependency identification.
Responsible-AI considerations, operational readiness, and a SteerCo readout.
Expected deliverables
Validated prototype and workshop decision record.
Business Requirements Document.
Prioritized backlog with acceptance criteria.
High-level delivery plan and estimation assumptions.
RAID summary, governance, and ways of working.
SteerCo presentation.
Acceptance criteria
Business owner confirms the prototype direction.
Requirements are complete enough to trace and govern.
The backlog supports credible delivery planning.
Dependencies and assumptions are visible.
SteerCo can make the required decisions.
Out of scope
Production deployment, full-scale integration, migration, operational rollout, and final production acceptance. Contract value, named systems or vendors, detailed dates beyond the two-week Sprint 0, and committed benefits are intentionally not provided.
Sprint 0 finish line
Outcome and scope aligned
Prototype validated
BRD and backlog ready
Dependencies and RAID visible
Plan agreed
SteerCo decisions prepared
Step 2 · Make it real
Build a Rapid Prototype
We know some things about the customer and the scope—but we want to align clearly and quickly. A prototype is the fastest way to make the conversation real. Let’s build one with AI. It will be fun.
Choose your assigned scenario On-Shelf Availability and Store Replenishment Personalized Omnichannel Product Discovery Customer Care and Order Exception Resolution Returns, Fraud, and Retail Loss Reduction Supplier and Product Onboarding
Only your selected scenario appears on screen.
All five are included when printing.
Use AI to build your prototype
Use an AI or prototyping tool of your choice. Make the intended outcome, end-to-end journey, user decisions, human oversight, rules, and exceptions visible—not merely polished. This page does not call any external AI service.

SOURCE EXTRACT: text lines 455-556
Scenario 05 Supplier and Product Onboarding
Executive sponsor: Chief Merchandising Officer
New product introduction
Compliance evidence
Supplier collaboration
Assortment readiness
Business context / problem
New product introduction is slowed by incomplete or inconsistent product information, missing compliance evidence, repeated supplier follow-up, unclear ownership, and category-manager review workload. Readiness differs by category and channel, making assortment launch decisions difficult to govern.
Primary personas / users
Supplier contact: wants clear requirements, limited rework, and predictable status. Category manager: evaluates customer fit, commercial readiness, and assortment choice. Compliance owner: verifies mandatory evidence and claims. Content and channel readiness owner: prepares accurate customer-facing information. Merchandising operations and assortment approver: coordinate workload, exceptions, launch blockers, and the final go/no-go decision.
Relevant products, channels, processes, or journeys
New and changed products; supplier submission and clarification; product, packaging, claim, and compliance information; category review; approval and exception; channel readiness; assortment decision; and launch handoff.
Clear business objective
Prepare a supplier and product onboarding capability that improves submission completeness, focuses category and compliance review, supports policy consistency, and provides clear visibility of assortment readiness and launch blockers.
Prototype starter pack
Use these exercise inputs to show the supplier's submission journey, the internal reviews, the human approvals, and the blockers that determine launch readiness.
A Illustrative business facts
Fictional exercise assumptions: these figures are provided only to populate the mock-up. They are not observed Contoso Retail facts or promised results.
Operating fact Illustrative baseline
Monthly submissions 260 new-product submissions: 110 Packaged Food, 85 Personal Care, and 65 Seasonal Home.
Initial completeness 41% of submissions are incomplete at first review, most often missing claims evidence, packaging dimensions, ingredients, or channel content.
Clarification cycles Submissions average 2.7 supplier clarification cycles before they are ready for a category decision.
Review time Median elapsed time from initial submission to assortment decision is 18 business days; seven of those days are typically spent waiting for clarification.
Upcoming launch dates 74 products are planned to launch within eight weeks, including 19 with a requested launch date within three weeks.
Compliance evidence 32% of submissions requiring claim, ingredient, safety, or packaging evidence are missing at least one mandatory item at first review.
Workload and supplier effort Each category manager carries 46 open submissions on average; suppliers spend about 4.2 hours per submission responding to clarification requests.
Business value measures
Measure Illustrative baseline Desired direction
Complete at first review 59% Increase
Average clarification cycles 2.7 Reduce
Median time to assortment decision 18 business days Reduce; target to define in Sprint 0
Mandatory evidence present before approval 68% at first review Increase while preserving specialist verification
Products with unresolved blockers inside three weeks of launch 19 planned launches, 11 with open blockers Reduce and expose earlier
B Current process today
Supplier contact submits company, product, packaging, claim, launch, content, and commercial information. Friction: category requirements are unclear and suppliers omit or format information differently.
Merchandising operations coordinator checks completeness against a general checklist. Friction: category-specific gaps are discovered after the submission enters review.
Coordinator and supplier exchange clarification requests and revised evidence. Friction: requests arrive in several rounds, repeat questions, and do not always show which item blocks progress.
Category manager reviews customer fit, assortment overlap, commercial information, demand assumptions, and launch timing. Friction: high workload hides urgent or nearly ready submissions.
Compliance and content owners review mandatory evidence, product claims, labels, imagery, descriptions, and channel suitability. Friction: conflicting information and unverified supplier statements delay both tracks.
Category, compliance, and assortment owners approve, reject, request changes, or record an exception. Friction: decision ownership and conditions are not visible in one place.
Channel and launch readiness owners confirm customer content, packaging, supply, store/digital readiness, and handoff dates. Friction: a product can appear approved while a critical launch blocker remains open.
Merchandising operations leader reports status across categories, suppliers, blockers, and upcoming launches. Friction: portfolio reporting is manually assembled and quickly becomes stale.
C Where the customer intends to use AI
Contoso Retail intends to use AI to guide suppliers toward complete submissions, identify missing or conflicting information, summarize supplied evidence, prioritize internal review, and show the blockers affecting launch readiness. Supplier-provided information must remain clearly identified and verified where policy requires. Category managers, compliance owners, and assortment approvers retain all approval and exception decisions. The outcome being improved is a complete, reviewable product submission that reaches the right human decision sooner with fewer clarification cycles and clearer launch risk.
D Prototype v1 must demonstrate
Supplier submission checklist — supplier contact: product/category, required fields, evidence, owner, completeness, save/submit, guidance, and assisted-support request.
Completeness and missing-information request — coordinator and supplier: readiness by section, blocker, conflicting value, requested correction, due date, response, and resubmit action.
Category review — category manager: product summary, customer need, assortment comparison, commercial facts, launch date, readiness, questions, and recommend/return action.
Compliance evidence review — compliance owner: claim or rule, evidence item, source, date, status, uncertainty, specialist note, verify, reject, or request-more action.
Approval, exception, and launch readiness — authorized owners: decisions, conditions, blocker owner, due date, channel/content/supply status, go/no-go, and escalation.
Portfolio dashboard — merchandising operations leader: open submissions, age, category workload, completeness, blocker type, launch proximity, supplier effort, and drill-down.
E Representative mock data
Submission Supplier / product Status and important values Business issue
ONB-8101 Northstar Foods · Harvest Trail Granola · Packaged Food Requested launch 12 Oct 2026; 82% complete; allergen declaration missing; nutrition panel supplied Mandatory food evidence blocks compliance and assortment approval.
ONB-8102 Willow & Coast · CalmLeaf Hand Lotion · Personal Care Requested launch 28 Sep 2026; 91% complete; “48-hour moisture” claim conflicts across label and evidence Claim must be clarified and verified before approval.
ONB-8103 Hearthline Goods · WinterGlow Lantern Set · Seasonal Home Requested launch 20 Oct 2026; 76% complete; battery safety declaration and carton dimensions missing Seasonal date is near, but commercial urgency cannot remove mandatory blockers.
ONB-8104 Meadowlane Pantry · Garden Cup Soup · Packaged Food Requested launch 16 Nov 2026; 100% complete; category review pending 6 days; no compliance blocker Nearly ready submission is hidden in a high-workload category queue.
F Business rules and exceptions to show
Mandatory category and compliance evidence must be confirmed before assortment approval; launch urgency cannot override a mandatory blocker.
Supplier statements remain “supplier provided” until the responsible category or compliance owner verifies them.
Conflicting claims, ingredients, safety details, or packaging values require clarification and named human review before readiness can advance.
Category managers approve assortment fit; compliance owners approve mandatory evidence; neither approval substitutes for the other.
Exceptions require an authorized owner, rationale, expiry or condition, affected channels, and visible escalation; unresolved mandatory evidence cannot be excepted.
Smaller suppliers and non-standard products must have accessible guidance and assisted submission; unfamiliar format or supplier size must not lower priority or imply poor quality.
G Copyable AI prompts for Prototype v1
Use these as a starting point, then add your team’s decisions and preferred tool instructions.
Create Prototype v1 for Supplier and Product Onboarding using the scenario details above. Include supplier checklist, completeness and missing-information request, category review, compliance evidence review, approval/exception and launch readiness, and portfolio dashboard views with the stated personas, fields, rules, and sample submissions.
Copy prompt
Critique the Supplier and Product Onboarding Prototype v1 from the Chief Merchandising Officer perspective. Identify missing requirements for submission guidance, category workload, evidence, human approvals, exceptions, supplier effort, launch blockers, and measurable readiness.
Copy prompt
Create an as-is and to-be journey for Supplier and Product Onboarding, then produce a Prototype v1 acceptance checklist. Cover every persona, handoff, decision, exception, required view, field, interaction, representative case, business rule, success measure, and human-oversight boundary in the scenario context.
Copy prompt
Targeted outcomes / objectives
The engagement will align stakeholders on priority product onboarding journeys, readiness definitions, required evidence, and decision ownership.
The capability should guide suppliers and internal teams toward complete, reviewable submissions and clear resolution of missing or conflicting information.
The engagement will define category-specific policies, compliance reviews, exceptions, approvals, and handoffs needed for assortment readiness.
The capability should help category managers focus on material decisions while preserving accountability for product and launch approval.
The engagement will validate measures for cycle time, completeness, rework, review quality, supplier effort, readiness, and control adherence.
Initial scope assumptions
Begin with selected product categories and onboarding journeys.
Use customer-provided policies, examples, and descriptions of required information.
Keep compliance, category, and assortment approvals with authorized owners.
Prototype supplier collaboration, internal review, exception, and readiness views.
Success measures to define / validate
Submission completeness, clarification cycles, rework, and elapsed-time measures.
Review workload, decision turnaround, exception, and approval quality indicators.
Supplier effort, guidance clarity, response, and adoption measures.
Compliance evidence coverage, assortment readiness, blocker age, and launch handoff quality.
Clarify risks, constraints, dependencies, and responsible-AI questions
Category policy differences, evidence quality, supplier capability, ownership gaps, claim review, launch dependencies, and competing commercial deadlines.
How will uncertain, contradictory, or supplier-provided information be represented, verified, and escalated?
Could smaller suppliers, non-standard products, languages, or categories be unfairly disadvantaged by completeness or review expectations?
Which claims or evidence require specialist judgment, and how will decisions remain traceable and contestable?
Step 3 · Invite the tough questions
Refine Your Requirements
Great job—you have an amazing first prototype. Now put it in front of your project team and customer owner, invite the tough questions, and refine it with AI. Next, turn the validated experience into a BRD and an actionable backlog. Choose any format that works for your team.
Refinement flow
Demonstrate Prototype v1.
Customer owner introduces changes and decisions.
Update Prototype v2 and confirm the outcome and journey.
Record decisions, assumptions, open questions, and acceptance.
Generate the BRD and backlog from the validated prototype.

SOURCE EXTRACT: text lines 617-733
Customer owner Supplier and Product Onboarding
Executive sponsor: Chief Merchandising Officer
Customer feedback and change requests
Open only after Prototype v1 has been demonstrated.
Compliance constraint: A compliance owner says specified evidence must be confirmed before assortment approval; commercial urgency cannot override it. Add blocker, exception, ownership, and escalation requirements.
Supplier reality: Smaller suppliers cannot support repeated complex requests. Refine guidance, minimum viable submission, clarification, accessibility, and assisted onboarding without lowering mandatory standards.
Scope tension: Merchandising introduces a near-term seasonal assortment need across several categories. Decide whether to narrow the initial scope, phase category rules, or accept explicit readiness risk for SteerCo.
Use AI to shape the BRD and backlog
Ground every draft in the validated experience and team evidence. Human owners remain accountable for accuracy, priority, acceptance, and decisions.
Generate a Business Requirements Document for Supplier and Product Onboarding from Prototype v2, the source scenario and exported context, the customer feedback and change requests, and the decision log. Clearly separate verified facts, fictional exercise inputs, assumptions, decisions, and open questions. Attach or paste Prototype v2 or screenshots, the scenario context export, customer changes, and the decision log before generating.
Copy prompt
Generate a prioritized delivery backlog for Supplier and Product Onboarding, traced to the BRD and Prototype v2. Include epics, features, stories or equivalent items, acceptance criteria, example scenarios, dependencies, sequencing, non-functional and responsible-AI work, data/security/privacy needs, and open questions. Attach or paste Prototype v2 or screenshots, the scenario context export, customer changes, decision log, and BRD.
Copy prompt
Review the Supplier and Product Onboarding BRD and backlog for completeness, contradictions, missing exceptions, weak acceptance criteria, unowned dependencies, unsupported assumptions, responsible-AI gaps, and delivery-readiness risks. Propose precise corrections and preserve traceability to the prototype and customer decisions. Attach or paste Prototype v2 or screenshots, the scenario context export, customer changes, decision log, BRD, and backlog.
Copy prompt
BRD should cover
Executive summary, business objective, and intended outcomes.
Scope in/out and assumptions.
Stakeholders, personas, and user goals.
Current and target journeys/processes.
Functional requirements and business rules/exceptions.
Non-functional requirements: usability, accessibility, performance, resilience, and operability.
Information/data needs, readiness, quality, and ownership.
Security, privacy, compliance, responsible AI, and human oversight.
Dependencies and integration needs at an appropriate high level.
Risks, issues, assumptions, and constraints.
Success measures and acceptance criteria.
Decisions, open questions, and traceability to the prototype.
Backlog should cover
Epics, features, and user stories or an equivalent hierarchy.
Persona, user need, and business value.
Acceptance criteria and example scenarios.
Priorities and sequencing.
Dependencies and enablers.
Non-functional and operational-readiness items.
Data, security, privacy, and responsible-AI work.
Assumptions, open questions, and validation spikes.
Release/sprint placement and milestone linkage.
Definition of ready/done as appropriate.
Reference: Teams may refer to the Agent Delivery Playbook where available. Do not assume or invent its contents.
Step 4 · Lead with decisions
Create the SteerCo Pitch
Wow—you have accomplished a lot, quickly. It is time to show the SteerCo what is clear, what is ready, and where you need decisions. Capture the essentials below, then let AI help you turn them into a sharp leadership deck.
Enable decisions, not a replay
The SteerCo presentation should enable decisions, not repeat every Sprint 0 detail. Keep the storyline concise, evidence-led, and explicit about recommendations, ownership, and asks.
Current scenario:
SteerCo readiness summary
0 of 7 capture sections have content.
Still needed: all seven sections.
Progress and evidence
What was completed, prototype status, customer workshops and decisions, and supporting evidence.
AI draft + human validation
Progress and evidence notes
Agreed business outcome and scope
Outcome, success measures, in scope, out of scope, and acceptance.
Enter manually
Agreed business outcome and scope notes
Prototype and customer feedback
What the prototype demonstrated, changes requested, and how Prototype v2 responded.
AI draft + human validation
Prototype and customer feedback notes
Key epics and features
Top backlog items, value, sequence, and dependencies.
Use AI
Key epics and features notes
Risks, assumptions and dependencies
Top RAID and responsible-AI items, impact, mitigation, owner, and decision date.
AI draft + human ownership
Risks, assumptions and dependencies notes
Milestone/release/sprint plan
Major phases, sprints or releases, milestones, dependencies, and readiness gates.
AI draft + human validation
Milestone/release/sprint plan notes
Decisions and asks
Decisions needed, options, recommendation, owner, and due date.
Enter manually
Decisions and asks notes
Suggested 6–7 slide deck
Business outcome, scope and success measures.
Sprint 0 progress and prototype evidence.
Customer feedback, validated requirements and key decisions.
Key epics/features and backlog traceability.
Delivery approach, releases/sprints, milestones and optimization.
Risks, assumptions, dependencies, governance and responsible AI.
Decisions/asks and immediate next steps.
Copyable deck prompts
Copy prompt
Copy prompt
Evaluation
100-point rubric
Connect customer evidence and decisions across every artifact.
Business outcome and prototype fit
Outcome, scenario, journey, and prototype usefulness.
20 points
Requirements completeness and customer alignment
Coverage, changes, decisions, exceptions, and acceptance.
20 points
BRD/backlog quality and traceability
Priority, acceptance, dependencies, questions, and links.
20 points
Sprint 0 readiness, plan, governance and risk coverage
Sequencing, assumptions, governance, RAID, and onboarding.
20 points
Optimization, SteerCo clarity and responsible AI
Productivity, executive clarity, asks, safety, and oversight.
20 points
Total: 100 points
Facilitator note: only three or four teams may present; every team must be ready.
Previous Next
Reset wizard notes
Privacy: activity notes stay in the current browser, and exports are downloaded locally.
Sprint 0 finish line
Make the next team faster because your decisions are clearer.
A strong result is a transparent, customer-validated foundation that makes scope, work, uncertainty, ownership, controls, and next decisions visible.
Ready for the larger delivery team to onboard
Contoso Retail and all scenario content are fictional, illustrative exercise assumptions for delivery immersion learning. No business benefit, performance change, or implementation commitment is implied.



===== FILE: steerco-pitch.pptx =====
===== TYPE: .pptx (signature D0-CF-11-E0-A1-B1-1A-E1) =====
===== SECTIONS DETECTED: 7 slides (legacy PowerPoint, COM extraction) =====

----- SLIDE 1 -----
01  /  OUTCOME & SCOPE
Fewer loops. Clearer decisions. No weaker controls.
Supplier and ProductOnboarding
Agree controls and scope first.Then validate a safer route tohuman decisions, with fewer loops.
59%
Complete at first review
75% proposed hypothesis
2.7
Clarification cycles
≤2.0 proposed hypothesis
18
Business days to decision
≤14 proposed hypothesis
PROTOTYPE: ALL THREE CATEGORIES
Recommend Packaged Food implementation pilot;gated Seasonal Home → Personal Care expansion.
Scope: prepare, prototype, specify, estimate and govern.Not in scope: production, live AI, integration,migration, rollout or final production acceptance.
7 Sep 2026  |  DRAFT FOR STEERCO
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: challenge, SOW and onboarding A/C • Brief K01–K03, scope/boundaries • Capture: outcome & scope
1 / 7
  [Speaker notes] [50 seconds] The decision-led thesis is fewer clarification loops without weaker evidence or human accountability. The fictional baseline is 59 percent complete at first review, 2.7 correction rounds and 18 business days to assortment decision. The proposed 75 percent, two rounds and fourteen days are pilot hypotheses, to be ratified only after cohort-level baseline work. K04 separates evidence presence at first review (68 percent) from the control of 100 percent verified mandatory evidence at approval; its proposed presence target is 90 percent. K05 is 11 blocked of 19 launches within three weeks, with a reduction target pending D8. K06 supplier effort is 4.2 hours, proposed at most three. All three categories remain in the prototype. Only the initial implementation pilot is recommended to narrow. Evidence definitions and denominators live in delivery-control-workbook.xlsx and business-requirements.docx.

Provenance: contoso-retail-delivery-challenge.html, SOW lines 1777–1789 and onboarding A/C lines 2447–2493; delivery-brief.json metrics K01–K06.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 1

----- SLIDE 2 -----
02  /  PROGRESS & EVIDENCE
Prepared for a workshop — not accepted by a customer
PREPARED: v1/v2, BRD, BACKLOG & CONTROL PACK
PENDING: WORKSHOP, POLICY, ACCEPTANCE & CAPACITY
Prototype mock-up workflow • six views • no live AI or production authentication
V01
Supplier checklist
›
V02
Clarification
›
V03
Category review
›
V04
Compliance evidence
›
V05
Approval and launch
›
V06
Portfolio
ONB-8101 · Northstar Foods
Harvest Trail Granola · Packaged Food12 Oct 2026 • 82% completeAllergen declaration missing; nutrition panel supplied.
ONB-8102 · Willow & Coast
CalmLeaf Hand Lotion · Personal Care28 Sep 2026 • 91% complete“48-hour moisture” claim conflicts across label/evidence.
ONB-8103 · Hearthline Goods
WinterGlow Lantern Set · Seasonal Home20 Oct 2026 • 76% completeBattery safety declaration and carton dimensions missing.
ONB-8104 · Meadowlane Pantry
Garden Cup Soup · Packaged Food16 Nov 2026 • 100% completeCategory review pending 6 days; no compliance blocker.
Four source mock cases • requested dates are not production promises • customer validation has not occurred
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: challenge onboarding D/E • Evidence: prototype-v1.html and prototype-v2.html • Capture: progress & evidence
2 / 7
  [Speaker notes] [55 seconds] These are prepared exercise artefacts, not customer-accepted outputs. The diagram is a designed prototype mock-up, not a screenshot or validated customer evidence. Demonstrate the six local views: supplier checklist, clarification, category review, compliance evidence, approval and launch, and portfolio. Northstar demonstrates a missing allergen blocker; Willow and Coast a conflicting claim; Hearthline mandatory safety evidence plus packaging gaps; Meadowlane a complete item still waiting six days for category review. Preserve the original dates and completeness values; do not interpret completeness as compliance. Use prototype-v1.html for the first conversation and prototype-v2.html for the proposed response. business-requirements.docx holds requirements; workshop-and-delivery-handbook.docx holds the workshop and acceptance plan; delivery-control-workbook.xlsx holds traceability and delivery controls. No test pass rate or customer validation result is claimed.

Provenance: challenge onboarding D/E lines 2495–2518; canonical brief views V01–V06 and deliverable filenames.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 2

----- SLIDE 3 -----
03  /  CHANGE RESPONSE
Three source changes. Three proposed decisions.
CR01 → D01
Mandatory evidence
Source: urgency cannot overridespecified compliance evidence.
v2: distinct category, complianceand assortment decisions;launch is a separate gate.
CR02 → D02
Supplier reality
Source: smaller suppliers cannotsustain repeated complex requests.
v2: save / submit incompleteintake for triage; assisted path,consolidated corrections.
CR03 → D03
Seasonal scope tension
Source: near-term assortmentneed spans several categories.
v2: prototype all three; pilotPackaged Food, then gatedcategory rules. Escalate dates.
GUARDRAILS CARRIED THROUGH v2
D04 · Bounded exceptions
Non-mandatory only; authorized owner,rationale, condition / expiry, channels,and escalation. Expiry blocks clearance.
D05 · Fair review queue
Risk, launch proximity and age —never supplier size or format.Highlight nearly ready aged items.
D06 · Verified evidence
Keep provenance and versions.Changes revoke verification andapprovals. AI never approves.
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: challenge onboarding F and three change requests • Brief CR01–CR03 / D01–D06 • Capture: prototype & feedback
3 / 7
  [Speaker notes] [55 seconds] These changes are scripted source exercise inputs, not feedback gathered from an actual workshop. D01 makes mandatory evidence non-exceptionable and distinguishes category, compliance, assortment and launch decisions. D02 permits incomplete minimum intake to enter triage, not to pass approval: smaller suppliers receive accessible guidance and assistance without changing mandatory standards. D03 is our recommendation, not an approved decision: narrow the implementation pilot to Packaged Food, retain all categories in the prototype, and fund or explicitly accept the seasonal timing risk. D04 governs non-mandatory exceptions with owner, rationale, condition or expiry, affected channels and escalation. D05 avoids supplier-size or format penalties. D06 retains provenance, exposes uncertainty and invalidates verification plus dependent approvals after changed evidence. Review proposed responses in prototype-v2.html alongside business-requirements.docx and the decision log in delivery-control-workbook.xlsx.

Provenance: challenge lines 2520–2529 and 2595–2599; brief decisions D01–D06.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 3

----- SLIDE 4 -----
04  /  TRACEABLE DELIVERY
Six epics connect business value to controls
EP06 · Discover & expand
Resolve policy / system uncertainty;qualify category rules before expansion.
US19–21 / EN01–03 → V04–06D01 / D03 / D07 · S0; US22–23 → S3–4
EP05 · Trust & service readiness
Protect evidence, access and fairness;make AI uncertainty contestable.
US13 / NFR01 → V01 / D01US15 / NFR03 → V04 / D06
EP01 · Supplier collaboration
Guide minimum intake and combinecorrections to reduce supplier effort.
US01 / FR01 → V01 / D02US02 / FR02 → V02 / D02
EP02 · Category decisions
Expose queue reasoning; keep fitrecommendation with category owners.
US04 / FR04 → V06 / D05US05 / FR05 → V03 / D01
EP03 · Evidence & approvals
Verify sources; separate decisions;revoke approvals when evidence changes.
US06 / FR06 → V04 / D06US08 / FR08 → V05 / D01
EP04 · Launch & portfolio
Make handoff blockers visible;measure cycle time and supplier effort.
US10 / FR10 → V05 / D01US11 / FR11 → V06 / D07
DEPENDENCY LOGIC  Discovery → trust + intake → review + evidence → launch gate → category expansion
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: brief EP01–EP06 and US/FR/NFR/EN/V/D mapping • Full chain: delivery-control-workbook.xlsx • Capture: epics & features
4 / 7
  [Speaker notes] [50 seconds] Read this as a dependency sequence, not six independent projects. EP06 first resolves policy, data and integration ownership; EP05 trust foundations and EP01 supplier collaboration enable safe intake. EP02 and EP03 combine review and verified evidence, and EP04 separates launch handoff from assortment decision and measures the outcome. EP06 then requalifies Seasonal Home and Personal Care rather than assuming food rules transfer unchanged. The displayed mappings are selected exact canonical IDs. Every story maps to a requirement, view and decision in delivery-control-workbook.xlsx, with requirements and acceptance criteria in business-requirements.docx. Identity and secure evidence are implementation work, not claims that the local HTML has real authentication. All estimates are relative points, not hours.

Exact canonical estimate ledger:
US01 EP01/FR01 → V01/D02: 5 SP, S1, Must
US02 EP01/FR02 → V02/D02: 5 SP, S1, Must
US03 EP01/FR03 → V01/D02: 3 SP, S1, Must
US04 EP02/FR04 → V06/D05: 5 SP, S2, Must
US05 EP02/FR05 → V03/D01: 5 SP, S2, Must
US06 EP03/FR06 → V04/D06: 8 SP, S2, Must
US07 EP03/FR07 → V04/D06: 5 SP, S2, Must
US08 EP03/FR08 → V05/D01: 5 SP, S2, Must
US09 EP03/FR09 → V05/D04: 5 SP, S2, Must
US10 EP04/FR10 → V05/D01: 5 SP, S2, Must
US11 EP04/FR11 → V06/D07: 3 SP, S2, Should
US12 EP03/FR12 → V04/D06: 5 SP, S2, Must
US13 EP05/NFR01 → V01/D01: 5 SP, S1, Must
US14 EP05/NFR02 → V04/D06: 3 SP, S1, Must
US15 EP05/NFR03 → V04/D06: 5 SP, S2, Must
US16 EP05/NFR04 → V01/D02: 3 SP, S2, Must
US17 EP05/NFR05 → V05/D01: 5 SP, S2, Must
US18 EP05/NFR06 → V06/D07: 3 SP, S2, Must
US19 EP06/EN01 → V04/D01: 3 SP, S0, Must
US20 EP06/EN02 → V05/D03: 3 SP, S0, Must
US21 EP06/EN03 → V06/D07: 3 SP, S0, Must
US22 EP06/EN04 → V01/D03: 5 SP, S3, Should
US23 EP06/EN05 → V04/D03: 5 SP, S4, Should
US24 EP06/EN06 → V06/D03: 2 SP, S0, Must

Provenance: delivery-brief.json epics and stories, with traceability in delivery-control-workbook.xlsx and business-requirements.docx.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 4

----- SLIDE 5 -----
05  /  INDICATIVE PLAN
Gate readiness — do not confuse points with capacity
SPRINT 0 · TEN RELATIVE BUSINESS DAYS · PLANNED, NOT ELAPSED
D1–D2
Policies + owners
D3–D4
v1 → v2 + controls
D5–D6
Scope + BRD
D7–D8
Estimate + baseline
D9–D10
Acceptance → G0
PLACEMENT: S0 11 SP + S1–S4 93 SP = 104 SP / 24 STORIES
21 SP
S1
Trust + intake
62 SP
S2
Pilot candidate
5 SP
S3
Seasonal Home
5 SP
S4
Personal Care
S2 PLACEMENT OVERLOAD
62 SP — almost 3× S1; capacity unvalidated.Dependency buckets, not a schedule.
Sensitivity only: at a hypothetical 20–30 SPper bucket, S2 alone needs 3–4 buckets.Re-estimate after spikes; staffing unconfirmed.
No committed production delivery by seasonal dates.
G0 D10: accepted direction + staffed estimate  →  G1 after S2: controls, UAT, operations + human sign-off
G2/G3: approved category rules + regression • Optimize consolidated requests and reusable rules; measure cycle time.
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: brief planning, exact US estimates and gates • S3/S4 provisional • Handbook + workbook • Capture: milestone / sprint plan
5 / 7
  [Speaker notes] [65 seconds] The two-week Sprint 0 is a proposed D1–D10 cadence; it has not already elapsed. Total effort is 104 points: S0 eleven, S1 twenty-one, S2 sixty-two, S3 five and S4 five. The 93 points beyond S0 are not a feasible four-sprint commitment. S2 contains thirteen stories and almost three times the S1 placement. To make uncertainty tangible, a hypothetical throughput of twenty to thirty points per bucket would require three to four buckets for S2 alone, before considering dependencies. That is sensitivity arithmetic, not a staffed capacity assumption. Proposed core: Product Owner, delivery lead, BA, UX/accessibility, technical lead, two engineers and QA, with part-time compliance, security, data and supplier operations; funding and availability are pending. G0 needs policy/data owners, accepted direction, traceable backlog, staffed re-estimate and RAID decisions. G1 follows the S2 bucket only if controls, UAT, operational readiness and human sign-off pass. G2/G3 require approved category rules and regression. Optimize reusable rules and consolidated corrections while preserving human verification and measuring actual cycle time.

Provenance: brief planning and US01–US24; totals computed from canonical stories. Calculation: ceil(62/30)=3 and ceil(62/20)=4. Planning evidence: workshop-and-delivery-handbook.docx and delivery-control-workbook.xlsx.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 5

----- SLIDE 6 -----
06  /  RAID & GOVERNANCE
Protect the decision chain before scaling the workflow
RISK · Seasonal timing
28 Sep is 21 calendar days from 7 Sep.Escalate dates; no production promise.
CMOD5
DEPENDENCY · Policy / data
Mandatory rules / evidence owners unconfirmed.Confirm owners; hold approval until verified.
Compliance ownerD2
ASSUMPTION · Capacity / systems
Staffing and system contracts are unknown.Run spikes; fund and rebalance S2.
Delivery lead +technical lead · D8
ISSUE · Acceptance not obtained
Workshop and baseline remain pending.Validate cohorts, supplier effort and acceptance.
Product OwnerD10
AI assists.Humans decide.
Secure, isolated evidence.Visible source + uncertainty.Human verification.Contest with named owner.No size / format penalty.AI cannot approve.
Changed evidence revokes verificationand dependent approvals.
GOVERNANCE  Daily delivery huddle • twice-weekly policy / design review • D5 scope escalation • D10 G0 review
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: challenge onboarding F / risks + brief D01–D07 • Owners proposed, dates relative to Sprint 0 • Capture: RAID & RAI
6 / 7
  [Speaker notes] [55 seconds] All owners are proposed roles and D dates are relative Sprint 0 due dates. The most acute timing tension is Willow and Coast on 28 September, exactly 21 calendar days after the 7 September reference date; Northstar is 12 October, Hearthline 20 October and Meadowlane 16 November. None is a promised production milestone. Compliance confirms mandatory evidence and named human ownership. Delivery and technical leads validate availability, integration ownership and estimates, rather than assuming our S2 bucket is achievable. The Product Owner must obtain baseline evidence, supplier-cohort feedback and business acceptance. Governance is proposed: daily delivery huddle, twice-weekly policy/design decisions, scope escalation at D5 and G0 at D10; material mandatory-control risk escalates immediately to compliance, then sponsor if unresolved. Production design must provide secure evidence, supplier isolation, provenance, uncertainty and contestability; local role switching is only a simulation. AI drafts, summarizes and highlights but never verifies, approves, excepts or authorizes launch.

Provenance: challenge risks lines 2562–2569 and source rules F; canonical brief decisions, boundaries and seasonalRisk; governance and RAID evidence in workshop-and-delivery-handbook.docx and delivery-control-workbook.xlsx.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 6

----- SLIDE 7 -----
07  /  DECISIONS & ASKS
Four decisions unlock a credible handoff
PENDING — NO APPROVAL OR RELEASE COMMITMENT
D2 · Mandatory controls
D01 / D04 / D06
Options: enforce verified mandatory evidence;or defer approval pending policy clarification.Recommend: enforce; no urgency override.
Accountable: Compliance owner
D5 · Pilot scope + seasonal risk
D03
Options: phase categories; or fund multi-categoryre-estimation (no date guarantee).Recommend: Packaged Food; escalate seasonal risk.
Accountable: Chief Merchandising Officer
D8 · Staff capacity + re-estimate
G0 CAPACITY
Options: fund a staffed core and rebalance;or defer implementation commitment.Recommend: validate availability; re-estimate S2.
Accountable: Delivery lead; sponsor funds
D10 · Baseline + acceptance
D07 / G0
Options: accept evidenced direction and measures;or extend discovery if evidence is incomplete.Recommend: accept only against G0 criteria.
Accountable: Product Owner
IMMEDIATE NEXT STEPS
Convene owners → demo four cases → log decisions → validate measures + capacity → review G0
AI-authored exercise preparation • Fictional inputs • All approvals pending
Source: brief D01–D07 and G0 • D07 baseline decision due D8; consolidated acceptance ask D10 • Capture: decisions & asks
7 / 7
  [Speaker notes] [55 seconds] Ask SteerCo for choices, not retrospective approval of work that has not happened. By relative D2, compliance should enforce verified mandatory evidence or hold approval while policy is clarified; bypass is not an acceptable option. By D5, the CMO chooses the recommended Packaged Food pilot with gated Seasonal Home and Personal Care, explicitly accepting seasonal timing risk, or funds multi-category re-estimation without a date guarantee. By D8, the delivery lead obtains staffed availability and a rebalanced estimate, with sponsor funding; otherwise defer an implementation commitment. By D10, the Product Owner accepts only an evidenced G0 package or extends discovery. D07 baseline and target validation is due D8, then enters the consolidated D10 acceptance decision; D2/D5/D8/D10 are relative days, not decision identifiers. Next, convene the accountable owners, walk the four mock cases, record decisions, validate baseline and capacity, and review G0. The decision log lives in delivery-control-workbook.xlsx. Approval status remains pending.

Provenance: canonical brief decision and gate records; source seven SteerCo capture sections; business-requirements.docx, workshop-and-delivery-handbook.docx and delivery-control-workbook.xlsx.

This is AI-authored exercise preparation, not evidence of elapsed Sprint 0. All source facts are fictional. Customer workshop, business-owner acceptance, policy confirmation, staffed capacity validation and SteerCo decisions remain pending. Targets are hypotheses, not commitments. 
  [Speaker notes] 7

===== FILE: steerco-readiness-summary.txt =====
===== TYPE: .txt (signature 53-54-45-45-52-43-4F-20) =====
===== SECTIONS DETECTED: plain text, 89 lines (cite by line number) =====
STEERCO READINESS CAPTURE - SUPPLIER AND PRODUCT ONBOARDING
Prepared 7 September 2026 / Fictional exercise / Customer ratification pending

Use these seven sections in the challenge's SteerCo capture form.
These notes describe prepared artefacts and proposals, not a completed customer workshop.

1. PROGRESS AND EVIDENCE

Prepared: a six-view Prototype v1 and refined Prototype v2 containing ONB-8101 through ONB-8104; the BRD; workshop and delivery handbook; a 24-story delivery control workbook; and a seven-slide SteerCo pitch. Source requirements and the three customer changes are retained in source-context.txt.

Prototype evidence: local interactive journeys for supplier intake, clarification, category review, compliance evidence, distinct approvals and launch readiness, and portfolio decisions. A deterministic rule engine stands in for AI. No live model, production integration or supplier messaging is implemented. Technical simulation evidence is separate from business acceptance.

Still pending: actual business-owner demonstration, workshop decisions, confirmed customer policies and data, signed acceptance, staffed re-estimation and SteerCo approval. A simulated critique is a preparation aid, not proof of customer agreement.

2. BUSINESS OUTCOME AND PROPOSED SCOPE

Outcome: improve submission completeness, reduce avoidable supplier rework, focus category and compliance review, and expose the true blockers to assortment and launch decisions.

Source fictional baselines: 59% complete at first review; 2.7 clarification cycles; 18 business days median to assortment decision; 68% mandatory evidence presence at first review; 4.2 hours supplier clarification effort; 11 of 19 products inside three weeks of requested launch have open blockers.

Proposed pilot hypotheses, subject to D07: 75% complete at first review, at most 2.0 clarification cycles, at most 14 business days median decision time, 90% evidence presence at first review and at most 3 hours supplier effort. Verification of all mandatory evidence before approval is a control, not an improvement target to trade away.

Prototype scope: all three source categories and four supplied records. Proposed implementation scope: Packaged Food pilot, then gated Seasonal Home and Personal Care. Out of scope for Sprint 0: production deployment, full integrations, migration, operational rollout and final production acceptance.

3. PROTOTYPE AND CUSTOMER FEEDBACK

CR01: specified mandatory evidence must be confirmed before assortment approval; urgency cannot override it.
Response: D01/D04/D06; separate category and compliance approvals, source/version-sensitive verification, non-waivable mandatory evidence, bounded non-mandatory exceptions, owner-based escalation and a separate launch gate.

CR02: smaller suppliers cannot sustain repeated complex requests.
Response: D02/D05; minimum viable triage intake, accessible guidance, assisted submission and a single open consolidated correction round in v2. Mandatory standards remain unchanged. Supplier size and unfamiliar formats do not reduce review priority.

CR03: near-term seasonal demand spans multiple categories.
Response: D03; prototype broadly but recommend phased implementation. SteerCo must explicitly accept timing risk or fund a revised plan after discovery. The original 28 Sep, 12 Oct, 20 Oct and 16 Nov requested launches are not delivery promises.

The three change requests are source inputs. D01-D07 are proposed exercise decisions, not customer-ratified decisions.

4. KEY EPICS AND FEATURES

EP01 Supplier collaboration: US01-US03; category intake, consolidated corrections and assisted support.
EP02 Category decisions: US04-US05; explainable workload queue and accountable assortment-fit decision.
EP03 Evidence and governed approvals: US06-US09 and US12; source-linked review, version invalidation, distinct gates, bounded exceptions, audit and contest.
EP04 Launch and portfolio: US10-US11; readiness by channel and operational measures.
EP05 Trust and service readiness: US13-US18; identity/isolation, privacy, responsible-AI evaluation, accessibility, resilience, support and adoption.
EP06 Discovery and phased expansion: US19-US24; policies, system ownership, baselines, category rule packs and handoff.

Traceability is carried by FR/NFR/EN requirement IDs, US story IDs, V01-V06 prototype views, D01-D07 proposed decisions and acceptance cases. Prototype links for NFR/enabler stories denote the affected experience, not a production implementation.

5. RISKS, ASSUMPTIONS AND DEPENDENCIES

Mandatory evidence/policy ambiguity: Compliance owner to confirm rule packs and required verification at D2; absent confirmation blocks readiness.
Seasonal scope pressure: Chief Merchandising Officer to decide phased pilot versus funded re-estimate at D5; never waive mandatory evidence.
Supplier burden and accessibility: Supplier experience lead to validate plain-language and assisted intake at D3; preserve equivalent standards.
Unconfirmed system/data ownership: Technical lead and data owner to identify authoritative sources and interface contracts through discovery; no vendor assumed.
Capacity concentration: Delivery lead to re-estimate and rebalance the 62-point S2 bucket at D8; no commitment before staffed capacity is credible.
Untrusted supplier content and unsupported AI claims: Compliance/security/AI leads own provenance, human verification, injection evaluation and manual fallback before pilot release.

Governance: Product Owner owns value and acceptance; delivery lead owns plan/RAID; compliance owns mandatory policy; category owns assortment fit; assortment approver owns final decisions; channel owners confirm readiness. Daily core-team working review, regular customer decision sessions and D10 SteerCo are proposed. Named individuals and service expectations require confirmation.

6. MILESTONE / RELEASE / SPRINT PLAN

Sprint 0 is ten relative business days, not a claim that work has already elapsed.
D1-D2: scope, outcomes, policies, source examples and accountable owners.
D3-D4: v1 walkthrough, simulated critique preparation, real customer feedback session and proposed decisions.
D5-D6: v2 refinement, BRD and traceability.
D7-D8: backlog, evaluation design, staffing and capacity re-estimate.
D9-D10: acceptance review, explicit open-risk decisions, SteerCo and handoff.

Canonical relative estimates total 104 points: S0 11; S1 21; S2 62; S3 5; S4 5.
S1-S2 indicate Packaged Food dependency placement; S3 Seasonal Home; S4 Personal Care. Two-week bucket lengths are planning assumptions only. The S2 concentration is not capacity-validated. Points are not hours and cannot substantiate calendar commitments.

G0 at D10 requires accepted prototype direction, confirmed policies/owners, traceable requirements and backlog, staffed re-estimation and recorded risk decisions.
G1 requires controls, customer UAT and operational readiness before any pilot release.
G2/G3 category expansion requires approved rule packs and regression evidence.

Optimization: consolidate supplier follow-up, reuse category rule structures, focus review on material blockers and automate preparation rather than approval. Measure net effort and quality by category and supplier cohort; do not promise benefits.

7. DECISIONS AND ASKS

Mandatory controls: endorse the no-waiver policy and independent decision owners, or defer readiness until policy is resolved. Recommend endorsement. Accountable owner: Compliance owner. Due: D2.

Scope and seasonal timing: choose the recommended Packaged Food pilot with explicit seasonal timing risk; alternatively commission a funded multi-category re-estimate. Do not approve unsupported dates. Accountable owner: Chief Merchandising Officer. Due: D5.

Staffing and capacity: confirm available roles and rebalance the indicative backlog, or defer release commitments. Recommend a staffed re-estimate rather than accepting the overloaded S2 bucket. Accountable owner: Delivery lead with sponsor funding authority. Due: D8.

Measures and acceptance: ratify definitions, baseline samples and proposed targets at D8; record business acceptance and remaining conditions at D10. Accountable owner: Product Owner with domain owners.

All asks remain pending. Immediate proposed action is to run the customer walkthrough with prototype and policy examples, not to authorize production deployment.


===== FILE: workshop-and-delivery-handbook.docx =====
===== TYPE: .docx (signature D0-CF-11-E0-A1-B1-1A-E1) =====
===== SECTIONS DETECTED: legacy Word document (COM extraction) =====
DELIVERY FOUNDATION  /  07 SEPTEMBER 2026
Workshop & Delivery Handbook
Runnable walkthroughs, decision preparation and gated delivery
Working package
Status

Scenario
Supplier and Product Onboarding

Audience
Business owners, delivery team and SteerCo

Maturity
AI-authored preparation; customer workshop NOT held

Decisions
D01–D07 proposed; awaiting ratification

Plan
S0 relative D1–D10; S1–S4 provisional; S2 overloaded

Acceptance
Business-owner and production signoff pending

Prototype all three categories and all four supplied cases. Recommend Packaged Food as the initial implementation pilot, then gated Seasonal Home and Personal Care rule packs. Seasonal pressure is explicitly escalated; do not imply a production commitment to the supplied launch dates.
Local prototypes show all three categories and all four supplied records. No real AI, identity, supplier messaging, integration or production deployment is included.
Contents and reading guide
Use the section numbers below to navigate. Stable FR/NFR/EN, US, V, D and TC IDs connect this document to the editable delivery-control-workbook.xlsx.
01  How to use this delivery package
02  Proposed workshop agenda and capture protocol
03  Prototype v1 six-view walkthrough
04  Simulated CMO critique and change rationale
05  Decision log for ratification
06  Assumptions and open questions
07  V1 acceptance checklist — pending
08  V2 business UAT and implementation test script
09  Detailed relative two-week Sprint 0 plan
10  Releases, estimation uncertainty and capacity sensitivity
11  Governance, RACI, RAID and change control
12  Definition of Ready and Definition of Done
13  Operational runbook and incident response
14  Adoption, training, support and optimization
15  Handoff, finish line and acceptance record
Source basis: supplied contoso-retail-delivery-challenge.html, selected Supplier and Product Onboarding scenario, shared SoW and artifact requirements; canonical delivery brief dated 2026-09-07. Source inputs are fictional, not observed customer facts. Added policies, targets and dates are proposed or unknown.
01  How to use this delivery package
Fictional exercise; AI-authored working package. Customer workshop, business-owner acceptance, policy confirmation and SteerCo decisions are pending. No real customer validation or production deployment has occurred. No live AI, external service, actual supplier messaging, production identity, system integration, rollout, migration or final production acceptance. HTML is a local interactive simulation with mock role switching, not authentication. All added policy thresholds, channels, evidence dates, prices, owner names and record ages are illustrative assumptions.
This is a runnable workshop and delivery preparation guide, not minutes of a workshop. All attendee names, business verdicts, dates of actual sessions and signature fields remain blank/pending. The CMO critique is simulated analytical preparation.
Files: open prototype-v1.html and prototype-v2.html locally in a modern browser. Use business-requirements.docx for rules and trace; delivery-control-workbook.xlsx as the editable planning/control register; steerco-pitch.pptx for sponsor decisions. The prototype is local and uses mock role switching—not authentication, a backend, real AI or actual supplier messaging.
Facilitator preparation: make a copy of the package; open both prototypes; identify the current record and mock role; use the prototype Reset control if provided or reload a clean demo state; confirm four sample records and six views. Use fictional sample information only. If a control differs, follow its on-screen label rather than assume production behavior.
Safety instruction: announce which values are source inputs versus proposed additions. Do not add real supplier evidence or credentials. Draft/save/submit, clarification, approval and exception interactions simulate local state only. All three categories are represented even though the recommended implementation pilot is Packaged Food.
Exercise sample
Source state
Demo objective

ONB-8101 — Northstar Foods / Harvest Trail Granola
Packaged Food; 12 Oct 2026; 82% complete. Allergen declaration missing; nutrition panel supplied
Mandatory evidence blocks compliance and assortment approval.

ONB-8102 — Willow & Coast / CalmLeaf Hand Lotion
Personal Care; 28 Sep 2026; 91% complete. “48-hour moisture” claim conflicts across label and evidence
Clarify and verify claim; never infer compliance from 91% completeness.

ONB-8103 — Hearthline Goods / WinterGlow Lantern Set
Seasonal Home; 20 Oct 2026; 76% complete. Battery safety declaration and carton dimensions missing
Urgency cannot remove mandatory blockers; downstream packaging readiness remains separate.

ONB-8104 — Meadowlane Pantry / Garden Cup Soup
Packaged Food; 16 Nov 2026; 100% complete. Category review pending 6 days; no compliance blocker
Complete is not category-approved, assortment-approved or launch-ready.


02  Proposed workshop agenda and capture protocol
Proposed 90-minute working session for Sprint 0 D3, with later D4/D5/D8 decisions. Invite role holders for supplier, category, compliance, content/channel, operations, assortment approval, Product Owner and delivery lead; actual participants have not been identified.
Minutes
Activity / facilitator
Capture / exit

0–10
PO and BA: outcomes, SoW boundaries, source assumptions
Confirm or amend scope, personas and acceptance owners; unknowns remain open

10–30
UX: v1 six-view walkthrough with four records
Record observed behavior, pain points and v1 checklist; no implied acceptance

30–45
Business role-play: simulated CMO critique; introduce source CR01–CR03
Capture proposed response and unresolved trade-offs without invented customer quotes

45–65
BA/technical lead: v2 response and replay controls
Trace CR→D→FR/US/TC; capture exceptions and operational gaps

65–80
PO/QA: business UAT examples, success measures and plan
Review K04 distinction, supplier effort, S2 load and decision options

80–90
Delivery lead: decisions/actions/acceptance route
Assign actual owner/date only after confirmation; record pending/accepted/conditional/rejected honestly


Actual session record — Date/time: __________; facilitator: __________; attendees and represented roles: __________; artifacts/versions: __________; observations: __________; decisions ratified: __________; dissent/conditions: __________; follow-up owners/dates: __________. Status: NOT HELD / PENDING.
03  Prototype v1 six-view walkthrough
View / mock role
Runnable action and sample
Expected discussion / evidence

V01 Supplier checklist / supplier
Open Northstar; inspect product/category, required fields/evidence, owner and 82% completeness; save draft, inspect submit/guidance/assisted-support controls. Switch to Hearthline, Willow & Coast and Meadowlane to compare categories.
Record minimum viable intake behavior, missing allergen, safety/dimensions and claim evidence. Do not assume 100% means approved. TC01/03

V02 Clarification / operations then supplier
Open Northstar missing evidence; inspect section readiness, blocker, requested correction, owner, due, response and resubmit; compare Willow & Coast conflicting claim.
Record whether one consolidated round preserves response/version history and clearly names the conflict. TC02

V03 Category review / category manager
Open Meadowlane: 100% complete, no compliance blocker, category pending six days. Inspect customer need, comparison, commercial facts/unknowns, requested launch and recommend/return actions.
Capture whether queue/fit recommendation differs from final approval and whether unknown facts are explicit. TC04/05

V04 Compliance evidence / compliance owner
Open Willow & Coast's 48-hour moisture claim; compare label and evidence. Inspect source/date/status/uncertainty/specialist note; request more rather than assume verified. Then inspect Northstar missing allergen and Hearthline battery safety.
Record named reviewer, provenance, mandatory blocker and changed-version behavior; AI cannot approve. TC06/07/12

V05 Approval and launch / approver then channel owner
Try to progress Northstar and Hearthline with mandatory gaps; inspect exception/owner/condition/due/escalation. Open Meadowlane and distinguish category, compliance, assortment and channel/content/supply readiness.
Record denial of mandatory overrides; separate launch no-go and missing handoff prerequisites. TC08/09/10

V06 Portfolio / operations
Filter all three categories; drill into all four records, review workload, completeness, blocker types, launch proximity, supplier effort and aged nearly-ready Meadowlane.
Record queue explanation and source baselines; 68% is first-review presence, not approval verification. TC04/11


V1 evidence capture: for each action record actual result, screenshot/reference, discrepancy, observer and follow-up. No v1 result is pre-marked accepted. If a stateful action changes sample data, restore the demo before the next observer.
04  Simulated CMO critique and change rationale
SIMULATED CMO CRITIQUE — Prepared by AI for role-play; not customer quotations or actual feedback. A polished completeness score risks hiding mandatory blockers. Supplier follow-up must be simpler without weakening standards. Category managers need an aged, nearly-ready queue as well as urgency. Commercial requests across categories require an explicit scope/timing decision. Approval, launch, source confidence, exception expiry and accountable handoffs must be visibly distinct.
Source change request
Proposed decisions
Proposed v2 response / trace

CR01 — Compliance constraint: specified evidence confirmed before assortment; urgency cannot override; add blockers, ownership, exception and escalation
D01; D04; D06
V03–V05 separate human gates; source/version verification, stale invalidation, bounded non-mandatory exceptions and audit/contest. FR05–FR10/FR12; US05–10/12–15/17; TC05–10/12–15/17

CR02 — Supplier reality: smaller suppliers cannot support repeated complex requests; improve minimum intake, guidance, clarification, accessibility and assistance
D02; D05; D07
V01/V02 incomplete triage and consolidated correction; V06 explainable queue and supplier-effort/first-review measures. FR01–FR04/FR11; US01–04/11/16/18/21; TC01–04/11/16/18/21

CR03 — Scope tension: near-term seasonal assortment across multiple categories; narrow, phase or accept explicit readiness risk
D03
All three categories remain in both demonstrations; recommend Packaged Food implementation first, Seasonal Home then Personal Care only after rule gates. EN02/EN04/EN05/EN06; US20/22/23/24; TC20/22/23/24


V2 changes are proposed design responses implemented by the package prototype owner, not proof of customer agreement. Business reviewers must compare actual v1/v2 controls and capture discrepancies. Exact story-to-decision mappings remain those in the canonical trace, even where a change request has wider impact.
05  Decision log for ratification
D01 / CR01 — Proposed exercise decision — awaiting ratification. Accountable role: Compliance owner; due Sprint 0 D2. Options: Permit urgent override / prohibit mandatory override. Recommendation: Prohibit mandatory override. Proposed decision text: Mandatory evidence cannot be excepted; distinct category, compliance and assortment decisions; launch is a separate gate. Rationale: Prevents commercial pressure bypassing required evidence. Actual decision, approver, date and conditions: __________________.
D02 / CR02 — Proposed exercise decision — awaiting ratification. Accountable role: Supplier experience lead; due Sprint 0 D3. Options: Complete-only gate / minimum intake plus consolidated assistance. Recommendation: Minimum intake for triage; unchanged approval standards. Proposed decision text: Minimum viable intake may be saved and submitted for triage while incomplete. Consolidate corrections; assisted path preserves all mandatory standards. Rationale: Reduces burden without confusing triage with approval. Actual decision, approver, date and conditions: __________________.
D03 / CR03 — Proposed exercise decision — awaiting ratification. Accountable role: Chief Merchandising Officer; due Sprint 0 D5. Options: Narrow pilot / parallel categories / accept explicit timing risk. Recommendation: Packaged Food then gated Seasonal Home and Personal Care. Proposed decision text: Pilot Packaged Food; phase Seasonal Home then Personal Care after rule approval. SteerCo explicitly accepts seasonal timing risk or funds re-estimation; no date promise. Rationale: Contains rule uncertainty; expose seasonal timing risk and funding trade-off. Actual decision, approver, date and conditions: __________________.
D04 / CR01 — Proposed exercise decision — awaiting ratification. Accountable role: Assortment approver; due Sprint 0 D4. Options: Unbounded override / bounded authorized non-mandatory exception. Recommendation: Bounded exception with expiry or condition. Proposed decision text: Non-mandatory exceptions require authorized assortment owner, rationale, condition or expiry, channels and escalation. Expired exceptions cease to clear launch blockers. Rationale: Prevents stale and unauthorized exceptions clearing launch. Actual decision, approver, date and conditions: __________________.
D05 / CR02 — Proposed exercise decision — awaiting ratification. Accountable role: Merchandising operations lead; due Sprint 0 D4. Options: FIFO / opaque score / explainable risk-proximity-age queue. Recommendation: Explainable queue with aged nearly-ready view. Proposed decision text: Queue priority uses mandatory risk, launch proximity and age, never supplier size or format. Category queue highlights nearly ready aged items. Rationale: Balances urgency and workload without disadvantaging smaller suppliers. Actual decision, approver, date and conditions: __________________.
D06 / CR01 — Proposed exercise decision — awaiting ratification. Accountable role: Compliance owner; due Sprint 0 D4. Options: AI approval / advisory AI and version-bound human review. Recommendation: Advisory AI; reverify changed evidence. Proposed decision text: Evidence provenance and versions retained; changed evidence revokes verification and dependent approvals. AI supports humans and never approves. Rationale: Preserves provenance and prevents stale approvals. Actual decision, approver, date and conditions: __________________.
D07 / CR02 — Proposed exercise decision — awaiting ratification. Accountable role: Product Owner; due Sprint 0 D8. Options: Promise targets now / validate cohort baselines and targets. Recommendation: Validate with supplier-effort feedback before pilot. Proposed decision text: Baseline and targets must be validated with category/cohort measures and supplier-effort feedback before pilot launch. Rationale: Avoids unverified benefits and shifted supplier burden. Actual decision, approver, date and conditions: __________________.
Record an actual ratification only after the accountable customer owner explicitly confirms it; retain original proposal, alternatives, rationale and any dissent. A role-play or AI critique is not ratification. Escalate unresolved compliance decisions to compliance authority; funding/scope/timing decisions to the CMO/SteerCo.
06  Assumptions and open questions
Assumptions (unvalidated): proposed core team and specialists can be funded; chosen first pilot category reduces rule uncertainty; proposed 50-user workload and performance/recovery budgets are useful starting points; first-review/cohort event data can be captured; support/notification channels can be agreed. Added targets are hypotheses. None is verified by the fictional baselines.
Open question
Owner / due
Evidence to close

Q01 Which rules, mandatory fields, accepted evidence, version validity and minimum intake apply per category?
Compliance owner / D2
Rule pack and customer policy sources

Q02 Who can approve category fit, compliance, assortment, launch and exceptions; how are appeals handled?
Product Owner / D2
Named authority and segregation matrix

Q03 Which systems own product, supplier, evidence, content, supply and identity; what APIs and acknowledgement exist?
Technical lead / D3
System owners and contract samples

Q04 Can source baselines and proposed targets be measured from agreed first-review/cohort events?
Product Owner / D8
Baseline sample, denominators and holiday calendar

Q05 What privacy basis, residency, encryption standards, retention and legal-hold rules apply?
Security/privacy lead / D4
Customer policy/DPIA/security approval

Q06 Which support/notification channels, SLAs, service hours and run owners are funded?
Service owner / D7
Operating model and escalation rota

Q07 What review-priority weights, tie-breaks, unknown-age handling and workload SLAs are acceptable?
Merchandising operations lead / D4
Queue replay and category-owner approval

Q08 Which languages, accessible formats and supplier cohorts must the pilot support?
Supplier experience lead / D3
Supplier research and accessibility plan

Q09 Which AI tasks/model, source boundaries, evaluation corpus and stop gates are approved?
AI evaluation lead / D6
RAI evaluation and security signoff

Q10 What staffed capacity, burst workload, recovery objectives and integration availability are real?
Delivery lead / D9
Capacity model and performance workload

Q11 Does SteerCo accept seasonal timing risk or fund parallel scope discovery and re-estimation?
Chief Merchandising Officer / D5
D03 recorded decision; no launch-date promise

Q12 Who will accept each Sprint 0 artifact, prototype direction and implementation release?
Product Owner / D1; confirm D10
Named signatories and evidence checklist


Assumption review cadence: log impact and confidence, identify the experiment/evidence required, validate in D1–D9 spikes, and explicitly accept or replace at G0. An unanswered question must not silently become a requirement or assumed agreement.
07  V1 acceptance checklist — pending
Check ID
Coverage and expected evidence
Actual result / business verdict

VA01
Six personas represented with clear goals, handoffs and authority; mock roles identified
Pending; observer/date/evidence: ______

VA02
All four original records and all three categories with exact source values and unknowns labelled
Pending; observer/date/evidence: ______

VA03
V01 category fields/evidence/owner/completeness/save/submit/guidance/assisted request
Pending; observer/date/evidence: ______

VA04
V02 section readiness/blocker/conflict/correction/due/response/resubmit
Pending; observer/date/evidence: ______

VA05
V03 customer need/comparison/commercial facts/requested launch/readiness/questions/recommend/return
Pending; observer/date/evidence: ______

VA06
V04 rule/claim/evidence/source/date/status/uncertainty/note/verify/reject/request more
Pending; observer/date/evidence: ______

VA07
V05 distinct decisions/conditions/blocker owner/due/channel-content-supply/go-no-go/escalation
Pending; observer/date/evidence: ______

VA08
V06 open submissions/age/workload/completeness/blockers/proximity/effort/drill-down
Pending; observer/date/evidence: ______

VA09
No mandatory override; supplier-provided vs verified; exception authorization and expiry; contest route
Pending; observer/date/evidence: ______

VA10
Source baselines and proposed targets distinguished; 68% first-review presence; launch not equal approval
Pending; observer/date/evidence: ______

VA11
Accessible guidance, assisted path and supplier-size/format-neutral priority
Pending; observer/date/evidence: ______

VA12
Human oversight/local simulation boundary explicit; no real authentication/AI/messaging claim
Pending; observer/date/evidence: ______


Direction acceptance — Business owner: __________; reviewed artifact/version: __________; date: __________; accepted/conditional/rejected: __________; conditions/actions: __________. Status: pending.
08  V2 business UAT and implementation test script
Run TC01–TC12 as business walkthroughs in prototype-v2.html using the relevant mock role and source record. TC13–TC18 require an implemented service and specialist test environment; local UI behavior cannot prove them. TC19–TC24 assess discovery/handoff or future rule-pack artifacts. All statuses remain Not run / business acceptance pending.
For each test: reset/restore the relevant demo record; choose the listed view and mock role; execute the positive example, capture actual result; restore; execute the negative example, capture denial/uncertainty behavior; record evidence and defect owner. A genuine source conflict should never be dismissed to make a demo pass.
TC01 | FR01 → US01 → V01 → D02 | Supplier contact. Positive: Given Northstar is 82% complete, when the supplier saves and submits the minimum viable intake, then retain the draft version, mark incomplete/triage and list missing allergen evidence. Negative: Given mandatory evidence is absent, when submission is attempted, then triage is allowed but no compliance, assortment or launch approval is inferred. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC02 | FR02 → US02 → V02 → D02 | Supplier contact. Positive: Given Northstar has an open request, when operations consolidates corrections and supplier resubmits, then show the field/evidence, conflict, requested change, owner, due date and response in one versioned round. Negative: Given a repeated request for the same unresolved field, when a new round is composed, then merge/deduplicate rather than silently reset history or count each field as a cycle. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC03 | FR03 → US03 → V01 → D02 | Supplier contact. Positive: Given an assisted or keyboard-only user, when requesting support and following guidance, then show plain-language category examples, route to named support owner and preserve the supplier's saved work. Negative: Given a small supplier/non-standard format, when triaging, then do not lower its priority or waive mandatory evidence; provide an accessible alternative. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC04 | FR04 → US04 → V06 → D05 | Merchandising operations lead. Positive: Given the four samples, when queue filters/sort are applied, then expose mandatory risk, launch proximity, age, workload and Meadowlane's six-day pending review with an explainable reason. Negative: Given only supplier size or unfamiliar format changes, when re-ranking, then priority must not worsen; missing age stays unknown rather than invented. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC05 | FR05 → US05 → V03 → D01 | Category manager. Positive: Given Meadowlane is complete and has no compliance blocker, when category review is recorded, then assess customer need, overlap, commercial facts, demand assumptions, requested launch and readiness; record recommend/approve-fit/return with rationale. Negative: Given category fit is approved, when viewing final status, then neither compliance verification nor final assortment approval is substituted by that decision. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC06 | FR06 → US06 → V04 → D06 | Compliance owner. Positive: Given Willow & Coast's claim conflicts, when reviewing evidence, then show claim/rule, source, date if known, version, supplier-provided state, uncertainty and specialist notes; request clarification before verification. Negative: Given a source is missing, stale, contradictory or only AI-generated, when attempting verification, then block advancement and assign named human review. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC07 | FR07 → US07 → V04 → D06 | Compliance owner. Positive: Given verified evidence and dependent approvals, when that evidence version changes, then revoke verification and dependent compliance/assortment/launch approvals, retain old audit versions and require re-review. Negative: Given a stale browser version, when a reviewer saves a decision, then reject the lost-update attempt and require refresh; never overwrite a newer review. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC08 | FR08 → US08 → V05 → D01 | Assortment approver. Positive: Given current category approval and verified mandatory evidence, when an authorized approver decides assortment, then record an explicit approval with rationale and keep launch pending until all launch gates pass. Negative: Given Northstar lacks allergen evidence or Meadowlane is merely complete, when final approval is attempted, then block and show the missing prerequisite; launch urgency never overrides it. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC09 | FR09 → US09 → V05 → D04 | Assortment approver. Positive: Given a non-mandatory condition, when an authorized owner grants an exception, then require rationale, condition or expiry, affected channels, escalation owner and record scope. Negative: Given mandatory evidence is unresolved, an unauthorized role acts, or an exception expires, when clearing a launch blocker, then deny/restore blocker and escalate. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC10 | FR10 → US10 → V05 → D01 | Content/channel readiness owner. Positive: Given assortment approval, when preparing launch, then separately record store/digital content, images, claims, packaging, supply, owner, due date and receiving-team acknowledgement; issue go only when all required checks are current. Negative: Given Hearthline lacks carton dimensions, when approval exists on another track, then launch remains no-go; an absent acknowledgement cannot be treated as complete. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC11 | FR11 → US11 → V06 → D07 | Merchandising operations lead. Positive: Given first-review and decision events, when computing K01-K06, then apply cohort denominators, preserve first-review snapshots and show supplier effort, missingness and category drill-down. Negative: Given 68% mandatory evidence presence at first review, when reporting approval readiness, then do not label 68% verified at approval; 100% mandatory verification is a separate proposed gate. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC12 | FR12 → US12 → V04 → D06 | Compliance owner. Positive: Given a contested decision, when a supplier requests review, then assign a named human resolver, retain source/version, actor, timestamp, rationale, prior and new state and communicate outcome. Negative: Given a user edits history or AI proposes approval, when persisting, then deny audit mutation/AI authority and log the attempted action without exposing another supplier's data. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC13 | NFR01 → US13 → V01 → D01 | Supplier contact. Positive: Given two supplier tenants and each mock/business role, when exercising read/write/export and decision APIs, then all unauthorized cross-supplier actions are denied and logged in the production design test suite. Negative: Given a supplier guesses another record ID or changes the UI role, when requesting data, then server authorization still denies access; local role switch is never authentication evidence. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC14 | NFR02 → US14 → V04 → D06 | Compliance owner. Positive: Given evidence ingestion, when stored/transferred, then use approved encryption in transit/at rest, restrict access, scan files, inventory personal data and apply approved deletion/legal-hold policies. Negative: Given retention/encryption choices are unapproved, when release is requested, then stop at the privacy/security gate; do not invent a retention period. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC15 | NFR03 → US15 → V04 → D06 | Compliance owner. Positive: Given 100 proposed curated source-linked cases, when evaluating suggestions, then 100% of evidence assertions have source/version citations or explicit abstention and zero automatic approvals occur. Negative: Given hostile evidence, contradictory claims or no source, when AI is asked to override rules/reveal data, then ignore document instructions, abstain/escalate and retain mandatory blockers. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC16 | NFR04 → US16 → V01 → D02 | Supplier contact. Positive: Given the six views, when independent keyboard/screen-reader/zoom and automated checks run, then satisfy WCAG 2.2 AA with zero critical task blockers; paired supplier-size/format variants have identical eligibility/priority. Negative: Given supplier-size or format-only counterfactual changes, when outcomes differ or a task is inaccessible, then halt release and remediate before approval. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC17 | NFR05 → US17 → V05 → D01 | Assortment approver. Positive: Given a proposed 50 concurrent users, 260 submissions/month and 10 MB evidence files, when testing 30 minutes, then p95 non-AI read <2s and write <3s, AI response/abstention <10s; zero lost approved decisions. Negative: Given conflicting saves or integration outage, when retrying, then return a conflict, keep durable queue/idempotency keys and never duplicate approval; proposed RTO 4h/RPO 15m must be ratified. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC18 | NFR06 → US18 → V06 → D07 | Merchandising operations lead. Positive: Given pilot readiness, when service rehearsal runs, then named support owners triage an incident, disable AI without disabling manual controls, reconcile queues and restore the last approved rule/model version. Negative: Given missing on-call owner, runbook, training or unresolved critical incident, when launch gate is reviewed, then block release; production support must not be implied by the prototype. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC19 | EN01 → US19 → V04 → D01 | Compliance owner. Positive: Given customer policies and four samples, when the spike ends, then produce a versioned category-rule inventory, data dictionary, missing/unknown fields and owner approvals required for G0. Negative: Given missing policy or contradictory evidence rules, when the spike is reviewed, then record open questions/risks and do not mark rules approved. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC20 | EN02 → US20 → V05 → D03 | Content/channel readiness owner. Positive: Given customer system-owner interviews, when discovery ends, then document intake, evidence, product master, content/channel, supply and identity boundaries with schemas, auth, retry and ownership. Negative: Given absent vendor/API or ambiguous ownership, when estimating integration, then retain TBD and re-estimation dependency; do not invent system names. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC21 | EN03 → US21 → V06 → D07 | Merchandising operations lead. Positive: Given source baselines and cohort examples, when designing acceptance, then confirm denominator/time rules, proposed targets, RAI corpus and business signoff slots for K01-K06 and TC01-TC24. Negative: Given prototype outputs only, when assessing success, then do not report achieved benefit, completed customer UAT or validated performance. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC22 | EN04 → US22 → V01 → D03 | Supplier contact. Positive: Given G1 candidate controls and approved Seasonal Home rule pack, when Hearthline is replayed, then battery safety and packaging gaps remain blockers until verified/resolved and category regression passes. Negative: Given the 20 Oct request or unapproved rules, when expansion is proposed, then escalate timing risk rather than waive controls or promise that date. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC23 | EN05 → US23 → V04 → D03 | Compliance owner. Positive: Given approved Personal Care rules and claim specialist, when Willow & Coast is replayed, then the 48-hour moisture conflict cannot advance until reconciled and verified by a human. Negative: Given the 28 Sep request or missing specialist, when go-live is discussed, then record risk/no-go; S4 is not a promise to meet September demand. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
TC24 | EN06 → US24 → V06 → D03 | Merchandising operations lead. Positive: Given D1-D9 outputs, when G0 is held at D10, then verify traceability, prototype-direction acceptance, owned dependencies, staffed re-estimate and explicit SteerCo decisions. Negative: Given missing business approval, funding, policy or capacity evidence, when gate is reviewed, then mark conditional/no-go with owners and due actions, never fabricate signoff. Actual/evidence: __________. Tester/date: __________. Verdict: Pending. Defect/owner/retest: __________.
Exit proposal: no unresolved critical control, privacy, accessibility or data-integrity defect; all Must stories satisfy acceptance in the correct test layer; Should deferrals explicitly approved with impact; representative business testers approve direction/UAT with evidence. Technical checks and business acceptance are recorded separately. Signoff: name ______; role ______; date ______; version ______; decision/conditions ______.
09  Detailed relative two-week Sprint 0 plan
Two weeks / ten business days, relative D1-D10; current package is a preparation artefact, not elapsed Sprint 0 work.
Day / activity
Role / output
Work / dependency / checkpoint

D1 — Mobilize and align SoW/outcomes
Delivery lead / Product Owner: Scope, six personas, acceptance owners; requests for data/policies
US19; US20; US21; US24. Depends: Customer attendance/access. G0 acceptance responsibility pending

D2 — Map as-is and mandatory policies
Business analyst / Compliance owner: Policy/data inventory, role authority, FR baseline; review D01
US19. Depends: Q01/Q02 sources. D01 proposal due; mandatory rule gaps logged

D3 — Walk through v1; supplier burden workshop
UX lead / Supplier experience lead: Six-view demo, four cases, feedback capture, minimum intake/accessibility
US19; US20. Depends: Supplier representative availability. D02 proposal due; actual workshop pending

D4 — Refine v2 controls and evidence lifecycle
Technical lead / Compliance owner: D04-D06 proposals, exception/version/RBAC test design
US19; US20. Depends: Policy and identity owners. Resolve or escalate authority/privacy gaps

D5 — Scope and seasonal trade-off review
CMO / Delivery lead: D03 proposal, phased rule packs, risk/funding options
US20; US24. Depends: Seasonal business priorities. SteerCo risk decision pending

D6 — Refine BRD/backlog and evaluation suite
Business analyst / QA / AI lead: FR/NFR/EN trace, GWT tests, injection/grounding/fairness corpus
US19; US21. Depends: V2 direction and policy feedback. No actual RAI validation claimed

D7 — Integrations and operational readiness
Technical lead / Service owner: Contract sketches, support/runbook, adoption and rollback rehearsal plan
US20; US21. Depends: System owners, security/privacy input. Dependencies owned or escalated

D8 — Baseline and acceptance design review
Product Owner / Data lead: D07 proposal, K01-K06 definitions/targets, v2 UAT script
US21. Depends: Event data and business representatives. Targets/signoff remain pending

D9 — Estimate, capacity and risk challenge
Delivery lead / Technical lead / QA: Staffed capacity, S2 overload resolution, estimation ranges, RAID
US19; US20; US21; US24. Depends: Funding, availability, spike findings. Rebalance before any release commitment

D10 — G0 handoff and SteerCo review
Product Owner / Delivery lead / CMO: Artifact acceptance slots, open decisions, next-team handoff, conditional/no-go record
US24. Depends: Customer review and staffed re-estimate. G0 not yet held; record decision and evidence


Daily cadence proposal: 15-minute team sync; issue/decision log update before close; short PO/compliance decision clinic; two weekly artifact reviews. D1–D10 are relative business days, not completed work or actual calendar bookings. Customer availability and review turnaround must be confirmed.
10  Releases, estimation uncertainty and capacity sensitivity
S1-S4 are indicative two-week planning buckets, not commitments. S1-S2 Packaged Food pilot candidate; S3 Seasonal Home; S4 Personal Care. Rebalance after S0 spikes and velocity evidence. Story points are relative effort, not hours. Story placement shows dependency intent only and is not capacity-validated. Show per-sprint totals, explicitly flag S2 concentration, and do not claim a feasible four-sprint release until a staffed capacity model supports it.
Bucket
Points / intent
Gate and qualification

S0
11 points: US19–21/24; policy/data/integration/baseline discovery and handoff
G0 at D10: owner/policy clarity, direction acceptance, trace, staffed re-estimate and RAID decisions

S1
21 points: US01–03/13/14; intake, assistance, identity/privacy foundations
Dependency placement only; build prerequisites and approve contracts

S2
62 points: US04–12/15–18; review, evidence, controls, launch, RAI/operations
OVERLOADED against proposed capacity; G1 only after rebalanced work and all control/UAT/support gates pass

S3
5 points: US22; Seasonal Home rule pack/requalification
G2 only after G1, approved rules and regression; not a promised October launch

S4
5 points: US23; Personal Care claim-specialist expansion
G3 only with specialists, approved rules and regression; not a promised September launch


Total 104 relative points across 24 stories. Estimates use comparative complexity and uncertainty, not time conversion. Proposed reference: small change 3 points, typical workflow 5, complex evidence conflict review 8, handoff 2. Includes implementation, review and test effort within story scope; production migration, live integrations beyond discovered contracts and rollout are excluded and need separate estimates.
Editable workbook model: proposed baseline velocity 20 points per two-week sprint × 100% staffing × 80% focus × 80% reserve factor = 12.8 effective points. This is an illustrative planning hypothesis, not measured velocity. At that capacity S2's 62 points require 4.84 sprint-equivalents; whole-bucket planning rounds up to 5. Even at 30 baseline points and full availability, 80% focus/20% reserve gives 19.2; S2 requires 3.23 sprint-equivalents.
Optimistic/base/pessimistic sizing multipliers are proposed at 0.8/1.0/1.5. Confidence is low until policy, integrations, specialist availability and velocity are known. Spikes may split or expand stories. Re-estimate D9, rebalance S1/S2, identify parallel work and critical dependencies; SteerCo decides funding/scope/timing explicitly. S3/S4 point totals exclude unknown cross-category production complexity.
Core team proposal: Product Owner, delivery lead, BA, UX/accessibility, technical lead, two engineers, QA, plus part-time compliance/security/data/supplier operations. Named people, allocations and funding unconfirmed. Story points cannot establish a production date. Willow & Coast (28 Sep), Northstar (12 Oct), Hearthline (20 Oct), Meadowlane (16 Nov) remain requested dates only.
11  Governance, RACI, RAID and change control
Activity
Accountable
Responsible / consulted

Scope and benefit hypotheses
Product Owner
Business analyst / CMO; category/compliance

Category policy and evidence verification
Compliance owner
Compliance specialists / Category manager; security

Category fit decision
Category manager
Category manager / Supplier; content owner

Final assortment and exception decision
Assortment approver
Assortment approver / Category; compliance; operations

Launch readiness and receiving handoff
Content/channel readiness owner
Content/channel team; operations / Assortment; supply owner

Supplier clarification/support
Supplier experience lead
Operations coordinator / Supplier; UX/accessibility

Architecture, integration and data
Technical lead
Engineers; data lead / Security; system owners

RAI/security release controls
Security lead
AI evaluation lead; QA / Compliance; privacy; accessibility

Backlog/estimate/release governance
Product Owner
Delivery lead; technical lead / Team; CMO

Business UAT and Sprint 0 acceptance
Product Owner
Named business testers (TBD) / All six personas; delivery lead

Production support and incident recovery
Service owner
Support/on-call team (TBD) / Technical lead; security; compliance

Seasonal scope/funding/risk decision
CMO
Delivery lead / Product Owner; category; compliance


Proposed forums: daily delivery sync (delivery lead); twice-weekly PO/control decision clinic; D5 seasonal scope review; D8 measurement/UAT review; D9 capacity/RAID challenge; D10 SteerCo/G0. A quorum requires the accountable business role plus impacted control owner for decisions. No meeting has occurred.
Escalation proposal: immediate stop and notify security/compliance for data leakage, mandatory bypass or dangerous claim; keep affected launch blocked. High-impact scope/capacity or policy decisions unresolved for two business days go to PO/delivery lead; commercial timing/funding trade-offs to CMO/SteerCo. These SLAs are proposed, not contracted.
Change control: log CR ID, origin/source, requirement/story/test impact, mandatory-control impact, category/channel scope, estimate/capacity delta, risks, benefit and alternatives; obtain PO scope approval and relevant compliance/security authority; update decision log, trace, versioned baseline and regression set. Reject silent scope expansion or mandatory-control waiver. Rebaseline only after explicit approval.
RAID
Exposure / rating
Owner / due / action

R01 Risk
Seasonal dates precede unvalidated category delivery capacity / High
CMO / D5: Ratify D03; accept risk or fund re-estimation. Trigger: Requested launch threatened while rules/capacity unapproved. Status Open

R02 Risk
Mandatory evidence or claim conflicts produce unsafe approval / Critical
Compliance owner / D2: D01/D06 gates; source-linked specialist review. Trigger: Any unresolved mandatory blocker or stale version. Status Open

R03 Risk
Supplier burden or accessibility excludes smaller suppliers / High
Supplier experience lead / D3: D02/D05; consolidated assistance and paired fairness tests. Trigger: Repeated corrections or format/size affects priority. Status Open

R04 Risk
AI injection, unsupported claim or cross-supplier leakage / Critical
AI/security lead / D6: Untrusted-source isolation; server RBAC; abstain and stop gates. Trigger: One critical failure in evaluation or incident. Status Open

R05 Risk
S2 backlog concentration exceeds available capacity / High
Delivery lead / D9: Validate capacity, split/resequence stories; no four-sprint commitment. Trigger: Sprint load exceeds effective capacity. Status Open

A01 Assumption
Cross-functional team and part-time specialists will be available / High
Delivery lead / D9: Confirm names, allocations and funding. Trigger: Missing critical role at G0. Status Unvalidated

A02 Assumption
Proposed targets and workload represent a useful pilot hypothesis / Medium
Product Owner / D8: Validate event data, workload and supplier feedback. Trigger: Baseline/denominator not reproducible. Status Unvalidated

I01 Issue
Customer workshop, D01-D07 ratification and acceptance have not happened / High
Product Owner / D10: Schedule review; record actual decisions with blank signoff slots. Trigger: G0 approached without business review. Status Open

I02 Issue
Production policies, vendor contracts and retention decisions absent / High
Technical lead / D4: Run US19/US20; keep TBD and block affected release gate. Trigger: Implementation commitment requested without discovery. Status Open

DEP01 Dependency
Authoritative category policies and sample evidence / High
Compliance owner / D2: Obtain versioned samples and assign authoritative owner. Trigger: Source owner unavailable. Status Open

DEP02 Dependency
System ownership, identity, integration and environment access / High
Technical lead / D3: Contract/permission spikes; explicit acceptance from owners. Trigger: API/auth/tenant boundary unknown. Status Open

DEP03 Dependency
Human acceptance, operational ownership and support funding / High
Product Owner / D10: RACI, UAT slots, training and support coverage. Trigger: Gate without named accountable owner. Status Open


12  Definition of Ready and Definition of Done
Proposed DoR: named persona and value; FR/NFR/EN trace and prototype view; ratified applicable rule or explicit spike; GWT positive/negative criteria and test layer; data provenance/owner; dependencies and security/privacy/RAI impacts; estimate range and staffed placement; unresolved questions owned. A story with unknown mandatory policy is a discovery spike, not ready for committed implementation.
Proposed DoD for implementation: code/config reviewed; acceptance tests executed with evidence; no critical defects or bypass; role/supplier isolation, audit/version and relevant RAI/accessibility tests pass; telemetry/runbook and support training updated; documented rollback; PO acceptance recorded. UI simulation, compilation or OOXML QA alone never satisfies production DoD.
DoD for Sprint 0 artifact: internally consistent, source/assumption distinction clear, traceable and reviewable; role owners/due dates proposed; technical format QA recorded; actual business acceptance remains a separate gate. No workshop or signoff may be claimed until performed and recorded.
13  Operational runbook and incident response
Trigger / procedure
Owner / action
Exit evidence

Start of service / daily review
Operations checks queue freshness, integration errors, unowned/aged blockers, current rule version and review capacity; compliance checks expired exceptions/stale verification
Reconciled counts; assigned owner/due; unresolved mandatory blockers remain blocked

New or changed evidence
Compliance compares source/version, resolves conflicts, revokes dependent approvals and requests targeted consolidated correction
Current verification plus audit lineage; no launch until reapproved

Supplier assistance / contest
Supplier experience lead routes plain-language support; designated human resolver reviews contest independently where practical; preserves original decision and evidence
Acknowledged case, outcome/rationale, accessible next step; appeal SLA TBD

AI grounding/injection/fairness failure
AI/security lead disables affected AI suggestions immediately; preserve safe audit metadata; notify compliance/PO; manual checklists and human gates continue
Root cause, corrected prompt/retrieval/rules, full regression and explicit approval before resume

Unauthorized access / sensitive data incident
Security lead stops affected access/exports, follows approved incident procedure, scopes tenant exposure, preserves evidence and privacy obligations
Authorized incident clearance; notification/legal requirements determined by policy, not invented here

Integration outage / stale queue
Service owner marks data stale, pauses publishing/go decisions, retries idempotently with bounded backoff then failed queue; reconcile source IDs/versions/counts
No duplicates/lost decisions; receiving acknowledgement restored; manual reconciliation signed

Conflicting saves / concurrency
Technical lead rejects stale version, shows conflict, re-loads current state and preserves attempted rationale separately
Reviewer rechecks current evidence; no last-write-wins approval loss

Expired exception / unresolved launch blocker
Operations restores blocker and escalates to authorized owner; commercial urgency cannot waive mandatory evidence
Valid eligible exception or resolved prerequisite plus receiving owner acknowledgement

Rollback / recovery rehearsal
Service owner snapshots approved config/rule/model IDs, disables AI, rolls back last approved version, restores/replays durable events, checks approval lineage
Proposed RTO 4h/RPO 15m tested against ratified objectives; security/compliance/PO authorizes resume


Contacts, on-call rota, service hours, alert thresholds, platform dashboards, retention/legal-hold rules and severity SLAs are TBD (Q05/Q06/Q10). Proposed critical incidents halt affected launch immediately; restore human-safe operation before optimizing availability. This is a runbook design, not a deployed service or completed rehearsal.
14  Adoption, training, support and optimization
Audience
Training / owner
Readiness evidence

Supplier contacts
Plain-language checklist, evidence examples, assisted path and single correction round / Supplier experience lead
Observed save/submit/respond task and effort feedback. Proposed target: 90% task completion; ratify D8. Status: Pending

Category managers and operations
Queue reasons, aged nearly-ready work, handoffs and fit decision / Merchandising operations lead
Replay Meadowlane and prioritize all four cases without size bias. Proposed target: all assigned pilot reviewers trained. Status: Pending

Compliance and approvers
Source/version verification, conflict resolution, exception boundary, appeal / Compliance owner
Block mandatory override and stale approval in rehearsal. Zero critical control failure proposed. Status: Pending

Content/channel and support
Launch gates, queue reconciliation, incident escalation and manual fallback / Service owner
No-go/rollback exercise; named coverage confirmed. Coverage/support SLAs TBD. Status: Pending

Product Owner and data lead
KPI definitions, cohort denominator, supplier effort and benefit interpretation / Product Owner
Reconcile presence vs verification and baseline missingness. Targets ratified only after evidence review. Status: Pending


Before pilot: co-design plain-language examples with representative supplier cohorts; train all six roles on complete vs verified vs approved vs launch; provide keyboard-accessible job aids and assisted support; observe task completion and feedback; nominate role champions and funded support owners. Proposed training coverage/effort targets must be ratified, not reported achieved.
Pilot optimization plan: weekly K01–K06/appeals/error/fairness review with PO, compliance and supplier experience; inspect category/cohort distributions, not only aggregates. Propose one bounded improvement hypothesis at a time (guidance wording, consolidated request template, queue explanation); offline replay and controlled pilot compare against baseline with privacy safeguards. Do not optimize speed by weakening mandatory evidence or shifting effort to suppliers.
RAI evaluation stages: D6 design source-grounded and adversarial corpus; D8 validate measures/raters; before G1 implement and run tests with human adjudication; during pilot monitor abstention, citation coverage, false blockers, corrections, subgroup differences and drift; before G2/G3 repeat with category-specific evidence and specialist review.
Stop/resume: any cross-supplier disclosure, unauthorized approval, mandatory bypass, critical accessibility failure or unfair paired outcome stops the affected capability. Assign incident owner, preserve provenance, correct and rerun targeted plus shared regressions; independent compliance/security/PO approval required before resuming. Proposed evaluation thresholds are not validated production quality claims.
15  Handoff, finish line and acceptance record
Handoff / SoW finish line
Artifact / accepting role
Evidence / status

H01 Outcome and scope alignment
BRD sections 1–2; D03 / Product Owner
Written scope/benefit agreement. Draft prepared; acceptance pending

H02 Validated prototype direction
prototype-v1.html; prototype-v2.html; handbook UAT / Product Owner
Six-persona walkthrough and recorded direction acceptance. Local simulation only; customer validation pending

H03 BRD and backlog ready
BRD; Backlog; Requirements trace / Product Owner
All 24 items traceable with criteria and owned dependencies. Prepared; business acceptance pending

H04 Plan agreed and credible
Sprint0 Plan; Estimation; Release Plan / Delivery lead
Staffed re-estimate and S2 overload resolution. Provisional; not capacity validated

H05 Dependencies and RAID visible
RAID; Open Questions; RACI / Delivery lead
Named owners acknowledge mitigation/due dates. Proposed role owners; acknowledgements pending

H06 SteerCo decisions prepared
D01-D07; deck; seasonal risk / CMO
Ratified decisions with rationale and date. Proposals only

H07 Responsible AI and support ready
TC13-TC18; adoption/runbook / Service owner
Security/RAI/accessibility gates, training, support and rollback evidence. Implementation tests and rollout not performed

H08 G0 actual acceptance record
Reviewer name: ______; date: ______; outcome: ______ / Product Owner
Accepted / conditional / rejected with action owners and dates. Pending — no signature or approval recorded


New-team onboarding: review index and source status; replay four cases; inspect FR/US/V/D/TC trace and acceptance layers; review open questions and owned RAID; validate capacity model and S2 overload; confirm environments/system owners before implementation. Preserve original case data, stable IDs and pending status across changes.
G0 decision record — Actual meeting date: __________; business owner/name: __________; delivery lead: __________; reviewed versions: __________; acceptance outcome: __________; unresolved conditions with owner/due: __________; SteerCo decision references: __________. Status: Pending.
Prepared is not agreed. Prototype demonstration is not customer validation. Technical artifact QA is not UAT. Assortment approval is not launch readiness. No production deployment, migration, operational rollout or final production acceptance is included in this package.

