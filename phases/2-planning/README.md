# Phase 2: Planning

**Always required.** Every feature needs a spec before code.

## Workflows

### /constitution

Establish immutable project principles. Do this once per project.

**Process:**
1. Propose 5-9 articles based on project type
2. Discuss each with team
3. Finalize and commit to `docs/specs/constitution.md`

**Articles typically cover:**
- Development philosophy (spec-first, test-first)
- Scope control (one feature at a time, YAGNI)
- Quality gates (verify before declare)
- Decision documentation (ADRs)
- Human-in-the-loop points

**Artifact:** `docs/specs/constitution.md`

### /specify

Create a feature specification. WHAT + WHY only — no technical details.

**Process:**
1. Capture feature description in user-facing language
2. Define user journeys (happy path + edge cases)
3. List success criteria (testable/observable)
4. Mark uncertain areas as `[NEEDS CLARIFICATION]`
5. Auto-number feature and create directory `docs/specs/features/NNN-<name>/`

**Quality checks (unit tests for specs):**
- [ ] Describes WHAT user needs, not HOW to build it
- [ ] Success criteria are testable
- [ ] No premature technical decisions
- [ ] Ambiguities marked `[NEEDS CLARIFICATION]`

**Artifact:** `docs/specs/features/NNN-<name>/spec.md`

### /clarify

Resolve `[NEEDS CLARIFICATION]` items through structured Q&A.

**Process:**
1. List all `[NEEDS CLARIFICATION]` markers
2. For each: ask a specific, multiple-choice question when possible
3. Record the answer in clarification.md
4. Update spec.md to remove the marker

**Artifact:** `docs/specs/features/NNN-<name>/clarification.md`

## Aggregate: PRD

After specifying multiple features, aggregate into a PRD:

**Artifact:** `docs/specs/prd.md`

## Exit Criteria

- [ ] Constitution established and committed
- [ ] All features have spec.md files
- [ ] All `[NEEDS CLARIFICATION]` resolved
- [ ] Human has approved all specs
- [ ] PRD is coherent (no contradictions between features)

## Anti-Patterns

- Including technical decisions in specs (that's Phase 3)
- Skipping `/clarify` — unresolved ambiguity compounds downstream
- Creating specs for more than 3 features at once (overwhelms context)
