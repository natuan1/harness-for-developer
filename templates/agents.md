# AGENTS.md — [Project Name]

[One-sentence project purpose]

## Startup Protocol

Every session starts here. No exceptions:

1. **Confirm directory** with `pwd`
2. **Read constitution** at `docs/specs/constitution.md` — these are immutable rules
3. **Read feature state** at `docs/harness/feature-list.json`
4. **Read last session** at `docs/harness/progress.md`
5. **Run `./init.sh`** to verify environment
6. **Report to human:** current feature, blockers, recommended next action

If baseline verification fails, fix it before starting new work.

## Phase Router

Determine what the user needs:

| Request type | Route to |
|---|---|
| "I want to explore an idea" | Phase 1: `/brainstorm` |
| "I need to define requirements" | Phase 2: `/specify` |
| "Design the architecture" | Phase 3: `/plan` |
| "Let's build it" | Phase 4: `/tasks` |
| "Fix this small thing" | Quick Flow: `/specify` → `/plan` → `/tasks` |
| "Check my harness quality" | Assessment Mode (score 5 subsystems) |

## Working Rules

- **One feature at a time** — pick exactly one from feature-list.json
- **Stay in spec** — only implement what the spec says (YAGNI)
- **Verify before done** — run checklist, record evidence, then mark done
- **Spec ambiguity → ask human** — mark `[NEEDS CLARIFICATION]`, don't guess
- **Update artifacts** — feature-list.json + progress.md after each task
- **Leave clean state** — next session must be able to run `./init.sh` immediately

## Verification Checklist

Before marking any task as done:

- [ ] Tests pass: `[run command here]`
- [ ] Type-check clean: `[run command here]`
- [ ] Self-review: no dead code, no console.log, no hardcoded values
- [ ] Constitution constraints satisfied
- [ ] Feature-list.json updated
- [ ] Progress log updated

## Definition of Done

A feature is done ONLY when ALL are true:

- [ ] All stories implemented
- [ ] All verification checks pass with evidence
- [ ] Acceptance criteria from spec met
- [ ] Constitution constraints satisfied

## Session End Protocol

1. Update `docs/harness/progress.md` with current state
2. Update `docs/harness/session-handoff.md` for next session
3. Update `docs/harness/feature-list.json` with latest status
4. Commit all changes with descriptive message
5. Report summary to human

## Escalation

- **Spec unclear** → check `docs/specs/features/NNN-*/spec.md`, then ask human
- **Architecture question** → check `docs/specs/architecture.md`, then ask human
- **Constitutional violation** → flag to human before proceeding
- **Repeated test failures** → update progress, request human review
