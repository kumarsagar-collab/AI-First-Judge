===== FILE: Contoso Retail BRD - Customer Care and Order Exception Resolution.docx =====
===== TYPE: .docx (signature D0-CF-11-E0-A1-B1-1A-E1) =====
===== SECTIONS DETECTED: legacy Word document (COM extraction) =====
Business Requirements Document
Customer Care and Order Exception Resolution
Contoso Retail (fictional) — AI Implementation Engagement
Version 1.0 · Draft for Sprint 0 review · 3 September 2026
Executive sponsor: Chief Customer Officer
Prepared by the core project team, Architecture
 
FICTIONAL EXERCISE NOTICE — This document uses fictional, illustrative exercise assumptions for a learning and validation engagement. Figures, policies, personas, sample cases and baselines do not represent observed Contoso Retail facts, committed benefits, or implementation promises. All baselines carry a "measure to validate" status until instrumented in delivery.

DOCUMENT CONTROL
Field
Value

Document title
Business Requirements Document — Customer Care and Order Exception Resolution

Version
1.0 (Draft for Sprint 0 review)

Status
For review by the Steering Committee

Date
3 September 2026

Executive sponsor
Chief Customer Officer

Business owner
Policy owner and customer-experience leader

Delivery phase
Sprint 0 — validate and prepare the AI-enabled retail business capability

Traceable artefact
Prototype v1 (interactive, six views, five sample cases)

Review cycle
Sprint 0 workshop series, then SteerCo readout


1. EXECUTIVE SUMMARY
Customers contact Contoso Retail when an order goes wrong — a delivery runs late, an item is substituted, a refund does not arrive, or a pickup order is short. On a typical day the business handles an illustrative 1,480 order-exception contacts, roughly 1,050 on delivery orders and 430 on pickup. Those contacts are handled well or badly depending less on the facts of the case than on whether the colleague answering can assemble them quickly. Today they often cannot. An advisor spends an average of 12.6 minutes per case, of which 3.4 minutes goes to locating and interpreting policy across an average of 2.3 policy pages. Nearly a quarter of cases (23%) transfer at least once between the contact centre, a store, fulfilment or finance. Almost one in five customers (18%) comes back within seven days about the same issue. On a typical day 140 cases are still open after 48 hours, and 38 of those have no clearly assigned next owner.
The pattern behind those numbers is consistent: the facts of a case are scattered, the applicable policy is contested, the authority to act is not visible next to the options, and the customer is left without a named owner or a reliable expectation. The cost is paid twice — once in advisor time and once in customer trust.
This document sets out the business requirements for a production capability that addresses that pattern. The capability assembles a single consolidated view of the case, distinguishes confirmed facts from estimates and unknowns, surfaces the applicable policy rule with its evidence and its uncertainty, presents permitted remedies alongside their cost, their required authority and their real customer consequence, drafts a customer explanation the advisor reviews and releases, and tracks the promise through to closure with a named owner throughout.
The capability assists; it does not decide. Advisors verify the facts and decide within their authority. Supervisors and finance reviewers approve higher-value or exceptional remedies. Every drafted summary and customer message is reviewed by a human before use, and the advisor remains accountable for accuracy, tone and policy fit. Safety, allergy, accessibility and essential-use concerns always route to explicit human review regardless of amount.
Prototype v1 has been built and demonstrates all six required views against five representative cases, each of which exercises a different business rule. This BRD converts that prototype into a requirement set for a production-ready build, and the accompanying backlog sequences the work across three releases.
The intended business outcome is faster, more consistent, policy-aligned resolution that improves advisor productivity, customer understanding and accountable escalation — with every claimed improvement measured against a baseline established during delivery rather than asserted from this document.
2. BUSINESS OBJECTIVE AND INTENDED OUTCOMES
2.1 Business objective
Prepare and deliver a capability that enables faster, more consistent, policy-aligned order exception resolution while improving advisor productivity, customer understanding, resolution quality, and accountable escalation.
2.2 Intended outcomes
Ref
Intended outcome
How it is evidenced

O-1
Priority exception journeys, customer needs, ownership boundaries and current resolution barriers are mapped and agreed
Journey maps and ownership matrix signed off by the policy owner and operations leadership

O-2
Service teams receive relevant case context, policy guidance, permitted actions and next steps in one place
Prototype-validated views; production acceptance against FR-1 to FR-6

O-3
Resolution, escalation, approval, communication and follow-up requirements are defined across channels
Requirement set in this BRD; backlog items with acceptance criteria

O-4
Consistent customer explanations are produced while authorised judgment is retained for genuine exceptions
Human-review gate on every draft; quality-review sampling of released messages

O-5
Measures for productivity, resolution quality, customer effort, policy adherence and safe operation are validated
Measurement plan instrumented in Release 1; baseline confirmed before benefit is claimed

2.3 What this capability is explicitly NOT
It is not an autonomous resolution engine. It does not decide remedies, approve refunds, or send customer communications on its own. It does not replace the advisor's judgment, the supervisor's approval, or the finance reviewer's control over higher-value refunds. It does not determine policy — it applies published policy and shows the reader which rule it applied and why.
3. SCOPE
3.1 In scope
Area
In scope

Journeys
Selected high-priority order exception journeys: late or missing delivery, unavailable item substitution, partial and full refund, missing pickup item, and return/refund status

Channels
Contact centre (voice), messaging and in-app chat, email, SMS, and store service at the desk

Users
Contact-centre advisors, store-service associates, supervisors, finance reviewers, and the policy owner / customer-experience leader

Capability
Case queue and assignment; consolidated case and timeline; policy and eligibility guidance; remedy options with authority and approval; customer message drafting and release; resolution tracking, escalation and follow-up

Controls
Identity verification gating, authority thresholds, safety and essential-use routing, uncertainty labelling, human review before use, and a complete decision and disclosure audit trail

Data
Read integration with order, fulfilment, carrier, returns, payment, store pick, customer profile, policy content and case-history sources

Measurement
Instrumentation for handling effort, transfer, repeat contact, ageing, ownership, escalation, reopen and policy-adherence measures

3.2 Out of scope
Area
Out of scope
Rationale

Deployment
Production deployment, operational rollout and final production acceptance
Excluded by the Statement of Work for this engagement phase

Integration
Full-scale integration across all order and fulfilment systems, and data migration
Release 1 integrates the priority journeys only; wider integration is a later decision

Autonomy
Any automated decision, approval or outbound send without human review
Retained human decision is a design constraint, not a phasing choice

Policy authoring
Changing, drafting or arbitrating retail policy content
The capability applies published policy; the policy owner owns the content

Channels
Social media, third-party marketplace and reseller contact channels
Not part of the selected priority journeys

Journeys
Product warranty claims, fraud investigation, and commercial account disputes
Different ownership, different controls, different evidence standards

Localisation
Languages beyond the agreed pilot language set
Deferred pending the pilot-site decision

3.3 Assumptions
Ref
Assumption
Impact if untrue

A-1
Published policy content can be sourced with a stable rule identifier and effective date
Rule citation and effective-date display cannot be evidenced; guidance loses auditability

A-2
Order, fulfilment, carrier, returns, payment and store-pick systems expose read APIs or a near-real-time feed
The consolidated case and timeline degrade to manual assembly, removing most of the benefit

A-3
Carrier status latency is variable and sometimes hours stale
The freshness indicator and uncertainty labelling are mandatory, not optional

A-4
Approval thresholds are $40 advisor, $150 supervisor, above $150 finance reviewer
Authority gating logic and the approval routing model change

A-5
Customer channel and communication-support preferences are recorded on the customer profile
Preference-aware messaging and accessibility preservation cannot be honoured

A-6
A single named owner per case is operationally acceptable to both store and contact-centre leadership
The four-working-hour ownership rule cannot be enforced

A-7
Quality review sampling exists and can be extended to cover AI-assisted cases
Policy-adherence measurement has no observation method

A-8
Pilot scope is a defined advisor cohort and store set, not the whole estate
Release sequencing, training and change effort all increase materially

4. STAKEHOLDERS, PERSONAS AND USER GOALS
4.1 Stakeholders
Stakeholder
Interest
Involvement

Chief Customer Officer
Executive sponsor; customer trust and resolution quality
Steering Committee; scope and benefit decisions

Policy owner / customer-experience leader
Consistency, customer effort, unresolved patterns, policy fitness
Requirement sign-off; guidance content ownership; measurement review

Contact-centre operations leadership
Advisor productivity, staffing, transfer and repeat-contact rates
Journey validation; pilot cohort selection; adoption

Store operations leadership
Store-service workload and the store/contact-centre ownership boundary
Ownership rules; store pilot; associate training

Finance — refunds control
Refund authority, exception decisions, financial control
Approval thresholds; audit trail; release controls

Risk, legal and compliance
Consumer protection, complaint handling, records
Control design; disclosure and retention requirements

Data protection officer / privacy
Lawful basis, data minimisation, subject rights
Privacy review; data flows; retention

Responsible AI review board
Uncertainty handling, fairness, oversight, transparency
Responsible AI assessment; go/no-go on the pilot

Information security
Access control, identity verification, payment data exposure
Security review; threat model; penetration test

Enterprise architecture
Integration pattern, data ownership, platform fit
Solution design authority; dependency management

Fulfilment and carrier operations
Status quality, recovery actions, ownership of delivery exceptions
Data readiness; recovery process definition

Frontline representatives (advisors and associates)
Usability, trust, workload, training
Prototype validation; usability testing; pilot feedback

4.2 Personas and user goals
Persona
Who they are
Primary goal
What good looks like

Customer
The person whose order went wrong
A clear answer and a fair remedy without repeating the story
One explanation, honest about what is not known, a named owner, and a next step that happens

Contact-centre advisor
Handles voice, chat, email and SMS contacts
Investigate, explain the options, and decide within authority
Facts assembled, the rule and its evidence visible, options with consequences and limits shown together

Store-service associate
Resolves pickup issues at the desk with store context
Resolve or correctly hand over a pickup issue
Same case view as the contact centre, with store-specific evidence and a real handover, not a routing bounce

Supervisor
Approves higher-value or uncertain remedies for care operations
Approve, reject or redirect quickly with enough context to stand behind it
The rationale, the rule, the amount and the authority in one place; a queue that shows what is waiting

Finance reviewer
Decides amounts above $150 and policy exceptions
Control discretionary spend and release owed refunds
Full evidence chain, a clear distinction between money owed and money granted, and an auditable decision record

Policy owner / CX leader
Monitors consistency, customer effort and unresolved patterns
See where guidance fails, where cases stall, and where the rules conflict
Aggregated patterns, not individual surveillance; defect signals from the substitution and disruption rules

4.3 Persona access model
Persona
Can own a case
Approval limit
Can release a customer message
Notes

Contact-centre advisor
Yes
Up to $40
Yes, after the remedy is decided
Full case view; identity verification required before payment detail

Store-service associate
Yes
Up to $40
Yes, after the remedy is decided
Same limit as an advisor; store evidence additionally visible

Supervisor
Yes
Up to $150
Yes
Also assigns ownership on the four-hour escalation

Finance reviewer
Yes
Above $150 and all policy exceptions
Yes
Releases owed refunds; decides exceptions

Policy owner / CX leader
No
None — read only
No
Aggregate and pattern views; no decision or send rights

5. CURRENT AND TARGET JOURNEYS
5.1 Current-state process and friction
Step
Current process
Friction

1. Contact and identify
Customer contacts by phone, message or store visit; the colleague verifies identity and locates the order
Customers repeat details, and order context differs by channel

2. Classify
The advisor classifies the issue and asks for missing facts, photographs, pickup details or a preferred contact method
Classification is inconsistent and missing information is discovered late

3. Find the policy
The advisor searches policies for delivery, pickup, substitution, refund or return-status eligibility
Multiple pages conflict or omit disruption exceptions; 2.3 pages consulted per case

4. Investigate
The advisor, store or fulfilment colleague investigates the timeline, item status, payment, prior contacts and ownership
Handoffs and incomplete status create uncertainty

5. Compare remedies
The advisor compares replacement, partial refund, full refund, collection, wait-and-monitor or goodwill
Consequences and authority limits are not visible together

6. Decide or approve
The advisor, supervisor or finance reviewer makes or approves the remedy and records the rationale
Pending approvals leave the customer without a clear expectation

7. Explain
The advisor explains confirmed facts, unknowns, remedy, timing and next steps in the preferred channel
Messages can overstate uncertain delivery or refund timing

8. Follow through
The case owner monitors completion, follows up, and closes or reopens the case
Ownership, promised dates and repeat contact are not consistently tracked

5.2 Target journey
Step
Target process
Change from today
Prototype view

1. Contact and identify
Identity is verified once against the recorded method; the case opens with the order already located and the customer's channel and communication support surfaced
The customer stops repeating the story; identity gating is explicit rather than assumed
View 2

2. Classify and queue
The case is classified on intake, scored for priority reason, and placed in a queue showing age, impact, order value, owner and approval state
Classification is consistent and priority is explained, not implied
View 1

3. Assemble context
A consolidated case view assembles order, items, fulfilment timeline, payments, prior contacts and prior promises, with a data-freshness indicator
Investigation becomes reading rather than searching
View 2

4. Separate what is known
Confirmed facts, estimates and unknowns are labelled separately and carried into every downstream step
Uncertainty stops being flattened into false confidence
View 2, 5

5. Apply the policy
The applicable rule, its effective date, the eligibility result, the evidence used, the uncertainty and the exception path are presented together; the advisor acknowledges before proceeding
Policy search collapses from 2.3 pages to one assembled answer with its provenance
View 3

6. Choose the remedy
Permitted options are shown with amount, required authority level and the real customer consequence; a rationale is mandatory
Authority and consequence become visible at the moment of choice
View 4

7. Decide or route
The decision is made within authority, or routed to a supervisor or finance reviewer with the full evidence chain
Escalation carries context instead of restarting the investigation
View 4

8. Explain
A draft explanation separating confirmed facts, estimates and unknowns is produced in the customer's channel; the advisor edits, reviews and releases it
Explanations become consistent without becoming automated
View 5

9. Track and follow through
Promised date, next action, owner, dependency, customer response and reopen status are tracked; breaches and unowned cases escalate
Promises become observable rather than remembered
View 6

5.3 Ownership and handover model
The team in contact with the customer retains ownership until it hands over to a named individual who accepts it. Routing a case to another team does not transfer ownership. Every case carries exactly one named owner. A case with no named owner after four working hours escalates to a supervisor, who assigns ownership. A case must not be routed between teams more than once without supervisor involvement.
6. FUNCTIONAL REQUIREMENTS
Requirements are grouped by the six capability areas demonstrated in Prototype v1. Priority uses MoSCoW: M = Must, S = Should, C = Could.
6.1 FR-1 Case queue and assignment
Ref
Requirement
Priority

FR-1.1
Present a prioritised queue of order-exception cases showing case ID, age, channel, issue type, customer impact, order value, priority reason, owner and approval state
M

FR-1.2
State the priority reason in business language for every case; a case must never appear high-priority without a displayed reason
M

FR-1.3
Allow a permitted role to accept a case, which records that individual as the named owner and starts the ownership clock
M

FR-1.4
Allow a permitted role to take over a case already owned by another individual, recording the transfer and the reason
M

FR-1.5
Filter and sort the queue by unowned, awaiting approval, escalation risk, ageing band, channel and issue type
M

FR-1.6
Show approval state for each case: not yet requested, awaiting decision, approved, rejected, returned for revision, escalated to a named level
M

FR-1.7
Prevent a read-only role from accepting or owning a case, and explain why rather than failing silently
M

FR-1.8
Surface an aggregate view of queue health: open volume, cases over 48 hours, cases without an owner, and transfer counts
S

FR-1.9
Support store-service and contact-centre views of the same queue with role-appropriate scope
M

FR-1.10
Support bulk reassignment of unowned cases by a supervisor
C

6.2 FR-2 Consolidated case and timeline
Ref
Requirement
Priority

FR-2.1
Assemble a single case view: customer identity and relationship, preferred channel, communication support, language, order and item detail, payments, prior contacts and prior promises
M

FR-2.2
Display a fulfilment timeline of dated events, each attributed to its source system and marked as confirmed, estimated or uncertain
M

FR-2.3
Display a data-freshness indicator naming the source and the age of the most recent status, and flag status older than an agreed threshold as stale
M

FR-2.4
Separate and label confirmed facts, estimates and unknowns as three distinct sets, and carry those labels into downstream views
M

FR-2.5
List prior promises made to the customer with their current state — met, not yet met, breached, or inaccurate
M

FR-2.6
Mask payment detail until identity verification is complete, and record the verification method used
M

FR-2.7
Offer an assisted verification path where standard verification is not accessible to the customer, without refusing service
M

FR-2.8
Present a missing-information checklist and compose a single consolidated request in the customer's preferred channel
M

FR-2.9
Record every information request against the case, with what was asked and when
M

FR-2.10
Present the assembled summary as a draft requiring advisor review before use, with the review recorded
M

FR-2.11
Show store-specific evidence (pick, stage, handover scans and stock-count status) on pickup cases
M

FR-2.12
Allow the advisor to correct or annotate an assembled fact, recording the correction and its author
S

6.3 FR-3 Policy and eligibility guidance
Ref
Requirement
Priority

FR-3.1
Identify and present the applicable policy rules for the case, ranked by relevance and labelled primary, secondary, contributing or mandatory
M

FR-3.2
Display each rule's identifier, name, effective date and the operative extract of its wording
M

FR-3.3
Present an eligibility result with a plain-language explanation of how the rule applies to this case's facts
M

FR-3.4
List every piece of evidence used to reach the eligibility result, each traceable to a source system or a recorded customer statement
M

FR-3.5
State the uncertainties and rule conflicts affecting the result, and what each one does and does not change
M

FR-3.6
Present the exception path: which role decides, when it is required, and how it runs alongside the routine remedy
M

FR-3.7
Require the advisor to acknowledge the guidance before a remedy can be submitted for decision, and record the acknowledgment
M

FR-3.8
Present guidance as advisory only, with the decision explicitly retained by the human role
M

FR-3.9
Show the effective-date version of each rule that applied at the time of the decision, for later audit
M

FR-3.10
Route the case for explicit human review where a safety, allergy, accessibility or essential-use concern is engaged, regardless of amount
M

FR-3.11
Allow the advisor to record that the guidance does not fit the case, capturing the reason as a policy-owner signal
S

FR-3.12
Aggregate guidance overrides and disputed rules into a pattern view for the policy owner
S

6.4 FR-4 Remedy options, authority and approval
Ref
Requirement
Priority

FR-4.1
Present the permitted remedy options for the case, each with its amount, the authority level it requires, and the consequence the customer will actually experience
M

FR-4.2
Distinguish money owed (a correction of a failure) from a discretionary remedy, and never present the former as goodwill
M

FR-4.3
Enforce approval thresholds: advisor up to $40, supervisor up to $150, finance reviewer above $150 and for all policy exceptions
M

FR-4.4
Disable and visibly explain any option above the signed-in role's authority rather than hiding it
M

FR-4.5
Require a decision rationale before approve, reject or escalate is permitted
M

FR-4.6
Offer suggested rationale wording as a starting point, clearly marked as a draft the decision-maker owns
S

FR-4.7
Support approve, reject, return for revision, and escalate to a named higher authority
M

FR-4.8
Block a decision where prerequisites are unmet, and state every unmet prerequisite in business language
M

FR-4.9
Record a complete decision trail: who, when, which option, which rule, which rationale, and which authority level
M

FR-4.10
Preserve the customer's named owner and checkpoint while an escalation is pending
M

FR-4.11
Notify the receiving role when a case is escalated to them, with the full evidence chain attached
M

FR-4.12
Support a recommended option indicator, clearly labelled as a suggestion and never pre-selected
S

FR-4.13
Prevent a decision by a role that has no decision rights
M

6.5 FR-5 Customer message drafting and release
Ref
Requirement
Priority

FR-5.1
Draft a customer explanation that separately labels confirmed facts, estimates and unknowns
M

FR-5.2
Never state an unconfirmed delivery or refund time as a promise; express timing as a working-day range or a checkpoint the owner controls
M

FR-5.3
Pre-select the customer's stated channel, and warn visibly when a different channel is chosen
M

FR-5.4
Adapt the draft to the channel's constraints (length for SMS, structure for email, spoken form for voice and store)
M

FR-5.5
Offer tone variants without changing the factual content of the message
S

FR-5.6
Apply and preserve accessibility and communication-support preferences, including large print and plain-language variants
M

FR-5.7
Allow full editing of the draft before release, and record that an edit occurred
M

FR-5.8
Provide a send-for-review action routing the draft to a colleague or supervisor
M

FR-5.9
Block release until the remedy is decided and the case has a named owner
M

FR-5.10
State the named owner and the next step in every released message
M

FR-5.11
Display a guardrail checklist showing which content controls pass and which do not, before release
M

FR-5.12
Record the released message, its channel, its author and its release time against the case
M

FR-5.13
Require explicit advisor confirmation of accountability for accuracy, tone and policy fit at release
M

FR-5.14
Never send any customer communication without a human release action
M

6.6 FR-6 Resolution tracking, escalation and follow-up
Ref
Requirement
Priority

FR-6.1
Track for every open case: promised date, next action, owner, pending dependency, customer response and reopened status
M

FR-6.2
Flag a case whose promised date has passed, and escalate it to the accountable role
M

FR-6.3
Escalate a case with no named owner after four working hours to a supervisor for assignment
M

FR-6.4
Escalate complaints, repeated failed remedies and potential financial hardship on identification
M

FR-6.5
Detect and link a repeat contact on the same issue within seven days, and mark the case reopened
M

FR-6.6
Preserve the customer's chosen communication support through every transfer, escalation and follow-up
M

FR-6.7
Present outcome measures for the policy owner and CX leader at an aggregate level
M

FR-6.8
Record a full activity and disclosure log per case: actions, decisions, disclosures, releases, and the role that performed each
M

FR-6.9
Support scheduled follow-up actions with a named owner and a due checkpoint
M

FR-6.10
Support case closure with an outcome classification, and reopen with a linked reason
M

FR-6.11
Report on ownership continuity — how often a case changes owner and why
S

FR-6.12
Surface unresolved patterns by rule, journey, store and channel for the policy owner
S

7. BUSINESS RULES AND EXCEPTIONS
7.1 Business rules
Ref
Rule
Enforcement

BR-1
Verify customer identity before exposing payment details or changing a refund destination
System-enforced gate; payment fields masked until verification is recorded

BR-2
Where standard verification is not accessible to the customer, use the assisted verification path rather than refusing service
System-offered alternative path; the method used is recorded

BR-3
Advisors may approve remedies up to $40
Hard limit on the decision action

BR-4
Supervisors may approve remedies up to $150
Hard limit on the decision action

BR-5
Finance reviewers decide amounts above $150 and all policy exceptions
Routing rule plus hard limit

BR-6
Customer allergy, accessibility, safety or essential-use concerns require explicit human review rather than a routine substitution decision
Mandatory routing regardless of amount; review recorded on the case

BR-7
Where fulfilment status is stale or conflicting, label confirmed facts, estimates and unknowns separately
Presentation rule enforced in the case view and in every drafted message

BR-8
Never promise an unconfirmed delivery or refund time
Content control on the message draft; blocked at the release guardrail

BR-9
A draft summary or message must be reviewed by the advisor before use; the advisor remains accountable for accuracy, tone and policy fit
Human-review gate; accountability confirmed at release

BR-10
Escalate complaints, repeated failed remedies, potential financial hardship, or cases without an owner after four working hours
Automatic escalation with supervisor assignment

BR-11
Preserve the customer's chosen communication support across every handoff
Attribute carried with the case; re-applied on channel change

BR-12
The team in contact with the customer retains ownership until a named individual accepts the handover
Ownership model; routing alone never transfers ownership

BR-13
A substituted item that does not meet a recorded customer requirement is treated as an unfulfilled item — refund in full without requiring return
Eligibility rule; collection must not be a condition of the refund

BR-14
Money owed is not discretionary and must not be treated as goodwill
Remedy classification; enforced in option presentation and in message wording

7.2 Exception handling
Exception
Trigger
Handling

E-1 Safety or essential-use conflict
A remedy touches an allergy, accessibility, safety or essential-use need
Explicit human review recorded; the routine remedy proceeds in parallel and is not delayed by the review

E-2 Stale or conflicting fulfilment status
Source status older than the agreed freshness threshold, or two sources disagree
Facts split into confirmed, estimated and unknown; no timing commitment; freshness stated to the advisor

E-3 Authority exceeded
The chosen remedy exceeds the signed-in role's limit
The option is visible but disabled with the reason; escalation to the named authority is offered

E-4 No owner after four working hours
Ownership clock elapses
Supervisor escalation and assignment; the customer is given a named contact

E-5 Breached promise
A promised date or a published commitment window passes without fulfilment
Automatic escalation to the accountable role; the customer receives a checkpoint the owner controls

E-6 Policy conflict or gap
Two rules give different answers, or no rule covers the facts
Conflict stated to the advisor; exception path invoked; the case is logged as a policy-owner signal

E-7 Repeat contact within seven days
The customer contacts again on the same issue
The case is linked and marked reopened; prior promises and their state are surfaced

E-8 Verification not accessible
The customer cannot complete standard verification
Assisted path is offered; refusal of service is not a permitted outcome

E-9 Evidence unobtainable
The evidence that would settle a question does not exist and cannot be produced (for example, no item-level pickup scan)
The rule written for that gap governs; the case must not be held open waiting for evidence that cannot exist

E-10 Draft rejected by the reviewer
A colleague or supervisor returns a drafted message
The draft returns to the owner with the reviewer's reason; release stays blocked

8. NON-FUNCTIONAL REQUIREMENTS
8.1 Usability
Ref
Requirement
Acceptance target

NFR-U1
An advisor reaches the applicable rule, the eligibility result and the evidence without leaving the case view
Zero navigation away from the case for a standard exception

NFR-U2
Policy lookup effort falls materially against the 3.4-minute-per-case baseline
Measured in the pilot; target agreed after baseline confirmation

NFR-U3
Authority limits and customer consequences are visible at the moment of remedy choice, not after it
Verified in usability testing across all five sample journeys

NFR-U4
A new advisor completes a standard case unaided after a defined training period
Defined during Release 1 training design; measured at pilot

NFR-U5
Every blocked action states why it is blocked in business language, naming each unmet prerequisite
100% of blocked actions carry a reason

NFR-U6
Terminology in the interface matches operational language, not system or model language
Reviewed and signed off by frontline representatives

8.2 Accessibility
Ref
Requirement
Acceptance target

NFR-A1
The colleague-facing interface conforms to WCAG 2.2 Level AA
Independent audit with no outstanding Level A or AA defects

NFR-A2
Full keyboard operability across every view, with a visible focus order that follows the task
Verified by audit and by assistive-technology testing

NFR-A3
Screen-reader compatibility, including correct announcement of the confirmed / estimate / unknown labelling
Tested with the agreed screen-reader set

NFR-A4
Colour is never the sole carrier of meaning for fact labelling, approval state, or escalation status
Verified by audit

NFR-A5
Customer-facing message variants support large print and plain language, and preserve those settings across handoffs
Functional acceptance plus preservation test through transfer and escalation

NFR-A6
Customer communication-support preferences are honoured in every channel the capability sends through
Functional acceptance per channel

8.3 Performance
Ref
Requirement
Acceptance target

NFR-P1
The consolidated case view assembles and renders within an agreed interactive threshold during a live customer contact
95th percentile target set at design; provisional 3 seconds

NFR-P2
The queue loads and filters without perceptible delay at peak volume
95th percentile under 2 seconds at peak

NFR-P3
Policy guidance is produced within an agreed threshold from case open
95th percentile under 5 seconds

NFR-P4
The capability sustains peak concurrent advisor and associate load with no degradation of the case view
Load-tested to the agreed peak multiple of the 1,480-daily-case baseline

NFR-P5
Source-status freshness is displayed accurately and is never presented as more current than the source
100% accuracy in freshness display testing

NFR-P6
Message drafting completes within an agreed threshold so it does not extend the customer contact
95th percentile under 5 seconds

8.4 Resilience
Ref
Requirement
Acceptance target

NFR-R1
Where a source system is unavailable, the case view degrades gracefully, naming the missing source rather than presenting a partial view as complete
100% of source failures produce an explicit gap statement

NFR-R2
No source failure blocks case ownership, escalation, or a decision the available evidence supports
Verified by failure-injection testing per source

NFR-R3
Guidance failure never blocks the human decision path; the advisor can proceed with manual policy reference
Verified by failure-injection testing

NFR-R4
No in-flight decision, rationale, acknowledgment or draft is lost on session or service interruption
Recovery testing with zero loss of recorded actions

NFR-R5
Recovery objectives are defined and met for the case record and the decision audit trail
RPO and RTO agreed with operations and evidenced in test

NFR-R6
Duplicate actions are prevented on retry — a repeated release or approval must not double-apply
Idempotency verified for every write action

8.5 Operability
Ref
Requirement
Acceptance target

NFR-O1
Every decision, disclosure, release and escalation is logged with actor, role, timestamp, case and rule version
Complete audit trail evidenced in an audit sample

NFR-O2
Operational dashboards cover queue health, ageing, ownership gaps, escalation volume and guardrail blocks
Available from Release 1 pilot start

NFR-O3
Source-data freshness and integration health are monitored with alerting to a named operational owner
Alerting tested; runbook owner named

NFR-O4
Policy content updates take effect without a code release, and the effective date is displayed
Verified with a policy-content change in a controlled environment

NFR-O5
A documented runbook covers guidance failure, source outage, escalation backlog and content rollback
Runbook reviewed and rehearsed before pilot

NFR-O6
Model, prompt and guidance changes are versioned, reviewable and reversible, with the version recorded on affected cases
Version recorded on every case decision

NFR-O7
Support model, on-call ownership and incident severity definitions are agreed before pilot
Signed off by operations leadership

9. INFORMATION AND DATA NEEDS
9.1 Data domains, ownership and readiness
Domain
Key data
Owner
Readiness concern

Order
Order header, line items, values, channel, promised windows, order state
Digital commerce
Consistency of order context across channels

Fulfilment
Pick, stage, dispatch and handover scans; substitution decisions and their reasons
Fulfilment operations
Item-level granularity is missing on pickup handover

Carrier
Route assignment, scan events, arrival estimates, status timestamps
Fulfilment / carrier operations
Latency is variable and sometimes hours stale; estimates are model outputs, not commitments

Store
Store pick app events, staging, handover confirmation, stock counts
Store operations
Stock counts are not run on demand; store evidence arrives late or not at all

Returns
Return request, label issue, returns-centre receipt scan, condition assessment
Returns operations
Receipt scan is reliable; downstream refund release status is not linked

Payment and refund
Authorisation, capture, refund raised, refund released, hold reasons, refund destination
Finance
Refund holds carry no reason code — a named root-cause gap

Customer profile
Identity, verification methods, channel preference, communication support, recorded product preferences
Customer data
Preference completeness and currency are unproven at scale

Case history
Prior contacts, prior promises and their state, transfers, reopens
Care operations
Promises are not currently captured as structured, state-bearing records

Policy content
Rule identifier, name, effective date, operative wording, version history
Policy owner
Rules exist as pages, not as identified and dated units

Quality review
Sampled case assessments of policy adherence and explanation quality
Policy owner / quality
Sampling does not yet distinguish AI-assisted from unassisted cases

9.2 Data quality requirements
Ref
Requirement

D-1
Every displayed fact carries its source system and the timestamp of that source's last update

D-2
Data older than the agreed freshness threshold per source is visibly marked stale and is never presented as current

D-3
Where two sources conflict, both are shown with their sources; the capability does not silently pick or blend a value

D-4
An absent value is displayed as unknown, never as zero, blank or a default that reads as fact

D-5
Estimates are labelled as estimates at the point of display and are never promoted to confirmed facts downstream

D-6
Customer statements recorded by a colleague are attributed as such and distinguished from system records

D-7
Policy rules are versioned with an effective date, and the version applied is recorded against the decision

D-8
Promises made to the customer are captured as structured records with a state, not as free text

