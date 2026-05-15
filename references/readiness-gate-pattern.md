# Implementation Readiness Gate Pattern

Adapted from BMAD Method's gate-check system.

## Problem

Teams start coding before requirements are clear enough. This leads to rework, conflicting implementations, and wasted sessions — especially with AI agents that can generate large amounts of code quickly.

## Core Principle

**Catching alignment issues in solutioning is 10x faster than discovering them during implementation.**

## Gate Checklist

Every feature MUST pass this gate before implementation:

### 1. Specification Completeness

- [ ] All `[NEEDS CLARIFICATION]` markers resolved
- [ ] Success criteria are testable
- [ ] Edge cases documented
- [ ] Non-goals stated explicitly

### 2. Architecture Alignment

- [ ] Technical decisions documented as ADRs
- [ ] No conflicting patterns across features
- [ ] Integration points identified
- [ ] Data flow documented

### 3. Scope Clarity

- [ ] Feature boundaries defined
- [ ] Dependencies on other features mapped
- [ ] Stories sized for 1-session completion
- [ ] No scope overlap between stories

### 4. Constitution Compliance

- [ ] All articles addressed
- [ ] No violations identified
- [ ] Test-first approach planned

### 5. Environment Readiness

- [ ] Development environment verified (init.sh passes)
- [ ] Required tools/libraries available
- [ ] No blocking infrastructure issues

## Gate Results

### GATE:PASS

All checklist items satisfied. Proceed to implementation.

### GATE:CONCERNS

1-2 minor items not fully resolved. List concerns explicitly:
- Concern: [description]
- Risk: [what could go wrong]
- Mitigation: [how to handle if it does]

Human must explicitly approve proceeding with concerns.

### GATE:FAIL

Major gaps found. Return to appropriate phase:
- Missing specs → Phase 2 (Planning)
- Architecture gaps → Phase 3 (Solutioning)
- Environment issues → Fix first, re-run gate

## Anti-Patterns

| Anti-Pattern | Why It Fails |
|-------------|-------------|
| Rubber stamp gate | If you're not genuinely checking, skip it |
| Gate for every task | Gate is per-feature, not per-task |
| Paralysis by analysis | Gate should take 5-10 minutes, not hours |
| Skipping gate for "simple" features | Simple features still need alignment |

## Tradeoffs

| Choice | Benefit | Cost |
|--------|---------|------|
| Mandatory gate | Prevents misalignment | Adds 5-10 min before each feature |
| Per-feature (not per-task) | Right granularity | Requires feature-level thinking |
| CONCERNS path | Flexibility | Risk of rubber-stamping concerns |
| Human approval | Accountability | Bottleneck if human unavailable |

## Implementation

In AGENTS.md, add to startup protocol:

```
Before starting implementation of a feature:
1. Check feature-list.json for gate_status
2. If "pending" → run gate checklist
3. If "failed" → return to planning
4. Only proceed if "passed" or "concerns" (with approval)
```
