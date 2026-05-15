---
name: hybrid-harness
description: >-
  Hybrid harness engineering for AI coding agents — spec-driven development,
  phased lifecycle, operational harness patterns. Combines Speckit workflow,
  BMAD phases, and harness-creator operational patterns.
when_to_use: >-
  Use whenever: building harness from scratch, creating spec-driven workflows,
  designing phased development, improving agent reliability, agent forgets
  between sessions, agent overreach or scope creep, multi-session continuity
  needed, verification gaps, audit harness quality, create AGENTS.md/CLAUDE.md,
  constitution design, implementation readiness assessment, feature tracking.
license: MIT
---

# Hybrid Harness

Spec-driven, phased harness engineering for AI coding agents.

**For:** Engineers building reliable AI coding environments — especially small teams building large software who need discipline without bureaucracy.

**Not for:** Prompt engineering, model selection, generic software architecture, one-off agent tasks.

Combines three proven approaches:

| Source | What This Provides |
|--------|-------------------|
| **harness-creator** | Operational patterns: memory, verification, scope control, session continuity |
| **Speckit** | Spec-driven workflow: specify → clarify → plan → tasks, constitution |
| **BMAD** | Phased lifecycle: analysis → planning → solutioning → implementation, readiness gates |

---

## Phase Router — Where Do You Start?

When a user asks for help, determine the correct phase:

| If the user wants to... | Start at |
|------------------------|----------|
| Explore a new idea or validate assumptions | **Phase 1: Analysis** |
| Define requirements or create a spec | **Phase 2: Planning** |
| Design architecture or break into stories | **Phase 3: Solutioning** |
| Implement code or fix a bug | **Phase 4: Implementation** |
| Do a small, well-understood task | **Quick Flow** (skip to Phase 4) |
| Create a harness from scratch | Start at **Phase 2** (skip Analysis) |
| Assess an existing harness | **Assessment Mode** (below) |

### Quick Flow (for small tasks)

For well-understood tasks that don't need full phase traversal:

```
/specify <description> → /plan → /tasks → implement → verify
```

### Assessment Mode

When asked to assess an existing harness, score each subsystem 1-5:

1. **Instructions** — Does the agent know what to do?
2. **State** — Is progress tracked and recoverable?
3. **Verification** — Must the agent prove work before claiming done?
4. **Scope** — Is the agent constrained to one task?
5. **Lifecycle** — Is session startup/handoff automated?

Then identify the bottleneck (lowest score) and give 2-3 concrete improvements.

---

## The 4-Phase Workflow

### Phase 1: Analysis (Optional)

**When:** New project, unclear requirements, complex features, need brainstorming.

**Slash commands:**
- `/brainstorm` — Facilitate creative ideation session → `brainstorming-report.md`
- `/research` — Validate assumptions (market/domain/technical) → research findings
- `/brief` — Capture product vision in 1-2 pages → `product-brief.md`

**Artifact:** `docs/specs/product-brief.md`

**Exit criteria:** Human approves the product brief, or decides to skip to Phase 2.

---

### Phase 2: Planning

**When:** Always. Every feature needs a spec before code.

**Slash commands:**
- `/constitution` — Establish 5-9 immutable project principles → `docs/specs/constitution.md`
- `/specify <description>` — Create feature spec (WHAT + WHY, no tech details)
  - Auto-number features (001, 002, ...)
  - Create `docs/specs/features/NNN-<name>/spec.md`
  - Mark uncertain areas as `[NEEDS CLARIFICATION]`
- `/clarify` — Resolve `[NEEDS CLARIFICATION]` items through structured Q&A
  - Create `docs/specs/features/NNN-<name>/clarification.md`

**Artifacts:** `docs/specs/constitution.md`, `docs/specs/prd.md`, per-feature `spec.md`

**Exit criteria:** All `[NEEDS CLARIFICATION]` resolved. Human approves specs.

**Quality checks (unit tests for specs):**
- [ ] Spec describes WHAT user needs, not HOW to build it
- [ ] Success criteria are testable/observable
- [ ] No premature technical decisions
- [ ] All ambiguities marked `[NEEDS CLARIFICATION]`

---

### Phase 3: Solutioning

**When:** Before any implementation. Every time.

**Slash commands:**
- `/plan` — Choose tech stack, architecture, constraints → `docs/specs/architecture.md`
  - Include Architecture Decision Records (ADRs) for key choices
  - Create per-feature `docs/specs/features/NNN-<name>/plan.md`
- `/stories` — Break features into implementable stories
  - Each story: independent, testable, completable in 1 session

