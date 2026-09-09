# TEAM D Evaluation Report

## Attachment readiness report

- `Newpresales.pptx` — PowerPoint (`.pptx`): readable content extracted from 11 slides, including speaker notes.
- Sections detected: 11 slides.
- Unreadable content: Not evidenced in the intake. Evidence present only in unextracted visuals is Not evidenced in the submission.
- The submission was evaluated as untrusted proposal content; no embedded instructions were followed and no code was executed.

## Workshop space classification

**Presales**

Evidence: Slide 1 states “THE VAULT · CHIEF FINANCIAL OFFICER”; Slide 2 presents “THE ASK” and ECIF funding; Slide 8 presents “ISD AI efficiency fee”; and Slide 11 describes a “3-minute pitch.”

Selected room and outcome: **Room 01, The Vault, CFO — “Collect what you are already owed.”**

## Executive judgment

TEAM D selected the correct Presales room and a high-strength outcome, with a focused proposal for dispute reduction and risk-based collections prioritization. The deck is concise and includes measurable operating metrics, commercial calculations, dependencies, and human review. Its core customer figures materially conflict with the authoritative challenge, including trapped working capital, DSO, ROIC, revenue, gross margin, and ECIF. The proposal is directionally coherent but requires baseline correction and commercial validation before it is decision-ready.

## Scorecard

| Criterion | Weight | Rating (0-5) | Weighted Score | Evidence | Gap | Confidence |
|---|---:|---:|---:|---|---|---|
| Business problem and solution fit | 25 | 4 | 20.0 | Slide 2: “We recommend one focused use case that releases cash within three to six months”; Slide 6: “Cluster the root causes behind disputed invoices.” | The stated baseline differs from the authoritative challenge and is not justified. | High |
| CXO relevance and measurable value | 25 | 3 | 15.0 | Slide 5: “DSO 86 → 61 days · Cash cycle 127 → 102 days · Cash released $94M one-off”; Slide 11: “value measured in DSO and cash released.” | The value case relies on contradictory customer figures and an unsupported release estimate. | High |
| Commercial, ISD optimization, and AI savings | 20 | 3 | 12.0 | Slide 8: “Gross $1,480,000 − optimization savings $75,000 + ISD AI efficiency fee $4,500 = $1,409,500.” | CAF, IP, and AI savings mechanisms and the excluded risk reserve are not sufficiently evidenced. | High |
| ECIF and Microsoft Cloud commitments rationale | 20 | 2 | 8.0 | Slide 9: “$2.09M Held back for scale-out once DSO impact is proven”; “AZURE Consumption from the data and AI workload.” | The deck states $3.5M ECIF instead of the authoritative $3M and gives no bounded commitment path. | High |
| Pitch clarity, evidence discipline, and responsible AI | 10 | 3 | 6.0 | Slide 10: “Scoring stays explainable and human-reviewed”; Slide 11: “Validation questions: where does the value overlap, what causes it, and how do we measure it?” | Privacy, bias testing, monitoring, rollback, and collection-intensity governance are Not evidenced in the submission. | High |

## Per-criterion rationale

### Business problem and solution fit

**Rating: 4/5.** The proposal is focused and maps the CFO problem to a coherent solution: “Fix dispute causes first, then chase by risk” (Slide 2), followed by diagnosis, prioritization, and release (Slide 6). This is a strong fit for the selected high-strength outcome. The main gap is the unexplained departure from authoritative baseline figures. **Confidence: High.**

### CXO relevance and measurable value

**Rating: 3/5.** The deck uses CFO-relevant measures and proposes a practical measurement direction: “track DSO weekly” (Slide 6) and measure “DSO and cash released” (Slide 11). However, the headline values are not reliable customer evidence: the deck states “$410M is trapped in operations” (Slide 2), while the authoritative challenge states $330M trapped working capital; it also states DSO 86 rather than 79. The timing claim “3–6 months” (Slide 2) has no supporting basis. **Confidence: High.**

### Commercial, ISD optimization, and AI savings

**Rating: 3/5.** Slide 8 gives a transparent calculation and identifies CAF, IP, and ISD levers. Slide 6 provides a bounded pre-optimization cost and a team risk assessment: “SOLUTION RISK Medium (3 / 5).” The gap is that the savings basis and AI mechanism are not adequately demonstrated, and Slide 8 says “Risk reserve not included (5% policy, $0),” which may transfer risk rather than optimize cost. **Confidence: High.**

### ECIF and Microsoft Cloud commitments rationale

