# Spec-Driven Development Pattern

Adapted from GitHub's Spec Kit methodology.

## Problem

AI coding agents receive vague prompts and produce code that looks correct but doesn't match intent. The issue isn't the AI's coding ability — it's the lack of unambiguous, structured instructions.

## Core Principle

**The specification is the source of truth. Code is its expression.**

Maintaining software means evolving specifications, then regenerating code.

## The 4 Operations

### Specify — Define WHAT and WHY

Rules:
- User-facing language only — no technical implementation details
- Mark all uncertainties as `[NEEDS CLARIFICATION]`
- Include testable success criteria
- Describe user journeys (happy path + edge cases)

Anti-pattern: "Build a REST API with Express" — this is HOW, not WHAT.
Better: "Users need to submit documents through a web form and see confirmation"

### Clarify — Resolve Ambiguity

Rules:
- Ask one question at a time
- Prefer multiple choice when possible
- Record Q&A in clarification.md
- Remove `[NEEDS CLARIFICATION]` markers after resolution

Anti-pattern: Asking 5 questions at once (overwhelming).
Better: "Should documents be public or private by default? (A) Public (B) Private (C) User chooses"

### Plan — Decide HOW

Rules:
- Only after spec is clarified (all markers resolved)
- Document each decision as an ADR
- Reference constitution constraints
- Create per-feature technical plans

Anti-pattern: Including architecture decisions in the spec.
Better: Spec says WHAT, plan says HOW.

### Tasks — Break Into Work

Rules:
- Each task testable in isolation
- Each task completable in 30-60 minutes
- Tasks ordered by dependency
- Each task has clear done criteria

## Quality Checks — Unit Tests for Specs

Every spec should pass these checks:

- [ ] Describes WHAT, not HOW
- [ ] Success criteria are testable/observable
- [ ] No premature technical decisions
- [ ] All ambiguities marked `[NEEDS CLARIFICATION]`
- [ ] Edge cases addressed
- [ ] Non-goals explicitly stated

## Tradeoffs

| Choice | Benefit | Cost |
|--------|---------|------|
| Spec-first | Less rework, clearer intent | Upfront time investment |
| [NEEDS CLARIFICATION] markers | Catches ambiguity early | Can feel bureaucratic |
| Quality checks | Consistent spec quality | Extra validation step |
| Constitution | Shared principles | Needs team buy-in |

## Gotchas

1. **Spec looks complete but isn't** — Missing edge cases surface during implementation. Fix: explicit edge case section in every spec.
2. **Team skips /clarify** — Unresolved ambiguity compounds. Fix: make clarification mandatory before gate.
3. **Spec drifts from code** — Code changes but spec isn't updated. Fix: spec is source of truth, update spec first.
4. **Constitution ignored** — Agent treats principles as suggestions. Fix: reference in every verification checklist.