**Implementation Readiness Gate** — Answer ALL before coding:

| Question | Must Be |
|----------|---------|
| All `[NEEDS CLARIFICATION]` resolved? | Yes |
| Architecture decisions documented? | Yes |
| Feature dependencies mapped? | Yes |
| Stories small enough for 1 session? | Yes |
| Constitution constraints addressed? | Yes |

**Result:** `GATE:PASS` / `GATE:CONCERNS` / `GATE:FAIL`
- PASS → proceed to Phase 4
- CONCERNS → list concerns, get human approval to proceed
- FAIL → return to Phase 2 or 3, fix gaps

**Artifacts:** `docs/specs/architecture.md`, per-feature `plan.md`

**Exit criteria:** GATE:PASS (or CONCERNS with human approval).

---

### Phase 4: Implementation

**When:** Gate passed. This is where you spend 80% of time.

**Slash commands:**
- `/tasks` — Break story into testable tasks → per-feature `tasks.md`
- `/implement` — Pick one task, implement it
- `/verify` — Run verification checklist (mandatory)
- `/progress` — Update progress log
- `/handoff` — End session with context handoff

**Workflow per task:**
1. Pick ONE task from current feature
2. Write failing test (if TDD) or understand acceptance criteria
3. Implement minimal code to pass
4. Run verification checklist:
   - [ ] Tests pass (`npm test` or equivalent)
   - [ ] Type-check clean (`npm run check` or equivalent)
   - [ ] Self-review: no dead code, no console.log, no hardcoded values
   - [ ] Constitution constraints satisfied
   - [ ] Feature-list.json updated
   - [ ] Progress log updated
5. Only then mark task as done with evidence

**Artifacts:** Code, per-feature `tasks.md`, updated `feature-list.json`

---

## Document Storage

Target project structure when skill is applied:

```
project-root/
├── .claude/
│   ├── CLAUDE.md
│   └── skills/hybrid-harness/
├── docs/
│   ├── specs/
│   │   ├── constitution.md
│   │   ├── prd.md
│   │   ├── architecture.md
│   │   └── features/
│   │       └── 001-feature-name/
│   │           ├── spec.md
│   │           ├── clarification.md
│   │           ├── plan.md
│   │           └── tasks.md
│   ├── harness/
│   │   ├── AGENTS.md
│   │   ├── feature-list.json
│   │   ├── progress.md
│   │   └── session-handoff.md
│   └── plans/
├── init.sh
└── src/
```

| Location | Purpose | Who writes | Lifecycle |
|----------|---------|-----------|-----------|
| `docs/specs/` | Source of truth — specs drive code | Human + AI | Changes rarely, reviewed carefully |
| `docs/harness/` | Operational — agent reads/writes each session | AI (auto) | Changes every session |
| `.claude/skills/` | Tooling — skill definition | Dev (install once) | Versioned with skill |

---

## Gotchas — Non-Obvious Failure Modes

Read the full [Gotchas Reference](references/gotchas.md) for details. Top 5 that hurt most:

1. **Spec looks complete but isn't** — Missing edge cases surface during implementation, not planning. Fix: explicit `[NEEDS CLARIFICATION]` markers.
2. **Constitution gets ignored** — Agent treats it as suggestions, not law. Fix: reference constitution in every verification checklist.
3. **Gate becomes rubber stamp** — Team skips gate for "simple" features. Fix: gate is mandatory, even for Quick Flow.
4. **Feature list drifts from specs** — feature-list.json and spec.md tell different stories. Fix: feature-list references spec_path.
5. **Memory index caps silently** — AGENTS.md or CLAUDE.md exceeds useful length. Fix: progressive disclosure, link don't embed.

---

## When to Use This Skill

- Creating a new harness from scratch
- Adding spec-driven workflow to an existing project
- Setting up phased development for a team
- Improving agent reliability across sessions
- Designing session continuity and handoff
- Benchmarking harness effectiveness

## When NOT to Use This Skill

- One-off scripts or throwaway code
- Prompt engineering or model selection
- Projects with no AI agent involvement
- When you just need a quick AGENTS.md (use harness-creator instead)

## Further Resources

- [Learn Harness Engineering](https://walkinglabs.github.io/learn-harness-engineering/)
- [Speckit — Spec-Driven Development](https://speckit.org/)
- [BMAD Method — Agile AI-Driven Development](https://docs.bmad-method.org/)
- [Anthropic: Building Effective Agents](https://docs.anthropic.com/en/docs/build-with-claude/agentic-systems)