9.3 Data ownership and stewardship
Each domain above has a named data owner accountable for availability, quality and change notification. The policy owner is accountable for the currency and correctness of policy content. Care operations is accountable for the case record, including the promise and ownership history. Finance is accountable for refund status and for the introduction of hold reason codes. A data-readiness assessment per domain is a Release 1 entry condition and is carried as a backlog enabler.
10. SECURITY, PRIVACY, COMPLIANCE, RESPONSIBLE AI AND HUMAN OVERSIGHT
10.1 Security
Ref
Requirement

S-1
Role-based access control aligned to the persona access model, with least privilege by default

S-2
Payment detail is masked until identity verification is recorded, and any change of refund destination requires fresh verification

S-3
Store-service access is scoped to the store's cases and to store-relevant evidence

S-4
All access to customer data is logged and attributable to an individual, never to a shared account

S-5
Data in transit and at rest is encrypted to enterprise standard

S-6
Discretionary remedy authority cannot be self-granted or escalated by the acting role

S-7
A threat model and a penetration test are completed before pilot exposure to real customer data

10.2 Privacy and compliance
Ref
Requirement

P-1
A lawful basis is documented for every processing purpose, and a DPIA is completed before pilot

P-2
Data minimisation — only the case data needed for the resolution decision is assembled and displayed

P-3
Health, disability and comparable sensitive characteristics are never inferred; where a customer volunteers one, it is recorded only with a defined purpose and control

P-4
Retention periods are defined for case records, drafts, released messages, transcripts and decision logs

P-5
Subject-access, rectification and erasure requests are supportable across every store the capability writes to

P-6
Complaint handling meets the applicable consumer-protection and regulatory requirements, including record-keeping

P-7
Records evidence what the customer was told, when, by whom, and on what basis

10.3 Responsible AI
Ref
Requirement

RAI-1
The capability assists and never decides — no automated remedy decision, approval, or outbound customer communication

RAI-2
Confirmed facts, estimates and unknowns are labelled separately wherever status is stale or conflicting; an unconfirmed time is never stated as a promise

RAI-3
Every drafted summary, guidance output and customer message is reviewed by the accountable human before use

RAI-4
Guidance is traceable — every eligibility result names the rule, its effective date, and the evidence used

RAI-5
The capability states what it does not know rather than filling the gap, and never asserts a cause it cannot evidence

RAI-6
Safety, allergy, accessibility and essential-use concerns route to explicit human review regardless of amount

RAI-7
Fairness is assessed across language, disability and communication support, order value, customer history and channel; disparities in remedy, escalation and effort are tested before and during pilot

RAI-8
Colleagues can report a wrong or unhelpful guidance output in one action, and those reports feed a monitored review loop

RAI-9
Model, prompt and guidance versions are recorded against every case they influenced, and are reversible

RAI-10
Customers are informed about AI assistance in line with the agreed transparency position

RAI-11
The capability is not used to evaluate, rank or compare individual colleague performance; measurement is aggregate

10.4 Human oversight model
Level
Who
What they retain

Point of use
Advisor or store associate
Verifies facts, acknowledges guidance, chooses the remedy within authority, edits and releases every customer message, and is accountable for accuracy, tone and policy fit

Approval
Supervisor
Approves up to $150, assigns ownership on escalation, records safety reviews, and returns work for revision

Financial control
Finance reviewer
Decides above $150 and all policy exceptions, releases owed refunds, and owns the audit position on discretionary spend

Governance
Policy owner / CX leader and the Responsible AI review board
Monitor consistency, customer effort, disparity and unresolved patterns; own the guidance content and the go/no-go on scope expansion

11. DEPENDENCIES AND INTEGRATION
11.1 Integration needs
Integration
Direction
Purpose
Criticality

Order management
Read
Order header, lines, values, promised windows and order state
Critical

Fulfilment and warehouse
Read
Pick, dispatch and substitution events with reasons
Critical

Carrier status
Read
Route, scan events, estimates and status timestamps with explicit freshness
Critical

Store pick and handover
Read
Staging, handover confirmation and stock-count status
Critical for pickup journeys

Returns management
Read
Return request, label, receipt scan and condition
Critical for return journeys

Payment and refund
Read, and write on release
Authorisation, capture, refund raised and released, hold reasons; refund release action
Critical

Customer profile and preferences
Read
Identity verification methods, channel preference, communication support, recorded preferences
Critical

Case management
Read and write
Case record, ownership, decisions, rationale, promises, escalation and closure
Critical

Policy content repository
Read
Identified, dated, versioned rule content
Critical

Communication channels
Write on release
SMS, email, in-app messaging delivery
Critical

Identity and access management
Read
Role, authority level, store and team scope
Critical

Analytics and measurement
Write
Event stream for the measurement plan
High

Quality review tooling
Read and write
Sampling of AI-assisted cases for policy adherence and explanation quality
High

11.2 Organisational and delivery dependencies
Ref
Dependency
Owner
Needed by

DEP-1
Policy content converted to identified, dated, versioned units
Policy owner
Before Release 1 build of guidance

DEP-2
Refund hold reason codes introduced in the payment and refund process
Finance
Release 1 for the return-status journey

DEP-3
Item-level pickup handover evidence, or formal acceptance of the customer-report rule in its absence
Store operations
Release 1 for the pickup journey

DEP-4
Carrier status latency characterised and freshness thresholds agreed
Fulfilment operations
Release 1 design

DEP-5
Single-owner model agreed across store and contact-centre leadership
Operations leadership
Release 1 build

DEP-6
Customer preference and communication-support data completeness assessed
Customer data
Release 1 design

DEP-7
DPIA, security review and Responsible AI assessment completed
Privacy, security, RAI board
Before pilot exposure to real data

DEP-8
Pilot cohort, store set and measurement baseline agreed
Operations leadership
Before Release 1 pilot

DEP-9
Quality review sampling extended to AI-assisted cases
Policy owner / quality
Release 1 pilot

DEP-10
Training and change plan for advisors, associates, supervisors and finance
Operations and change
Before pilot

12. RISKS, ISSUES, ASSUMPTIONS AND CONSTRAINTS
12.1 Risks
Ref
Risk
Impact
Likelihood
Mitigation
Owner

R-1
Fulfilment and carrier status is too incomplete or too stale to support a trustworthy consolidated view
High
High
Freshness thresholds, explicit staleness marking, and journeys designed to work with acknowledged gaps
Fulfilment operations

R-2
Policy content cannot be sourced as identified, dated units, so guidance cannot cite its rule
High
Medium
DEP-1 raised early; a manual content-conversion enabler is carried in Release 1
Policy owner

R-3
Advisors do not trust the guidance and revert to manual policy search, so no effort benefit is realised
High
Medium
Evidence and uncertainty shown by default; frontline co-design; a one-action feedback loop
CX leader

R-4
Advisors over-trust the guidance and accept a wrong result without verifying
High
Medium
Mandatory acknowledgment, evidence display, quality-review sampling, and a monitored override signal
RAI board

R-5
The ownership model is agreed on paper but not adopted, so unowned cases persist
High
Medium
Four-hour escalation enforced in the system; ownership continuity reported to leadership
Operations leadership

R-6
Inconsistent treatment emerges across language, disability, order value, customer history or channel
High
Medium
Fairness assessment before and during pilot; disparity monitoring on remedy, escalation and effort
RAI board

R-7
Refund release remains blocked in the finance queue, so the breached-promise journey improves in explanation but not in outcome
Medium
High
DEP-2 hold reason codes; finance release SLA agreed as a Release 1 dependency
Finance

R-8
Peak-period volume degrades the case view during exactly the periods that generate the most exceptions
High
Medium
Peak load testing against a multiple of the daily baseline; graceful degradation design
Enterprise architecture

R-9
Privacy or Responsible AI review delays pilot exposure to real customer data
Medium
Medium
Assessments started in Sprint 0 and carried as an explicit backlog enabler
Privacy and RAI board

R-10
Measurement lacks a credible baseline, so no benefit can be evidenced either way
Medium
High
Instrumentation and baseline capture are Release 1 scope, ahead of the capability rollout
CX leader

R-11
Scope expands to journeys outside the agreed priority set before the first is proven
Medium
Medium
Release gate: no new journey until the prior journey's measures are validated
Sponsor

R-12
Store and contact-centre process divergence makes a single case model unworkable in practice
Medium
Medium
Store associate included in design from Sprint 0; store journey piloted alongside, not after
Store operations

12.2 Issues
Ref
Issue
Status
Action

I-1
Refund holds carry no reason code, so the root cause of the return-status journey cannot be diagnosed
Open
Raised to finance as DEP-2; workaround is an explicit unknown shown to the advisor

I-2
Pickup handover has no item-level scan, so a missing-item dispute has no settling evidence
Open
Policy already accepts the customer report; store operations to confirm the position formally

I-3
Ownership currently transfers by routing, which the target model does not permit
Open
Ownership model to be agreed and enforced; DEP-5

I-4
Automated substitution does not evaluate recorded account preferences
Open
Treated as a fulfilment defect; logged for the policy owner and raised to fulfilment

I-5
Quality review does not distinguish AI-assisted cases from unassisted ones
Open
DEP-9; sampling design to be extended before pilot

12.3 Constraints
Ref
Constraint

C-1
Production deployment, full-scale integration, migration, operational rollout and final production acceptance are outside this engagement

C-2
Approvals and discretionary remedies remain with authorised human roles; no autonomy is available as a scope trade

C-3
Approval thresholds are fixed at $40 / $150 / above $150 for this phase

C-4
The capability applies published policy and does not author, change or arbitrate it

C-5
Pilot exposure to real customer data is gated on completed privacy, security and Responsible AI assessments

C-6
Delivery starts with a defined pilot cohort and store set, not the whole estate

C-7
All figures in this document are fictional exercise assumptions and cannot be used as a benefit commitment

13. SUCCESS MEASURES AND ACCEPTANCE CRITERIA
13.1 Success measures
Measure
Illustrative baseline
Desired direction
Measurement method

Average handling effort
12.6 minutes, including 3.4 minutes on policy
Reduce without lowering resolution quality
Contact-handling telemetry, split by journey, against a pre-pilot baseline

Policy pages consulted per case
2.3
Reduce
Guidance usage telemetry and advisor observation

Transfer rate
23% of cases transfer at least once
Reduce
Case routing and ownership events

Repeat contact within seven days
18%
Reduce
Linked-contact detection on the same issue

Cases unresolved after 48 hours
140 daily, 38 without a next owner
Reduce, and eliminate the unowned subset
Case ageing and ownership reporting

Policy-consistent resolution in quality review
79%
Increase
Extended quality-review sampling covering AI-assisted cases

Escalation appropriateness
Not currently measured
Establish, then improve
Supervisor and finance review of escalated cases

Reopen rate
Not currently measured
Establish, then reduce
Case closure and reopen linkage

Customer effort and satisfaction
Not currently measured for this journey set
Establish, then improve
Post-resolution survey on the pilot journeys

Advisor confidence and adoption
Not currently measured
Establish, then improve
Adoption telemetry plus a periodic advisor survey

Guardrail effectiveness
Not currently measured
Establish and monitor
Rate of blocked releases, override reports and safety routings

13.2 Acceptance criteria
Ref
Acceptance criterion

AC-1
All Must-priority functional requirements in FR-1 to FR-6 are demonstrated against the five representative cases and signed off by the business owner

AC-2
Every business rule BR-1 to BR-14 is enforced by the system and evidenced in test, not merely documented in guidance

AC-3
No customer communication can be sent without a recorded human release action, verified by test

AC-4
Every remedy decision carries an actor, role, authority level, rule version, evidence set and rationale in the audit trail

AC-5
Authority thresholds are enforced, and an over-authority option is visible, disabled and explained

AC-6
Confirmed facts, estimates and unknowns are labelled separately in the case view and in every drafted message

AC-7
No drafted message states an unconfirmed delivery or refund time as a promise, verified across the five case journeys

AC-8
Safety, allergy, accessibility and essential-use cases route to explicit human review regardless of amount

AC-9
Identity verification gates payment detail, and an accessible assisted path exists that does not refuse service

AC-10
A case with no named owner after four working hours escalates to a supervisor, verified by test

AC-11
Communication support preferences survive transfer, escalation and follow-up, verified end to end

AC-12
WCAG 2.2 AA conformance is confirmed by independent audit with no outstanding Level A or AA defects

AC-13
Performance thresholds NFR-P1 to NFR-P6 are met at the tested peak load

AC-14
Failure-injection testing confirms graceful degradation with explicit gap statements for every critical source

AC-15
DPIA, security review, penetration test and Responsible AI assessment are complete and signed off before pilot exposure to real customer data

AC-16
The measurement plan is instrumented and a pre-pilot baseline is captured before any benefit is claimed

AC-17
Fairness assessment across language, disability, order value, history and channel shows no unexplained disparity in remedy, escalation or effort

AC-18
Runbooks, alerting, on-call ownership and content rollback are rehearsed before pilot

14. DECISIONS, OPEN QUESTIONS AND TRACEABILITY
14.1 Decisions taken
Ref
Decision
Rationale
Date

DEC-1
The capability assists and never decides; no autonomous remedy, approval or send
Retained human decision is a control requirement, not a maturity stage
3 Sep 2026

DEC-2
Confirmed facts, estimates and unknowns are labelled separately as a product-wide rule
Stale carrier and refund status make a single undifferentiated view actively misleading
3 Sep 2026

DEC-3
Approval thresholds of $40 / $150 / above $150 are enforced in the system
Authority must be visible and binding at the moment of choice
3 Sep 2026

DEC-4
One named owner per case; routing alone never transfers ownership
38 unowned cases daily is an accountability failure, not a volume problem
3 Sep 2026

DEC-5
Safety, allergy, accessibility and essential-use concerns route to human review at any amount
The nature of the need, not its cost, determines the control
3 Sep 2026

DEC-6
Store service and the contact centre share one case model and one queue
The ownership boundary cannot be fixed while the two teams see different cases
3 Sep 2026

DEC-7
Money owed is classified separately from discretionary remedy
Presenting an overdue refund as goodwill misstates the customer's entitlement
3 Sep 2026

DEC-8
Measurement is instrumented before capability rollout, not alongside it
Without a baseline no benefit claim is defensible
3 Sep 2026

14.2 Open questions
Ref
Open question
Owner
Needed by

Q-1
What freshness threshold marks carrier status stale for each journey?
Fulfilment operations
Release 1 design

Q-2
What is the agreed customer transparency position on AI assistance, and where is it stated?
RAI board and legal
Before pilot

Q-3
Can refund hold reason codes be introduced in Release 1, or must the advisor continue to state the cause as unknown?
Finance
Release 1 planning

Q-4
Will store operations formally accept the customer-report rule where no item-level scan exists?
Store operations
Release 1 design

Q-5
What is the finance release service level for an overdue refund escalation?
Finance
Release 1 design

Q-6
Which languages are in the pilot scope, and how is guidance quality assured in each?
Operations and RAI board
Release 2 planning

Q-7
Does the recorded-preference dataset have sufficient completeness to drive substitution safeguards?
Customer data
Release 1 design

Q-8
What retention period applies to drafted-but-unreleased customer messages?
Privacy
Before pilot

Q-9
How is the four-working-hour ownership clock calculated across store trading hours and contact-centre shifts?
Operations leadership
Release 1 build

Q-10
What is the escalation path when a finance reviewer is unavailable within the agreed window?
Finance
Release 1 design

14.3 Traceability to Prototype v1
Prototype view
Personas demonstrated
Requirements traced
Rules evidenced
Sample cases

1. Case queue
Advisor, store associate, supervisor, finance reviewer, policy owner
FR-1.1 to FR-1.10
BR-10, BR-12
All five

2. Consolidated case and timeline
Advisor, store associate
FR-2.1 to FR-2.12
BR-1, BR-2, BR-7, BR-9, BR-11
CARE-24081, CARE-24082, CARE-24084, CARE-24085

3. Policy and eligibility guidance
Advisor
FR-3.1 to FR-3.12
BR-6, BR-7, BR-9, BR-13
All five

4. Remedy and approval
Advisor, supervisor, finance reviewer
FR-4.1 to FR-4.13
BR-3, BR-4, BR-5, BR-6, BR-14
All five

5. Customer message preview
Advisor
FR-5.1 to FR-5.14
BR-7, BR-8, BR-9, BR-11
All five

6. Resolution tracking
Case owner, policy owner and CX leader
FR-6.1 to FR-6.12
BR-10, BR-11, BR-12
All five

14.4 Sample-case traceability
Case
Journey
Rule exercised
What it validates

CARE-24081
Late delivery, $126, 7 hours past the window, carrier status 5 hours stale
Delivery disruption; communicating uncertain fulfilment status
Uncertainty labelling under stale status; customer choice of remedy; goodwill within advisor authority

CARE-24082
Unavailable substitution, $18, fragrance-free need conflicted
Substitution suitability; safety and essential-use exception
Explicit human review at any amount; refund proceeds without waiting on the review; substitution defect logged

CARE-24083
Damaged accessory, $38, photographs supplied within 48 hours
Damaged goods within 48 hours; component damage
Clean resolution inside advisor authority; evidence-based eligibility; escalation only on changed facts

CARE-24084
Missing pickup item, $16, no item-level scan, no owner for 27 hours
Pickup discrepancy; four-hour ownership rule; store and contact-centre boundary
Ownership escalation independent of amount; a rule written for an evidence gap; broken call-back recovery

CARE-24085
Return received, refund not released, 6 days against a 5-working-day commitment
Return refund timing; goodwill for a missed commitment; identity verification before payment detail
Breached-promise escalation to finance; money owed separated from goodwill; verification gating

14.5 Traceability onward
Every functional requirement in section 6 carries forward into the accompanying backlog, where it is realised as one or more user stories with acceptance criteria and a release placement. Business rules BR-1 to BR-14 are carried as acceptance criteria on the stories that enforce them rather than as separate items, so that no rule can be delivered as documentation alone. The non-functional requirements and the Responsible AI, security, privacy and data items are carried as their own backlog sections with the same acceptance discipline.
CLOSING NOTE
This document describes a validated prototype and a requirement set, not a delivered system. Every baseline figure is a fictional exercise assumption carried for planning purposes and must be replaced by an instrumented measurement before any benefit is claimed.


===== FILE: Contoso Retail Delivery Backlog - Customer Care and Order Exception Resolution.xlsx =====
===== TYPE: .xlsx (signature D0-CF-11-E0-A1-B1-1A-E1) =====
===== SECTIONS DETECTED: 9 worksheet(s) (legacy Excel, COM extraction) =====

----- SHEET README -----
Delivery Backlog — README |
Topic | Detail
Purpose | This workbook is the delivery backlog for the Contoso Retail Customer Care and Order Exception Resolution capability. It converts the Business Requirements Document into an epic, feature and user-story hierarchy with acceptance criteria, sequencing and readiness items.
Companion document | Business Requirements Document — Customer Care and Order Exception Resolution, version 1.0, 3 September 2026. Every backlog item carries a Traces to BRD reference back to that document.
Source artefact | Prototype v1 — an interactive prototype covering six views (case queue; consolidated case and timeline; policy and eligibility guidance; remedy and approval; customer message preview; resolution tracking) across five representative cases.
Fictional exercise notice | All content is fictional and illustrative, produced for a learning and validation engagement. Figures, policies, personas, cases and baselines do not represent observed Contoso Retail facts, committed benefits, or implementation promises.
Sheet — Epics | Nine epics with outcome statement, primary persona, business value, priority, target release, BRD traceability and dependencies.
Sheet — Features | Fifty-three features mapped to their epic, with persona, user need, business value, priority, release, sprint, dependencies and an acceptance summary.
Sheet — User Stories | Sixty-five user stories with persona, need and value, numbered acceptance criteria, a Given / When / Then example scenario, MoSCoW priority, estimate, sprint, release, dependencies and BRD traceability.
Sheet — NFR and Operational Readiness | Thirty items covering usability, accessibility, performance, resilience and operability, each with a measurable acceptance criterion.
Sheet — Data, Security, Privacy and Responsible AI | Thirty-two items covering data foundations and quality, security controls, privacy and compliance, and the Responsible AI control set including the assistive-only boundary.
Sheet — Spikes and Open Questions | Fourteen timeboxed spikes, each naming the question, the owner, the definition of done and the work it unblocks.
Sheet — Release Plan and Milestones | Sprint-by-sprint placement across Sprint 0, Release 1 (Sprints 1 to 10 including a controlled pilot), Release 2 and Release 3, with exit criteria and milestones.
Sheet — Definition of Ready and Done | Story-level, spike-level and release-level readiness and completion criteria.
Priority convention | MoSCoW — Must, Should, Could. Every Must item in Release 1 is required for the pilot entry gate.
Estimate convention | Story points on a Fibonacci scale (2, 3, 5, 8). Estimates are indicative and are re-estimated by the delivery team at sprint planning.
Traceability convention | FR references are functional requirements, BR are business rules, NFR are non-functional requirements, D are data requirements, S are security, P are privacy, RAI are Responsible AI, AC are acceptance criteria, DEP are dependencies and Q are open questions — all from the BRD.
Governing constraint | The capability assists and never decides. No automated remedy decision, approval, or outbound customer communication exists in any release. Approval thresholds are advisor $40, supervisor $150, finance reviewer above $150 and all policy exceptions.

----- SHEET Epics -----
Delivery Backlog — Epics |  |  |  |  |  |  |  |  |
Epic ID | Epic | Primary persona | Outcome statement | Business value | Priority | Target release | Traces to BRD | Dependencies and enablers | Prototype traceability
EP-01 | Case Intake, Classification and Queue Management | Advisor · Store associate | Every order-exception contact becomes a classified, prioritised, owned case with a visible reason for its priority. | Removes the 38 daily cases with no assigned next owner and makes priority explainable rather than implied. | Must | R1 | FR-1.1-1.10; BR-10, BR-12 | EP-07 (case data), EP-08 (access model) | View 1 — Case queue
EP-02 | Consolidated Case Context and Timeline | Advisor · Store associate | One assembled case view so the customer never repeats the story and the advisor stops searching. | Attacks the largest share of the 12.6-minute handling time and the 23% transfer rate. | Must | R1 | FR-2.1-2.12; BR-1, BR-2, BR-7, BR-9, BR-11 | EP-07 (source integration) | View 2 — Case and timeline
EP-03 | Policy and Eligibility Guidance | Advisor | The applicable rule, its evidence, its uncertainty and its exception path presented in one place with the advisor acknowledging before acting. | Targets the 3.4 minutes per case spent locating and interpreting policy across 2.3 pages. | Must | R1 | FR-3.1-3.12; BR-6, BR-7, BR-9, BR-13 | DEP-1 policy content; EP-08 (RAI controls) | View 3 — Policy and eligibility
EP-04 | Remedy Options, Authority and Approval | Advisor · Supervisor · Finance reviewer | Permitted remedies with amount, authority and real customer consequence shown together, decided within enforced limits with a recorded rationale. | Makes authority and consequence visible at the moment of choice and creates an auditable decision record. | Must | R1 | FR-4.1-4.13; BR-3, BR-4, BR-5, BR-6, BR-14 | EP-01 (ownership), EP-03 (acknowledgment gate) | View 4 — Remedy and approval
EP-05 | Customer Communication and Channel Delivery | Advisor | A drafted explanation that separates confirmed facts, estimates and unknowns, released only by a human in the customer's channel. | Improves customer understanding and stops messages overstating uncertain delivery or refund timing. | Must | R1 | FR-5.1-5.14; BR-7, BR-8, BR-9, BR-11 | EP-04 (decision), EP-02 (fact labelling), channel integration | View 5 — Customer message
EP-06 | Resolution Tracking, Escalation and Follow-up | Case owner · Policy owner / CX leader | Promises, owners, dependencies and reopens tracked to closure, with automatic escalation on breach or ownership gaps. | Attacks the 140 cases older than 48 hours, the 18% repeat-contact rate and unenforced promises. | Must | R1 | FR-6.1-6.12; BR-10, BR-11, BR-12 | EP-01, EP-04, EP-09 (measurement) | View 6 — Resolution tracking
EP-07 | Data Foundation and Source Integration | All personas (enabler) | Order, fulfilment, carrier, store, returns, payment, profile, case-history and policy data available with source attribution and freshness. | Nothing else in the capability is trustworthy without it; it is the critical-path enabler. | Must | R1 | Section 9; D-1 to D-8; DEP-1 to DEP-4, DEP-6 | Source system owners; DEP-2 hold reason codes | Underpins all six views
EP-08 | Responsible AI, Security, Privacy and Human Oversight | All personas · RAI board · Privacy · Security | Assistive-only operation, enforced human review, identity gating, traceability, fairness assessment and reversible versioning. | This is the licence to operate; pilot exposure to real customer data is gated on it. | Must | R1 | Section 10; RAI-1 to RAI-11; S-1 to S-7; P-1 to P-7 | DEP-7 assessments | Cross-cutting
EP-09 | Measurement, Adoption and Operational Readiness | Policy owner / CX leader · Operations | Instrumented measures, a captured baseline, dashboards, runbooks, training and support before any benefit is claimed. | Without a baseline no benefit claim is defensible in either direction. | Must | R1 | Section 13; NFR-O1 to NFR-O7; DEP-8 to DEP-10 | EP-06 (tracking events) | View 6 measures panel

