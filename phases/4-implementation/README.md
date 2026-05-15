# Phase 4: Implementation

This is where you spend 80% of your time. Build, verify, iterate.

## Startup Protocol

Every session MUST start here:

1. Confirm working directory with `pwd`
2. Read `docs/specs/constitution.md`
3. Read `docs/harness/feature-list.json` for current state
4. Read `docs/harness/progress.md` for last session
5. Run `./init.sh` to verify environment
6. Report: current feature, blockers, next action

## Workflows

### /tasks

Break current story into testable tasks.

**Task criteria:**
- Testable in isolation
- Completable in 30-60 minutes
- Has clear done criteria

**Artifact:** `docs/specs/features/NNN-<name>/tasks.md`

### /implement

Pick ONE task and implement it.

**Process:**
1. Select task from tasks.md
2. Write failing test (TDD) or understand acceptance criteria
3. Implement minimal code to pass
4. Run verification checklist

### /verify

**Mandatory before marking any task as done.**

Checklist:
- [ ] Tests pass (`npm test` or equivalent)
- [ ] Type-check clean (`npm run check` or equivalent)
- [ ] Self-review: no dead code, no console.log, no hardcoded values
- [ ] Constitution constraints satisfied
- [ ] Feature-list.json updated with evidence
- [ ] Progress log updated

### /progress

Update session progress log.

**Artifact:** Updated `docs/harness/progress.md`

### /handoff

End session with full context handoff.

**Artifact:** Updated `docs/harness/session-handoff.md`

## Working Rules

- **One task at a time** — never work on 2 tasks simultaneously
- **Stay in scope** — only modify files related to current task
- **Verify before declare** — no "done" without evidence
- **Update artifacts** — feature-list and progress must reflect reality
- **Spec ambiguity → ask human** — don't guess, mark `[NEEDS CLARIFICATION]`

## Definition of Done

A feature is done ONLY when:
- All stories completed
- All tasks verified with evidence
- Acceptance criteria from spec.md met
- Feature-list.json shows status "done" with evidence
- Constitution constraints satisfied

## Session End Protocol

1. Update `docs/harness/progress.md`
2. Update `docs/harness/session-handoff.md`
3. Update `docs/harness/feature-list.json`
4. Commit all changes with descriptive message
5. Report summary to human

## Anti-Patterns

- Marking done without running verification commands
- Working on multiple features in one session
- Skipping progress update because "nothing happened"
- Not committing at session end
- Implementing beyond spec scope (YAGNI violation)