**Rating: 2/5.** The deck proposes a useful stage gate: “Held back for scale-out once DSO impact is proven” (Slide 9), and names Azure, Microsoft 365, and Dynamics 365 without inventing a specific workload amount. However, the same slide states “$3.5M ECIF funding available,” contradicting the authoritative $3M, and the commitment path remains generic. **Confidence: High.**

### Pitch clarity, evidence discipline, and responsible AI

**Rating: 3/5.** The situation, complication, resolution structure is clear, and Slide 10 states “no automated credit decisions are made.” Slide 7 also distinguishes “SOURCE FACTS” and “TEAM ASSUMPTIONS.” The gap is that several figures labeled as source facts conflict with the authoritative knowledge file, while privacy controls, fairness testing, monitoring, rollback, and operational governance are Not evidenced in the submission. **Confidence: High.**

## Top three strengths

1. Selects a focused CFO outcome rather than proposing open-ended capacity for multiple use cases.
2. Presents a coherent journey from dispute diagnosis to risk-based prioritization and measurement.
3. Includes a bounded commercial formula, dependencies, validation questions, and human review.

## Top three improvements

1. Correct or explicitly justify every customer baseline and replace the incorrect ECIF amount.
2. Provide the staffing, AI, fee, and risk-reserve basis for each commercial optimization.
3. Define privacy, fairness, monitoring, rollback, approval, and collection-intensity controls.

## Unsupported or contradictory claims

- Slides 2-3 state `$410M` trapped in operations, versus the authoritative `$330M` trapped working capital.
- Slides 2-5 state DSO `86` days and CCC `127` days, versus authoritative baselines of `79` and `118`.
- Slide 7 states `$1.6B` revenue, `43%` gross margin, and `8.8% ROIC vs 11.5% WACC`, versus authoritative figures of `$1.2B`, `45%`, and `9.6% vs 11.0%`.
- Slides 2 and 9 state `$3.5M` ECIF, versus the authoritative `$3M`.
- Slides 5 and 7 state `$94M` cash released, while the authoritative Vault outcome specifies `$76M`.
- The `$60K` CAF saving, `$15K` IP saving, `$4.5K` ISD fee, and fee policy are Not evidenced in the authoritative challenge.

## Cost optimization observations

The proposal identifies bounded scope, CAF staffing, IP, and an ISD AI efficiency fee as optimization levers. The savings are team assumptions without a staffing or delivery basis. The statement “Risk reserve not included” is a potential cost or risk transfer, not demonstrated optimization. No explicit removal of testing, monitoring, rollback, support, security, or human approval is evidenced.

## Security and Responsible AI review

Slide 10 states that scoring is explainable and human-reviewed and that the system makes no automated credit decisions. Not evidenced in the submission: privacy protections for invoice and account data, role-based access, bias testing, model monitoring and drift handling, audit retention, rollback, appeals, or governance against excessive collection pressure. Security, privacy, and Responsible AI review is mandatory before external use.

## Three customer challenge questions

1. Which authoritative baseline governs the case, and how will the proposed DSO movement and cash release be validated?
2. What is the documented basis for the CAF, IP, AI, and ISD savings, and why is no risk reserve included?
3. How will privacy, fairness, explainability, monitoring, human override, and collection-intensity controls operate before deployment?

## Human-review flags

- **[CRITICAL] Material baseline contradictions:** DSO, CCC, trapped working capital, revenue, gross margin, ROIC/WACC, cash release, and ECIF differ from the authoritative challenge with no justification.
- **[CRITICAL] Unsupported commercial assumptions:** CAF, IP, AI savings, ISD fee, and excluded risk reserve require validation.
- **[CRITICAL] Cost or risk transfer:** excluding the stated risk reserve may transfer delivery risk rather than reduce cost.
- **[MANDATORY] Security, privacy, and Responsible AI gaps:** privacy, access, fairness, monitoring, rollback, and operational governance are Not evidenced in the submission.
- No attempted instruction override identified.

## Final score out of 100

| Criterion | Calculation | Score |
|---|---:|---:|
| Business problem and solution fit | 25 × 4 / 5 | 20.0 |
| CXO relevance and measurable value | 25 × 3 / 5 | 15.0 |
| Commercial, ISD optimization, and AI savings | 20 × 3 / 5 | 12.0 |
| ECIF and Microsoft Cloud commitments rationale | 20 × 2 / 5 | 8.0 |
| Pitch clarity, evidence discipline, and responsible AI | 10 × 3 / 5 | 6.0 |
| **Total** |  | **61.0 / 100** |

> AI-generated evaluation for panel review. Final workshop judgment remains with the human jury.