----- SHEET Features -----
Delivery Backlog — Features |  |  |  |  |  |  |  |  |  |
Feature ID | Epic ID | Feature | Persona | User need | Business value | Priority | Release | Sprint | Dependencies and enablers | Acceptance summary
FE-01.1 | EP-01 | Prioritised case queue | Advisor · Store associate | See what to work on next and why it matters | Replaces implied urgency with a stated priority reason | Must | R1 | S1-S2 | EP-07 case data | Queue shows all ten queue fields with a stated priority reason on every row
FE-01.2 | EP-01 | Case ownership and assignment | Advisor · Store associate · Supervisor | Take, hold and hand over a case as a named individual | Eliminates the unowned-case failure mode | Must | R1 | S2 | Single-owner model agreed (DEP-5) | Accept, take over and supervisor reassignment all record a named owner and reason
FE-01.3 | EP-01 | Queue filtering and queue health | Advisor · Supervisor | Find unowned, awaiting-approval and at-risk cases fast | Makes ageing and ownership gaps actionable rather than reported after the fact | Must | R1 | S2-S3 | FE-01.1 | Filters for unowned, awaiting approval, escalation risk, ageing and channel; health counters accurate
FE-01.4 | EP-01 | Intake classification and priority scoring | Advisor · Store associate | Have the issue classified consistently at intake | Removes the inconsistent classification that surfaces missing information late | Must | R1 | S3 | EP-07 | Classification applied on intake with an explainable priority reason; advisor can correct it
FE-02.1 | EP-02 | Customer, preference and communication-support panel | Advisor · Store associate | Know who I am speaking to and how they want to be treated | Stops preference and accessibility needs being lost at the first contact | Must | R1 | S2 | Profile integration | Channel preference, language and communication support displayed and carried onward
FE-02.2 | EP-02 | Order, item and payment context | Advisor | See what was ordered, what happened to it and what was paid | Removes the largest single source of investigation time | Must | R1 | S2-S3 | Order, fulfilment, payment integration | Order lines, item states and payment lines shown with source attribution
FE-02.3 | EP-02 | Fulfilment timeline with source and freshness | Advisor · Store associate | See the event sequence and how current each source is | Prevents a stale carrier feed reading as current truth | Must | R1 | S3 | Carrier and store integration; Q-1 threshold | Every event carries source and timestamp; stale status is visibly marked
FE-02.4 | EP-02 | Confirmed facts, estimates and unknowns | Advisor | Know what I can say, what I can only estimate and what I must not claim | The core Responsible AI control, and the basis of every downstream message | Must | R1 | S3-S4 | FE-02.3 | Three labelled sets produced per case; labels propagate to guidance and message
FE-02.5 | EP-02 | Prior contacts and promise register | Advisor | See what the customer was already told and whether it held | Turns broken promises from an invisible failure into a tracked state | Must | R1 | S4 | Case history integration | Prior contacts and promises shown with state: met, not yet met, breached, inaccurate
FE-02.6 | EP-02 | Identity verification gate and assisted path | Advisor · Store associate | Verify before I expose payment detail, without shutting anyone out | Enforces BR-1 while keeping BR-2's accessible alternative | Must | R1 | S2 | IAM and profile integration | Payment masked until verification; assisted path available; method recorded
FE-02.7 | EP-02 | Missing-information request | Advisor | Ask for everything I need once, in the customer's channel | Removes the repeated-contact pattern caused by late discovery | Must | R1 | S4 | FE-02.1 | Checklist composes one consolidated request in the preferred channel and logs it
FE-03.1 | EP-03 | Rule identification and ranking | Advisor | Be shown which rules apply and how strongly | Collapses a 2.3-page search into one assembled answer | Must | R1 | S4 | DEP-1 policy content | Rules ranked and labelled primary, secondary, contributing or mandatory
FE-03.2 | EP-03 | Eligibility result with evidence chain | Advisor | Understand the result and see what it was based on | Auditable guidance is what makes it trustworthy and reviewable | Must | R1 | S4-S5 | FE-03.1, FE-02.4 | Result states the rule applied; every evidence item traces to a source or a recorded statement
FE-03.3 | EP-03 | Uncertainty, conflict and exception path | Advisor | Know what is contested and who decides when it is | Handles the conflicting and incomplete policy pages that cause disputes today | Must | R1 | S5 | FE-03.2 | Uncertainties stated with what they do and do not change; exception path names the deciding role
FE-03.4 | EP-03 | Advisor acknowledgment gate | Advisor | Confirm I have read and verified before I act | Makes the human-in-the-loop control real rather than assumed | Must | R1 | S5 | FE-03.2 | Remedy submission blocked until acknowledgment; acknowledgment recorded with actor and time
FE-03.5 | EP-03 | Safety and essential-use routing | Advisor · Supervisor | Have safety-related cases reviewed by a person, whatever the amount | Enforces BR-6, the rule least tolerant of automation | Must | R1 | S5 | FE-03.3 | Safety flag routes to explicit human review at any amount; routine remedy is not delayed by it
FE-03.6 | EP-03 | Guidance override and policy-defect signal | Advisor · Policy owner | Say when the guidance does not fit, and have that heard | Turns advisor disagreement into a policy improvement loop instead of a silent workaround | Should | R2 | S7 | FE-03.2 | Override captured with reason; aggregated into a policy-owner pattern view
FE-04.1 | EP-04 | Remedy option presentation | Advisor · Supervisor · Finance reviewer | See the options with cost, authority and customer consequence together | Fixes the specific friction that consequences and limits are not visible together | Must | R1 | S5 | FE-03.4 | Each option shows amount, required authority and the real customer consequence
FE-04.2 | EP-04 | Authority threshold enforcement | All decision roles | Be stopped from committing beyond my authority, and told why | Financial control made visible at the decision point | Must | R1 | S5-S6 | IAM role and limit data | $40 / $150 / above-$150 limits enforced; over-authority options visible, disabled and explained
FE-04.3 | EP-04 | Decision, rationale and audit trail | All decision roles | Record why I decided what I decided | Every discretionary payment becomes defensible in review | Must | R1 | S6 | FE-04.1 | Rationale mandatory; trail records actor, role, option, rule version, evidence and time
FE-04.4 | EP-04 | Approve, reject, revise and escalate | All decision roles | Route the decision correctly without losing the case context | Escalation carries evidence instead of restarting the investigation | Must | R1 | S6 | FE-04.2 | Four actions available per role; escalation carries the full evidence chain and preserves the owner
FE-04.5 | EP-04 | Money owed versus discretionary remedy | Advisor · Finance reviewer | Not present an overdue refund as a favour | Protects the customer's entitlement and the integrity of goodwill reporting | Must | R1 | S6 | FE-04.1 | Options classified; owed amounts cannot be worded or reported as goodwill
FE-04.6 | EP-04 | Suggested rationale drafting | Advisor · Supervisor | Start from a draft rather than a blank box | Reduces effort without transferring accountability | Should | R2 | S7 | FE-04.3 | Suggestion clearly marked as a draft; never auto-submitted; edit is recorded
FE-05.1 | EP-05 | Draft message generation with fact labelling | Advisor | Produce an explanation that is honest about uncertainty | The customer-facing expression of the whole capability | Must | R1 | S6 | FE-02.4, FE-04.3 | Draft separately labels confirmed facts, estimates and unknowns for every journey
FE-05.2 | EP-05 | Channel selection and adaptation | Advisor | Send in the channel the customer asked for, shaped for that channel | Respects stated preference and prevents fragmented or unreadable messages | Must | R1 | S6-S7 | Channel integration | Preferred channel pre-selected; deviation warned; content adapts per channel
FE-05.3 | EP-05 | Accessibility and communication-support variants | Advisor | Honour large print, plain language and support needs | Accessibility that survives handoffs rather than being re-declared | Must | R1 | S7 | FE-02.1 | Variants applied and preserved through transfer, escalation and follow-up
FE-05.4 | EP-05 | Edit, review and release control | Advisor · Supervisor | Edit freely, get a second opinion, and release deliberately | Nothing reaches a customer without a human act | Must | R1 | S7 | FE-04.4 | Edit recorded; send-for-review routes to a colleague; release blocked until the remedy is decided
FE-05.5 | EP-05 | Content guardrails and release checklist | Advisor | See what passes and what fails before I send | Turns the content rules into an operating control rather than training material | Must | R1 | S7 | FE-05.1 | Checklist shows each control's state; no unconfirmed timing can be released as a promise
FE-05.6 | EP-05 | Tone variants | Advisor | Match the register to the situation without changing the facts | Improves customer experience at no factual cost | Should | R2 | S8 | FE-05.1 | Tone variants change register only; factual content is provably unchanged
FE-06.1 | EP-06 | Promise, owner and next-action tracking | Case owner | Keep the promise visible until it is kept | Promises become observable rather than remembered | Must | R1 | S7 | EP-01, EP-04 | Promised date, next action, owner, dependency, response and reopen state tracked per case
FE-06.2 | EP-06 | Automatic escalation rules | Supervisor · Finance reviewer | Have the system escalate before the customer has to chase | Directly attacks the 140-case ageing backlog | Must | R1 | S8 | Q-9 clock definition | Four-hour ownership, breached promise, complaint and hardship escalations fire and notify
FE-06.3 | EP-06 | Repeat contact detection and reopen | Case owner · CX leader | Know when someone is contacting us again about the same thing | Makes the 18% repeat-contact measure actionable at case level | Must | R1 | S8 | Case history integration | Same-issue contact within seven days links the case and marks it reopened
FE-06.4 | EP-06 | Case activity and disclosure log | All personas · Audit | Have a complete record of what was done and disclosed | The evidentiary backbone for audit, complaint handling and quality review | Must | R1 | S8 | FE-04.3 | Every action, decision, disclosure and release logged with actor, role and time
FE-06.5 | EP-06 | Outcome and pattern reporting | Policy owner / CX leader | See where cases stall and which rules keep failing | Aggregate insight without individual surveillance | Must | R1 | S9 | EP-09 | Aggregate-only views by rule, journey, store and channel; no individual performance ranking
FE-06.6 | EP-06 | Scheduled follow-up and closure | Case owner | Close properly, or come back at the right time | Prevents silent abandonment and premature closure | Should | R2 | S9 | FE-06.1 | Follow-ups carry an owner and a checkpoint; closure records an outcome classification
FE-07.1 | EP-07 | Source integration layer with attribution and freshness | Enabler | Every fact carries where it came from and how old it is | Preconditions the entire fact-labelling model | Must | R1 | S1-S3 | Source system owners | Each integrated source returns value, source identity and last-update timestamp
FE-07.2 | EP-07 | Policy content as identified, dated, versioned units | Enabler | Cite a rule by identifier, effective date and version | Without it, guidance cannot be traced or audited | Must | R1 | S1-S2 | DEP-1 policy owner | Rules retrievable by identifier with effective date and version history
FE-07.3 | EP-07 | Structured promise and ownership records | Enabler | Store promises and ownership as states, not free text | Makes breach detection and ownership escalation possible at all | Must | R1 | S2-S3 | Case management integration | Promises and ownership persisted as structured, state-bearing records
FE-07.4 | EP-07 | Refund status and hold-reason integration | Enabler | Know why a refund is held | Closes the named root-cause gap in the return-status journey | Must | R1 | S3-S4 | DEP-2 finance | Refund raised, released and hold-reason states retrievable; unknown shown honestly when absent
FE-07.5 | EP-07 | Data readiness and quality assessment per domain | Enabler | Know what each source can and cannot support before we design on it | Prevents building journeys on data that cannot carry them | Must | R1 | S1 | Data owners | Assessment completed per domain with gaps, owners and mitigations recorded
FE-08.1 | EP-08 | Role-based access and authority model | Enabler | Give each role exactly the rights it should have | Least privilege plus enforceable approval limits | Must | R1 | S2 | IAM | Persona access model implemented; authority cannot be self-granted or self-escalated
FE-08.2 | EP-08 | Traceability, versioning and reversibility | Enabler | Know which guidance version influenced which case, and be able to roll it back | Operational safety net for any guidance change | Must | R1 | S5-S6 | EP-03 | Model, prompt and rule versions recorded per case; rollback rehearsed
FE-08.3 | EP-08 | Fairness assessment and disparity monitoring | RAI board · CX leader | Test whether treatment differs by language, disability, value, history or channel | The engagement's own stated fairness question, answered with evidence | Must | R1 | S8-S9 | EP-09 measurement | Disparity tested on remedy, escalation and effort pre-pilot and monitored in pilot
FE-08.4 | EP-08 | Privacy, DPIA and retention controls | Privacy | Process the minimum, for a documented purpose, for a defined period | Gates pilot exposure to real customer data | Must | R1 | S4-S6 | DEP-7 | DPIA complete; retention defined for cases, drafts, released messages and logs
FE-08.5 | EP-08 | Security controls and assurance | Security | Protect customer and payment data and prove it | Gates pilot exposure to real customer data | Must | R1 | S6-S8 | DEP-7 | Threat model, controls and penetration test complete with findings closed
FE-08.6 | EP-08 | Colleague feedback loop on guidance quality | Advisor · RAI board | Report a wrong or unhelpful output in one action | Creates the monitored improvement signal the guidance needs | Must | R1 | S8 | FE-03.6 | One-action report; reports triaged in a monitored review loop with response times
FE-08.7 | EP-08 | Customer transparency on AI assistance | RAI board · Legal | State our position on AI assistance clearly | Answers open question Q-2 before pilot | Must | R1 | S7 | Q-2 decision | Transparency position agreed, documented and applied consistently across channels
FE-09.1 | EP-09 | Measurement instrumentation and event stream | Enabler | Emit the events the measures need | No baseline, no defensible benefit claim | Must | R1 | S3-S5 | EP-06 | Events emitted for handling effort, transfer, repeat contact, ageing, ownership, escalation and reopen
FE-09.2 | EP-09 | Baseline capture before rollout | CX leader | Know where we started | Prevents benefit claims that cannot be evidenced | Must | R1 | S5-S6 | FE-09.1 | Pre-pilot baseline captured and agreed for every measure in section 13.1
FE-09.3 | EP-09 | Operational dashboards and alerting | Operations | See queue health, ageing, ownership gaps and guardrail blocks live | Operability from day one of pilot | Must | R1 | S8-S9 | FE-09.1 | Dashboards live at pilot start; alerting routes to a named operational owner
FE-09.4 | EP-09 | Runbooks, support model and content rollback | Operations | Know what to do when it breaks | Readiness gate for pilot | Must | R1 | S9 | NFR-O5 | Runbooks rehearsed for guidance failure, source outage, escalation backlog and rollback
FE-09.5 | EP-09 | Training, adoption and change | Operations · Change | Prepare advisors, associates, supervisors and finance | Adoption is the main risk to realising any benefit | Must | R1 | S9-S10 | DEP-10 | Role-based training delivered; adoption and confidence measured in pilot
FE-09.6 | EP-09 | Quality review extension to AI-assisted cases | Policy owner / Quality | Sample assisted cases distinctly | Answers whether policy adherence actually improved | Must | R1 | S9 | DEP-9 | Sampling design distinguishes assisted from unassisted cases and reports both

----- SHEET User Stories -----
Delivery Backlog — User Stories |  |  |  |  |  |  |  |  |  |  |  |  |  |
Story ID | Feature ID | Epic ID | Persona | User story | Business value | Acceptance criteria | Example scenario (Given / When / Then) | MoSCoW | Estimate (pts) | Sprint | Release | Dependencies | Traces to BRD | Prototype view
US-001 | FE-01.1 | EP-01 | Contact-centre advisor | As a contact-centre advisor, I want a queue showing case ID, age, channel, issue, customer impact, order value, priority reason, owner and approval state, so that I can choose the right next case without opening each one. | Cuts selection time and makes prioritisation defensible. | 1. All ten fields render for every case. 2. Age is shown in elapsed time and by opened timestamp. 3. Order value is formatted as currency. 4. Approval state is one of: not requested, awaiting decision, approved, rejected, returned for revision, escalated to a named level. 5. The queue refreshes without losing the advisor's scroll position. | Given 40 open cases across delivery and pickup, When the advisor opens the queue, Then every case shows all ten fields and no case renders with an empty priority reason. | Must | 5 | S1 | R1 | FE-07.1 | FR-1.1, FR-1.6 | View 1
US-002 | FE-01.1 | EP-01 | Store-service associate | As a store-service associate, I want to see pickup cases for my store in the same queue the contact centre uses, so that we are working one list rather than two. | Removes the divergent-view root cause behind the store/contact-centre ownership dispute. | 1. Store scope filters to that store's cases by default. 2. The associate can see, but not silently alter, cases owned by the contact centre. 3. Field set and semantics are identical to the advisor view. | Given a pickup case raised at Store 118, When the associate opens the queue, Then the case appears with the same fields the contact centre sees. | Must | 3 | S2 | R1 | FE-08.1 | FR-1.9 | View 1
US-003 | FE-01.1 | EP-01 | Contact-centre advisor | As an advisor, I want every case to state why it is prioritised, so that I am not guessing at someone else's urgency. | Prioritisation becomes explainable and challengeable rather than opaque. | 1. A priority reason in business language is mandatory on every case. 2. No case can be displayed as high priority without one. 3. The reason names the driver (time-critical need, safety flag, breached promise, ownership gap, stale status). | Given a case flagged high priority because a refund commitment was breached, When it appears in the queue, Then the priority reason states the breached commitment rather than a score. | Must | 3 | S2 | R1 | US-001 | FR-1.2 | View 1
US-004 | FE-01.2 | EP-01 | Contact-centre advisor | As an advisor, I want to accept a case and be recorded as its named owner, so that the customer has someone to ask for by name. | Directly addresses the 38 daily cases with no assigned next owner. | 1. Accept records the individual, their role and the timestamp. 2. The four-working-hour ownership clock resets on acceptance. 3. The owner is visible in the queue, the case view and any customer message. 4. Acceptance is blocked for roles without ownership rights, with the reason stated. | Given an unowned case, When the advisor accepts it, Then the owner shows their name and role and the ownership clock resets. | Must | 5 | S2 | R1 | FE-08.1 | FR-1.3, BR-12 | View 1
US-005 | FE-01.2 | EP-01 | Supervisor | As a supervisor, I want to take over or reassign a case that already has an owner, so that ownership follows capability and availability rather than routing history. | Keeps the single-owner model workable when people are unavailable. | 1. Take-over records the previous owner, the new owner and a reason. 2. The previous owner is notified. 3. Ownership history is retained and reportable. | Given a case owned by an absent advisor, When the supervisor reassigns it, Then the transfer and its reason are recorded and the prior owner is notified. | Must | 3 | S2 | R1 | US-004 | FR-1.4, FR-6.11 | View 1
US-006 | FE-01.2 | EP-01 | Policy owner / CX leader | As a policy owner, I want to be prevented from owning or deciding a case, so that my monitoring role cannot be confused with an operational one. | Keeps oversight independent of the decisions it oversees. | 1. Ownership and decision actions are unavailable to the read-only role. 2. The interface explains the restriction rather than failing silently. 3. The attempt is logged. | Given the policy owner is signed in, When they attempt to accept a case, Then the action is refused with a plain-language explanation and no ownership is recorded. | Must | 2 | S2 | R1 | FE-08.1 | FR-1.7, RAI-11 | View 1
US-007 | FE-01.3 | EP-01 | Supervisor | As a supervisor, I want to filter the queue to unowned, awaiting-approval and escalation-risk cases, so that I can clear the exceptions before they age. | Turns the ageing backlog into a worklist rather than a monthly report. | 1. Filters for unowned, awaiting approval, escalation risk, ageing band, channel and issue type. 2. Filters combine. 3. Counts match the underlying case set exactly. | Given 12 unowned cases, When the supervisor applies the unowned filter, Then exactly those 12 are listed and the counter agrees. | Must | 3 | S2 | R1 | US-001 | FR-1.5 | View 1
US-008 | FE-01.3 | EP-01 | Policy owner / CX leader | As a CX leader, I want queue health counters for open volume, cases over 48 hours, unowned cases and transfers, so that I can see whether the operation is holding. | Makes the ageing and ownership measures visible daily instead of retrospectively. | 1. Counters are aggregate only and name no individual. 2. Values reconcile to the case set. 3. Counters refresh on the agreed interval. | Given 140 cases older than 48 hours of which 38 are unowned, When the leader opens the queue health panel, Then both figures are shown and reconcile to the case list. | Should | 3 | S3 | R1 | FE-09.1 | FR-1.8 | View 1
US-009 | FE-01.4 | EP-01 | Contact-centre advisor | As an advisor, I want the issue classified at intake with a reason I can correct, so that classification stops depending on who picked up the contact. | Attacks the inconsistent classification that causes late discovery of missing information. | 1. A classification and priority reason are applied on intake. 2. The advisor can change both, with the change recorded. 3. Corrections feed a review signal for classification quality. | Given an inbound contact about a late delivery, When the case is created, Then it is classified as a delivery exception with a stated reason the advisor may correct. | Must | 5 | S3 | R1 | FE-07.1 | FR-1.2, FR-2.10 | View 1
US-010 | FE-01.3 | EP-01 | Supervisor | As a supervisor, I want to reassign several unowned cases at once, so that a backlog can be cleared in one action. | Reduces the cost of clearing an ownership gap after a peak. | 1. Multi-select with a single reassignment action. 2. Each case records its own transfer entry. 3. A partial failure reports which cases did not reassign. | Given eight unowned cases selected, When the supervisor reassigns them to a named advisor, Then eight individual ownership records are written. | Could | 3 | S9 | R2 | US-005 | FR-1.10 | View 1
US-011 | FE-02.1 | EP-02 | Contact-centre advisor | As an advisor, I want the customer's preferred channel, language and communication support shown at the top of the case, so that I do not have to ask them again. | Removes the repeat-the-story friction at the very first step. | 1. Preferred channel, language and communication support display from the profile. 2. Missing preferences show as unknown, never as a default. 3. The values carry into the message view. | Given a customer who asked for text-only contact during working hours, When the advisor opens the case, Then the text-only preference is displayed before any message is drafted. | Must | 3 | S2 | R1 | FE-07.1 | FR-2.1, BR-11 | View 2
US-012 | FE-02.2 | EP-02 | Contact-centre advisor | As an advisor, I want the order lines and their current item states in the case view, so that I can see what was ordered and what happened to each item. | Removes a large share of the per-case investigation time. | 1. Every order line shows description, quantity, state and value. 2. Sub-items and substituted items are shown against the line they replaced. 3. Each state names its source system. | Given an order where one of fourteen items was substituted, When the advisor opens the case, Then both the ordered and the substituted item are shown against the same line. | Must | 5 | S2 | R1 | FE-07.1 | FR-2.1 | View 2
US-013 | FE-02.3 | EP-02 | Contact-centre advisor | As an advisor, I want a fulfilment timeline where each event names its source and its age, so that I can tell current fact from stale record. | Prevents a five-hour-old carrier scan being read as the vehicle's present position. | 1. Events are ordered and dated. 2. Each event names its source system. 3. Events are marked confirmed, estimated or uncertain. 4. A freshness indicator states the age of the most recent status per source. | Given the last carrier scan is five hours old, When the advisor views the timeline, Then the scan is marked stale and the freshness indicator states its age. | Must | 8 | S3 | R1 | FE-07.1, Q-1 | FR-2.2, FR-2.3, D-1, D-2 | View 2
US-014 | FE-02.4 | EP-02 | Contact-centre advisor | As an advisor, I want confirmed facts, estimates and unknowns presented as three separate labelled sets, so that I never state an estimate as a fact. | The central Responsible AI control and the basis of every customer message. | 1. Three distinct labelled sets are produced per case. 2. No item appears in more than one set. 3. An unknown is never rendered as blank, zero or a default. 4. The labels propagate unchanged into guidance and the message draft. | Given a case with a stale carrier estimate and an unverified chilled-item condition, When the summary is produced, Then the arrival time appears under estimates and the item condition under unknowns. | Must | 8 | S3 | R1 | US-013 | FR-2.4, BR-7, RAI-2, D-4, D-5 | View 2
US-015 | FE-02.5 | EP-02 | Contact-centre advisor | As an advisor, I want to see what the customer was already promised and whether it held, so that I do not repeat a promise we have already broken. | Turns broken promises from an invisible failure into a visible state. | 1. Prior promises are listed with who made them, when, and through which channel. 2. Each carries a state: met, not yet met, breached, or inaccurate. 3. Breached promises are visually distinct. | Given a call-back was promised yesterday and never made, When the advisor opens the case, Then the promise shows as breached before any new commitment can be drafted. | Must | 5 | S4 | R1 | FE-07.3 | FR-2.5, FR-6.1 | View 2
US-016 | FE-02.6 | EP-02 | Contact-centre advisor | As an advisor, I want payment detail masked until I have verified the customer's identity, so that I cannot expose it by accident. | Enforces BR-1 as a system control rather than a training expectation. | 1. Payment fields are masked by default. 2. Verification unmasks and records the method used. 3. Changing a refund destination requires a fresh verification. 4. Every unmasking is logged with actor and time. | Given an unverified customer, When the advisor opens the payments panel, Then all payment values are masked and the verification prompt is shown. | Must | 5 | S2 | R1 | FE-08.1 | FR-2.6, BR-1, S-2 | View 2
US-017 | FE-02.6 | EP-02 | Contact-centre advisor | As an advisor, I want an assisted verification path when standard verification is not accessible to the customer, so that a disability or a lost device never means refusal of service. | Prevents an access control becoming an exclusion. | 1. An assisted path is offered whenever standard verification fails or is declined. 2. Refusal of service is not an available outcome. 3. The path used is recorded distinctly from standard verification. | Given a customer who cannot receive a one-time code, When the advisor selects the assisted path, Then verification completes and the method is recorded as assisted. | Must | 5 | S2 | R1 | US-016 | FR-2.7, BR-2, NFR-A6 | View 2
US-018 | FE-02.7 | EP-02 | Contact-centre advisor | As an advisor, I want to select everything missing and send one consolidated request in the customer's channel, so that we ask once rather than three times. | Attacks the repeat-contact pattern caused by piecemeal information gathering. | 1. A checklist of missing items is presented with why each is needed. 2. Selected items compose into a single message. 3. The message defaults to the customer's preferred channel. 4. The request is logged against the case. | Given three missing items are selected, When the advisor sends the request, Then one message is sent in the preferred channel and one log entry is written. | Must | 5 | S4 | R1 | US-011 | FR-2.8, FR-2.9 | View 2
US-019 | FE-02.2 | EP-02 | Store-service associate | As a store associate, I want store pick, stage, handover and stock-count evidence in the case, so that a missing-item dispute is judged on what the store actually recorded. | Makes the pickup journey resolvable at the desk rather than by routing. | 1. Store events display with source and timestamp. 2. Absence of an item-level scan is stated explicitly as a gap. 3. Stock-count status is shown as run, not run, or pending. | Given a pickup marked complete with only an order-level scan, When the associate opens the case, Then the absence of an item-level scan is stated as a known gap. | Must | 5 | S3 | R1 | FE-07.1 | FR-2.11, E-9 | View 2
US-020 | FE-02.4 | EP-02 | Contact-centre advisor | As an advisor, I want the assembled summary presented as a draft I must review, so that accountability for its accuracy sits with me and is recorded. | Makes the human-review control auditable rather than assumed. | 1. The summary is labelled a draft until reviewed. 2. Review is an explicit action recorded with actor and time. 3. Downstream steps state whether review has occurred. | Given a newly assembled case summary, When the advisor has not yet reviewed it, Then it is labelled as an unreviewed draft everywhere it appears. | Must | 3 | S4 | R1 | US-014 | FR-2.10, BR-9, RAI-3 | View 2
US-021 | FE-02.2 | EP-02 | Contact-centre advisor | As an advisor, I want to correct or annotate an assembled fact that is wrong, so that the case record reflects what I verified rather than what a system reported. | Keeps the advisor accountable and gives the data owners a defect signal. | 1. A correction records the original value, the corrected value, the author and the time. 2. Corrections are visually distinct from source values. 3. Corrections aggregate into a data-quality signal. | Given a delivery address the order system reports incorrectly, When the advisor corrects it, Then both values are retained and the correction is attributed. | Should | 5 | S7 | R2 | US-012 | FR-2.12, D-6 | View 2
US-022 | FE-03.1 | EP-03 | Contact-centre advisor | As an advisor, I want the applicable rules identified and ranked, so that I stop searching across policy pages mid-conversation. | Targets the 3.4 minutes per case spent locating and interpreting policy. | 1. Rules are ranked by relevance. 2. Each is labelled primary, secondary, contributing or mandatory. 3. Mandatory rules are always shown regardless of ranking. | Given a late-delivery case with a chilled sub-basket, When guidance is produced, Then the delivery disruption rule ranks primary and the uncertainty-communication rule shows as mandatory. | Must | 8 | S4 | R1 | FE-07.2 | FR-3.1 | View 3
US-023 | FE-03.1 | EP-03 | Contact-centre advisor | As an advisor, I want each rule shown with its identifier, name, effective date and operative wording, so that I can quote the actual rule rather than a paraphrase. | Makes guidance defensible in quality review and in a complaint. | 1. Identifier, name, effective date and operative extract display for every rule shown. 2. The extract is the published wording, not a generated summary. 3. The version applied is recorded against the case. | Given the delivery disruption rule effective 1 April 2026, When the advisor reads the guidance, Then its identifier, effective date and published wording are shown. | Must | 5 | S4 | R1 | US-022 | FR-3.2, FR-3.9, D-7 | View 3
US-024 | FE-03.2 | EP-03 | Contact-centre advisor | As an advisor, I want an eligibility result explained in plain language against this case's facts, so that I understand the answer well enough to defend it. | Converts policy interpretation from a search task into a review task. | 1. The result states which rule produced it and how the case's facts meet or fail its conditions. 2. The result is labelled advisory. 3. No result is produced where the evidence does not support one; the gap is stated instead. | Given a delivery seven hours past a confirmed window against a four-hour threshold, When guidance is produced, Then the result states the elapsed time and names the threshold it exceeded. | Must | 8 | S4 | R1 | US-023 | FR-3.3, FR-3.8, RAI-4 | View 3
US-025 | FE-03.2 | EP-03 | Contact-centre advisor | As an advisor, I want every piece of evidence behind the result listed and traceable, so that I can check the reasoning rather than trust it. | Directly counters the over-trust risk R-4. | 1. Each evidence item names its source system or identifies it as a colleague-recorded customer statement. 2. Nothing outside the listed evidence influences the result. 3. Evidence items link to the timeline entry they came from. | Given an eligibility result, When the advisor opens the evidence panel, Then every input is listed with its source and none is unattributed. | Must | 5 | S5 | R1 | US-024 | FR-3.4, D-6, RAI-4 | View 3
US-026 | FE-03.3 | EP-03 | Contact-centre advisor | As an advisor, I want the uncertainties and rule conflicts stated with what each does and does not change, so that I know which parts of the answer are solid. | Handles the conflicting and incomplete policy pages that drive today's disputes. | 1. Each uncertainty states its effect on the result. 2. Conflicting rules are both shown with their sources; neither is silently preferred. 3. Where no rule covers the facts, the gap is stated as a gap. | Given a chilled-item rule that applies only if a temperature breach occurred, When the breach is unverified, Then the guidance states the remedy is conditional and says why. | Must | 5 | S5 | R1 | US-024 | FR-3.5, D-3, E-6 | View 3
US-027 | FE-03.3 | EP-03 | Contact-centre advisor | As an advisor, I want the exception path to name who decides and when it applies, so that I escalate to the right person the first time. | Reduces the 23% transfer rate by removing guesswork from routing. | 1. The exception path names the deciding role and the trigger condition. 2. It states whether the routine remedy proceeds in parallel. 3. The path is available as a one-action escalation. | Given a full refund requested on an order that may still arrive, When guidance is produced, Then the exception path names supervisor review and states the trigger. | Must | 5 | S5 | R1 | US-026 | FR-3.6, E-3 | View 3
US-028 | FE-03.4 | EP-03 | Contact-centre advisor | As an advisor, I want to acknowledge that I have read and verified the guidance before I can submit a remedy, so that the human-in-the-loop step is real. | Makes BR-9 a system control instead of a training message. | 1. Remedy submission is blocked until acknowledgment. 2. Acknowledgment records actor, role, rule versions and time. 3. Withdrawal of acknowledgment re-blocks submission. 4. Read-only roles cannot acknowledge. | Given unacknowledged guidance, When the advisor attempts to submit a remedy, Then submission is blocked and the missing acknowledgment is named as the reason. | Must | 5 | S5 | R1 | US-025 | FR-3.7, BR-9, RAI-3 | View 3
US-029 | FE-03.5 | EP-03 | Contact-centre advisor | As an advisor, I want a safety, allergy, accessibility or essential-use concern to route to explicit human review regardless of the amount, so that a low-value case is not decided routinely when the stakes are not financial. | Enforces BR-6, the rule least tolerant of automation. | 1. The flag routes to human review at any amount. 2. The routine remedy is not delayed by the review. 3. The review is recorded with the reviewing role and its reason. 4. No medical characterisation is inferred or recorded unless the customer volunteered it. | Given an $18 substitution conflicting with a recorded fragrance-free need, When guidance is produced, Then human review is required and the refund is not held pending that review. | Must | 8 | S5 | R1 | US-024 | FR-3.10, BR-6, RAI-6, P-3 | View 3
US-030 | FE-03.6 | EP-03 | Contact-centre advisor | As an advisor, I want to record that the guidance does not fit the case, so that my disagreement improves the rules instead of becoming a private workaround. | Creates the policy improvement loop and surfaces rule defects. | 1. An override is captured in one action with a mandatory reason. 2. The case proceeds under the advisor's judgment. 3. Overrides aggregate by rule for the policy owner. | Given guidance that misreads the facts, When the advisor records an override with a reason, Then the case proceeds and the rule is credited with an override signal. | Should | 5 | S7 | R2 | US-028 | FR-3.11, RAI-8 | View 3
US-031 | FE-03.6 | EP-03 | Policy owner / CX leader | As a policy owner, I want overrides and disputed rules aggregated into a pattern view, so that I can fix the rules that keep failing. | Turns individual friction into a policy backlog. | 1. Aggregation is by rule, journey, store and channel. 2. No individual colleague is named or ranked. 3. Trend over time is visible. | Given repeated overrides on the substitution rule, When the policy owner opens the pattern view, Then that rule surfaces as a top defect signal without naming any advisor. | Should | 5 | S8 | R2 | US-030 | FR-3.12, RAI-11 | View 3
US-032 | FE-04.1 | EP-04 | Contact-centre advisor | As an advisor, I want each remedy option shown with its amount, its required authority and the consequence the customer will actually experience, so that I choose knowing the trade-off. | Fixes the stated friction that consequences and authority limits are not visible together. | 1. Every option shows amount, authority level and customer consequence. 2. Consequence is written from the customer's point of view, not the system's. 3. Options unsupported by the facts are not offered. | Given a late-delivery case, When the advisor opens the remedy view, Then monitoring, goodwill, redelivery and cancellation each show cost, authority and consequence. | Must | 8 | S5 | R1 | US-028 | FR-4.1 | View 4
US-033 | FE-04.2 | EP-04 | Contact-centre advisor | As an advisor, I want options above my authority to be visible but disabled with the reason shown, so that I know what exists and who can approve it. | Keeps the escalation path discoverable instead of hiding the option. | 1. Over-authority options render, disabled, with the required level named. 2. A one-action escalation to that level is offered. 3. Hiding an option is never the behaviour. | Given an advisor with a $40 limit and a $126 refund option, When the remedy view loads, Then the option is visible, disabled, and labelled as requiring supervisor authority. | Must | 5 | S5 | R1 | US-032 | FR-4.4, E-3 | View 4
US-034 | FE-04.2 | EP-04 | Supervisor | As a supervisor, I want the $40, $150 and above-$150 thresholds enforced by the system, so that authority is a control rather than a convention. | Financial control at the decision point. | 1. Advisor decisions above $40 are refused. 2. Supervisor decisions above $150 are refused. 3. Above $150 and all policy exceptions route to a finance reviewer. 4. No role can raise its own limit. | Given a supervisor and a $180 remedy, When approval is attempted, Then it is refused and finance review is offered as the route. | Must | 8 | S5 | R1 | FE-08.1 | FR-4.3, BR-3, BR-4, BR-5, S-6 | View 4
US-035 | FE-04.3 | EP-04 | Contact-centre advisor | As an advisor, I want a rationale to be mandatory before any decision, so that the reasoning survives the conversation. | Every discretionary payment becomes defensible in review. | 1. Approve, reject and escalate are blocked without a rationale of meaningful length. 2. The rationale is stored against the decision. 3. It appears in quality review and audit extracts. | Given a selected remedy and an empty rationale, When approval is attempted, Then it is blocked and the missing rationale is named. | Must | 3 | S6 | R1 | US-032 | FR-4.5 | View 4
US-036 | FE-04.3 | EP-04 | Finance reviewer | As a finance reviewer, I want a complete decision trail with actor, role, option, rule version, evidence and rationale, so that I can stand behind discretionary spend in an audit. | The evidentiary basis for financial control. | 1. Every decision writes all six attributes. 2. The trail is immutable and time-ordered. 3. It is exportable for audit. 4. Rule version is the version in force at decision time. | Given an approved $79 remedy, When the audit extract is produced, Then it names the approver, their role, the option, the rule version, the evidence set and the rationale. | Must | 8 | S6 | R1 | US-035 | FR-4.9, NFR-O1, P-7 | View 4
US-037 | FE-04.4 | EP-04 | Supervisor | As a supervisor, I want to approve, reject, return for revision or escalate with the case context attached, so that a decision does not restart the investigation. | Reduces the transfer and rework cost of escalation. | 1. Four actions are available subject to role. 2. Escalation carries facts, guidance, evidence and rationale. 3. Return for revision names what must change. 4. The customer's named owner and checkpoint persist throughout. | Given an escalated case, When the finance reviewer opens it, Then the full evidence chain is present without any re-request to the advisor. | Must | 8 | S6 | R1 | US-036 | FR-4.7, FR-4.10, FR-4.11 | View 4
US-038 | FE-04.5 | EP-04 | Finance reviewer | As a finance reviewer, I want money owed distinguished from a discretionary remedy, so that an overdue refund is never presented to a customer as a favour. | Protects the customer's entitlement and the integrity of goodwill reporting. | 1. Each option is classified as owed or discretionary. 2. Owed amounts cannot be worded as goodwill in any draft message. 3. Reporting separates the two categories. | Given a $64 refund overdue against a five-working-day commitment, When options are presented, Then the refund is classified as owed and only the $15 credit is classified as goodwill. | Must | 5 | S6 | R1 | US-032 | FR-4.2, BR-14 | View 4
US-039 | FE-04.4 | EP-04 | Contact-centre advisor | As an advisor, I want every blocked decision to name each unmet prerequisite, so that I can fix the blockage instead of guessing at it. | Removes a common source of frustration and unnecessary escalation. | 1. All unmet prerequisites are listed, not just the first. 2. Wording is business language, never system or error text. 3. Prerequisites resolve live as they are satisfied. | Given no owner, no acknowledgment and no rationale, When approval is attempted, Then all three blockers are listed together. | Must | 3 | S6 | R1 | US-035 | FR-4.8, NFR-U5 | View 4
US-040 | FE-04.6 | EP-04 | Contact-centre advisor | As an advisor, I want suggested rationale wording I can edit, so that I start from a draft rather than a blank box. | Reduces effort without transferring accountability. | 1. The suggestion is clearly marked as a draft. 2. It is never submitted without an explicit human action. 3. Edits are recorded. 4. The final wording is attributed to the decision-maker. | Given a selected remedy, When the advisor inserts the suggested rationale, Then it appears as editable text marked as a draft and is not submitted automatically. | Should | 3 | S7 | R2 | US-035 | FR-4.6, RAI-3 | View 4
US-041 | FE-04.2 | EP-04 | Policy owner / CX leader | As a read-only role, I want to be prevented from making any remedy decision, so that oversight cannot become an operational shortcut. | Keeps the governance role independent. | 1. All decision actions are unavailable to the read-only role. 2. The restriction is explained. 3. Attempts are logged. | Given the policy owner is signed in, When the remedy view loads, Then all decision actions are unavailable and the read-only status is stated. | Must | 2 | S6 | R1 | FE-08.1 | FR-4.13, RAI-11 | View 4
US-042 | FE-05.1 | EP-05 | Contact-centre advisor | As an advisor, I want a drafted explanation that separately labels confirmed facts, estimates and unknowns, so that the customer gets an honest picture rather than a confident one. | The customer-facing expression of the whole capability. | 1. The draft contains three labelled sections carrying the case's fact labels unchanged. 2. Nothing labelled unknown is presented as known. 3. The draft names the remedy, the owner and the next step. 4. The draft is never sent automatically. | Given a case with a stale carrier estimate, When the draft is produced, Then the estimate appears under estimates with its source age and not as an arrival commitment. | Must | 8 | S6 | R1 | US-014, US-036 | FR-5.1, BR-7, RAI-2 | View 5
US-043 | FE-05.5 | EP-05 | Contact-centre advisor | As an advisor, I want the system to prevent me releasing an unconfirmed delivery or refund time as a promise, so that we stop creating the next complaint while resolving this one. | Enforces BR-8, the rule most directly tied to repeat contact. | 1. Timing is expressed as a working-day range or as a checkpoint the owner controls. 2. A specific unconfirmed date cannot be released as a commitment. 3. The guardrail state is shown before release, not after. | Given a carrier estimate of 6:00 p.m. that is not a confirmed slot, When the advisor attempts release, Then the guardrail blocks any wording that states it as a promise. | Must | 8 | S7 | R1 | US-042 | FR-5.2, BR-8 | View 5
US-044 | FE-05.2 | EP-05 | Contact-centre advisor | As an advisor, I want the customer's stated channel pre-selected and any deviation warned, so that a preference is honoured by default rather than by memory. | Respects stated preference and reduces customer effort. | 1. The stated channel is pre-selected. 2. Choosing another channel raises a visible warning naming the stated preference. 3. The deviation and its reason are logged. | Given a customer who asked for text only, When the advisor selects email, Then a warning names the stated preference and the deviation is logged. | Must | 5 | S6 | R1 | US-011 | FR-5.3, BR-11 | View 5
US-045 | FE-05.2 | EP-05 | Contact-centre advisor | As an advisor, I want the draft shaped for the channel it will go out on, so that an SMS is not a fragmented email and a call script is not read verbatim. | Prevents the message quality being lost in the delivery channel. | 1. SMS drafts respect length limits without dropping a labelled section. 2. Email drafts carry a subject line and full structure. 3. Voice and store drafts are written as spoken guidance with a verification prompt. | Given the SMS channel, When the draft is produced, Then it fits the channel's constraints while retaining the confirmed, estimate and unknown sections. | Must | 5 | S7 | R1 | US-044 | FR-5.4 | View 5
US-046 | FE-05.3 | EP-05 | Contact-centre advisor | As an advisor, I want accessibility and communication-support preferences applied to the message and preserved across handoffs, so that a customer never has to re-declare a support need. | Accessibility that survives the process, not just the first contact. | 1. Large-print and plain-language variants are available and applied. 2. Preferences persist through transfer, escalation and follow-up. 3. A new owner inherits them without action. | Given a customer needing plain language, When the case escalates to finance and returns, Then the preference is still applied to the next message. | Must | 5 | S7 | R1 | US-011 | FR-5.6, BR-11, NFR-A5 | View 5
US-047 | FE-05.4 | EP-05 | Contact-centre advisor | As an advisor, I want to edit the draft freely before release, so that I can say it in my own words and remain accountable for it. | Keeps accountability with the human who signs the message. | 1. The full draft is editable. 2. The edit is recorded with actor and time. 3. The released text is stored exactly as sent. | Given a produced draft, When the advisor edits and saves it, Then the edit is recorded and the released version matches what was sent. | Must | 3 | S7 | R1 | US-042 | FR-5.7, FR-5.12 | View 5
US-048 | FE-05.4 | EP-05 | Contact-centre advisor | As an advisor, I want to send a draft for colleague or supervisor review, so that I can get a second opinion on a difficult message. | Supports quality on the cases most likely to escalate. | 1. Send-for-review routes to a named colleague or supervisor. 2. The reviewer can return it with a reason. 3. Release stays blocked while a review is outstanding. | Given a draft sent for review, When the reviewer returns it with a reason, Then the draft returns to the owner and release remains blocked. | Must | 5 | S7 | R1 | US-047 | FR-5.8, E-10 | View 5
US-049 | FE-05.4 | EP-05 | Contact-centre advisor | As an advisor, I want release blocked until the remedy is decided and the case has a named owner, so that we never tell a customer something we cannot yet stand behind. | Stops the pending-approval gap that leaves customers without an expectation. | 1. Release is blocked without a decided remedy. 2. Release is blocked without a named owner. 3. Each blocker is named in business language. | Given an undecided remedy, When release is attempted, Then it is blocked and the undecided remedy is named as the reason. | Must | 5 | S7 | R1 | US-037 | FR-5.9, FR-5.10 | View 5
US-050 | FE-05.5 | EP-05 | Contact-centre advisor | As an advisor, I want a guardrail checklist showing which content controls pass and which do not, so that I can see the risk before I send rather than after. | Turns content rules into an operating control. | 1. Each control shows a pass or fail state with an explanation. 2. Failing controls that block release are distinguished from advisory ones. 3. The checklist state at release is recorded. | Given a draft in a non-preferred channel with no owner, When the checklist renders, Then both issues show as failing with their reasons. | Must | 5 | S7 | R1 | US-043 | FR-5.11 | View 5
US-051 | FE-05.4 | EP-05 | Contact-centre advisor | As an advisor, I want to confirm my accountability for accuracy, tone and policy fit at the point of release, so that the human-review control is explicit and recorded. | Makes BR-9 auditable at the moment it matters. | 1. Release requires an explicit accountability confirmation. 2. Actor, role, channel and time are recorded. 3. No path exists to release without it. | Given a compliant draft, When the advisor releases it, Then the accountability confirmation is recorded with the released message. | Must | 3 | S7 | R1 | US-049 | FR-5.13, BR-9, RAI-3 | View 5
US-052 | FE-05.4 | EP-05 | Information security / Audit | As a control owner, I want it to be impossible for the system to send a customer message without a human release action, so that the assistive-only boundary is provable. | The single most important Responsible AI boundary in the capability. | 1. No scheduled, triggered or automated send path exists. 2. Penetration and code review confirm the absence. 3. Any attempted automated send fails closed and raises an alert. | Given any system trigger, When a send is attempted without a human release, Then it fails and an alert is raised. | Must | 8 | S8 | R1 | US-051 | FR-5.14, RAI-1, AC-3 | View 5
US-053 | FE-05.6 | EP-05 | Contact-centre advisor | As an advisor, I want tone variants that do not change the facts, so that I can match the register without risking the content. | Improves customer experience at no factual cost. | 1. Tone variants alter register only. 2. The three labelled sections and every figure are provably unchanged. 3. A difference check is available before release. | Given a warm tone is selected, When the draft regenerates, Then all confirmed facts, estimates, unknowns and amounts are identical to the plain version. | Should | 5 | S8 | R2 | US-042 | FR-5.5 | View 5
US-054 | FE-06.1 | EP-06 | Case owner | As a case owner, I want promised date, next action, owner, dependency, customer response and reopen status tracked on every open case, so that nothing depends on my memory. | Attacks the 140-case ageing backlog at source. | 1. All six attributes are tracked per open case. 2. Each is editable by the owner with the change recorded. 3. A missing next action is itself flagged. | Given an open case awaiting a store stock count, When the owner views tracking, Then the dependency and the next action are both named with an owner. | Must | 8 | S7 | R1 | US-004 | FR-6.1 | View 6
US-055 | FE-06.2 | EP-06 | Supervisor | As a supervisor, I want a case with no named owner after four working hours to escalate to me automatically, so that ownership gaps are corrected before the customer chases. | Eliminates the 38 daily unowned cases. | 1. The clock respects store trading hours and contact-centre shifts. 2. Escalation notifies a named supervisor. 3. The supervisor assigns ownership from the escalation. 4. The escalation is recorded. | Given a case unowned for four working hours, When the clock elapses, Then a supervisor is notified and the case appears in their assignment queue. | Must | 8 | S8 | R1 | Q-9, US-005 | FR-6.3, BR-10, E-4 | View 6
US-056 | FE-06.2 | EP-06 | Case owner | As a case owner, I want a breached promised date to escalate automatically, so that the customer is not the one who discovers it. | Converts a broken promise from a customer complaint into an internal trigger. | 1. Breach is detected against the recorded promise. 2. Escalation routes to the accountable role for that promise type. 3. The customer receives a checkpoint the owner controls, not a new unconfirmed date. | Given a refund due one day ago, When the promised date passes, Then the case escalates to a finance reviewer and is flagged as a breached promise. | Must | 8 | S8 | R1 | US-054 | FR-6.2, E-5 | View 6
US-057 | FE-06.2 | EP-06 | Supervisor | As a supervisor, I want complaints, repeated failed remedies and potential financial hardship escalated on identification, so that the cases that most need judgment get it soonest. | Enforces the remaining escalation triggers in BR-10. | 1. Each trigger raises an escalation on identification. 2. The trigger reason is stated. 3. The customer's communication support is preserved through the escalation. | Given a second failed remedy on the same case, When it is recorded, Then the case escalates and names the repeated failure as the trigger. | Must | 5 | S8 | R1 | US-055 | FR-6.4, BR-10 | View 6
US-058 | FE-06.3 | EP-06 | Case owner | As a case owner, I want a repeat contact on the same issue within seven days linked and marked reopened, so that we see the pattern instead of opening a second case. | Makes the 18% repeat-contact measure actionable at case level. | 1. Same-issue contacts within seven days link to the original case. 2. The case is marked reopened with the reason. 3. Prior promises and their state surface on the linked case. | Given a customer contacting twice in seven days about one refund, When the second contact arrives, Then it links to the original case and the case is marked reopened. | Must | 8 | S8 | R1 | FE-07.3 | FR-6.5, E-7 | View 6
US-059 | FE-06.1 | EP-06 | Case owner | As a case owner, I want the customer's communication support preserved through every transfer, escalation and follow-up, so that a support need is never lost in a handoff. | Accessibility that holds across the whole process. | 1. Support attributes travel with the case. 2. A new owner inherits them without action. 3. A channel change re-applies them. 4. Loss of a support attribute is treated as a defect. | Given a text-only customer whose case moves from store to finance and back, When each owner drafts a message, Then the text-only preference is applied every time. | Must | 5 | S8 | R1 | US-046 | FR-6.6, BR-11, NFR-A5 | View 6
US-060 | FE-06.4 | EP-06 | Audit / Compliance | As a control owner, I want a complete per-case activity and disclosure log, so that we can evidence what the customer was told, when, by whom and on what basis. | The evidentiary backbone for audit and complaint handling. | 1. Every action, decision, disclosure and release is logged with actor, role and time. 2. The log is immutable and time-ordered. 3. It is exportable and retained to the defined period. | Given a complaint six weeks later, When the log is retrieved, Then it shows every disclosure and release with its author and basis. | Must | 8 | S8 | R1 | US-036 | FR-6.8, NFR-O1, P-7 | View 6
US-061 | FE-06.5 | EP-06 | Policy owner / CX leader | As a CX leader, I want aggregate outcome measures without individual performance data, so that I can improve the operation without surveilling colleagues. | Governance insight that stays inside the Responsible AI boundary. | 1. Views are aggregate only. 2. No individual is named, ranked or compared. 3. Baselines are labelled as provisional until instrumented. | Given the measures panel, When the leader opens it, Then figures are aggregate and no colleague-level breakdown is available. | Must | 5 | S9 | R1 | FE-09.1 | FR-6.7, RAI-11 | View 6
US-062 | FE-06.5 | EP-06 | Policy owner / CX leader | As a policy owner, I want unresolved patterns broken down by rule, journey, store and channel, so that I can see where the process keeps failing. | Turns the ageing backlog into a diagnosable set of causes. | 1. Breakdown by rule, journey, store and channel. 2. Trend over time. 3. Drill-through to case examples without individual attribution. | Given repeated pickup ownership failures at one store, When the pattern view is opened, Then that store and journey combination surfaces as a top unresolved pattern. | Should | 5 | S9 | R2 | US-061 | FR-6.12 | View 6
US-063 | FE-06.6 | EP-06 | Case owner | As a case owner, I want scheduled follow-ups with an owner and a checkpoint, so that a case that must wait does not drift. | Prevents silent abandonment of cases with genuine dependencies. | 1. A follow-up carries an owner, a checkpoint and a purpose. 2. A due follow-up appears in the owner's queue. 3. A missed follow-up escalates. | Given a case awaiting a stock count, When the follow-up falls due, Then it appears in the owner's queue and escalates if missed. | Should | 5 | S9 | R2 | US-054 | FR-6.9 | View 6
US-064 | FE-06.6 | EP-06 | Case owner | As a case owner, I want to close a case with an outcome classification and to reopen it with a linked reason, so that closure means something in reporting. | Makes reopen and outcome measures trustworthy. | 1. Closure requires an outcome classification. 2. Reopen links to the original case with a reason. 3. Reopen rate is derivable from these records. | Given a closed case the customer disputes, When it is reopened, Then it links to the original closure and records the reopen reason. | Should | 3 | S9 | R2 | US-058 | FR-6.10 | View 6
US-065 | FE-06.5 | EP-06 | Policy owner / CX leader | As a CX leader, I want ownership continuity reported, so that I can tell whether the single-owner model is actually being followed. | Verifies that the most important process change took hold. | 1. Owner-change frequency and reasons are reported in aggregate. 2. Routing without acceptance is identified as a distinct failure. 3. No individual ranking is produced. | Given cases routed between teams without acceptance, When the continuity report runs, Then those cases are identified as ownership failures without naming colleagues. | Should | 5 | S10 | R2 | US-005 | FR-6.11, BR-12 | View 6

