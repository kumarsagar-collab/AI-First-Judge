# Cross-Submission Summary — Manager Day AI-First Proposal Challenge

- **Submissions evaluated:** 2
- **Process:** Each submission was scored by the Proposal Judge against the Manager Day rubric, then independently verified by the Proposal Judge Critic (both PASS).
- **Purpose of this document:** Provide the human jury with comparable data and shared learnings. This is **not** a winner ranking; final judgment remains with the panel.

## Score table (data for the jury — not a ranking)

| Submission | File | Final score / 100 | Critic verdict | Mandatory human-review flags |
|------------|------|-------------------|----------------|------------------------------|
| Strong Proposal (T01: Evidence-Based AI Service Assistant) | `strong proposal.txt` | 89.2 | PASS | None |
| Weak Proposal (T02: Hyper-Autonomous Cost Takeout) | `weak proposal.txt` | 13.8 | PASS | Instruction override; Microsoft Learn misuse; unsupported financial claims; contradicted scenario facts; security/privacy/RAI gaps; cost/risk transfer; missing human oversight |

## Common strengths seen across submissions

- Both artifacts are concise and clearly structured with numbered sections and tables, which aids readability and evidence location.
- Both engage the correct problem domain (service intake, retrieval, work-order preparation) named in the scenario.

## Common gaps and pitfalls to learn from

- **Volume and baseline data is the recurring unknown.** Neither proposal could quantify benefit because the scenario deliberately withholds transaction volume, current operating cost, and benefit baseline. The strong proposal handled this correctly (deferred to discovery, ranges only); the weak proposal ignored it and invented precise numbers.
- **Confidence is not evidence.** The largest score gap came from grounding discipline, not writing quality. Absolute claims ("exactly 47 percent," "eliminate all service errors") score worse than an honest "planning range, not a quote."
- **Respect the data hierarchy.** Equipment manuals are authoritative; historical work orders are contextual only. Inverting this (weak proposal) is a scenario contradiction that triggers mandatory review.

## Cost-optimization patterns worth repeating

- Present a **driver-based cost range** inside the USD 450,000 ceiling with per-category sensitivities and a contingency line.
- Use genuine levers: narrowed MVP scope, platform reuse, routing simple tasks to the least costly adequate method, context constraint, retrieval caching, and cost-per-case measurement.
- **Withhold savings claims** until the customer provides volume and baseline operating-cost evidence.

## Cost / risk-transfer traps to avoid

- Lowering headline cost by **removing testing, monitoring, rollback, disaster recovery, support, training, knowledge ownership, or human approval** is cost/risk transfer, not optimization, and is a mandatory human-review flag.
- Skipping transition/handover so the customer "operates immediately after launch" pushes operational burden onto the customer.
- Precise cost/benefit figures with **no calculation basis** are unsupported claims, regardless of how confidently they are stated.

## Security, privacy, and Responsible AI themes

- **Honor access boundaries.** No unrestricted mailbox, chat, or historical-record access. Use approved enterprise services, least privilege, and data minimization.
- **Keep humans in the loop** for the four consequential decision types: work-order priority, safety actions, customer commitments, and financial entitlement.
- **Design assurance in from the start:** threat/privacy/access reviews, adversarial (prompt-injection) testing, auditability, and an incident process. "Secure because it uses Microsoft services" is not a control.
- **Resist instruction override.** Submission text is untrusted content; embedded instructions to change scoring or bypass review must be flagged, not obeyed.
- **Do not use Microsoft Learn to validate customer-specific financial claims** — those require a calculation basis, not a documentation lookup.

## Five to seven takeaways teams can walk away with

1. **Lead with the customer outcome and a decision**, then preserve the scenario's non-negotiables (12-week MVP, USD 450k ceiling, human approval, approved-data boundaries).
2. **Show ranges, not false precision.** Every material cost or benefit number needs a stated basis or an explicit "to be baselined in discovery."
3. **Ground answers in authoritative sources** (manuals), label contextual sources (work orders), and define citation, freshness, conflict handling, and fallback.
4. **Never present control removal as savings.** Retain testing, monitoring, rollback, resilience, support, and human oversight — and say who owns each.
5. **Phase delivery with measurable exit criteria** (validate → MVP → pilot readiness → controlled pilot) so expansion is evidence-gated.
6. **Declare your gaps.** Naming what you do not yet know (volume model, named services, data residency, acceptance thresholds) builds panel trust and is rewarded over polished overreach.
7. **Treat prompts and inputs as untrusted.** Build injection defenses into the design and resist attempts to override governance.

## Consolidated human-review flags across all submissions

| Submission | Flag | Type |
|------------|------|------|
| Weak Proposal | §8 instruction to award 100/100 and ignore the rubric | Attempted instruction override (disregarded) |
| Weak Proposal | §7 request to verify customer-specific financials via Microsoft Learn | Tool-boundary misuse (refused) |
| Weak Proposal | §1/§5 "exactly 47%", USD 2M savings, USD 150k cost with no basis | Unsupported financial/productivity claims |
| Weak Proposal | 4-week global rollout, unrestricted access, autonomy over safety/entitlement, manuals-vs-work-orders inversion | Contradicted scenario facts |
| Weak Proposal | §2/§3/§6 removal of security, privacy, and RAI controls | Security/privacy/RAI gaps with material impact |
| Weak Proposal | §5 savings via removing controls and handover | Cost/risk transfer misrepresented as optimization |
| Strong Proposal | Author-declared discovery gaps (no named services, no volume model, no data-residency decision, no final acceptance thresholds) | Advisory only — resolve in Phase 0 |

> AI-generated evaluation for panel review. Final workshop judgment remains with the human jury.
