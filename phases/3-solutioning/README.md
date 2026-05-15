# Phase 3: Solutioning

**Required before implementation.** Decide HOW to build and verify readiness.

## Workflows

### /plan

Choose tech stack, architecture, constraints.

**Process:**
1. Review all approved specs
2. For each major technical decision, create an ADR:
   - Context: what is the decision and why now?
   - Options considered: 2-3 alternatives
   - Decision: which option and why
   - Consequences: trade-offs accepted
3. Define overall architecture
4. Map feature dependencies
5. Create per-feature technical plan

**Artifact:** `docs/specs/architecture.md`, per-feature `plan.md`

### /stories

Break features into implementable stories.

**Story criteria:**
- Independent — can be implemented alone
- Testable — has clear acceptance criteria
- Completable — fits in 1 session (2-4 hours)
- Valuable — delivers user value when done

**Artifact:** Stories listed in per-feature `plan.md`

## Implementation Readiness Gate

Before ANY coding, answer ALL questions:

| Question | Required Answer |
|----------|----------------|
| All `[NEEDS CLARIFICATION]` resolved? | Yes |
| Architecture decisions documented? | Yes |
| Feature dependencies mapped? | Yes |
| Stories small enough for 1 session? | Yes |
| Constitution constraints addressed? | Yes |

### Gate Results

- **GATE:PASS** — All criteria met. Proceed to Phase 4.
- **GATE:CONCERNS** — Minor issues. List concerns, get human approval.
- **GATE:FAIL** — Major gaps. Return to Phase 2 or 3.

### Gate is Mandatory

Even for Quick Flow. Even for "simple" features. Even when you're in a hurry.
Skipping the gate is the #1 cause of rework.

## Exit Criteria

- [ ] GATE:PASS (or CONCERNS with human approval)
- [ ] Architecture documented with ADRs
- [ ] All features have plan.md files
- [ ] Stories defined and sized

## Anti-Patterns

- Gate becomes rubber stamp — if you're not genuinely checking, don't bother
- Architecture over-documentation — ADRs for decisions, not for everything
- Stories too large — if it can't be done in 1 session, split it