----- SHEET NFR & Ops Readiness -----
Delivery Backlog — NFR & Operational Readiness |  |  |  |  |  |  |  |  |  |  |
Item ID | Category | Related feature | Item | Persona / owner | Requirement | Acceptance criteria | Priority | Release | Sprint | Traces to BRD | Dependency or enabler
NFR-B01 | Usability | FE-01.1 | Case view answers the question without navigation | Advisor | An advisor reaches the applicable rule, the eligibility result and the evidence without leaving the case view. | Zero navigation away from the case for a standard exception, verified across all five sample journeys. | Must | R1 | S5 | NFR-U1 | Usability test with frontline representatives
NFR-B02 | Usability | FE-03.1 | Policy effort reduction measured against baseline | Advisor | Policy lookup effort falls materially against the 3.4-minute-per-case baseline. | Baseline captured pre-pilot; target agreed after baseline confirmation; measured by guidance telemetry and observation. | Must | R1 | S9 | NFR-U2 | FE-09.2 baseline
NFR-B03 | Usability | FE-04.1 | Authority and consequence visible at choice | All decision roles | Authority limits and customer consequences are visible at the moment of remedy choice, not after it. | Verified in usability testing across all five sample journeys. | Must | R1 | S6 | NFR-U3 | US-032
NFR-B04 | Usability | EP-09 | New-advisor time to competence | Advisor | A new advisor completes a standard case unaided after the defined training period. | Training design agreed in Release 1; measured at pilot with a defined pass threshold. | Must | R1 | S9 | NFR-U4 | FE-09.5
NFR-B05 | Usability | Cross-cutting | Every blocked action explains itself | All personas | Every blocked action states why it is blocked in business language, naming each unmet prerequisite. | 100% of blocked actions carry a reason; no system or error text is surfaced to a colleague. | Must | R1 | S6 | NFR-U5 | US-039
NFR-B06 | Usability | Cross-cutting | Operational language in the interface | All personas | Terminology matches operational language, not system or model language. | Reviewed and signed off by frontline representatives before pilot. | Must | R1 | S7 | NFR-U6 | Frontline review
NFR-B07 | Accessibility | Cross-cutting | WCAG 2.2 AA conformance | All personas | The colleague-facing interface conforms to WCAG 2.2 Level AA. | Independent audit with no outstanding Level A or AA defects. | Must | R1 | S8 | NFR-A1, AC-12 | Independent auditor booked
NFR-B08 | Accessibility | Cross-cutting | Keyboard operability and focus order | All personas | Full keyboard operability with a visible focus order that follows the task. | Verified by audit and by assistive-technology testing. | Must | R1 | S8 | NFR-A2 | NFR-B07
NFR-B09 | Accessibility | FE-02.4 | Screen-reader announcement of fact labelling | Advisor | Screen readers correctly announce the confirmed, estimate and unknown labelling. | Tested with the agreed screen-reader set; labels announced distinctly, never merged. | Must | R1 | S8 | NFR-A3 | US-014
NFR-B10 | Accessibility | Cross-cutting | Colour is never the sole carrier of meaning | All personas | Fact labelling, approval state and escalation status carry a non-colour indicator. | Verified by audit across all six views. | Must | R1 | S8 | NFR-A4 | NFR-B07
NFR-B11 | Accessibility | FE-05.3 | Customer-facing accessibility variants | Customer | Large print and plain language are supported and preserved across handoffs. | Functional acceptance plus a preservation test through transfer and escalation. | Must | R1 | S7 | NFR-A5, AC-11 | US-046, US-059
NFR-B12 | Performance | FE-02.2 | Case view assembly during live contact | Advisor | The consolidated case view assembles and renders within the interactive threshold during a live contact. | 95th percentile within the agreed threshold; provisional 3 seconds, confirmed at design. | Must | R1 | S6 | NFR-P1 | FE-07.1
NFR-B13 | Performance | FE-01.1 | Queue load and filter at peak | Advisor · Supervisor | The queue loads and filters without perceptible delay at peak volume. | 95th percentile under 2 seconds at the tested peak. | Must | R1 | S6 | NFR-P2 | Load test environment
NFR-B14 | Performance | FE-03.2 | Guidance production time | Advisor | Policy guidance is produced within the agreed threshold from case open. | 95th percentile under 5 seconds. | Must | R1 | S6 | NFR-P3 | US-024
NFR-B15 | Performance | Cross-cutting | Peak concurrency | All personas | The capability sustains peak concurrent advisor and associate load without degrading the case view. | Load tested to the agreed peak multiple of the 1,480-daily-case baseline. | Must | R1 | S8 | NFR-P4 | Load test environment
NFR-B16 | Performance | FE-02.3 | Freshness display accuracy | Advisor | Source freshness is displayed accurately and never presented as more current than the source. | 100% accuracy in freshness display testing across every integrated source. | Must | R1 | S6 | NFR-P5, D-2 | US-013
NFR-B17 | Performance | FE-05.1 | Message drafting latency | Advisor | Message drafting completes without extending the customer contact. | 95th percentile under 5 seconds. | Must | R1 | S7 | NFR-P6 | US-042
NFR-B18 | Resilience | FE-07.1 | Graceful degradation with named gaps | Advisor | Where a source is unavailable, the case view names the missing source rather than presenting a partial view as complete. | 100% of source failures produce an explicit gap statement; failure-injection tested per source. | Must | R1 | S7 | NFR-R1, AC-14 | FE-07.1
NFR-B19 | Resilience | Cross-cutting | Source failure never blocks the human path | Advisor · Supervisor | No source failure blocks ownership, escalation, or a decision the available evidence supports. | Verified by failure-injection testing per source. | Must | R1 | S7 | NFR-R2 | NFR-B18
NFR-B20 | Resilience | FE-03.2 | Guidance failure fallback | Advisor | Guidance failure never blocks the decision path; the advisor can proceed with manual policy reference. | Verified by failure-injection testing; the fallback path is documented in the runbook. | Must | R1 | S7 | NFR-R3 | FE-09.4
NFR-B21 | Resilience | Cross-cutting | No loss of in-flight work | All personas | No in-flight decision, rationale, acknowledgment or draft is lost on session or service interruption. | Recovery testing shows zero loss of recorded actions. | Must | R1 | S8 | NFR-R4 | Recovery test plan
NFR-B22 | Resilience | Cross-cutting | Recovery objectives for the case and audit record | Audit · Operations | Recovery objectives are defined and met for the case record and the decision audit trail. | RPO and RTO agreed with operations and evidenced in a recovery test. | Must | R1 | S8 | NFR-R5 | Operations agreement
NFR-B23 | Resilience | Cross-cutting | Idempotent write actions | All personas | Duplicate actions are prevented on retry; a repeated release or approval must not double-apply. | Idempotency verified for every write action, including release, approval and refund initiation. | Must | R1 | S8 | NFR-R6 | US-052
NFR-B24 | Operability | FE-06.4 | Complete audit trail | Audit · Compliance | Every decision, disclosure, release and escalation logs actor, role, timestamp, case and rule version. | Complete trail evidenced in an audit sample. | Must | R1 | S8 | NFR-O1, AC-4 | US-060
NFR-B25 | Operability | FE-09.3 | Operational dashboards | Operations | Dashboards cover queue health, ageing, ownership gaps, escalation volume and guardrail blocks. | Available and accurate from pilot start. | Must | R1 | S9 | NFR-O2 | FE-09.1
NFR-B26 | Operability | FE-07.1 | Integration health monitoring and alerting | Operations | Source freshness and integration health are monitored with alerting to a named operational owner. | Alerting tested end to end; runbook owner named before pilot. | Must | R1 | S9 | NFR-O3 | FE-09.4
NFR-B27 | Operability | FE-07.2 | Policy content updates without a code release | Policy owner | Policy content updates take effect without a code release and display the effective date. | Verified by making a policy-content change in a controlled environment. | Must | R1 | S6 | NFR-O4 | US-023
NFR-B28 | Operability | FE-09.4 | Runbooks rehearsed | Operations | Runbooks cover guidance failure, source outage, escalation backlog and content rollback. | Reviewed and rehearsed before pilot with named owners. | Must | R1 | S9 | NFR-O5, AC-18 | NFR-B20
NFR-B29 | Operability | FE-08.2 | Versioned and reversible guidance changes | RAI board · Operations | Model, prompt and guidance changes are versioned, reviewable and reversible, with the version recorded on affected cases. | Version recorded on every case decision; a rollback is rehearsed successfully. | Must | R1 | S6 | NFR-O6, RAI-9 | US-036
NFR-B30 | Operability | FE-09.4 | Support model and incident severities | Operations | Support model, on-call ownership and incident severity definitions are agreed before pilot. | Signed off by operations leadership and published. | Must | R1 | S9 | NFR-O7 | Operations agreement

----- SHEET Data Sec Privacy RAI -----
Delivery Backlog — Data, Security, Privacy & Responsible AI |  |  |  |  |  |  |  |  |  |
Item ID | Category | Item | Requirement | Acceptance criteria | Priority | Release | Sprint | Dependency or owner | Traces to BRD | Related feature
DS-01 | Data | Source integration with attribution and freshness | Every integrated source returns value, source identity and last-update timestamp. | Every displayed fact carries its source and timestamp; no fact renders unattributed. | Must | R1 | S1-S3 | Data owners per domain | D-1, D-2 | FE-07.1
DS-02 | Data | Policy content as identified, dated, versioned units | Rules are retrievable by identifier with effective date and version history. | A rule can be cited by identifier, effective date and version; the version applied is stored on the decision. | Must | R1 | S1-S2 | DEP-1 policy owner | D-7, FR-3.9 | FE-07.2
DS-03 | Data | Structured promise and ownership records | Promises and ownership are persisted as structured, state-bearing records rather than free text. | Promise state and ownership history are queryable; breach detection and the four-hour clock run from them. | Must | R1 | S2-S3 | Case management | D-8, BR-12 | FE-07.3
DS-04 | Data | Refund status and hold-reason integration | Refund raised, released and hold-reason states are retrievable. | Hold reason displays where present; absence displays as unknown, never as a guessed cause. | Must | R1 | S3-S4 | DEP-2 finance | I-1, D-4 | FE-07.4
DS-05 | Data | Conflicting-source handling | Where two sources disagree, both are shown with their sources. | No value is silently picked or blended; the conflict is visible to the advisor. | Must | R1 | S3 | FE-07.1 | D-3, E-2 | US-013
DS-06 | Data | Data readiness and quality assessment per domain | Each of the ten data domains is assessed for availability, granularity, latency and completeness. | Assessment completed per domain with gaps, owners and mitigations recorded before the journey that depends on it is built. | Must | R1 | S1 | Data owners | Section 9.1 | FE-07.5
DS-07 | Data | Customer preference completeness assessment | Channel and communication-support preference completeness is measured. | Completeness measured and a fallback defined where preference is absent; absence never defaults silently. | Must | R1 | S2 | DEP-6 | A-5, Q-7 | FE-02.1
DS-08 | Data | Item-level pickup evidence position | Item-level handover evidence is obtained, or the customer-report rule is formally accepted in its absence. | A documented position from store operations; the capability behaves consistently with whichever position is agreed. | Must | R1 | S3 | DEP-3, Q-4 | I-2, E-9 | FE-07.1
SEC-01 | Security | Role-based access and least privilege | RBAC aligned to the persona access model with least privilege by default. | Each persona holds exactly the rights in section 4.3; excess rights fail a review test. | Must | R1 | S2 | IAM | S-1 | FE-08.1
SEC-02 | Security | Payment exposure gating | Payment detail masked until verification; refund-destination change requires fresh verification. | Masking and re-verification verified by test; every unmasking logged with actor and time. | Must | R1 | S2 | IAM | S-2, BR-1 | US-016
SEC-03 | Security | Store scope limitation | Store-service access scoped to that store's cases and store-relevant evidence. | Cross-store access attempts are refused and logged. | Must | R1 | S3 | IAM | S-3 | US-002
SEC-04 | Security | Individual attribution of access | All access to customer data is attributable to an individual, never a shared account. | No shared accounts exist; access logs resolve to named individuals. | Must | R1 | S3 | IAM | S-4 | NFR-B24
SEC-05 | Security | Encryption in transit and at rest | Data encrypted to enterprise standard in transit and at rest. | Confirmed by security review against the enterprise standard. | Must | R1 | S4 | Security | S-5 | DEP-7
SEC-06 | Security | Authority cannot be self-granted | No role can raise its own approval limit or grant itself decision rights. | Attempted self-escalation is refused and alerted; verified in penetration testing. | Must | R1 | S6 | SEC-01 | S-6, BR-3 to BR-5 | US-034
SEC-07 | Security | Threat model and penetration test | Threat model produced and penetration test completed with findings closed. | Completed and signed off before pilot exposure to real customer data. | Must | R1 | S6-S8 | DEP-7 | S-7, AC-15 | FE-08.5
PRI-01 | Privacy | DPIA and lawful basis | A lawful basis is documented per processing purpose and a DPIA is completed. | DPIA signed off by the data protection officer before pilot exposure to real data. | Must | R1 | S4 | DEP-7 | P-1, AC-15 | FE-08.4
PRI-02 | Privacy | Data minimisation | Only the case data needed for the resolution decision is assembled and displayed. | Field-level justification exists for every displayed attribute; unjustified fields are removed. | Must | R1 | S5 | PRI-01 | P-2 | FE-08.4
PRI-03 | Privacy | No inference of sensitive characteristics | Health, disability and comparable characteristics are never inferred. | Verified by test and review; a volunteered characteristic is recorded only with a defined purpose and control. | Must | R1 | S5 | PRI-01 | P-3, RAI-6 | US-029
PRI-04 | Privacy | Retention periods | Retention defined for cases, drafts, released messages, transcripts and decision logs. | Periods defined, implemented and evidenced; answers open question Q-8. | Must | R1 | S6 | PRI-01, Q-8 | P-4 | FE-08.4
PRI-05 | Privacy | Subject rights support | Access, rectification and erasure requests are supportable across every store the capability writes to. | A subject request is executed end to end in a controlled test. | Must | R1 | S6 | PRI-01 | P-5 | FE-08.4
PRI-06 | Privacy | Complaint handling records | Records evidence what the customer was told, when, by whom and on what basis. | An audit sample retrieves the full disclosure history for a case. | Must | R1 | S8 | NFR-B24 | P-6, P-7 | US-060
RAI-B01 | Responsible AI | Assistive-only boundary | No automated remedy decision, approval or outbound customer communication exists. | Verified by code review, penetration test and functional test; any automated send attempt fails closed and alerts. | Must | R1 | S8 | US-052 | RAI-1, AC-3 | FE-08.5
RAI-B02 | Responsible AI | Uncertainty labelling as a product rule | Confirmed facts, estimates and unknowns are labelled separately wherever status is stale or conflicting. | Verified across all five sample journeys in the case view, the guidance and the message draft. | Must | R1 | S4 | US-014 | RAI-2, BR-7, AC-6 | FE-02.4
RAI-B03 | Responsible AI | Human review before use | Every drafted summary, guidance output and customer message is reviewed by the accountable human before use. | No path exists to use an unreviewed output; review is recorded with actor and time. | Must | R1 | S7 | US-020, US-051 | RAI-3, BR-9 | FE-05.4
RAI-B04 | Responsible AI | Traceability of every result | Every eligibility result names the rule, its effective date and the evidence used. | No result renders without a complete evidence chain. | Must | R1 | S5 | US-025 | RAI-4, AC-4 | FE-03.2
RAI-B05 | Responsible AI | Stating the unknown | The capability states what it does not know and never asserts a cause it cannot evidence. | Adversarial test set confirms no fabricated cause, date or status is produced. | Must | R1 | S6 | US-014 | RAI-5, D-4 | FE-02.4
RAI-B06 | Responsible AI | Safety routing at any amount | Safety, allergy, accessibility and essential-use concerns route to explicit human review regardless of amount. | Verified with the substitution sample case and an adversarial variant set. | Must | R1 | S5 | US-029 | RAI-6, BR-6, AC-8 | FE-03.5
RAI-B07 | Responsible AI | Fairness assessment and disparity monitoring | Treatment is assessed across language, disability, order value, customer history and channel. | Disparity tested on remedy, escalation and effort pre-pilot; monitored during pilot with a defined response threshold. | Must | R1 | S8-S9 | FE-09.1 | RAI-7, AC-17 | FE-08.3
RAI-B08 | Responsible AI | Colleague feedback loop | A wrong or unhelpful guidance output can be reported in one action. | Reports are triaged in a monitored loop with a defined response time and feed the guidance backlog. | Must | R1 | S8 | US-030 | RAI-8 | FE-08.6
RAI-B09 | Responsible AI | Version recording and reversibility | Model, prompt and guidance versions are recorded against every case they influenced and are reversible. | Version present on every decision record; a rollback is rehearsed successfully. | Must | R1 | S6 | NFR-B29 | RAI-9, NFR-O6 | FE-08.2
RAI-B10 | Responsible AI | Customer transparency position | The position on AI assistance is agreed, documented and applied consistently. | Position signed off by the RAI board and legal; applied across every channel; answers open question Q-2. | Must | R1 | S7 | Q-2 | RAI-10 | FE-08.7
RAI-B11 | Responsible AI | No individual performance evaluation | The capability is not used to evaluate, rank or compare individual colleague performance. | All leader-facing views are aggregate; no colleague-level breakdown is technically available. | Must | R1 | S9 | US-061 | RAI-11 | FE-06.5

----- SHEET Spikes & Questions -----
Delivery Backlog — Spikes & Open Questions |  |  |  |  |  |  |  |  |  |  |
Item ID | Type | Title | Owner | Question to answer | Definition of done | Priority | Release | Sprint | Timebox | Traces to BRD | Unblocks
SPK-01 | Spike | Carrier status latency characterisation | Fulfilment operations | Measure real carrier status latency per route type and agree the freshness threshold that marks status stale. | A documented threshold per journey, agreed with operations, feeding the freshness indicator. | Must | R1 | S1 | 3 days | Q-1, A-3, DEP-4 | FE-02.3
SPK-02 | Spike | Policy content conversion feasibility | Policy owner | Establish whether published policy can be expressed as identified, dated, versioned units and at what effort. | A conversion approach and effort estimate, or a documented fallback if it cannot be done in Release 1. | Must | R1 | S1 | 5 days | A-1, DEP-1, R-2 | FE-07.2
SPK-03 | Spike | Refund hold reason code feasibility | Finance | Determine whether hold reason codes can be introduced in Release 1 and what the finance release service level will be. | A decision on reason codes and a documented release SLA, or an agreed interim position. | Must | R1 | S2 | 3 days | Q-3, Q-5, DEP-2, I-1 | FE-07.4
SPK-04 | Spike | Pickup evidence and ownership position | Store operations | Confirm whether item-level handover evidence is achievable, and formalise the customer-report rule if it is not. | A written position from store operations covering both evidence and the ownership boundary. | Must | R1 | S2 | 3 days | Q-4, DEP-3, I-2, I-3 | FE-07.1
SPK-05 | Spike | Working-hours ownership clock definition | Operations leadership | Define how the four-working-hour clock is calculated across store trading hours and contact-centre shifts. | An agreed calculation rule implemented in the escalation engine. | Must | R1 | S3 | 2 days | Q-9, DEP-5 | US-055
SPK-06 | Spike | Preference data completeness | Customer data | Measure completeness and currency of channel and communication-support preferences at scale. | A completeness figure and an agreed fallback where preference is absent. | Must | R1 | S2 | 3 days | Q-7, A-5, DEP-6 | FE-02.1
SPK-07 | Spike | Fairness test design | RAI board | Design the disparity tests across language, disability, order value, history and channel. | A test design with defined thresholds and a response protocol, agreed by the RAI board. | Must | R1 | S4 | 5 days | RAI-7, AC-17, R-6 | FE-08.3
SPK-08 | Spike | Customer transparency position | RAI board and Legal | Agree what customers are told about AI assistance and where it is stated. | A signed-off transparency position applied consistently across channels. | Must | R1 | S4 | 3 days | Q-2, RAI-10 | FE-08.7
SPK-09 | Spike | Measurement baseline design | CX leader | Define how each measure in section 13.1 is captured and what constitutes a valid pre-pilot baseline. | An instrumented measurement plan with agreed definitions and a baseline capture window. | Must | R1 | S3 | 5 days | DEP-8, AC-16, R-10 | FE-09.1
SPK-10 | Spike | Peak load profile | Enterprise architecture | Establish the peak concurrency profile to test against, derived from the 1,480-case daily baseline. | An agreed peak multiple and a load test plan. | Must | R1 | S5 | 2 days | NFR-P4, R-8 | NFR-B15
SPK-11 | Spike | Retention position for unreleased drafts | Privacy | Determine the retention period for drafted-but-unreleased customer messages. | A documented retention period implemented in the data lifecycle. | Should | R1 | S5 | 2 days | Q-8, P-4 | PRI-04
SPK-12 | Spike | Finance reviewer availability escalation | Finance | Define the escalation path when a finance reviewer is unavailable within the agreed window. | A documented alternate path preserving the customer's owner and checkpoint. | Should | R1 | S6 | 2 days | Q-10 | US-056
SPK-13 | Spike | Language scope and guidance quality assurance | Operations and RAI board | Decide the pilot language set and how guidance quality is assured in each language. | An agreed language scope with a quality-assurance method per language. | Should | R2 | S8 | 5 days | Q-6, RAI-7 | FE-08.3
SPK-14 | Spike | Quality review sampling design | Policy owner / Quality | Extend quality review sampling to distinguish AI-assisted from unassisted cases. | A sampling design that reports both populations separately. | Must | R1 | S7 | 3 days | DEP-9, I-5, A-7 | FE-09.6

----- SHEET Release Plan -----
Delivery Backlog — Release Plan & Milestones |  |  |  |  |  |
Sprint | Release | Theme | Contents | Exit criteria | Milestone | Status
Sprint 0 | Pre-R1 | Validate and prepare | Prototype v1 validated; BRD and backlog agreed; decision record; delivery plan; RAID and governance; SteerCo readout | Prototype validated and this BRD signed off by the business owner | M0 — SteerCo readout and delivery go-ahead | Complete
Sprint 1 | R1 | Foundations and readiness | Data readiness assessment (DS-06); source integration layer started (FE-07.1); policy content conversion (FE-07.2); queue skeleton (FE-01.1); spikes SPK-01, SPK-02 | Data readiness assessed per domain; policy conversion approach agreed | M1 — Data and policy readiness confirmed | Planned
Sprint 2 | R1 | Case foundations | Ownership model (FE-01.2); access and authority model (FE-08.1); customer and preference panel (FE-02.1); identity gate and assisted path (FE-02.6); order and item context (FE-02.2); spikes SPK-03, SPK-04, SPK-06 | A case can be owned, and identity gating works end to end | M1 | Planned
Sprint 3 | R1 | Context and timeline | Timeline with source and freshness (FE-02.3); store evidence (US-019); fact labelling started (FE-02.4); classification (FE-01.4); measurement instrumentation started (FE-09.1); spikes SPK-05, SPK-09 | Timeline renders with accurate freshness across every integrated source | M2 — Consolidated case view demonstrable | Planned
Sprint 4 | R1 | Facts, promises and guidance start | Fact labelling complete (FE-02.4); promise register (FE-02.5); missing-information request (FE-02.7); rule identification and eligibility (FE-03.1, FE-03.2); DPIA (PRI-01); spikes SPK-07, SPK-08 | Confirmed, estimate and unknown labelling demonstrable on all five sample cases | M2 | Planned
Sprint 5 | R1 | Guidance and remedy | Uncertainty and exception path (FE-03.3); acknowledgment gate (FE-03.4); safety routing (FE-03.5); remedy presentation (FE-04.1); authority enforcement started (FE-04.2); baseline capture starts (FE-09.2); spikes SPK-10, SPK-11 | Guidance is traceable and the acknowledgment gate blocks submission | M3 — Guidance and remedy path demonstrable | Planned
Sprint 6 | R1 | Decision and audit | Authority enforcement complete (FE-04.2); decision, rationale and audit trail (FE-04.3); approve, reject, revise, escalate (FE-04.4); owed versus discretionary (FE-04.5); versioning (FE-08.2); message drafting starts (FE-05.1); spike SPK-12 | Thresholds enforced and every decision produces a complete audit record | M3 | Planned
Sprint 7 | R1 | Communication | Channel adaptation (FE-05.2); accessibility variants (FE-05.3); edit, review and release (FE-05.4); guardrails (FE-05.5); tracking starts (FE-06.1); transparency position (FE-08.7); spike SPK-14 | No message can be released without a decided remedy, an owner and a human release | M4 — End-to-end journey demonstrable | Planned
Sprint 8 | R1 | Escalation, assurance and controls | Escalation rules (FE-06.2); repeat contact and reopen (FE-06.3); activity and disclosure log (FE-06.4); assistive-only assurance (RAI-B01); accessibility audit (NFR-B07); security and penetration test (SEC-07); fairness testing (FE-08.3) | Assistive-only boundary proven; WCAG 2.2 AA audit clean; escalations fire correctly | M5 — Assurance gate passed | Planned
Sprint 9 | R1 | Readiness and pilot preparation | Outcome and pattern reporting (FE-06.5); dashboards and alerting (FE-09.3); runbooks and support model (FE-09.4); training (FE-09.5); quality review extension (FE-09.6); baseline confirmed (FE-09.2) | Baseline captured; runbooks rehearsed; training delivered | M6 — Pilot entry gate | Planned
Sprint 10 | R1 pilot | Controlled pilot | Pilot with the defined advisor cohort and store set; adoption, disparity and guardrail monitoring; defect and feedback triage | Pilot runs with monitored measures and no unresolved severity-one defect | M7 — Pilot review and Release 2 decision | Planned
Sprints 11-14 | R2 | Scale and refine | Guidance override and pattern view (FE-03.6); suggested rationale (FE-04.6); tone variants (FE-05.6); follow-up and closure (FE-06.6); ownership continuity (US-065); fact correction (US-021); bulk reassignment (US-010); language scope (SPK-13) | Release 1 measures validated against baseline before scope expands | M8 — Measured improvement confirmed | Planned
Sprints 15+ | R3 | Extend | Additional exception journeys, additional channels and wider store rollout, each gated on the prior journey's validated measures | No new journey enters build until the previous journey's measures are validated | M9 — Journey expansion gate | Planned

----- SHEET DoR & DoD -----
Delivery Backlog — Definition of Ready & Definition of Done |  |  |
Type | Level | Criterion | Applies to
Definition of Ready | Story | The user story states persona, need and value in one sentence. | Every story in the backlog
Definition of Ready | Story | Acceptance criteria are written, testable and numbered. | Every story in the backlog
Definition of Ready | Story | At least one example scenario is expressed as Given / When / Then. | Every story in the backlog
Definition of Ready | Story | The story traces to a BRD requirement, business rule or non-functional requirement. | Every story in the backlog
Definition of Ready | Story | Dependencies and enablers are identified and either resolved or scheduled earlier. | Every story in the backlog
Definition of Ready | Story | Data needed by the story is confirmed available with source attribution and freshness. | Any story reading source data
Definition of Ready | Story | Any Responsible AI, privacy or security implication is identified and the relevant control named. | Every story
Definition of Ready | Story | The story is estimated by the team and fits within one sprint. | Every story in the backlog
Definition of Ready | Story | Accessibility implications are identified where the story changes a colleague or customer-facing surface. | Any interface story
Definition of Ready | Spike | The question, the timebox and the decision the answer unblocks are all stated. | Every spike
Definition of Done | Story | All acceptance criteria pass, demonstrated against at least one of the five representative cases. | Every story
Definition of Done | Story | Automated tests cover the acceptance criteria and pass in the pipeline. | Every story
Definition of Done | Story | The business rule the story enforces is enforced by the system, not by guidance or training. | Any story carrying a BR reference
Definition of Done | Story | Every action the story adds writes to the audit trail with actor, role and timestamp. | Any story adding an action
Definition of Done | Story | Blocked states name every unmet prerequisite in business language. | Any story that can block an action
Definition of Done | Story | Accessibility checks pass for the changed surface, including keyboard and screen-reader operation. | Any interface story
Definition of Done | Story | Performance is measured against the relevant NFR threshold and recorded. | Any story on a latency-sensitive path
Definition of Done | Story | Failure behaviour is defined and tested; a source failure produces an explicit gap statement. | Any story reading source data
Definition of Done | Story | No confirmed, estimate or unknown label is lost or promoted anywhere the story touches. | Any story handling case facts
Definition of Done | Story | Documentation and the runbook are updated where operational behaviour changed. | Any story with operational impact
Definition of Done | Story | The product owner has accepted the story against its acceptance criteria. | Every story
Definition of Done | Release | All Must-priority items in the release are accepted, and every business rule is evidenced in test. | Each release
Definition of Done | Release | DPIA, security review, penetration test and Responsible AI assessment are signed off before pilot exposure to real customer data. | Release 1 pilot
Definition of Done | Release | Measurement is instrumented and a pre-pilot baseline is captured. | Release 1
Definition of Done | Release | Runbooks, alerting, on-call ownership and content rollback are rehearsed. | Release 1
Definition of Done | Release | Training is delivered to advisors, store associates, supervisors and finance reviewers. | Release 1

===== FILE: contoso-order-exception-prototype-v1.html =====
===== TYPE: .html (signature 3C-21-44-4F-43-54-59-50) =====
===== SECTIONS DETECTED: HTML wireframe/markup, 1616 lines (cite by line number) =====
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="light dark">
<title>Contoso Retail — Customer Care and Order Exception Resolution — Prototype v1</title>
<style>
:root{
  --bg:#f4f5f7; --surface:#ffffff; --surface-2:#fafbfc; --surface-3:#eef1f5;
  --ink:#161a1d; --ink-2:#4a5259; --ink-3:#6d757d;
  --line:#d9dee4; --line-2:#e8ecf1;
  --brand:#0b5cab; --brand-ink:#ffffff; --brand-soft:#e6f0fa;
  --ok:#0f7b3f; --ok-soft:#e4f3ea;
  --warn:#8a5a00; --warn-soft:#fdf1dc;
  --risk:#a3282b; --risk-soft:#fbe8e8;
  --info:#4c3fa5; --info-soft:#eceafa;
  --radius:10px; --radius-s:6px;
  --shadow:0 1px 2px rgba(16,24,40,.06), 0 1px 3px rgba(16,24,40,.10);
}
@media (prefers-color-scheme: dark){
  :root{
    --bg:#12161a; --surface:#1b2126; --surface-2:#20272d; --surface-3:#28313a;
    --ink:#eef2f6; --ink-2:#c0c9d2; --ink-3:#98a3ad;
    --line:#333d47; --line-2:#2b343d;
    --brand:#6fb3ee; --brand-ink:#0b1620; --brand-soft:#1d2c3b;
    --ok:#63d894; --ok-soft:#16301f;
    --warn:#e9b95c; --warn-soft:#33280f;
    --risk:#f08b8b; --risk-soft:#3a1d1e;
    --info:#b0a6f5; --info-soft:#262146;
    --shadow:0 1px 2px rgba(0,0,0,.4), 0 1px 3px rgba(0,0,0,.35);
  }
}
*{box-sizing:border-box}
html,body{margin:0;padding:0}
body{
  background:var(--bg); color:var(--ink);
  font-family:"Segoe UI",system-ui,-apple-system,"Helvetica Neue",Arial,sans-serif;
  font-size:14px; line-height:1.45;
}
h1,h2,h3,h4{margin:0 0 .35em 0; line-height:1.25; font-weight:650}
h1{font-size:19px} h2{font-size:17px} h3{font-size:15px} h4{font-size:13px}
p{margin:0 0 .6em 0}
a{color:var(--brand)}
button{font:inherit}
.wrap{max-width:1360px; margin-inline:auto; padding-inline:20px; padding-block:0 40px}

/* ---------- notice ---------- */
.notice{
  background:var(--warn-soft); color:var(--warn); border-block-end:1px solid var(--line);
  padding:7px 20px; font-size:12px; text-align:center;
}
.notice strong{font-weight:700}

/* ---------- header ---------- */
header.app{
  background:var(--surface); border-block-end:1px solid var(--line); box-shadow:var(--shadow);
  position:sticky; inset-block-start:0; z-index:20;
}
.hrow{max-width:1360px; margin-inline:auto; padding:12px 20px; display:flex; gap:18px; align-items:center; flex-wrap:wrap}
.brand{display:flex; align-items:center; gap:10px; margin-inline-end:auto}
.logo{
  inline-size:34px; block-size:34px; border-radius:8px; background:var(--brand); color:var(--brand-ink);
  display:flex; align-items:center; justify-content:center; font-weight:800; font-size:13px; letter-spacing:.5px;
}
.brand .t1{font-weight:700; font-size:15px}
.brand .t2{font-size:11.5px; color:var(--ink-3)}
.hctl{display:flex; align-items:center; gap:8px}
.hctl label{font-size:11.5px; color:var(--ink-3); text-transform:uppercase; letter-spacing:.4px; font-weight:600}
select, input[type=text], textarea{
  background:var(--surface-2); color:var(--ink); border:1px solid var(--line);
  border-radius:var(--radius-s); padding:6px 8px; font:inherit; max-inline-size:100%;
}
textarea{inline-size:100%; min-block-size:78px; resize:vertical}
.authority{
  font-size:11.5px; color:var(--ink-2); background:var(--surface-3);
  border:1px solid var(--line); border-radius:999px; padding:4px 10px; white-space:nowrap;
}

/* ---------- tabs ---------- */
nav.tabs{max-width:1360px; margin-inline:auto; padding-inline:20px; display:flex; gap:2px; flex-wrap:wrap}
nav.tabs button{
  background:transparent; border:none; border-block-end:2.5px solid transparent;
  padding:10px 12px; color:var(--ink-2); cursor:pointer; font-size:13px; font-weight:600;
}
nav.tabs button:hover{color:var(--ink); background:var(--surface-2)}
nav.tabs button[aria-selected="true"]{color:var(--brand); border-block-end-color:var(--brand)}
nav.tabs .num{
  display:inline-flex; inline-size:17px; block-size:17px; border-radius:50%; background:var(--surface-3);
  color:var(--ink-2); font-size:10.5px; align-items:center; justify-content:center; margin-inline-end:6px; font-weight:700;
}
nav.tabs button[aria-selected="true"] .num{background:var(--brand); color:var(--brand-ink)}

/* ---------- layout ---------- */
.view{display:none; padding-block-start:18px}
.view.active{display:block}
.grid{display:grid; gap:16px}
.g-2{grid-template-columns:1fr 1fr}
.g-32{grid-template-columns:3fr 2fr}
.g-23{grid-template-columns:2fr 3fr}
.g-3{grid-template-columns:1fr 1fr 1fr}
@media (max-width:1050px){.g-2,.g-32,.g-23,.g-3{grid-template-columns:1fr}}

.card{background:var(--surface); border:1px solid var(--line); border-radius:var(--radius); box-shadow:var(--shadow)}
.card > .hd{
  padding:11px 14px; border-block-end:1px solid var(--line-2); display:flex; align-items:center;
  gap:10px; flex-wrap:wrap;
}
.card > .hd h3{margin:0}
.card > .hd .sub{font-size:11.5px; color:var(--ink-3)}
.card > .bd{padding:14px}
.card > .ft{padding:11px 14px; border-block-start:1px solid var(--line-2); background:var(--surface-2);
  border-end-start-radius:var(--radius); border-end-end-radius:var(--radius);
  display:flex; gap:8px; flex-wrap:wrap; align-items:center}
.spacer{margin-inline-start:auto}

/* ---------- view intro ---------- */
.vhead{display:flex; align-items:flex-end; gap:14px; flex-wrap:wrap; margin-block-end:14px}
.vhead .who{
  font-size:11.5px; color:var(--info); background:var(--info-soft); border:1px solid var(--line);
  border-radius:999px; padding:3px 10px; font-weight:600;
}
.vhead p{color:var(--ink-2); margin:0; font-size:13px; max-inline-size:70ch}

/* ---------- table ---------- */
table{inline-size:100%; border-collapse:collapse; font-size:12.8px}
th{
  text-align:start; font-size:10.8px; text-transform:uppercase; letter-spacing:.5px; color:var(--ink-3);
  font-weight:700; padding:8px 10px; border-block-end:1px solid var(--line); background:var(--surface-2);
  white-space:nowrap;
}
td{padding:9px 10px; border-block-end:1px solid var(--line-2); vertical-align:top}
tbody tr:hover{background:var(--surface-2)}
tr.sel{background:var(--brand-soft)}
tr.sel:hover{background:var(--brand-soft)}
.num-cell{text-align:end; white-space:nowrap; font-variant-numeric:tabular-nums}

/* ---------- pills ---------- */
.pill{
  display:inline-block; padding:2px 8px; border-radius:999px; font-size:11px; font-weight:650;
  border:1px solid transparent; white-space:nowrap;
}
.p-ok{background:var(--ok-soft); color:var(--ok)}
.p-warn{background:var(--warn-soft); color:var(--warn)}
.p-risk{background:var(--risk-soft); color:var(--risk)}
.p-info{background:var(--info-soft); color:var(--info)}
.p-brand{background:var(--brand-soft); color:var(--brand)}
.p-mute{background:var(--surface-3); color:var(--ink-2)}

/* ---------- buttons ---------- */
.btn{
  background:var(--surface-2); color:var(--ink); border:1px solid var(--line);
  border-radius:var(--radius-s); padding:7px 12px; cursor:pointer; font-size:12.8px; font-weight:600;
}
.btn:hover{background:var(--surface-3)}
.btn.primary{background:var(--brand); border-color:var(--brand); color:var(--brand-ink)}
.btn.primary:hover{filter:brightness(1.08)}
.btn.danger{color:var(--risk); border-color:var(--risk)}
.btn.small{padding:4px 9px; font-size:11.5px}
.btn[disabled]{opacity:.45; cursor:not-allowed}
.btn[disabled]:hover{background:var(--surface-2)}

/* ---------- misc blocks ---------- */
.kv{display:grid; grid-template-columns:minmax(120px,auto) 1fr; gap:6px 14px; font-size:12.8px}
.kv dt{color:var(--ink-3); font-weight:600}
.kv dd{margin:0}
.stack{display:flex; flex-direction:column; gap:12px}
.muted{color:var(--ink-3)}
.small{font-size:11.5px}
ul.tight{margin:0; padding-inline-start:18px}
ul.tight li{margin-block-end:4px}
.hr{block-size:1px; background:var(--line-2); margin-block:12px}

.callout{
  border:1px solid var(--line); border-inline-start:3px solid var(--brand);
  background:var(--surface-2); border-radius:var(--radius-s); padding:10px 12px; font-size:12.5px;
}
.callout.warn{border-inline-start-color:var(--warn); background:var(--warn-soft); color:var(--warn)}
.callout.risk{border-inline-start-color:var(--risk); background:var(--risk-soft); color:var(--risk)}
.callout.ok{border-inline-start-color:var(--ok); background:var(--ok-soft); color:var(--ok)}
.callout.info{border-inline-start-color:var(--info); background:var(--info-soft); color:var(--info)}
.callout b{font-weight:700}

/* fact bands */
.fact{border:1px solid var(--line); border-radius:var(--radius-s); padding:10px 12px; background:var(--surface-2)}
.fact h4{display:flex; align-items:center; gap:7px; margin-block-end:7px; font-size:11.5px;
  text-transform:uppercase; letter-spacing:.5px}
.fact.confirmed{border-inline-start:3px solid var(--ok)}
.fact.confirmed h4{color:var(--ok)}
.fact.estimate{border-inline-start:3px solid var(--warn)}
.fact.estimate h4{color:var(--warn)}
.fact.unknown{border-inline-start:3px solid var(--risk)}
.fact.unknown h4{color:var(--risk)}

/* timeline */
.tl{list-style:none; margin:0; padding:0; position:relative}
.tl::before{content:""; position:absolute; inset-block:6px 6px; inset-inline-start:7px; inline-size:2px; background:var(--line)}
.tl li{position:relative; padding-inline-start:26px; padding-block-end:14px}
.tl .dot{position:absolute; inset-inline-start:2px; inset-block-start:4px; inline-size:12px; block-size:12px;
  border-radius:50%; background:var(--surface); border:2px solid var(--brand)}
.tl li.est .dot{border-color:var(--warn)}
.tl li.risk .dot{border-color:var(--risk)}
.tl .when{font-size:11px; color:var(--ink-3); font-weight:650; text-transform:uppercase; letter-spacing:.4px}
.tl .what{font-size:13px; font-weight:600}
.tl .src{font-size:11.5px; color:var(--ink-3)}

/* option cards */
.opt{border:1px solid var(--line); border-radius:var(--radius-s); padding:11px 12px; background:var(--surface-2);
  display:grid; grid-template-columns:22px 1fr; gap:10px; cursor:pointer}
.opt.checked{border-color:var(--brand); background:var(--brand-soft)}
.opt.blocked{opacity:.72}
.opt .oh{display:flex; gap:8px; align-items:center; flex-wrap:wrap}
.opt .oname{font-weight:700; font-size:13px}
.opt .odesc{font-size:12.3px; color:var(--ink-2); margin-block-start:4px}
.opt input{margin-block-start:4px}

/* checklist */
.chk{display:flex; gap:9px; align-items:flex-start; padding:7px 0; font-size:12.8px}
.chk input{margin-block-start:3px}

/* message preview */
.msg{
  border:1px solid var(--line); border-radius:var(--radius-s); background:var(--surface-2);
  padding:14px; font-size:13px; white-space:pre-wrap; min-block-size:220px;
  font-family:"Segoe UI",system-ui,sans-serif;
}
.msg.lg{font-size:16.5px; line-height:1.65}
.seg{display:inline-flex; border:1px solid var(--line); border-radius:var(--radius-s); overflow:hidden}
.seg button{background:var(--surface-2); border:none; padding:6px 11px; cursor:pointer; font-size:12.3px;
  color:var(--ink-2); font-weight:600; border-inline-end:1px solid var(--line)}
.seg button:last-child{border-inline-end:none}
.seg button[aria-pressed="true"]{background:var(--brand); color:var(--brand-ink)}

/* metrics */
.metric{border:1px solid var(--line); border-radius:var(--radius-s); padding:11px 12px; background:var(--surface-2)}
.metric .mlab{font-size:11.3px; color:var(--ink-3); text-transform:uppercase; letter-spacing:.4px; font-weight:650}
.metric .mval{font-size:22px; font-weight:700; margin-block:3px; font-variant-numeric:tabular-nums}
.metric .mdir{font-size:11.5px; color:var(--ink-2)}
.bar{block-size:6px; border-radius:3px; background:var(--surface-3); margin-block-start:8px; overflow:hidden}
.bar span{display:block; block-size:100%; background:var(--brand)}

/* log */
.log{list-style:none; margin:0; padding:0; max-block-size:280px; overflow:auto}
.log li{padding:7px 0; border-block-end:1px dashed var(--line-2); font-size:12.3px}
.log .lt{font-size:11px; color:var(--ink-3); font-weight:650}

footer.app{margin-block-start:26px; padding:16px 20px; border-block-start:1px solid var(--line);
  color:var(--ink-3); font-size:11.5px; text-align:center}
.badge-dot{display:inline-block; inline-size:7px; block-size:7px; border-radius:50%; margin-inline-end:6px}
.d-ok{background:var(--ok)} .d-warn{background:var(--warn)} .d-risk{background:var(--risk)} .d-mute{background:var(--ink-3)}
@media print{
  nav.tabs, .hctl, .btn{display:none}
  .view{display:block !important}
}
</style>
</head>
<body>
<div class="notice"><strong>Fictional exercise prototype.</strong> Illustrative Sprint&nbsp;0 mock-up for Contoso Retail (fictional). Data, policies and figures are exercise assumptions only — not observed customer facts, committed benefits, or implementation promises.</div>

<header class="app">
  <div class="hrow">
    <div class="brand">
      <div class="logo">CR</div>
      <div>
        <div class="t1">Customer Care &amp; Order Exception Resolution</div>
        <div class="t2">Contoso Retail · Prototype v1 · Sponsor: Chief Customer Officer</div>
      </div>
    </div>
    <div class="hctl">
      <label for="personaSel">Signed in as</label>
      <select id="personaSel"></select>
    </div>
    <div class="hctl">
      <label for="caseSel">Working case</label>
      <select id="caseSel"></select>
    </div>
    <div class="authority" id="authorityChip">Approval authority —</div>
  </div>
  <nav class="tabs" id="tabs" role="tablist">
    <button role="tab" data-view="v1" aria-selected="true"><span class="num">1</span>Case queue</button>
    <button role="tab" data-view="v2" aria-selected="false"><span class="num">2</span>Case &amp; timeline</button>
    <button role="tab" data-view="v3" aria-selected="false"><span class="num">3</span>Policy &amp; eligibility</button>
    <button role="tab" data-view="v4" aria-selected="false"><span class="num">4</span>Remedy &amp; approval</button>
    <button role="tab" data-view="v5" aria-selected="false"><span class="num">5</span>Customer message</button>
    <button role="tab" data-view="v6" aria-selected="false"><span class="num">6</span>Resolution tracking</button>
  </nav>
</header>

<main class="wrap">

  <!-- ============ VIEW 1 : CASE QUEUE ============ -->
  <section class="view active" id="v1">
    <div class="vhead">
      <div>
        <h1>Case queue</h1>
        <p>Prioritised order-exception work for the contact centre and store service. Accept a case to become its named owner; ownership, approval state and priority reason stay visible at all times.</p>
      </div>
      <span class="who spacer" id="v1Persona">Contact-centre advisor · Store-service associate</span>
    </div>

    <div class="grid g-3" style="margin-block-end:16px">
      <div class="metric"><div class="mlab">Open order-exception cases today</div><div class="mval">1,480</div><div class="mdir">1,050 delivery · 430 pickup (illustrative daily baseline)</div></div>
      <div class="metric"><div class="mlab">Older than 48 hours</div><div class="mval">140</div><div class="mdir">38 with no clearly assigned next owner</div></div>
      <div class="metric"><div class="mlab">Transferred at least once</div><div class="mval">23%</div><div class="mdir">Between contact centre, store, fulfilment or finance</div></div>
    </div>

    <div class="card">
      <div class="hd">
        <h3>My queue — 5 cases shown</h3>
        <span class="sub">Sorted by priority reason, then age</span>
        <div class="spacer seg" id="queueFilter">
          <button data-f="all" aria-pressed="true">All</button>
          <button data-f="unowned" aria-pressed="false">No owner</button>
          <button data-f="approval" aria-pressed="false">Awaiting approval</button>
          <button data-f="risk" aria-pressed="false">Escalation risk</button>
        </div>
      </div>
      <div class="bd" style="padding:0; overflow:auto">
        <table>
          <thead>
            <tr>
              <th>Case ID</th><th>Age</th><th>Channel</th><th>Issue</th><th>Customer impact</th>
              <th class="num-cell">Order value</th><th>Priority reason</th><th>Owner</th><th>Approval state</th><th>Action</th>
            </tr>
          </thead>
          <tbody id="queueBody"></tbody>
        </table>
      </div>
      <div class="ft"><span class="small muted">Accepting a case records you as the named owner and starts the four-working-hour ownership clock. Cases without an owner after four working hours are escalated automatically.</span></div>
    </div>
  </section>

  <!-- ============ VIEW 2 : CONSOLIDATED CASE & TIMELINE ============ -->
  <section class="view" id="v2">
    <div class="vhead">
      <div>
        <h1 id="v2Title">Consolidated case and timeline</h1>
        <p>One assembled view of the customer, the order, what fulfilment actually recorded, what was paid, what was previously promised — and what is still unknown. The customer should not have to repeat the story.</p>
      </div>
      <span class="who spacer">Contact-centre advisor</span>
    </div>
    <div class="grid g-23">
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Customer and preferences</h3><span class="sub" id="v2CaseChip"></span></div>
          <div class="bd" id="v2Customer"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Order and items</h3><span class="sub" id="v2OrderChip"></span></div>
          <div class="bd" style="padding:0; overflow:auto"><table><thead><tr><th>Item</th><th>Qty</th><th>Status</th><th class="num-cell">Value</th></tr></thead><tbody id="v2Items"></tbody></table></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Payments</h3><span class="sub">Identity verification required before payment detail is exposed</span></div>
          <div class="bd" id="v2Payments"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Prior contacts and promises made</h3></div>
          <div class="bd" id="v2Contacts"></div>
        </div>
      </div>
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Fulfilment timeline</h3><span class="sub" id="v2Freshness"></span></div>
          <div class="bd"><ul class="tl" id="v2Timeline"></ul></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Confirmed facts, estimates and unknowns</h3><span class="sub">Assembled draft — advisor verifies before use</span></div>
          <div class="bd stack" id="v2Facts"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Missing information request</h3><span class="sub">Ask once, in the customer's preferred channel</span></div>
          <div class="bd" id="v2Missing"></div>
          <div class="ft"><button class="btn primary" id="btnMissing">Send information request</button><span class="small muted" id="missingHint">Select at least one item.</span></div>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ VIEW 3 : POLICY & ELIGIBILITY ============ -->
  <section class="view" id="v3">
    <div class="vhead">
      <div>
        <h1>Policy and eligibility guidance</h1>
        <p>The applicable rule, its effective date, the evidence used, what remains uncertain, and the exception path — assembled so the advisor stops searching across policy pages. Guidance is advisory; the advisor acknowledges it before a remedy can be submitted.</p>
      </div>
      <span class="who spacer">Contact-centre advisor</span>
    </div>
    <div class="grid g-32">
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Applicable rules</h3><span class="sub">Ranked by relevance to this exception</span></div>
          <div class="bd stack" id="v3Rules"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Evidence used</h3><span class="sub">Every input behind the eligibility result</span></div>
          <div class="bd" id="v3Evidence"></div>
        </div>
      </div>
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Eligibility result</h3></div>
          <div class="bd" id="v3Result"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Uncertainty and conflicts</h3></div>
          <div class="bd stack" id="v3Uncertainty"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Exception path</h3></div>
          <div class="bd" id="v3Exception"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Advisor acknowledgment</h3></div>
          <div class="bd">
            <label class="chk"><input type="checkbox" id="ackBox"><span id="ackText">I have read this guidance, verified the facts against the source systems, and take accountability for applying it to this case.</span></label>
            <div class="small muted" id="ackState" style="margin-block-start:6px"></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ VIEW 4 : REMEDY & APPROVAL ============ -->
  <section class="view" id="v4">
    <div class="vhead">
      <div>
        <h1>Remedy and approval</h1>
        <p>Permitted remedies, their cost, the authority level each requires, and the consequence the customer will actually experience — shown together, with the rationale recorded on the case.</p>
      </div>
      <span class="who spacer">Advisor · Supervisor · Finance reviewer</span>
    </div>
    <div class="callout" id="v4Authority" style="margin-block-end:14px"></div>
    <div class="grid g-32">
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Available remedy options</h3><span class="sub">Amount · authority · customer consequence</span></div>
          <div class="bd stack" id="v4Options"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Decision rationale</h3><span class="sub">Required — recorded on the case and in quality review</span></div>
          <div class="bd">
            <textarea id="rationale" placeholder="Why this remedy, referencing the confirmed facts and the applicable rule..."></textarea>
            <div class="small muted" style="margin-block-start:6px">Suggested wording is a starting point only; the decision and its wording remain the responsibility of the signed-in role.</div>
            <div style="margin-block-start:8px"><button class="btn small" id="btnSuggestRationale">Insert suggested rationale</button></div>
          </div>
          <div class="ft" id="v4Actions"></div>
        </div>
      </div>
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Decision status</h3></div>
          <div class="bd" id="v4Status"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Approval thresholds</h3></div>
          <div class="bd">
            <dl class="kv">
              <dt>Advisor</dt><dd>Up to $40</dd>
              <dt>Supervisor</dt><dd>Up to $150</dd>
              <dt>Finance reviewer</dt><dd>Above $150, and all policy exceptions</dd>
            </dl>
            <div class="hr"></div>
            <div class="small muted">Safety, allergy, accessibility and essential-use concerns always require explicit human review, whatever the amount.</div>
          </div>
        </div>
        <div class="card">
          <div class="hd"><h3>Decision trail</h3></div>
          <div class="bd"><ul class="log" id="v4Trail"></ul></div>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ VIEW 5 : CUSTOMER MESSAGE PREVIEW ============ -->
  <section class="view" id="v5">
    <div class="vhead">
      <div>
        <h1>Customer message preview</h1>
        <p>A drafted explanation that separates confirmed facts from estimates, states the remedy and timing, and never promises an unconfirmed delivery or refund time. The advisor edits and releases it — nothing is sent automatically.</p>
      </div>
      <span class="who spacer">Contact-centre advisor</span>
    </div>
    <div class="grid g-32">
      <div class="stack">
        <div class="card">
          <div class="hd">
            <h3>Draft message</h3>
            <span class="sub" id="v5ChannelChip"></span>
            <div class="spacer"><button class="btn small" id="btnEditMsg">Edit draft</button></div>
          </div>
          <div class="bd">
            <div class="msg" id="msgPreview"></div>
            <textarea id="msgEditor" style="display:none; min-block-size:300px"></textarea>
          </div>
          <div class="ft" id="v5Actions"></div>
        </div>
      </div>
      <div class="stack">
        <div class="card">
          <div class="hd"><h3>Channel</h3><span class="sub">Customer's stated preference is pre-selected</span></div>
          <div class="bd"><div class="seg" id="channelSeg"></div><div class="small muted" style="margin-block-start:8px" id="channelNote"></div></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Tone</h3></div>
          <div class="bd"><div class="seg" id="toneSeg">
            <button data-tone="plain" aria-pressed="true">Plain and direct</button>
            <button data-tone="warm" aria-pressed="false">Warm and apologetic</button>
            <button data-tone="formal" aria-pressed="false">Formal</button>
          </div></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Accessibility and communication support</h3><span class="sub">Preserved through every handoff</span></div>
          <div class="bd" id="v5Access"></div>
        </div>
        <div class="card">
          <div class="hd"><h3>Content guardrails</h3></div>
          <div class="bd stack" id="v5Guard"></div>
        </div>
      </div>
    </div>
  </section>

  <!-- ============ VIEW 6 : RESOLUTION TRACKING ============ -->
  <section class="view" id="v6">
    <div class="vhead">
      <div>
        <h1>Resolution tracking</h1>
        <p>Every open case with a promised date, a named next action and owner, the dependency it is waiting on, the customer's response, and whether it reopened — plus the outcome measures the engagement will validate.</p>
      </div>
      <span class="who spacer">Case owner · Policy owner and customer-experience leader</span>
    </div>

    <div class="card" style="margin-block-end:16px">
      <div class="hd"><h3>Open cases</h3><span class="sub">Promise breaches and unowned cases are flagged for escalation</span></div>
      <div class="bd" style="padding:0; overflow:auto">
        <table>
          <thead><tr><th>Case</th><th>Promised date</th><th>Next action</th><th>Owner</th><th>Pending dependency</th><th>Customer response</th><th>Reopened</th><th>State</th></tr></thead>
          <tbody id="trackBody"></tbody>
        </table>
      </div>
    </div>

    <div class="grid g-23">
      <div class="card">
        <div class="hd"><h3>Outcome measures</h3><span class="sub">Illustrative baselines to be validated during the engagement</span></div>
        <div class="bd"><div class="grid g-3" id="measures"></div>
          <div class="callout" style="margin-block-start:14px">Baselines are fictional exercise assumptions used to shape the measurement plan. Prototype v1 does not evidence movement against them; instrumentation and a measurement baseline are Sprint&nbsp;0 outputs.</div>
        </div>
      </div>
      <div class="card">
        <div class="hd"><h3>Session activity log</h3><span class="sub">Actions taken in this prototype session</span><div class="spacer"><button class="btn small" id="btnClearLog">Clear</button></div></div>
        <div class="bd"><ul class="log" id="activityLog"></ul></div>
      </div>
    </div>
  </section>

</main>

<footer class="app">
  Contoso Retail (fictional) · Customer Care and Order Exception Resolution · Prototype v1 · Sprint&nbsp;0 validation artefact.
  Prototype only — not a production system, not connected to live data, and not a commitment to any benefit or implementation outcome.
</footer>
<script>
"use strict";

/* ---------------------------------------------------------------
   Prototype v1 — fictional exercise data. Nothing here is a real
   Contoso Retail record, policy, price, person or commitment.
---------------------------------------------------------------- */

var PERSONAS = [
  {id:"advisor",    name:"Maya Alvarez",  role:"Contact-centre advisor",       limit:40,   decide:true,  scope:"Contact centre"},
  {id:"store",      name:"Devon Park",    role:"Store-service associate",      limit:40,   decide:true,  scope:"Store 118 — Riverside"},
  {id:"supervisor", name:"Rita Chen",     role:"Supervisor",                   limit:150,  decide:true,  scope:"Care operations"},
  {id:"finance",    name:"Alan Whitfield",role:"Finance reviewer",             limit:1e9,  decide:true,  scope:"Finance — refunds"},
  {id:"leader",     name:"Nadia Osei",    role:"Policy owner / CX leader",     limit:0,    decide:false, scope:"Policy and customer experience"}
];

var LEVELS = {advisor:"Advisor", supervisor:"Supervisor", finance:"Finance reviewer"};

var CASES = [
{
  id:"CARE-24081", order:"CR-784201", issue:"Late delivery", channel:"Phone",
  ageLabel:"3h 10m", ageHours:3.2, opened:"Today, 15:55",
  value:126.00, impact:"Needs delivery before 8:00 p.m. — evening carer visit",
  priority:"Time-critical customer need; carrier status stale for 5 hours",
  flags:{safety:false, ownership:false, breach:false, identity:true, stale:true},
  customer:{
    name:"Priya Raman", ref:"CUST-40218", tier:"Delivery Saver member · 4 years",
    prefChannel:"sms", prefLabel:"Text message (SMS)",
    prefNote:"Prefers text updates. Voice call acceptable, but not after 8:00 p.m.",
    language:"English", verifyMethod:"One-time code to registered mobile",
    access:["Short, plain-language messages","No automated voice calls after 8:00 p.m."]
  },
  items:[
    {name:"Weekly delivery basket — 14 items", qty:"14", status:"Out for delivery", value:126.00},
    {name:"· Chilled sub-basket (4 items)", qty:"4", status:"Temperature-controlled — time sensitive", value:31.40}
  ],
  freshness:"Carrier status last updated 5 hours ago — treat as stale",
  timeline:[
    {when:"Yesterday 20:10", what:"Order placed and payment authorised", src:"Order platform · confirmed", kind:"confirmed"},
    {when:"Today 06:40", what:"Picked and dispatched from Fulfilment Centre 3", src:"Warehouse scan · confirmed", kind:"confirmed"},
    {when:"Today 09:15", what:"Loaded to delivery route R-118, 22 stops", src:"Carrier feed · confirmed", kind:"confirmed"},
    {when:"Today 11:05", what:"Original delivery window 11:00–13:00 opened", src:"Order platform · confirmed", kind:"confirmed"},
    {when:"Today 14:02", what:"Last carrier scan: 'in transit, route delayed'", src:"Carrier feed · 5 hours old", kind:"est"},
    {when:"Today 18:00 (estimated)", what:"Revised arrival estimate — carrier model, not a confirmed slot", src:"Carrier estimate · unverified", kind:"risk"}
  ],
  payments:{
    method:"Card ending 4471 (authorised, not yet captured)",
    lines:[["Authorised","$126.00"],["Captured","$0.00 — capture occurs on delivery"],["Refunds to date","None"],["Refund destination","Original payment method"]]
  },
  contacts:[
    {when:"Today 14:20", channel:"Chat", who:"Automated status assistant", summary:"Customer asked where the order was; received the generic 'on its way' status."},
    {when:"Today 15:55", channel:"Phone", who:"Advisor — first human contact", summary:"Customer explained the 8:00 p.m. carer visit and asked for a firm time."}
  ],
  promises:[{what:"'We will text you when the driver is 30 minutes away.'", by:"Made in the 14:20 chat", state:"Not yet met — no notification has been sent"}],
  facts:{
    confirmed:["Order was dispatched and loaded to route R-118 this morning.","The delivery window of 11:00–13:00 was missed — the order is 7 hours past the promised window.","Payment is authorised at $126.00 and has not been captured.","The customer needs the order before 8:00 p.m."],
    estimates:["The carrier's revised arrival estimate is around 18:00. This is a carrier model output, not a confirmed slot.","Four chilled items may be outside their temperature window; this has not been verified."],
    unknowns:["The current physical position of the vehicle — the last scan is 5 hours old.","Whether the driver will complete route R-118 before 20:00.","Whether the chilled sub-basket is still saleable on arrival."]
  },
  missing:[
    {id:"m1",label:"Confirm a safe place or a neighbour if the customer is not at home after 20:00",note:"Avoids a second failed attempt"},
    {id:"m2",label:"Confirm the best mobile number for the driver's 30-minute text",note:"The earlier promise was never delivered"},
    {id:"m3",label:"Ask which items are essential this evening",note:"Enables a partial recovery if the full order cannot arrive"}
  ],
  policy:{
    rules:[
      {id:"DEL-4.2", name:"Delivery disruption and late arrival", effective:"Effective 1 April 2026", relevance:"Primary",
       extract:"Where a delivery is more than four hours beyond the confirmed window, the customer may choose continued monitoring with a checkpoint, a priority redelivery at no charge, or cancellation with a full refund. A goodwill credit of up to $15 may be applied at advisor discretion."},
      {id:"DEL-4.9", name:"Chilled and temperature-controlled items", effective:"Effective 1 April 2026", relevance:"Secondary",
       extract:"Chilled items delivered outside their temperature window must not be offered to the customer. Refund or replace without requiring the item to be returned."},
      {id:"RAI-2.1", name:"Communicating uncertain fulfilment status", effective:"Effective 15 February 2026", relevance:"Mandatory",
       extract:"Where fulfilment status is stale or conflicting, confirmed facts, estimates and unknowns must be labelled separately. An unconfirmed arrival time must never be stated as a promise."}
    ],
    result:{state:"eligible", label:"Eligible — customer choice of remedy",
      detail:"The delivery is 7 hours past the confirmed window, which exceeds the four-hour threshold in DEL-4.2. All three DEL-4.2 remedies are open to the customer, and a goodwill credit up to $15 is within advisor authority."},
    evidence:[
      "Confirmed window 11:00–13:00 versus current time — 7 hours elapsed (order platform).",
      "Dispatch and route-load scans confirming the order left the fulfilment centre (warehouse and carrier feeds).",
      "Last carrier scan at 14:02, now 5 hours old (carrier feed).",
      "Chilled sub-basket flag on 4 of 14 items (order platform).",
      "Customer's stated 8:00 p.m. constraint (this call, advisor-recorded)."
    ],
    uncertainty:[
      {t:"Stale carrier status",d:"The eligibility result rests on elapsed time, which is certain. The arrival estimate is not — do not use it as a commitment."},
      {t:"Chilled-item condition unverified",d:"DEL-4.9 only applies if the temperature window was actually breached. That is unknown until arrival, so treat the chilled refund as conditional."}
    ],
    exception:{path:"Supervisor review", when:"Required if the customer asks for a full $126 refund while the order may still arrive, or if a second delivery attempt also fails.",
      detail:"A full refund on an order that has not been confirmed undelivered is a policy exception under DEL-4.2 and is retained by a supervisor or, above $150, a finance reviewer."}
  },
  remedies:[
    {id:"r1", name:"Monitor with a two-hour checkpoint", amount:0, level:"advisor", consequence:"The customer waits, but receives a proactive text at the checkpoint instead of chasing. No money moves.", note:"Only defensible while the 8:00 p.m. need can still be met."},
    {id:"r2", name:"Goodwill credit for the missed window", amount:12, level:"advisor", consequence:"$12 credit applied to the account within one working day, alongside whichever fulfilment option is chosen.", note:"Within the $15 DEL-4.2 discretionary ceiling and inside advisor authority."},
    {id:"r3", name:"Priority redelivery tomorrow, morning slot", amount:10, level:"advisor", consequence:"Tonight's attempt is stood down and a confirmed morning slot replaces it. The customer must not be told tonight's delivery is cancelled until the carrier confirms recall.", note:"$10 covers the chilled sub-basket replacement."},
    {id:"r4", name:"Cancel and refund in full", amount:126, level:"supervisor", consequence:"The order is cancelled and $126 returns to the original card in 3–5 working days. The customer has no groceries this evening.", note:"Exceeds advisor authority, and is a policy exception while the order may still arrive."}
  ],
  message:{
    channelPref:"sms",
    opening:"About your delivery today",
    confirmed:["Your order left our fulfilment centre this morning and is loaded on today's delivery route.","It has missed the 11:00–13:00 window you were given."],
    estimates:["The carrier's own system last updated at 2:02 p.m. and estimates arrival around 6:00 p.m. I am not able to confirm that as a firm time, because the tracking has not refreshed for five hours."],
    unknowns:["I cannot confirm where the vehicle is right now, or that the four chilled items will still be within their temperature window when they arrive."]
  },
  tracking:{promised:"Today, checkpoint at 18:00", next:"Call the carrier depot for a live position, then text the customer", dependency:"Carrier route R-118 status refresh", response:"Awaiting customer choice of remedy", reopened:"No", state:"warn", stateLabel:"At risk — 8:00 p.m. constraint"}
},
{
  id:"CARE-24082", order:"CR-784350", issue:"Unavailable item substituted", channel:"Messaging",
  ageLabel:"1h 25m", ageHours:1.4, opened:"Today, 17:40",
  value:18.00, impact:"Fragrance-free product replaced with a scented version against a stated need",
  priority:"Stated fragrance sensitivity — safety and essential-use flag",
  flags:{safety:true, ownership:false, breach:false, identity:false, stale:false},
  customer:{
    name:"Tomas Weber", ref:"CUST-51844", tier:"Standard account · 2 years",
    prefChannel:"message", prefLabel:"In-app messaging",
    prefNote:"Prefers written messages so instructions can be re-read.",
    language:"English", verifyMethod:"Signed-in app session — already authenticated",
    access:["Fragrance-free household products recorded as a standing preference","Prefers written confirmation of any substitution"]
  },
  items:[
    {name:"BrightWash Unscented 2L — ordered", qty:"1", status:"Unavailable at pick", value:18.00},
    {name:"BrightWash Spring Meadow 2L — substituted", qty:"1", status:"Delivered against the customer's stated need", value:18.00}
  ],
  freshness:"Substitution recorded at pick — status current",
  timeline:[
    {when:"Yesterday 12:30", what:"Order placed with 'fragrance-free' preference recorded on the account", src:"Order platform · confirmed", kind:"confirmed"},
    {when:"Today 07:12", what:"BrightWash Unscented 2L unavailable at pick", src:"Warehouse pick · confirmed", kind:"confirmed"},
    {when:"Today 07:13", what:"Automatic substitution selected the scented variant of the same brand", src:"Substitution engine · confirmed", kind:"risk"},
    {when:"Today 07:13", what:"Account fragrance-free preference was not evaluated by the substitution rule", src:"Substitution engine · confirmed gap", kind:"risk"},
    {when:"Today 16:20", what:"Order delivered, including the substituted item", src:"Carrier scan · confirmed", kind:"confirmed"},
    {when:"Today 17:40", what:"Customer messaged: cannot use the scented product", src:"Messaging channel · confirmed", kind:"confirmed"}
  ],
  payments:{
    method:"Card ending 8802 (captured on delivery)",
    lines:[["Authorised","$74.20"],["Captured","$74.20"],["Substituted item value","$18.00"],["Refunds to date","None"],["Refund destination","Original payment method"]]
  },
  contacts:[{when:"Today 17:40", channel:"Messaging", who:"Customer — first contact on this issue", summary:"States the scented product cannot be used in the household and asks what happens next."}],
  promises:[{what:"Substitution notice said 'a close match was chosen for you'.", by:"Automated notification at 07:13", state:"Inaccurate — the match conflicted with a recorded need"}],
  facts:{
    confirmed:["The ordered product was BrightWash Unscented 2L, value $18.00.","A scented variant was substituted automatically and delivered.","A fragrance-free preference is recorded on the account and predates this order.","Payment of $74.20 has been captured, including the $18.00 substituted item."],
    estimates:["A fragrance-free replacement is expected to be available for a next-day delivery slot, based on current stock signals."],
    unknowns:["Whether the customer's need is a preference, a sensitivity, or a medical allergy — this has not been asked and must not be assumed.","Whether the product has been opened or used.","Whether other items in the order carry the same conflict."]
  },
  missing:[
    {id:"m1",label:"Ask, without pressing for medical detail, whether the fragrance-free need is a health requirement",note:"Determines whether a standing account safeguard is set"},
    {id:"m2",label:"Confirm whether the scented item should be collected or disposed of",note:"Collection must not be a condition of the refund"},
    {id:"m3",label:"Confirm a preferred slot for a fragrance-free replacement",note:"Written confirmation, per the customer's channel preference"}
  ],
  policy:{
    rules:[
      {id:"SUB-2.7", name:"Substitution suitability and refusal", effective:"Effective 15 February 2026", relevance:"Primary",
       extract:"A substituted item that does not meet a recorded customer requirement is treated as an unfulfilled item. Refund it in full without requiring return, and offer a replacement in the next available slot."},
      {id:"RAI-1.3", name:"Safety, allergy, accessibility and essential-use exception", effective:"Effective 15 February 2026", relevance:"Mandatory",
       extract:"Where a customer's allergy, accessibility, safety or essential-use need is engaged, the case must receive explicit human review. Automated or routine substitution decisioning must not be relied upon, and the reason must be recorded."},
      {id:"SUB-3.4", name:"Recorded preferences in automated substitution", effective:"Effective 1 June 2026", relevance:"Contributing",
       extract:"Automated substitution must exclude products conflicting with a recorded account preference. A conflicting substitution is a fulfilment defect and must be logged for the policy owner."}
    ],
    result:{state:"review", label:"Eligible for full refund — but requires explicit human review",
      detail:"SUB-2.7 makes the $18.00 refund straightforward and it sits inside advisor authority. RAI-1.3 nonetheless engages because a fragrance-free need may be a health requirement, so the remedy must be reviewed and recorded by a human rather than decided routinely. The refund itself must not be delayed by that review."},
    evidence:[
      "Ordered item versus delivered item, both recorded at pick (order platform).",
      "Fragrance-free preference on the account, dated before this order (customer profile).",
      "Substitution engine log showing the preference was not evaluated (fulfilment log).",
      "Captured payment of $74.20 including the $18.00 item (payment system).",
      "Customer's message stating the product cannot be used (messaging channel)."
    ],
    uncertainty:[
      {t:"Nature of the need is unknown",d:"Nothing in the record establishes whether this is a preference, a sensitivity or an allergy. Do not record a medical characterisation the customer has not given."},
      {t:"Scope of the defect",d:"Whether other substitutions in this or previous orders hit the same conflict has not been checked. That is a policy-owner question, not a blocker for this remedy."}
    ],
    exception:{path:"Supervisor acknowledgment plus policy-owner notification", when:"Required for every case where RAI-1.3 is engaged, regardless of the amount involved.",
      detail:"The refund proceeds within advisor authority. In parallel, a supervisor records the safety review and the substitution defect is raised to the policy owner under SUB-3.4."}
  },
  remedies:[
    {id:"r1", name:"Refund the substituted item in full, no return required", amount:18, level:"advisor", consequence:"$18.00 returns to the original card in 3–5 working days. The customer keeps or disposes of the scented item — collection is not a condition.", note:"Straightforward under SUB-2.7; still requires the RAI-1.3 review to be recorded."},
    {id:"r2", name:"Refund in full and reserve a fragrance-free replacement", amount:18, level:"advisor", consequence:"Same $18.00 refund, plus a reserved fragrance-free replacement in the next available slot at no charge.", note:"Preferred outcome — restores the original need rather than only the money.", recommended:true},
    {id:"r3", name:"Refund, replacement, and a standing account safeguard", amount:26, level:"supervisor", consequence:"As above, plus $8 goodwill and a permanent block on scented substitutions for this account.", note:"Supervisor records the RAI-1.3 safety review; the safeguard prevents recurrence."},
    {id:"r4", name:"Full order refund", amount:74.20, level:"supervisor", consequence:"The entire $74.20 order is refunded. Disproportionate to a single substituted item unless the customer reports wider harm.", note:"Only if the customer reports that the whole delivery is unusable."}
  ],
  message:{
    channelPref:"message",
    opening:"About the substituted item in your order",
    confirmed:["You ordered BrightWash Unscented 2L, and a scented version was sent instead.","Your account records a fragrance-free preference, so this substitution should not have been made.","The $18.00 for that item is being refunded to your card. You do not need to return it."],
    estimates:["A fragrance-free replacement is expected to be available in the next delivery slot. I will confirm the slot in writing once it is reserved rather than estimating a date now."],
    unknowns:["I have not assumed anything about why you need fragrance-free products. If it is a health requirement, tell me and I will have a colleague set a permanent safeguard on your account."]
  },
  tracking:{promised:"Refund confirmation today; replacement slot to be confirmed", next:"Record the safety review and raise the substitution defect", dependency:"Supervisor safety review under RAI-1.3", response:"Customer replied in-app, awaiting the review outcome", reopened:"No", state:"warn", stateLabel:"Human review required"}
},
{
  id:"CARE-24083", order:"CR-784411", issue:"Partial refund — damaged accessory", channel:"Email",
  ageLabel:"6h 05m", ageHours:6.1, opened:"Today, 13:00",
  value:38.00, impact:"Blender is usable, but the damaged accessory limits what the customer bought it for",
  priority:"Evidence complete and within advisor authority — resolvable at first contact",
  flags:{safety:false, ownership:false, breach:false, identity:false, stale:false},
  customer:{
    name:"Helen Okoro", ref:"CUST-33907", tier:"Standard account · 7 months",
    prefChannel:"email", prefLabel:"Email",
    prefNote:"Prefers email, and asked for the outcome in writing.",
    language:"English", verifyMethod:"Verified — replied from the registered order email",
    access:["No specific communication support recorded"]
  },
  items:[
    {name:"MixMate Compact Blender", qty:"1", status:"Delivered — main unit undamaged", value:89.00},
    {name:"· Travel bottle and blade accessory", qty:"1", status:"Delivered damaged — cracked at the collar", value:38.00}
  ],
  freshness:"Delivery and evidence both confirmed — status current",
  timeline:[
    {when:"3 days ago 09:40", what:"Order placed and paid", src:"Order platform · confirmed", kind:"confirmed"},
    {when:"2 days ago 14:15", what:"Delivered and signed for", src:"Carrier scan · confirmed", kind:"confirmed"},
    {when:"Today 12:55", what:"Customer emailed reporting the cracked accessory", src:"Email channel · confirmed", kind:"confirmed"},
    {when:"Today 12:56", what:"Two photographs received showing the crack and the outer packaging", src:"Email attachment · confirmed", kind:"confirmed"},
    {when:"Today 13:00", what:"Case created and routed to the contact centre", src:"Care platform · confirmed", kind:"confirmed"}
  ],
  payments:{
    method:"Card ending 1129 (captured)",
    lines:[["Authorised","$127.00"],["Captured","$127.00"],["Accessory value","$38.00"],["Refunds to date","None"],["Refund destination","Original payment method"]]
  },
  contacts:[{when:"Today 12:55", channel:"Email", who:"Customer — first contact", summary:"Reports the accessory arrived cracked, attaches two photographs, and asks for a refund on that part only."}],
  promises:[{what:"Automatic acknowledgment: 'a colleague will respond within 24 hours'.", by:"Care platform at 13:00", state:"Within the promised window"}],
  facts:{
    confirmed:["The order was delivered two days ago and signed for.","The customer reported the damage within 48 hours of delivery.","Two photographs show a crack at the accessory collar, and the outer packaging is intact.","The accessory is priced at $38.00 and the main unit at $89.00.","$38.00 sits within advisor authority."],
    estimates:["Damage in transit rather than at manufacture is the more likely cause, given the intact outer packaging — but this is an inference, not a determination."],
    unknowns:["Whether the main blender unit has any fault the customer has not yet noticed.","Whether a replacement accessory is in stock for direct dispatch."]
  },
  missing:[
    {id:"m1",label:"Confirm whether the main unit works normally",note:"Avoids a second contact if the whole product is affected"},
    {id:"m2",label:"Ask whether a replacement accessory or the refund is preferred",note:"Both are permitted — the choice is the customer's"}
  ],
  policy:{
    rules:[
      {id:"DAM-3.1", name:"Damaged goods reported within 48 hours", effective:"Effective 10 January 2026", relevance:"Primary",
       extract:"Where damage is reported within 48 hours of delivery and photographic evidence is supplied, a refund of the affected item or a replacement may be issued without return, up to a value of $50."},
      {id:"DAM-3.6", name:"Component and accessory damage", effective:"Effective 10 January 2026", relevance:"Secondary",
       extract:"Where only a component is damaged, refund or replace the component. A full product refund requires the main unit to be affected or the product to be unusable without the component."},
      {id:"RET-6.4", name:"Refund timing", effective:"Effective 1 May 2026", relevance:"Contributing",
       extract:"Approved refunds are released to the original payment method within five working days. The customer must be told the working-day range, not a specific calendar date."}
    ],
    result:{state:"eligible", label:"Eligible — within advisor authority",
      detail:"Damage was reported within 48 hours with photographic evidence, and at $38.00 the accessory is below both the $50 DAM-3.1 ceiling and the $40 advisor limit. No return is required. A full product refund is not supported, because the main unit is working."},
    evidence:[
      "Delivery scan two days ago establishing the 48-hour window (carrier feed).",
      "Two customer photographs showing the cracked collar and intact outer packaging (email attachments).",
      "Accessory line value of $38.00 against the $50 DAM-3.1 ceiling (order platform).",
      "No prior damage claims on this account (case history)."
    ],
    uncertainty:[
      {t:"Cause of damage is inferred",d:"Intact packaging points to a manufacturing or pre-pack fault rather than transit handling. Nothing in the remedy depends on that, so it should not be stated to the customer as fact."},
      {t:"Main-unit condition unconfirmed",d:"The customer has not said whether the blender itself works. If it does not, DAM-3.6 opens a full product refund at a supervisor level."}
    ],
    exception:{path:"Supervisor", when:"Required only if the customer reports the main unit is also faulty, taking the remedy to $89.00 or above.",
      detail:"A component-only claim is decided by the advisor. Escalation is a change in the facts, not a change in confidence."}
  },
  remedies:[
    {id:"r1", name:"Refund the accessory, no return required", amount:38, level:"advisor", consequence:"$38.00 returns to the original card within five working days. The customer keeps the damaged accessory and no longer has a working one.", note:"Squarely within DAM-3.1 and advisor authority.", recommended:true},
    {id:"r2", name:"Send a replacement accessory", amount:38, level:"advisor", consequence:"A replacement is dispatched at no charge. The customer gets the product they bought, but waits for delivery instead of receiving money back.", note:"Subject to stock — do not commit to a date until dispatch is confirmed."},
    {id:"r3", name:"Refund the accessory and add goodwill", amount:48, level:"supervisor", consequence:"$38.00 refund plus $10 goodwill credit. Exceeds advisor authority.", note:"Not supported by the facts unless the customer reports wider inconvenience."},
    {id:"r4", name:"Full product refund", amount:127, level:"supervisor", consequence:"The whole $127.00 order is refunded and the product collected. The customer loses a blender that currently works.", note:"Requires the main unit to be faulty under DAM-3.6."}
  ],
  message:{
    channelPref:"email",
    opening:"About the damaged accessory in your MixMate order",
    confirmed:["Your photographs show the accessory arrived cracked, and you reported it within our 48-hour window.","You are entitled to a refund on that part, and you do not need to return it.","The refund is $38.00 — the accessory only, not the blender itself."],
    estimates:["Refunds are released to the original card within five working days of approval. I am giving you that range rather than a specific date, because the exact posting day depends on your bank."],
    unknowns:["I have not assumed the blender itself is affected. If it is not working properly, reply and tell me — that changes what I can offer you."]
  },
  tracking:{promised:"Refund confirmation within 24 hours of contact", next:"Confirm the refund in writing by email", dependency:"None — evidence complete", response:"Customer awaiting a written answer", reopened:"No", state:"ok", stateLabel:"On track"}
},
{
  id:"CARE-24084", order:"CR-784499", issue:"Missing item from a pickup order", channel:"Store service",
  ageLabel:"27h 40m", ageHours:27.7, opened:"Yesterday, 15:35",
  value:16.00, impact:"Customer paid for and collected an order that was one item short",
  priority:"No clearly assigned owner for over four working hours — ownership disputed between store and contact centre",
  flags:{safety:false, ownership:true, breach:false, identity:false, stale:true},
  customer:{
    name:"Marcus Bell", ref:"CUST-27655", tier:"Standard account · 3 years",
    prefChannel:"phone", prefLabel:"Phone call",
    prefNote:"Prefers a phone call; asked not to be sent app notifications.",
    language:"English", verifyMethod:"Verified in store against the pickup code",
    access:["Requested spoken rather than written confirmation"]
  },
  items:[
    {name:"Pickup order — 9 items", qty:"9", status:"Marked complete at collection", value:88.50},
    {name:"· PureHome Paper Towels 6-pack", qty:"1", status:"Not received by the customer", value:16.00}
  ],
  freshness:"Store stock count not yet run — item-level status unconfirmed",
  timeline:[
    {when:"2 days ago 18:20", what:"Pickup order placed and paid online", src:"Order platform · confirmed", kind:"confirmed"},
    {when:"Yesterday 11:05", what:"Order picked and staged at Store 118", src:"Store pick app · confirmed", kind:"confirmed"},
    {when:"Yesterday 15:30", what:"Pickup marked complete — order-level scan only, no item-level scan", src:"Store handover · confirmed gap", kind:"risk"},
    {when:"Yesterday 15:35", what:"Customer returned to the desk reporting a missing item", src:"Store service · confirmed", kind:"confirmed"},
    {when:"Yesterday 15:50", what:"Case routed to the contact centre; contact centre routed it back to the store", src:"Care platform · confirmed", kind:"risk"},
    {when:"Today 19:00", what:"Still no named owner — 27 hours elapsed", src:"Care platform · confirmed", kind:"risk"}
  ],
  payments:{
    method:"Card ending 6310 (captured at order)",
    lines:[["Authorised","$88.50"],["Captured","$88.50"],["Disputed item value","$16.00"],["Refunds to date","None"],["Refund destination","Original payment method"]]
  },
  contacts:[
    {when:"Yesterday 15:35", channel:"Store service", who:"Store associate", summary:"Customer reported the missing pack at the desk; associate could not adjust the order and raised a case."},
    {when:"Yesterday 15:50", channel:"Internal", who:"Contact centre", summary:"Returned the case to the store on the basis that pickup discrepancies are store-owned."},
    {when:"Today 10:15", channel:"Phone", who:"Customer — chasing", summary:"Called to ask who is dealing with it. No named owner could be given."}
  ],
  promises:[{what:"'The store will call you back today.'", by:"Store desk, yesterday 15:35", state:"Broken — no call was made"}],
  facts:{
    confirmed:["The order was paid in full at $88.50, including $16.00 for the paper towels.","The pickup was marked complete at order level; no item-level scan exists.","The customer reported the shortfall within five minutes of collection, at the store desk.","The case has had no named owner for more than 27 hours.","A call-back was promised yesterday and was not made."],
    estimates:["A staged-order shortfall is the more likely explanation than a collection error, given the report came within five minutes at the desk — this is a judgement, not a finding."],
    unknowns:["Whether the item was staged and then lost, or never picked at all — the store stock count has not been run.","Which team owns the outcome: store service or the contact centre."]
  },
  missing:[
    {id:"m1",label:"Run the store stock count on the paper-towel line for yesterday",note:"The only evidence that would settle what happened"},
    {id:"m2",label:"Assign one named owner and tell the customer who it is",note:"Required by the four-working-hour ownership rule"},
    {id:"m3",label:"Confirm whether the customer wants a refund or the item",note:"Do not decide this for them"}
  ],
  policy:{
    rules:[
      {id:"PIC-5.4", name:"Pickup discrepancy and missing items", effective:"Effective 20 March 2026", relevance:"Primary",
       extract:"Where an item-level scan does not exist, a customer report made at the point of collection is accepted. Refund or replace the item without requiring proof, up to a value of $40."},
      {id:"OWN-1.2", name:"Case ownership and the four-hour rule", effective:"Effective 1 April 2026", relevance:"Mandatory",
       extract:"Every case carries one named owner. A case without a named owner after four working hours is escalated to a supervisor, who assigns ownership. Cases must not be routed between teams more than once without supervisor involvement."},
      {id:"PIC-5.9", name:"Store and contact-centre boundary", effective:"Effective 20 March 2026", relevance:"Contributing",
       extract:"The team in contact with the customer retains ownership until it hands over to a named individual who accepts it. Handover is never complete on routing alone."}
    ],
    result:{state:"eligible", label:"Eligible — but blocked on ownership, not on evidence",
      detail:"PIC-5.4 accepts the customer's report where no item-level scan exists, and at $16.00 the remedy sits inside advisor and store-associate authority. The obstacle is OWN-1.2: the case has been routed between teams and has had no named owner for 27 hours, which is an automatic supervisor escalation."},
    evidence:[
      "Order-level pickup scan with no item-level scan (store handover log).",
      "Customer report timed five minutes after collection (store service record).",
      "Payment capture of $88.50 including the $16.00 line (payment system).",
      "Routing history showing the case moved between teams and back (care platform).",
      "Ownership clock showing 27 hours without a named owner (care platform)."
    ],
    uncertainty:[
      {t:"No item-level evidence exists, and none may ever exist",d:"PIC-5.4 is written for exactly this gap. Waiting for certainty that cannot be produced is what has kept this case open for a day."},
      {t:"Ownership boundary is genuinely ambiguous",d:"PIC-5.9 resolves it in principle — the team in contact keeps it — but that has not been applied. This is a process finding for the policy owner."}
    ],
    exception:{path:"Supervisor — automatic under OWN-1.2", when:"Already triggered. This case exceeded four working hours without a named owner and requires supervisor assignment, whatever the remedy amount.",
      detail:"The supervisor assigns a named owner and the remedy proceeds at the normal authority level. Escalation here is about accountability, not about the money."}
  },
  remedies:[
    {id:"r1", name:"Refund the missing item", amount:16, level:"advisor", consequence:"$16.00 returns to the original card within five working days. The customer does not get the paper towels and has already made a wasted trip back to the desk.", note:"Permitted under PIC-5.4 without proof."},
    {id:"r2", name:"Refund and set aside the item for collection", amount:16, level:"advisor", consequence:"$16.00 refunded and a replacement pack held at the desk under the customer's name, if they choose to return.", note:"Only offer if the customer is willing to make another trip."},
    {id:"r3", name:"Refund plus goodwill for the wasted return trip and the broken call-back", amount:26, level:"advisor", consequence:"$16.00 refund plus a $10 credit, acknowledging the missed call-back and the second trip.", note:"Proportionate to two service failures; still inside advisor authority.", recommended:true},
    {id:"r4", name:"Refund, goodwill, and free delivery of a replacement", amount:44, level:"supervisor", consequence:"Full recovery without another store visit. Exceeds the $40 advisor ceiling.", note:"Reasonable where the customer cannot easily return to the store."}
  ],
  message:{
    channelPref:"phone",
    opening:"About the item missing from your pickup order",
    confirmed:["You paid for a 6-pack of PureHome paper towels and did not receive it.","You told us at the desk within five minutes of collecting, and we accept that report.","I am the named owner of this case now, and you can ask for me by name."],
    estimates:["Refunds reach the original card within five working days. I will not give you a specific date, because the posting day depends on your bank."],
    unknowns:["I cannot yet tell you what happened to the pack — the store stock count has not been run. That does not change what you are owed, and I am not asking you to wait for it."]
  },
  tracking:{promised:"Call-back promised yesterday — not made", next:"Supervisor to assign a named owner, then call the customer", dependency:"Store stock count on the paper-towel line", response:"Customer called once to chase; no answer given", reopened:"No — but a second contact has already happened", state:"risk", stateLabel:"Escalated — no owner for 27 hours"}
},
{
  id:"CARE-24085", order:"CR-783902", issue:"Return received, refund not issued", channel:"Text message",
  ageLabel:"2h 50m", ageHours:2.8, opened:"Today, 16:20",
  value:64.00, impact:"Customer is out of pocket $64.00 and past the timing they were promised",
  priority:"Refund promise breached — six days elapsed against a five-working-day commitment",
  flags:{safety:false, ownership:false, breach:true, identity:true, stale:false},
  customer:{
    name:"Anita Deshmukh", ref:"CUST-19042", tier:"Delivery Saver member · 6 years",
    prefChannel:"sms", prefLabel:"Text message (SMS)",
    prefNote:"Explicitly asked for text updates only — no phone calls during working hours.",
    language:"English", verifyMethod:"One-time code to registered mobile — required before refund destination is discussed",
    access:["Text-only contact during working hours","Asked for confirmation numbers in writing"]
  },
  items:[
    {name:"FitStride Exercise Mat", qty:"1", status:"Returned — received at the returns centre", value:64.00}
  ],
  freshness:"Returns-centre receipt confirmed; refund release status is the gap",
  timeline:[
    {when:"12 days ago", what:"Order delivered", src:"Carrier scan · confirmed", kind:"confirmed"},
    {when:"9 days ago", what:"Return requested and label issued", src:"Returns portal · confirmed", kind:"confirmed"},
    {when:"6 days ago 11:30", what:"Return received and scanned at the returns centre", src:"Returns centre · confirmed", kind:"confirmed"},
    {when:"6 days ago 11:31", what:"Five-working-day refund commitment started", src:"Policy RET-6.2 · confirmed", kind:"confirmed"},
    {when:"Today", what:"Refund still not released — commitment now exceeded", src:"Payment system · confirmed", kind:"risk"},
    {when:"Today 16:20", what:"Customer texted asking where the refund is", src:"Messaging channel · confirmed", kind:"confirmed"}
  ],
  payments:{
    method:"Card ending 2264 (captured)",
    lines:[["Original payment","$64.00"],["Refund raised","Yes — 6 days ago"],["Refund released","No — held in the finance queue"],["Refunds to date","None"],["Refund destination","Original payment method — unchanged"]]
  },
  contacts:[
    {when:"3 days ago", channel:"Text message", who:"Customer", summary:"Asked whether the return had arrived; was told it had, and that the refund was 'being processed'."},
    {when:"Today 16:20", channel:"Text message", who:"Customer", summary:"Asked directly when the money will be back, noting it has been six days."}
  ],
  promises:[
    {what:"'Refunds are issued within five working days of us receiving your return.'", by:"Returns portal, at the point of return", state:"Breached — six days elapsed"},
    {what:"'Your refund is being processed.'", by:"Text reply three days ago", state:"Accurate but uninformative — it set no expectation"}
  ],
  facts:{
    confirmed:["The return was received and scanned at the returns centre six days ago.","The five-working-day refund commitment has been exceeded.","The refund of $64.00 was raised but has not been released.","The refund destination is the original card and has not been changed.","The customer has now contacted twice about the same issue."],
    estimates:["The hold appears to be a finance-queue backlog rather than a problem with the return itself, based on the return being scanned clean."],
    unknowns:["Why the refund was held — no reason code is recorded against it.","When finance will release it, until a reviewer picks it up."]
  },
  missing:[
    {id:"m1",label:"Get the hold reason from the finance refund queue",note:"No reason code is recorded — this is the root question"},
    {id:"m2",label:"Complete identity verification before discussing the refund destination",note:"Required before any payment detail is exposed or changed"},
    {id:"m3",label:"Confirm the customer wants written confirmation of the release",note:"They asked for confirmation numbers in writing"}
  ],
  policy:{
    rules:[
      {id:"RET-6.2", name:"Return refund timing", effective:"Effective 1 May 2026", relevance:"Primary",
       extract:"A refund is released within five working days of the return being received at the returns centre. Where that commitment is missed, the case is escalated and the customer is given a named owner and a checkpoint date."},
      {id:"RET-6.7", name:"Goodwill for a missed refund commitment", effective:"Effective 1 May 2026", relevance:"Secondary",
       extract:"Where a refund commitment is missed through no fault of the customer, a goodwill credit of up to $15 may be applied at advisor discretion. The refund itself is not discretionary and must not be treated as goodwill."},
      {id:"SEC-1.1", name:"Identity verification before payment detail", effective:"Effective 1 January 2026", relevance:"Mandatory",
       extract:"Verify the customer's identity before exposing payment details or changing a refund destination. Where standard verification is not accessible to the customer, use the assisted verification path rather than refusing service."}
    ],
    result:{state:"breach", label:"Refund is owed and overdue — escalation required",
      detail:"The return was received six days ago against a five-working-day commitment under RET-6.2, so the refund is overdue and the case escalates automatically. The $64.00 is money owed, not a discretionary remedy — only the goodwill credit under RET-6.7 is discretionary and it sits inside advisor authority."},
    evidence:[
      "Returns-centre receipt scan dated six days ago (returns system).",
      "Refund raised but not released, with no reason code (payment system).",
      "Five-working-day commitment shown to the customer at return (returns portal).",
      "Two customer contacts about the same issue within seven days (case history).",
      "Refund destination unchanged since the original payment (payment system)."
    ],
    uncertainty:[
      {t:"No hold reason is recorded",d:"Nothing explains why the release stalled. Do not tell the customer it is a 'system delay' — that is a guess dressed as an answer."},
      {t:"Release date cannot be confirmed",d:"Only a finance reviewer can commit to a release. Give the customer a checkpoint you control instead of a bank date you do not."}
    ],
    exception:{path:"Finance reviewer", when:"Automatic — a breached refund commitment escalates to finance to release the payment.",
      detail:"The refund is not an approval decision, it is a release action. The advisor may apply the RET-6.7 goodwill credit in parallel without waiting for finance."}
  },
  remedies:[
    {id:"r1", name:"Escalate to finance for immediate release", amount:64, level:"finance", consequence:"The $64.00 owed is released to the original card. The customer gets the money they are owed — this corrects a failure rather than granting a remedy.", note:"Money owed, not discretionary. Requires a finance reviewer to release it.", recommended:true},
    {id:"r2", name:"Goodwill credit for the missed commitment", amount:15, level:"advisor", consequence:"$15 credit applied within one working day, alongside the refund release. Acknowledges six days of the customer's money being held.", note:"At the RET-6.7 ceiling and inside advisor authority; can proceed in parallel."},
    {id:"r3", name:"Release the refund and add goodwill", amount:79, level:"finance", consequence:"$64.00 released plus a $15 credit, handled as one action with a single written confirmation.", note:"Cleanest for the customer — one message, one owner, one checkpoint."},
    {id:"r4", name:"Hold and re-check in two working days", amount:0, level:"advisor", consequence:"Nothing changes. The customer waits longer on a commitment already broken, and is likely to contact a third time.", note:"Not defensible here — the commitment is already breached."}
  ],
  message:{
    channelPref:"sms",
    opening:"About your refund for the FitStride mat",
    confirmed:["Your return reached our returns centre six days ago and was scanned in.","Your refund of $64.00 was raised but has not been released. That is past the five working days we promised you.","This is money you are owed, and I have escalated it to our finance team to release."],
    estimates:["Once released, card refunds usually appear within three to five working days. I am not going to give you a date for the release itself until finance confirms it."],
    unknowns:["I cannot tell you yet why the release stalled — there is no reason recorded against it, and I would rather say that than guess."]
  },
  tracking:{promised:"Refund was due 1 day ago — commitment breached", next:"Finance reviewer to release $64.00; advisor to text a checkpoint", dependency:"Finance refund queue — no hold reason recorded", response:"Customer has contacted twice in seven days", reopened:"Yes — repeat contact on the same issue", state:"risk", stateLabel:"Breached promise — escalated"}
}
];

var MEASURES = [
  {lab:"Average handling effort", val:"12.6 min", dir:"Reduce, without lowering resolution quality", note:"3.4 min of it is locating and interpreting policy", pct:100},
  {lab:"Transfer rate", val:"23%", dir:"Reduce", note:"Between contact centre, store, fulfilment or finance", pct:23},
  {lab:"Repeat contact within 7 days", val:"18%", dir:"Reduce", note:"Same issue, contacted again", pct:18},
  {lab:"Unresolved after 48 hours", val:"140 daily", dir:"Reduce and clarify ownership", note:"38 have no clearly assigned next owner", pct:27},
  {lab:"Policy-consistent resolution", val:"79%", dir:"Increase — measure to validate", note:"Quality-review sample", pct:79},
  {lab:"Policy pages consulted per case", val:"2.3", dir:"Reduce", note:"Delivery disruption and substitution most disputed", pct:46}
];
</script>
<script>
"use strict";

/* ---------------- state (in memory only) ---------------- */
var ST = {};
CASES.forEach(function(c){
  ST[c.id] = {owner:null, ack:false, remedy:null, rationale:"", decision:"none", decidedBy:"",
              escalatedTo:"", verified:!c.flags.identity, missingSent:false, checks:{},
              tone:"plain", channel:c.message.channelPref, msgState:"draft", msgText:null,
              largePrint:false, plainLang:false};
});
ST["CARE-24082"].owner = "Jae Lin · Contact-centre advisor";
ST["CARE-24083"].owner = "Maya Alvarez · Contact-centre advisor";
ST["CARE-24085"].owner = "Maya Alvarez · Contact-centre advisor";
ST["CARE-24085"].ack = true;
ST["CARE-24085"].remedy = "r1";
ST["CARE-24085"].rationale = "Return confirmed received six days ago against a five-working-day commitment under RET-6.2. The $64.00 is money owed, not a discretionary remedy, and no hold reason is recorded. Escalating to finance for release.";

var CUR = CASES[0].id;
var ME = PERSONAS[0];
var LOG = [];
var LEVEL_RANK = {advisor:1, supervisor:2, finance:3};

/* ---------------- helpers ---------------- */
function $(id){ return document.getElementById(id); }
function esc(s){ return String(s).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;"); }
function money(n){ return "$" + Number(n).toFixed(2); }
function getCase(id){ for(var i=0;i<CASES.length;i++){ if(CASES[i].id===id) return CASES[i]; } return CASES[0]; }
function cur(){ return getCase(CUR); }
function st(){ return ST[CUR]; }
function myRank(){ return ME.id==="supervisor"?2 : ME.id==="finance"?3 : ME.decide?1:0; }
function remedyOf(c,s){ if(!s.remedy) return null; for(var i=0;i<c.remedies.length;i++){ if(c.remedies[i].id===s.remedy) return c.remedies[i]; } return null; }
function nowLabel(){
  var d = new Date();
  return String(d.getHours()).padStart(2,"0") + ":" + String(d.getMinutes()).padStart(2,"0") + ":" + String(d.getSeconds()).padStart(2,"0");
}
function log(caseId, text){
  LOG.unshift({t:nowLabel(), c:caseId, who:ME.role, text:text});
  renderLog();
}
function approvalState(c,s){
  if(s.decision==="approved") return {label:"Approved · " + s.decidedBy, cls:"p-ok"};
  if(s.decision==="rejected") return {label:"Rejected · " + s.decidedBy, cls:"p-risk"};
  if(s.decision==="escalated") return {label:"Escalated to " + s.escalatedTo, cls:"p-warn"};
  if(s.decision==="revision") return {label:"Returned for revision", cls:"p-warn"};
  if(s.remedy) return {label:"Awaiting decision", cls:"p-warn"};
  return {label:"Not yet requested", cls:"p-mute"};
}
function ownerLabel(s){ return s.owner ? s.owner : "Unassigned"; }

/* ---------------- header ---------------- */
function buildHeader(){
  var ps = $("personaSel"), cs = $("caseSel");
  ps.innerHTML = PERSONAS.map(function(p,i){ return '<option value="'+p.id+'">'+esc(p.role+" — "+p.name)+'</option>'; }).join("");
  cs.innerHTML = CASES.map(function(c){ return '<option value="'+c.id+'">'+esc(c.id+" · "+c.issue)+'</option>'; }).join("");
  ps.addEventListener("change", function(){
    for(var i=0;i<PERSONAS.length;i++){ if(PERSONAS[i].id===ps.value) ME = PERSONAS[i]; }
    log(CUR, "Signed-in role switched to " + ME.role + " (" + ME.name + ").");
    renderAll();
  });
  cs.addEventListener("change", function(){ CUR = cs.value; renderAll(); });
}
function renderHeader(){
  $("caseSel").value = CUR;
  $("personaSel").value = ME.id;
  var lim = ME.id==="finance" ? "no ceiling — decides above $150 and all policy exceptions"
          : ME.decide ? "up to " + money(ME.limit) : "read-only — monitors consistency, cannot decide remedies";
  $("authorityChip").textContent = "Approval authority: " + lim + " · " + ME.scope;
  $("v1Persona").textContent = ME.role + " — " + ME.name;
}

/* ---------------- tabs ---------------- */
function buildTabs(){
  var btns = $("tabs").querySelectorAll("button");
  Array.prototype.forEach.call(btns, function(b){
    b.addEventListener("click", function(){
      Array.prototype.forEach.call(btns, function(x){ x.setAttribute("aria-selected", x===b ? "true":"false"); });
      ["v1","v2","v3","v4","v5","v6"].forEach(function(v){ $(v).classList.toggle("active", v===b.getAttribute("data-view")); });
      window.scrollTo(0,0);
    });
  });
}
function goTab(v){
  var btns = $("tabs").querySelectorAll("button");
  Array.prototype.forEach.call(btns, function(x){ x.setAttribute("aria-selected", x.getAttribute("data-view")===v ? "true":"false"); });
  ["v1","v2","v3","v4","v5","v6"].forEach(function(x){ $(x).classList.toggle("active", x===v); });
  window.scrollTo(0,0);
}

/* ---------------- view 1 : queue ---------------- */
var QFILTER = "all";
function passesFilter(c,s){
  if(QFILTER==="all") return true;
  if(QFILTER==="unowned") return !s.owner;
  if(QFILTER==="approval") return !!s.remedy && s.decision==="none";
  if(QFILTER==="risk") return c.flags.breach || c.flags.ownership || c.flags.safety;
  return true;
}
function renderQueue(){
  var rows = CASES.filter(function(c){ return passesFilter(c, ST[c.id]); }).map(function(c){
    var s = ST[c.id], ap = approvalState(c,s);
    var dot = c.tracking.state==="risk" ? "d-risk" : c.tracking.state==="warn" ? "d-warn" : "d-ok";
    var act = s.owner
      ? (s.owner.indexOf(ME.name) === 0
          ? '<span class="pill p-ok">Yours</span>'
          : '<button class="btn small" data-take="'+c.id+'">Take over</button>')
      : '<button class="btn small primary" data-take="'+c.id+'">Accept &amp; assign</button>';
    return '<tr class="'+(c.id===CUR?"sel":"")+'" data-open="'+c.id+'">'
      + '<td><span class="badge-dot '+dot+'"></span><strong>'+esc(c.id)+'</strong><div class="small muted">'+esc(c.order)+'</div></td>'
      + '<td>'+esc(c.ageLabel)+'<div class="small muted">'+esc(c.opened)+'</div></td>'
      + '<td>'+esc(c.channel)+'</td>'
      + '<td>'+esc(c.issue)+'</td>'
      + '<td>'+esc(c.impact)+'</td>'
      + '<td class="num-cell">'+money(c.value)+'</td>'
      + '<td>'+esc(c.priority)+'</td>'
      + '<td>'+esc(ownerLabel(s))+'</td>'
      + '<td><span class="pill '+ap.cls+'">'+esc(ap.label)+'</span></td>'
      + '<td>'+act+' <button class="btn small" data-open2="'+c.id+'">Open</button></td>'
      + '</tr>';
  }).join("");
  $("queueBody").innerHTML = rows || '<tr><td colspan="10" class="muted" style="padding:18px">No cases match this filter.</td></tr>';

  Array.prototype.forEach.call($("queueBody").querySelectorAll("[data-take]"), function(b){
    b.addEventListener("click", function(ev){
      ev.stopPropagation();
      var id = b.getAttribute("data-take");
      if(!ME.decide){ log(id, "Ownership not taken \u2014 the policy owner / customer-experience role monitors cases and does not own or decide them."); goTab("v6"); return; }
      ST[id].owner = ME.name + " · " + ME.role;
      CUR = id;
      log(id, "Case accepted. Named owner is now " + ME.name + " (" + ME.role + "). Four-working-hour ownership clock reset.");
      renderAll();
    });
  });
  Array.prototype.forEach.call($("queueBody").querySelectorAll("[data-open2]"), function(b){
    b.addEventListener("click", function(ev){ ev.stopPropagation(); CUR = b.getAttribute("data-open2"); renderAll(); goTab("v2"); });
  });
  Array.prototype.forEach.call($("queueBody").querySelectorAll("[data-open]"), function(tr){
    tr.addEventListener("click", function(){ CUR = tr.getAttribute("data-open"); renderAll(); });
  });
}
function buildQueueFilter(){
  var btns = $("queueFilter").querySelectorAll("button");
  Array.prototype.forEach.call(btns, function(b){
    b.addEventListener("click", function(){
      QFILTER = b.getAttribute("data-f");
      Array.prototype.forEach.call(btns, function(x){ x.setAttribute("aria-pressed", x===b ? "true":"false"); });
      renderQueue();
    });
  });
}

/* ---------------- view 2 : case + timeline ---------------- */
function renderCaseView(){
  var c = cur(), s = st();
  $("v2Title").textContent = "Consolidated case and timeline — " + c.id;
  $("v2CaseChip").textContent = c.id + " · " + c.issue;
  $("v2OrderChip").textContent = "Order " + c.order + " · " + money(c.value);
  $("v2Freshness").textContent = c.freshness;

  $("v2Customer").innerHTML =
    '<dl class="kv">'
    + '<dt>Customer</dt><dd>'+esc(c.customer.name)+' <span class="small muted">('+esc(c.customer.ref)+')</span></dd>'
    + '<dt>Relationship</dt><dd>'+esc(c.customer.tier)+'</dd>'
    + '<dt>Preferred channel</dt><dd><span class="pill p-brand">'+esc(c.customer.prefLabel)+'</span></dd>'
    + '<dt>Preference note</dt><dd>'+esc(c.customer.prefNote)+'</dd>'
    + '<dt>Language</dt><dd>'+esc(c.customer.language)+'</dd>'
    + '<dt>Communication support</dt><dd><ul class="tight">'+c.customer.access.map(function(a){return "<li>"+esc(a)+"</li>";}).join("")+'</ul></dd>'
    + '<dt>Identity</dt><dd>'+(s.verified?'<span class="pill p-ok">Verified</span> ':'<span class="pill p-warn">Not verified</span> ')+'<span class="small muted">'+esc(c.customer.verifyMethod)+'</span></dd>'
    + '</dl>';

  $("v2Items").innerHTML = c.items.map(function(i){
    return '<tr><td>'+esc(i.name)+'</td><td>'+esc(i.qty)+'</td><td>'+esc(i.status)+'</td><td class="num-cell">'+money(i.value)+'</td></tr>';
  }).join("");

  if(!s.verified){
    $("v2Payments").innerHTML = '<div class="callout warn"><b>Payment detail is masked.</b> Identity must be verified before payment details are exposed or a refund destination is changed (SEC-1.1). Where standard verification is not accessible to the customer, use the assisted path rather than refusing service.</div>'
      + '<div style="margin-block-start:10px"><button class="btn primary" id="btnVerify">Complete identity verification</button> <button class="btn" id="btnAssisted">Use assisted verification path</button></div>';
    $("btnVerify").addEventListener("click", function(){ s.verified=true; log(c.id,"Identity verified by "+ME.name+" using: "+c.customer.verifyMethod+"."); renderAll(); });
    $("btnAssisted").addEventListener("click", function(){ s.verified=true; log(c.id,"Identity verified via the assisted path — standard verification was not accessible to the customer."); renderAll(); });
  } else {
    $("v2Payments").innerHTML = '<dl class="kv">'
      + '<dt>Method</dt><dd>'+esc(c.payments.method)+'</dd>'
      + c.payments.lines.map(function(l){ return "<dt>"+esc(l[0])+"</dt><dd>"+esc(l[1])+"</dd>"; }).join("")
      + '</dl><div class="small muted" style="margin-block-start:8px">Visible because identity is verified. Any change of refund destination requires a fresh verification.</div>';
  }

  $("v2Contacts").innerHTML =
    '<h4>Prior contacts</h4><ul class="tight">'
    + c.contacts.map(function(x){ return "<li><strong>"+esc(x.when)+" · "+esc(x.channel)+"</strong> — "+esc(x.who)+". "+esc(x.summary)+"</li>"; }).join("")
    + '</ul><div class="hr"></div><h4>Promises already made to this customer</h4><ul class="tight">'
    + c.promises.map(function(p){ return "<li>"+esc(p.what)+"<div class=\"small muted\">"+esc(p.by)+" — <strong>"+esc(p.state)+"</strong></div></li>"; }).join("")
    + '</ul>';

  $("v2Timeline").innerHTML = c.timeline.map(function(e){
    return '<li class="'+(e.kind==="est"?"est":e.kind==="risk"?"risk":"")+'"><span class="dot"></span>'
      + '<div class="when">'+esc(e.when)+'</div><div class="what">'+esc(e.what)+'</div><div class="src">'+esc(e.src)+'</div></li>';
  }).join("");

  $("v2Facts").innerHTML =
      band("confirmed","Confirmed facts", c.facts.confirmed)
    + band("estimate","Estimates — not commitments", c.facts.estimates)
    + band("unknown","Unknown — do not fill the gap", c.facts.unknowns)
    + '<div class="callout info">This draft summary is assembled from the systems above. It must be reviewed by the advisor before use; the advisor remains accountable for accuracy, tone and policy fit.</div>';

  var checks = c.missing.map(function(m){
    return '<label class="chk"><input type="checkbox" data-miss="'+m.id+'"'+(s.checks[m.id]?" checked":"")+'><span>'+esc(m.label)+'<div class="small muted">'+esc(m.note)+'</div></span></label>';
  }).join("");
  $("v2Missing").innerHTML = checks + (s.missingSent ? '<div class="callout ok" style="margin-block-start:10px">Information request sent via '+esc(c.customer.prefLabel)+' — the customer\u2019s preferred channel. Asked once, in one message.</div>' : '');
  Array.prototype.forEach.call($("v2Missing").querySelectorAll("[data-miss]"), function(cb){
    cb.addEventListener("change", function(){ s.checks[cb.getAttribute("data-miss")] = cb.checked; updateMissingHint(); });
  });
  updateMissingHint();
}
function band(kind, title, items){
  return '<div class="fact '+kind+'"><h4>'+esc(title)+'</h4><ul class="tight">'
    + items.map(function(i){ return "<li>"+esc(i)+"</li>"; }).join("") + '</ul></div>';
}
function updateMissingHint(){
  var s = st(), n = 0;
  for(var k in s.checks){ if(s.checks[k]) n++; }
  $("btnMissing").disabled = n===0;
  $("missingHint").textContent = n===0 ? "Select at least one item." : n + " item(s) will be requested in a single message via " + cur().customer.prefLabel + ".";
}

/* ---------------- view 3 : policy ---------------- */
function renderPolicy(){
  var c = cur(), s = st(), p = c.policy;
  $("v3Rules").innerHTML = p.rules.map(function(r){
    var cls = r.relevance==="Mandatory" ? "p-risk" : r.relevance==="Primary" ? "p-brand" : "p-mute";
    return '<div class="callout"><div style="display:flex;gap:8px;align-items:center;flex-wrap:wrap;margin-block-end:6px">'
      + '<strong>'+esc(r.id)+' — '+esc(r.name)+'</strong>'
      + '<span class="pill '+cls+'">'+esc(r.relevance)+'</span>'
      + '<span class="small muted spacer">'+esc(r.effective)+'</span></div>'
      + '<div class="small">\u201C'+esc(r.extract)+'\u201D</div></div>';
  }).join("");

  $("v3Evidence").innerHTML = '<ul class="tight">'+p.evidence.map(function(e){return "<li>"+esc(e)+"</li>";}).join("")+'</ul>'
    + '<div class="small muted" style="margin-block-start:8px">Every item above is a system record or a customer statement recorded on this case. Nothing in the eligibility result is inferred beyond what is listed here.</div>';

  var rcls = p.result.state==="eligible" ? "ok" : p.result.state==="breach" ? "risk" : "warn";
  var rpill = p.result.state==="eligible" ? "p-ok" : p.result.state==="breach" ? "p-risk" : "p-warn";
  $("v3Result").innerHTML = '<div class="pill '+rpill+'" style="font-size:12.5px">'+esc(p.result.label)+'</div>'
    + '<p style="margin-block-start:10px">'+esc(p.result.detail)+'</p>'
    + '<div class="callout '+rcls+'">Guidance only. The advisor verifies the facts and decides within their authority; the assistant does not decide, approve, or send.</div>';

  $("v3Uncertainty").innerHTML = p.uncertainty.map(function(u){
    return '<div class="fact estimate"><h4>'+esc(u.t)+'</h4><div class="small">'+esc(u.d)+'</div></div>';
  }).join("");

  $("v3Exception").innerHTML = '<dl class="kv">'
    + '<dt>Path</dt><dd><span class="pill p-info">'+esc(p.exception.path)+'</span></dd>'
    + '<dt>When</dt><dd>'+esc(p.exception.when)+'</dd>'
    + '<dt>How it works</dt><dd>'+esc(p.exception.detail)+'</dd></dl>';

  $("ackBox").checked = s.ack;
  $("ackBox").disabled = !ME.decide;
  $("ackState").textContent = s.ack
    ? "Acknowledged. Remedy selection is unlocked for this case."
    : (ME.decide ? "Not acknowledged. A remedy cannot be submitted for decision until the guidance is acknowledged."
                 : "The policy owner / customer-experience role reviews guidance for consistency but does not acknowledge it on a live case.");
}

/* ---------------- view 4 : remedy + approval ---------------- */
function suggestRationale(){
  var c = cur(), s = st(), r = remedyOf(c,s);
  if(!r){ return; }
  var txt = "Applied " + c.policy.rules[0].id + " (" + c.policy.rules[0].effective.toLowerCase() + "). "
    + c.policy.result.label + ". Selected " + r.name.toLowerCase() + " at " + (r.amount>0?money(r.amount):"no cost")
    + ", which requires " + LEVELS[r.level].toLowerCase() + " authority. Confirmed facts verified against the source systems; "
    + "estimates and unknowns were not stated to the customer as commitments.";
  $("rationale").value = txt; s.rationale = txt; renderRemedy();
}
function renderRemedy(){
  var c = cur(), s = st();
  var lim = ME.id==="finance" ? "no ceiling" : money(ME.limit);
  $("v4Authority").innerHTML = ME.decide
    ? "<b>"+esc(ME.name)+" — "+esc(ME.role)+".</b> Approval authority "+esc(lim)+"."
      + (c.flags.safety ? " <b>This case engages the safety and essential-use exception (RAI-1.3), so explicit human review is required whatever the amount.</b>" : "")
      + (c.flags.ownership ? " <b>This case has exceeded four working hours without a named owner, so supervisor assignment is required under OWN-1.2.</b>" : "")
      + (c.flags.breach ? " <b>A refund commitment has been breached, so this case escalates to a finance reviewer for release under RET-6.2.</b>" : "")
    : "<b>Read-only role.</b> The policy owner and customer-experience leader monitor consistency, customer effort and unresolved patterns. Remedies and approvals stay with the advisor, supervisor and finance reviewer.";

  $("v4Options").innerHTML = c.remedies.map(function(r){
    var need = LEVEL_RANK[r.level];
    var blocked = need > myRank() || !ME.decide;
    var pill = r.level==="advisor" ? "p-ok" : r.level==="supervisor" ? "p-warn" : "p-risk";
    return '<label class="opt '+(s.remedy===r.id?"checked":"")+' '+(blocked?"blocked":"")+'">'
      + '<input type="radio" name="remedy" data-remedy="'+r.id+'"'+(s.remedy===r.id?" checked":"")+(ME.decide?"":" disabled")+'>'
      + '<div><div class="oh"><span class="oname">'+esc(r.name)+'</span>'
      + '<span class="pill p-brand">'+(r.amount>0?money(r.amount):"No cost")+'</span>'
      + '<span class="pill '+pill+'">'+esc(LEVELS[r.level])+' authority</span>'
      + (r.recommended?'<span class="pill p-info">Assistant suggests</span>':"")
      + (blocked?'<span class="pill p-mute">Above your authority</span>':"")
      + '</div>'
      + '<div class="odesc"><strong>Customer consequence:</strong> '+esc(r.consequence)+'</div>'
      + '<div class="odesc muted">'+esc(r.note)+'</div></div></label>';
  }).join("");
  Array.prototype.forEach.call($("v4Options").querySelectorAll("[data-remedy]"), function(rb){
    rb.addEventListener("change", function(){
      s.remedy = rb.getAttribute("data-remedy");
      if(s.decision!=="none"){ s.decision="none"; s.decidedBy=""; }
      log(c.id, "Remedy option selected: " + remedyOf(c,s).name + " (" + money(remedyOf(c,s).amount) + ").");
      renderAll();
    });
  });

  $("rationale").value = s.rationale;
  $("rationale").disabled = !ME.decide;

  var r = remedyOf(c,s);
  var need = r ? LEVEL_RANK[r.level] : 0;
  var reasons = [];
  if(!ME.decide) reasons.push("this role cannot decide remedies");
  if(!s.ack) reasons.push("policy guidance has not been acknowledged");
  if(!r) reasons.push("no remedy option is selected");
  if(!s.owner) reasons.push("the case has no named owner");
  if(s.rationale.trim().length < 15) reasons.push("a decision rationale is required");
  if(r && need > myRank()) reasons.push(money(r.amount) + " needs " + LEVELS[r.level].toLowerCase() + " authority");

  var canApprove = reasons.length===0;
  var canEscalate = ME.decide && !!r && s.ack;
  $("v4Actions").innerHTML =
      '<button class="btn primary" id="btnApprove"'+(canApprove?"":" disabled")+'>Approve</button>'
    + '<button class="btn danger" id="btnReject"'+(canApprove?"":" disabled")+'>Reject</button>'
    + '<button class="btn" id="btnRevise"'+(ME.decide && r?"":" disabled")+'>Return for revision</button>'
    + '<button class="btn" id="btnEscalate"'+(canEscalate?"":" disabled")+'>Escalate</button>'
    + '<span class="small muted spacer">'+(canApprove ? "Ready to decide." : "Blocked: " + esc(reasons.join("; ")) + ".")+'</span>';

  $("btnApprove").addEventListener("click", function(){
    s.decision="approved"; s.decidedBy = ME.name + " (" + ME.role + ")";
    log(c.id, "Remedy approved: " + r.name + " " + money(r.amount) + ", by " + s.decidedBy + ".");
    renderAll();
  });
  $("btnReject").addEventListener("click", function(){
    s.decision="rejected"; s.decidedBy = ME.name + " (" + ME.role + ")";
    log(c.id, "Remedy rejected by " + s.decidedBy + ". Rationale recorded on the case.");
    renderAll();
  });
  $("btnRevise").addEventListener("click", function(){
    s.decision="revision"; s.decidedBy = ME.name + " (" + ME.role + ")";
    log(c.id, "Returned to the case owner for revision by " + s.decidedBy + ".");
    renderAll();
  });
  $("btnEscalate").addEventListener("click", function(){
    var to = r && LEVEL_RANK[r.level] > myRank() ? LEVELS[r.level] : (myRank()>=2 ? "Finance reviewer" : "Supervisor");
    s.decision="escalated"; s.escalatedTo = to; s.decidedBy = ME.name + " (" + ME.role + ")";
    log(c.id, "Escalated to " + to + " by " + ME.name + ". The customer keeps a named owner and a checkpoint while the escalation runs.");
    renderAll();
  });
  var ap = approvalState(c,s);
  $("v4Status").innerHTML = '<dl class="kv">'
    + '<dt>Case</dt><dd>'+esc(c.id)+' · '+esc(c.issue)+'</dd>'
    + '<dt>Owner</dt><dd>'+esc(ownerLabel(s))+'</dd>'
    + '<dt>Acknowledged</dt><dd>'+(s.ack?'<span class="pill p-ok">Yes</span>':'<span class="pill p-warn">No</span>')+'</dd>'
    + '<dt>Selected remedy</dt><dd>'+(r?esc(r.name)+" — "+money(r.amount):"<span class=\"muted\">None selected</span>")+'</dd>'
    + '<dt>Authority needed</dt><dd>'+(r?esc(LEVELS[r.level]):"—")+'</dd>'
    + '<dt>Approval state</dt><dd><span class="pill '+ap.cls+'">'+esc(ap.label)+'</span></dd>'
    + '</dl>';

  $("v4Trail").innerHTML = LOG.filter(function(l){ return l.c===c.id; }).slice(0,12).map(function(l){
    return '<li><div class="lt">'+esc(l.t)+" · "+esc(l.who)+'</div>'+esc(l.text)+'</li>';
  }).join("") || '<li class="muted small">No decisions recorded on this case in this session.</li>';
}
</script>
<script>
"use strict";

/* ---------------- view 5 : customer message ---------------- */
var CHANNELS = [
  {id:"sms",     label:"Text message"},
  {id:"message", label:"In-app message"},
  {id:"email",   label:"Email"},
  {id:"phone",   label:"Phone call script"},
  {id:"store",   label:"In-store, spoken"}
];
var CHANNEL_NOTE = {
  sms:"Keep it short. Long text messages fragment and the customer may read only the first part.",
  message:"Written and re-readable — suits customers who asked for instructions they can go back to.",
  email:"Full detail is appropriate here. Lead with the answer, not the apology.",
  phone:"Read as a script, not verbatim. Pause after the confirmed facts so the customer can respond.",
  store:"Spoken at the desk. Confirm the outcome in the customer's preferred channel afterwards."
};
var TONE_OPEN = {
  plain:  {greet:"Hello ", lead:"Here is where things stand.", sorry:""},
  warm:   {greet:"Hi ", lead:"I am sorry about this, and I want to be straight with you about where things stand.", sorry:"I know this has been frustrating. "},
  formal: {greet:"Dear ", lead:"Thank you for contacting Contoso Retail. The position on your case is set out below.", sorry:""}
};

function buildMessage(c, s){
  var t = TONE_OPEN[s.tone];
  var r = remedyOf(c,s);
  var name = c.customer.name.split(" ")[0];
  var L = [];
  var short = (s.channel==="sms");

  if(s.channel==="email"){ L.push("Subject: " + c.message.opening + " (case " + c.id + ")"); L.push(""); }
  if(s.channel==="phone" || s.channel==="store"){ L.push("[Spoken — confirm you are speaking to " + c.customer.name + " before continuing]"); L.push(""); }

  L.push(t.greet + (s.tone==="formal" ? c.customer.name : name) + ",");
  L.push("");
  L.push(t.lead);
  L.push("");

  L.push("WHAT I CAN CONFIRM");
  c.message.confirmed.forEach(function(x){ L.push("• " + x); });
  L.push("");

  L.push("WHAT IS AN ESTIMATE, NOT A PROMISE");
  c.message.estimates.forEach(function(x){ L.push("• " + x); });
  L.push("");

  L.push("WHAT I DO NOT KNOW YET");
  c.message.unknowns.forEach(function(x){ L.push("• " + x); });
  L.push("");

  L.push("WHAT I AM DOING");
  if(r && s.decision==="approved"){
    L.push("• " + r.name + (r.amount>0 ? " — " + money(r.amount) : "") + ".");
    L.push("• " + r.consequence);
  } else if(r && s.decision==="escalated"){
    L.push("• I have selected " + r.name.toLowerCase() + " and escalated it to a " + s.escalatedTo.toLowerCase() + " for approval.");
    L.push("• I will come back to you with the outcome — I am not going to tell you it is done before it is.");
  } else if(r){
    L.push("• I am proposing " + r.name.toLowerCase() + (r.amount>0 ? " (" + money(r.amount) + ")" : "") + ", which is not yet approved.");
    L.push("• [Draft blocked from release until the remedy is decided.]");
  } else {
    L.push("• [No remedy has been selected yet. Choose one on the remedy and approval view before releasing this message.]");
  }
  L.push("");

  L.push("WHO OWNS THIS AND WHAT HAPPENS NEXT");
  L.push("• Your named contact is " + (s.owner ? s.owner.split(" · ")[0] : "[unassigned — assign an owner before sending]") + ".");
  L.push("• Next step: " + c.tracking.next + ".");
  L.push("• I will update you by " + (CHANNELS.filter(function(x){return x.id===s.channel;})[0]||{label:"your preferred channel"}).label.toLowerCase() + ", which is the channel you asked for.");
  L.push("");
  L.push("Case reference " + c.id + " · order " + c.order + ".");

  var out = L.join("\n");
  if(short){
    out = out.replace(/\n\n+/g, "\n");
  }
  if(s.plainLang){
    out = out.replace(/WHAT I CAN CONFIRM/, "WHAT WE KNOW FOR SURE")
             .replace(/WHAT IS AN ESTIMATE, NOT A PROMISE/, "WHAT WE THINK, BUT CANNOT PROMISE")
             .replace(/WHAT I DO NOT KNOW YET/, "WHAT WE DO NOT KNOW YET")
             .replace(/WHAT I AM DOING/, "WHAT WE ARE DOING")
             .replace(/WHO OWNS THIS AND WHAT HAPPENS NEXT/, "WHO IS LOOKING AFTER THIS");
  }
  return out;
}

function renderMessage(){
  var c = cur(), s = st();
  $("v5ChannelChip").textContent = c.id + " · sending as " + (CHANNELS.filter(function(x){return x.id===s.channel;})[0]||{label:""}).label;

  $("channelSeg").innerHTML = CHANNELS.map(function(ch){
    return '<button data-ch="'+ch.id+'" aria-pressed="'+(s.channel===ch.id?"true":"false")+'">'+esc(ch.label)+(ch.id===c.message.channelPref?" ★":"")+'</button>';
  }).join("");
  Array.prototype.forEach.call($("channelSeg").querySelectorAll("[data-ch]"), function(b){
    b.addEventListener("click", function(){
      s.channel = b.getAttribute("data-ch"); s.msgText = null;
      if(s.channel !== c.message.channelPref){ log(c.id, "Channel changed to " + b.textContent.replace(" ★","") + " — this is not the customer's stated preference (" + c.customer.prefLabel + ")."); }
      renderMessage();
    });
  });
  $("channelNote").textContent = (s.channel===c.message.channelPref ? "★ This is the customer's stated preference. " : "⚠ Not the customer's stated preference (" + c.customer.prefLabel + "). ") + CHANNEL_NOTE[s.channel];

  Array.prototype.forEach.call($("toneSeg").querySelectorAll("[data-tone]"), function(b){
    b.setAttribute("aria-pressed", s.tone===b.getAttribute("data-tone") ? "true":"false");
  });

  var text = s.msgText !== null ? s.msgText : buildMessage(c,s);
  $("msgPreview").textContent = text;
  $("msgPreview").classList.toggle("lg", s.largePrint);
  $("msgEditor").value = text;

  $("v5Access").innerHTML =
    '<ul class="tight">'+c.customer.access.map(function(a){return "<li>"+esc(a)+"</li>";}).join("")+'</ul>'
    + '<div class="hr"></div>'
    + '<label class="chk"><input type="checkbox" id="cbLarge"'+(s.largePrint?" checked":"")+'><span>Show and send in large print</span></label>'
    + '<label class="chk"><input type="checkbox" id="cbPlain"'+(s.plainLang?" checked":"")+'><span>Use plain-language headings</span></label>'
    + '<div class="small muted" style="margin-block-start:6px">Communication support travels with the case. It is preserved on transfer, escalation and follow-up, and must not be dropped when a case changes owner.</div>';
  $("cbLarge").addEventListener("change", function(){ s.largePrint = this.checked; renderMessage(); });
  $("cbPlain").addEventListener("change", function(){ s.plainLang = this.checked; s.msgText = null; renderMessage(); });

  var approved = s.decision==="approved";
  var guards = [];
  guards.push({ok:true, t:"Confirmed facts, estimates and unknowns are labelled separately", d:"Required by RAI-2.1 wherever fulfilment status is stale or conflicting."});
  guards.push({ok:true, t:"No unconfirmed delivery or refund time is stated as a promise", d:"Timing is given as a working-day range or a checkpoint the owner controls."});
  guards.push({ok:!!s.owner, t:"A named owner is stated in the message", d:s.owner ? "Owner: " + s.owner : "No owner assigned — accept the case on the queue first."});
  guards.push({ok:approved, t:"The remedy is decided before the message is released", d:approved ? "Approved by " + s.decidedBy : "The draft can be prepared and reviewed, but not released, until the remedy is decided."});
  guards.push({ok:s.channel===c.message.channelPref, t:"Sent in the customer's stated channel", d:s.channel===c.message.channelPref ? c.customer.prefLabel : "Currently set to a channel the customer did not ask for."});
  guards.push({ok:true, t:"Advisor review before use", d:"This is a draft. The advisor is accountable for its accuracy, tone and policy fit — nothing is sent automatically."});
  $("v5Guard").innerHTML = guards.map(function(g){
    return '<div class="callout '+(g.ok?"ok":"warn")+'"><b>'+(g.ok?"✓ ":"! ")+esc(g.t)+'</b><div class="small">'+esc(g.d)+'</div></div>';
  }).join("");

  var stateLabel = s.msgState==="released" ? '<span class="pill p-ok">Released to the customer</span>'
    : s.msgState==="review" ? '<span class="pill p-warn">With a colleague for review</span>'
    : '<span class="pill p-mute">Draft — not sent</span>';
  $("v5Actions").innerHTML = stateLabel
    + '<button class="btn" id="btnReview"'+(s.msgState==="draft"?"":" disabled")+'>Send for review</button>'
    + '<button class="btn primary" id="btnRelease"'+(approved && s.owner && ME.decide && s.msgState!=="released" ? "":" disabled")+'>Release to customer</button>'
    + '<button class="btn" id="btnReset">Regenerate draft</button>'
    + '<span class="small muted spacer">'+(approved?"":"Release is blocked until the remedy is decided.")+'</span>';
  $("btnReview").addEventListener("click", function(){ s.msgState="review"; log(c.id,"Draft customer message sent for colleague review by "+ME.name+"."); renderMessage(); });
  $("btnRelease").addEventListener("click", function(){
    s.msgState="released";
    log(c.id,"Customer message released by "+ME.name+" via "+(CHANNELS.filter(function(x){return x.id===s.channel;})[0].label)+". Advisor accepted accountability for accuracy, tone and policy fit.");
    renderMessage();
  });
  $("btnReset").addEventListener("click", function(){ s.msgText=null; $("msgEditor").style.display="none"; $("msgPreview").style.display="block"; $("btnEditMsg").textContent="Edit draft"; renderMessage(); });
}

/* ---------------- view 6 : tracking ---------------- */
function renderTracking(){
  $("trackBody").innerHTML = CASES.map(function(c){
    var s = ST[c.id], tr = c.tracking;
    var cls = tr.state==="risk" ? "p-risk" : tr.state==="warn" ? "p-warn" : "p-ok";
    var lbl = tr.stateLabel;
    if(s.decision==="approved"){ cls="p-ok"; lbl="Remedy approved — in delivery"; }
    else if(s.decision==="escalated"){ cls="p-warn"; lbl="Escalated to " + s.escalatedTo; }
    return '<tr'+(c.id===CUR?' class="sel"':'')+'>'
      + '<td><strong>'+esc(c.id)+'</strong><div class="small muted">'+esc(c.issue)+'</div></td>'
      + '<td>'+esc(tr.promised)+'</td>'
      + '<td>'+esc(tr.next)+'</td>'
      + '<td>'+esc(ownerLabel(s))+'</td>'
      + '<td>'+esc(tr.dependency)+'</td>'
      + '<td>'+esc(tr.response)+'</td>'
      + '<td>'+esc(tr.reopened)+'</td>'
      + '<td><span class="pill '+cls+'">'+esc(lbl)+'</span></td></tr>';
  }).join("");

  $("measures").innerHTML = MEASURES.map(function(m){
    return '<div class="metric"><div class="mlab">'+esc(m.lab)+'</div><div class="mval">'+esc(m.val)+'</div>'
      + '<div class="mdir">'+esc(m.dir)+'</div><div class="bar"><span style="inline-size:'+m.pct+'%"></span></div>'
      + '<div class="small muted" style="margin-block-start:6px">'+esc(m.note)+'</div></div>';
  }).join("");
}

function renderLog(){
  $("activityLog").innerHTML = LOG.length ? LOG.map(function(l){
    return '<li><div class="lt">'+esc(l.t)+" · "+esc(l.c)+" · "+esc(l.who)+'</div>'+esc(l.text)+'</li>';
  }).join("") : '<li class="muted small">Nothing recorded yet. Accept a case, acknowledge the guidance, choose a remedy or release a message and it appears here.</li>';
}

/* ---------------- one-time bindings ---------------- */
function bindOnce(){
  $("ackBox").addEventListener("change", function(){
    var s = st();
    s.ack = this.checked;
    log(CUR, s.ack ? "Policy guidance acknowledged by " + ME.name + " — facts verified against the source systems."
                   : "Policy acknowledgment withdrawn by " + ME.name + ".");
    renderAll();
  });
  $("rationale").addEventListener("input", function(){ st().rationale = this.value; });
  $("rationale").addEventListener("change", function(){ renderRemedy(); });
  $("btnMissing").addEventListener("click", function(){
    var c = cur(), s = st(), n = 0;
    for(var k in s.checks){ if(s.checks[k]) n++; }
    s.missingSent = true;
    log(c.id, "Information request for " + n + " item(s) sent to the customer via " + c.customer.prefLabel + " — asked once, in a single message.");
    renderCaseView();
  });
  Array.prototype.forEach.call($("toneSeg").querySelectorAll("[data-tone]"), function(b){
    b.addEventListener("click", function(){ var s = st(); s.tone = b.getAttribute("data-tone"); s.msgText = null; renderMessage(); });
  });
  $("btnEditMsg").addEventListener("click", function(){
    var editing = $("msgEditor").style.display !== "none";
    if(editing){
      st().msgText = $("msgEditor").value;
      $("msgEditor").style.display = "none"; $("msgPreview").style.display = "block";
      this.textContent = "Edit draft";
      log(CUR, "Draft customer message edited by " + ME.name + " before release.");
      renderMessage();
    } else {
      $("msgEditor").style.display = "block"; $("msgPreview").style.display = "none";
      this.textContent = "Save edits";
    }
  });
  $("btnSuggestRationale").addEventListener("click", suggestRationale);
  $("btnClearLog").addEventListener("click", function(){ LOG = []; renderLog(); });
}

/* ---------------- render all ---------------- */
function renderAll(){
  renderHeader();
  renderQueue();
  renderCaseView();
  renderPolicy();
  renderRemedy();
  renderMessage();
  renderTracking();
  renderLog();
}

buildHeader();
buildTabs();
buildQueueFilter();
bindOnce();
renderAll();
</script>
</body>
</html>


===== FILE: contoso-retail-order-exception-resolution-prototype-context.md =====
===== TYPE: .md (signature 23-20-43-6F-6E-74-6F-73) =====
===== SECTIONS DETECTED: plain text, 204 lines (cite by line number) =====
# Contoso Retail — Customer Care and Order Exception Resolution Prototype v1 Context

## Fictional exercise notice

This export contains fictional, illustrative exercise assumptions for learning only. It does not represent observed customer facts, committed benefits, or implementation promises.
Generated: 2026-09-03T13:42:38.107Z

## Customer and project context

Contoso Retail is a fictional omnichannel retailer operating stores and digital channels. Microsoft recently signed an AI implementation contract. The core project team is beginning a two-week Sprint 0 before the larger delivery team joins.

## Relevant Statement of Work summary

Purpose: validate and prepare the assigned AI-enabled retail business capability. In scope: outcome and scope alignment, workshops, rapid prototype, requirement validation, BRD, prioritized backlog, estimation assumptions, high-level delivery/release/sprint plan, governance, RAID, responsible AI, operational readiness, and SteerCo readout. Expected outputs: validated prototype and decision record, BRD, prioritized backlog with acceptance criteria, delivery plan, RAID/governance, and SteerCo presentation. Out of scope: production deployment, full-scale integration, migration, operational rollout, and final production acceptance.

## Scenario name and sponsor

Customer Care and Order Exception Resolution
Executive sponsor: Chief Customer Officer

## Business problem

Business context / problem

Customers contact Contoso Retail when orders are delayed, items are substituted, refunds are unclear, or return status is uncertain. Contact-center and store-service teams must navigate fragmented policies, incomplete context, ownership boundaries, and escalation paths while protecting customer trust.

## Business objective

Clear business objective

Prepare a capability that enables faster, more consistent, policy-aligned order exception resolution while improving advisor productivity, customer understanding, resolution quality, and accountable escalation.

## Personas and users

Primary personas / users

Customer: wants a clear answer and fair remedy without repeating the story. Contact-center advisor: investigates, explains options, and decides within authority. Store-service associate: resolves pickup issues using store context. Supervisor or finance reviewer: approves higher-value or uncertain remedies. Policy owner and customer-experience leader: monitor consistency, customer effort, and unresolved patterns.

## Journeys, products, channels and processes

Relevant products, channels, processes, or journeys

Delivery and pickup orders; delayed or missing items; substitutions; cancellation; refund and return status; contact center, messaging, and store service; handoff, escalation, recovery, and follow-up.

## Targeted outcomes

Targeted outcomes / objectives

- The engagement will map priority exception journeys, customer needs, ownership boundaries, and current resolution barriers.

- The capability should provide service teams with relevant case context, policy guidance, permitted actions, and next steps.

- The engagement will define resolution, escalation, approval, communication, and follow-up requirements across channels.

- The capability should help create consistent customer explanations while allowing authorized judgment for genuine exceptions.

- The engagement will validate measures for productivity, resolution quality, customer effort, policy adherence, and safe operation.

## Scope assumptions

Initial scope assumptions

- Begin with selected high-priority order exception journeys.

- Cover both contact-center and store-service use where responsibilities overlap.

- Retain approvals and discretionary remedies with authorized roles.

- Include communication, escalation, and follow-up in the prototype.

## Illustrative business facts and value metrics

AIllustrative business facts

Fictional exercise assumptions: these figures support the mock-up only. They are not observed Contoso Retail facts or promised results.

Operating fact | Illustrative baseline

Daily case volume | 1,480 order-exception contacts: about 1,050 delivery cases and 430 pickup cases across contact center and store service.

Transfers | 23% of cases transfer at least once between contact center, store, fulfillment, or finance.

Repeat contact | 18% of customers contact Contoso Retail again within seven days about the same issue.

Handling effort | Average advisor handling time is 12.6 minutes, including 3.4 minutes spent locating and interpreting policy.

Unresolved work | 140 cases are older than 48 hours on a typical day; 38 have no clearly assigned next owner.

Policy lookup | Advisors consult an average of 2.3 policy pages per case; delivery disruption and substitution rules are the most frequently disputed.

Approval thresholds | Advisors may approve remedies up to $40, supervisors up to $150, and finance reviewers decide higher-value or exceptional refunds.

Business value measures

Measure | Illustrative baseline | Desired direction

Average handling effort | 12.6 minutes | Reduce without lowering resolution quality

Transfer rate | 23% | Reduce

Repeat contact within seven days | 18% | Reduce

Cases unresolved after 48 hours | 140 daily | Reduce and clarify ownership

Policy-consistent resolution in quality review | 79% | Increase; measure to validate

## Current-state process and pain points

BCurrent process today

- Customer and advisor or store associate begin by phone, message, or store visit; the service colleague verifies identity and locates the order. Friction: customers repeat details and order context differs by channel.

- Advisor classifies the issue and asks for missing facts, photographs, pickup details, or preferred contact method. Friction: classification is inconsistent and missing information is often discovered late.

- Advisor searches policies for delivery, pickup, substitution, refund, or return-status eligibility. Friction: multiple pages can conflict or omit disruption exceptions.

- Advisor, store, or fulfillment colleague investigates the timeline, item status, payment, prior contacts, and ownership. Friction: handoffs and incomplete status create uncertainty.

- Advisor compares permitted remedies such as replacement, partial refund, full refund, collection, wait-and-monitor, or goodwill. Friction: consequences and authority limits are not visible together.

- Advisor, supervisor, or finance reviewer makes or approves the remedy and records the rationale. Friction: pending approvals leave the customer without a clear expectation.

- Advisor explains confirmed facts, unknowns, remedy, timing, and next steps in the customer's preferred channel. Friction: messages can overstate uncertain delivery or refund timing.

- Case owner monitors completion, follows up, and closes or reopens the case. Friction: ownership, promised dates, and repeat contact are not consistently tracked.

## Intended AI assistance and retained human decisions

CWhere the customer intends to use AI

Contoso Retail intends to use AI to summarize the customer's case, identify missing information, present policy-aligned options, draft a clear customer explanation, and flag uncertainty or escalation needs. Advisors verify the facts and make decisions within their authority; supervisors and finance reviewers approve higher-value or exceptional remedies. The outcome being improved is a faster, more consistent resolution that distinguishes confirmed facts from estimates and gives the customer a clear owner, remedy, and next step.

## Required prototype views, fields and interactions

DPrototype v1 must demonstrate

- Case queue — advisor or store associate: case ID, age, channel, issue, customer impact, order value, priority reason, owner, approval state, and accept/assign action.

- Consolidated case and timeline — advisor: customer preference, order/items, fulfillment events, payments, prior contacts, promises, known facts, unknowns, and missing-information request.

- Policy and eligibility guidance — advisor: applicable rule, effective date, eligibility result, evidence used, uncertainty, exception path, and acknowledgment.

- Remedy and approval — advisor, supervisor, or finance reviewer: available options, amount, authority level, customer consequence, rationale, approve, reject, revise, or escalate.

- Customer message preview — advisor: channel, tone, confirmed facts, estimates, remedy, timing, accessibility preference, edit, and send-for-review action.

- Resolution tracking — case owner and leader: promised date, next action, owner, pending dependency, customer response, reopened status, and outcome measures.

## Representative mock data

ERepresentative mock data

Case | Order and issue | Status and important values | Business issue

CARE-24081 | Order CR-784201 · late delivery | 7 hours late; $126 order; carrier status last updated 5 hours ago; customer needs delivery before 8:00 p.m. | Explain uncertainty and choose monitoring, replacement, or recovery action.

CARE-24082 | Order CR-784350 · unavailable substitution | BrightWash Unscented 2L replaced with scented version; $18; customer preference says fragrance-free | Substitution conflicts with a stated need; advisor must confirm a safe remedy.

CARE-24083 | Order CR-784411 · partial refund | MixMate Compact Blender accessory damaged; $38 refund requested; photo received; within advisor authority | Show eligibility, evidence, remedy choice, and rationale.

CARE-24084 | Order CR-784499 · missing pickup item | PureHome Paper Towels 6-pack; $16; pickup marked complete; store count uncertain | Ownership between store and contact center is unclear.

CARE-24085 | Order CR-783902 · return status question | FitStride Exercise Mat; $64; return received 6 days ago; refund pending; customer prefers text updates | Provide a clear status, expected timing, and escalation if the promise is missed.

## Business rules, exceptions and responsible-AI boundaries

FBusiness rules and exceptions to show

- Verify customer identity before exposing payment details or changing a refund destination; use an assisted path when standard verification is not accessible.

- Advisors may approve remedies up to $40, supervisors up to $150, and finance reviewers decide amounts above $150 or policy exceptions.

- Customer allergy, accessibility, safety, or essential-use concerns require explicit human review rather than a routine substitution decision.

- When fulfillment status is stale or conflicting, label confirmed facts, estimates, and unknowns separately; never promise an unconfirmed delivery or refund time.

- A draft summary or message must be reviewed by the advisor before use; the advisor remains accountable for accuracy, tone, and policy fit.

- Escalate complaints, repeated failed remedies, potential financial hardship, or cases without an owner after four working hours; preserve the customer's chosen communication support.

## Success measures

Success measures to define / validate

- Resolution time, transfer rate, repeat contact, escalation, and reopen measures.

- Policy adherence, explanation quality, decision consistency, and resolution accuracy.

- Advisor effort, confidence, adoption, and training implications.

- Customer effort, satisfaction, complaint, refund, and recovery indicators.

## Risks, dependencies and responsible-AI questions

Clarify risks, constraints, dependencies, and responsible-AI questions

- Incomplete order status, conflicting policies, refund authority, channel handoffs, fulfillment ownership, and operational peaks.

- How will uncertainty be communicated? When must an advisor verify information or escalate rather than act?

- Could language, disability, order value, customer history, or channel lead to inconsistent treatment?

- What controls protect sensitive customer information, discretionary remedies, and complaint handling?

