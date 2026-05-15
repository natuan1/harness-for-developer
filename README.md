<div align="center">

# Harness for Developer

**Make your AI coding agent work like a real developer.**

Spec-driven, phased harness engineering for AI coding agents.

[![version](https://img.shields.io/badge/version-1.0.0-blue)](https://github.com/natuan1/harness-for-developer)
[![license](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![compatibility](https://img.shields.io/badge/compatible-Claude%20Code%20%7C%20Codex%20%7C%20Cursor%20%7C%20Windsurf-purple)](https://github.com/natuan1/harness-for-developer)

</div>

---

## Why I Built This

Hi, I'm **Nguyen Anh Tuan**. I use AI coding agents every day — Claude Code, Cursor, Windsurf. And I kept running into the same problem:

**AI agents start fast, but finish poorly.**

They can write code at lightning speed, but they also:
- Lose context between sessions
- Don't know when to stop and ask
- Write code without understanding the requirements
- Say "done" without actually verifying
- Over-engineer or scope-creep without anyone noticing

I needed a way to make my AI agents work with **discipline** — the same discipline I'd expect from a good developer on my team. Not more prompting tricks, not better model selection — a **structured workflow** that the agent follows every single time.

That's what **Harness for Developer** is. An AI agent skill you drop into your project that gives your agent:

- **Specs before code** — no more coding without understanding what to build
- **Phased workflow** — analysis → planning → solutioning → implementation
- **Implementation gates** — mandatory readiness check before any coding begins
- **Verification** — tests, type-checks, self-review before marking anything as done
- **Session continuity** — progress tracking and handoff so nothing is lost between sessions

---

## What It Does

This is an **AI agent skill** — a set of instructions you install in your project. Once installed, your AI agent automatically follows a structured workflow:

```
Request → Analyze → Specify → Design → Implement → Verify → Deliver
```

The skill combines three proven methodologies:

| Source | What It Contributes |
|--------|-------------------|
| **harness-creator** | Operational patterns: memory persistence, verification, scope control, session continuity |
| **Speckit** | Spec-driven workflow: specify → clarify → plan → tasks, constitution, quality checks |
| **BMAD Method** | Phased lifecycle: analysis → planning → solutioning → implementation, readiness gates |

---

## The Problem It Solves

| You know this problem | Here's how the harness fixes it |
|----------------------|-------------------------------|
| Agent loses context between sessions | Automatic session handoff + progress tracking |
| Agent starts coding before understanding requirements | Spec-driven: must have an approved spec before code |
| Agent says "done" but isn't really done | Mandatory verification checklist before marking complete |
| Agent keeps adding more features (scope creep) | Constitution + scope control + one feature at a time |
| No idea what phase the agent is in | Phase routing + feature-list tracking |
| Team members get inconsistent results from agents | Standardized templates + shared constitution |

---

## Quick Start

### Install

```bash
# Clone
git clone https://github.com/natuan1/harness-for-developer.git

# Copy into your project
cp -r harness-for-developer/ your-project/.claude/skills/hybrid-harness/
```

### Activate

Open your AI coding agent and type:

```
/hybrid-harness
```

The agent will:
1. Load the skill definition
2. Ask what you want to do
3. Route to the correct phase automatically

### Use

| You want to... | Run this |
|---------------|----------|
| Create a new harness | `/constitution` → `/specify <description>` |
| Define requirements | `/specify <description>` → `/clarify` |
| Design architecture | `/plan` → `/stories` |
| Start coding | `/tasks` → `/implement` → `/verify` |
| Do a small task | Quick Flow: `/specify` → `/plan` → `/tasks` |

Full guide: [docs/getting-started.md](docs/getting-started.md)

---

## The 4-Phase Workflow

```
Phase 1: Analysis (optional)       Phase 2: Planning
  /brainstorm → /research            /constitution → /specify → /clarify
           ↓                                    ↓
Phase 3: Solutioning               Phase 4: Implementation
  /plan → /stories → GATE           /tasks → /implement → /verify
```

### Phase 1: Analysis
*Optional — for new projects, unclear requirements, or complex features.*

Brainstorm, research, write a product brief.

### Phase 2: Planning
*Always required — every feature needs a spec before code.*

Create a **constitution** (immutable project principles), write feature specs, resolve ambiguities.

### Phase 3: Solutioning
*Before any implementation, every time.*

Choose tech stack, design architecture, break features into stories. The **Implementation Readiness Gate** checks that you're actually ready to code:

- All ambiguities resolved?
- Architecture decisions documented?
- Feature dependencies mapped?
- Stories small enough for one session?
- Constitution constraints addressed?

Result: **PASS** (proceed) / **CONCERNS** (get approval) / **FAIL** (go back)

### Phase 4: Implementation
*Where you spend 80% of your time.*

Code, test, verify. Each task must pass the verification checklist before being marked done. Session handoff ensures nothing is lost.

### Quick Flow (for small tasks)

```
/specify → /plan → /tasks → implement → verify
```

Skip the full Analysis and Planning phases, but the **gate is still mandatory**.

---

## Templates

Nine production-ready templates included:

| Template | Purpose |
|----------|---------|
| `agents.md` | Agent entry point — startup protocol, phase router, working rules, verification checklist |
| `constitution.md` | Immutable project principles (5–9 articles) |
| `prd.md` | Product Requirements Document |
| `architecture.md` | Architecture overview + Architecture Decision Records |
| `feature-list.json` | Feature tracking with stories, acceptance criteria, gate status |
| `feature-list.schema.json` | JSON Schema for feature-list validation |
| `init.sh` | Bootstrap script with environment checks |
| `progress.md` | Session progress log with phase tracking |
| `session-handoff.md` | Cross-session continuity document |

---

## Project Structure After Setup

When you apply the harness to your project, it creates this structure:

```
your-project/
├── .claude/
│   ├── CLAUDE.md
│   └── skills/hybrid-harness/
├── docs/
│   ├── specs/                      # Source of truth
│   │   ├── constitution.md         # Immutable principles
│   │   ├── prd.md                  # Product requirements
│   │   ├── architecture.md         # Architecture + ADRs
│   │   └── features/
│   │       └── 001-feature-name/
│   │           ├── spec.md         # WHAT + WHY
│   │           ├── clarification.md
│   │           ├── plan.md         # HOW
│   │           └── tasks.md        # Implementable tasks
│   └── harness/                    # Operational (auto-updated each session)
│       ├── AGENTS.md               # Agent entry point
│       ├── feature-list.json       # Tracking
│       ├── progress.md             # Progress log
│       └── session-handoff.md      # Session handoff
├── init.sh
└── src/
```

| Location | Purpose | Updated by |
|----------|---------|-----------|
| `docs/specs/` | Source of truth — specs drive code | Human + AI |
| `docs/harness/` | Operational state — read/written each session | AI (automatic) |
| `.claude/skills/` | Tooling — installed once, versioned with skill | Developer |

---

## Reference Patterns

Eight deep-dive pattern documents included:

| Pattern | Source | Read when... |
|---------|--------|-------------|
| Memory Persistence | harness-creator | Agent forgets context between sessions |
| Context Engineering | harness-creator | Your AGENTS.md is getting too long |
| Tool Registry & Safety | harness-creator | You need tool restrictions for the agent |
| Multi-Agent Coordination | harness-creator | Multiple agents working simultaneously |
| Lifecycle & Bootstrap | harness-creator | Setting up a new project |
| Spec-Driven Development | Speckit | Understanding the spec workflow in depth |
| Implementation Readiness Gate | BMAD | Using the gate checklist |
| Gotchas | All three | Debugging non-obvious failure modes |

---

## Full Workflow Example

See [docs/workflow-walkthrough.md](docs/workflow-walkthrough.md) for a complete example of building a feature from scratch — from initial idea through spec, architecture, implementation, and verification.

---

## Compatibility

| Agent | Support Level |
|-------|-------------|
| **Claude Code** | Primary — designed for this |
| **Codex CLI** | Full support |
| **Cursor** | Full support |
| **Windsurf** | Full support |
| **Any AI coding agent** | Works if it reads markdown instructions |

---

## When to Use This

| Use it when... | Don't use it when... |
|---------------|---------------------|
| Small team building large software | One-off scripts or throwaway code |
| You need discipline without bureaucracy | You're doing prompt engineering or model selection |
| You want traceability from spec to code | Your project doesn't use AI agents |
| Spec-driven workflow matters to you | You just need a quick, simple AGENTS.md |
| You're tired of agents losing context | |

---

## Repository Structure

```
harness-for-developer/
├── README.md                      # You are here
├── SKILL.md                       # Main skill definition (entry point)
├── metadata.json                  # Skill metadata & triggers
├── phases/                        # 4-phase workflow documentation
│   ├── 1-analysis/README.md
│   ├── 2-planning/README.md
│   ├── 3-solutioning/README.md
│   └── 4-implementation/README.md
├── references/                    # 8 deep-dive pattern docs
├── templates/                     # 9 scaffold templates
├── evals/                         # 8 evaluation test cases
└── docs/
    ├── getting-started.md         # Detailed setup guide
    ├── workflow-walkthrough.md    # Full workflow example
    └── examples/
```

---

## Contributing

Contributions are welcome!

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "feat: add your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## Author

**Nguyen Anh Tuan** — Developer building reliable AI coding workflows.

If this project helps you, give it a star.

---

## License

[MIT](LICENSE) — Use freely, modify freely.

---

## Credits

- [harness-creator](https://github.com/walkinglabs/learn-harness-engineering) — Operational harness patterns
- [Speckit](https://speckit.org/) — Spec-driven development methodology
- [BMAD Method](https://docs.bmad-method.org/) — Phased agile AI-driven development
- [Anthropic — Building Effective Agents](https://docs.anthropic.com/en/docs/build-with-claude/agentic-systems) — Agent design principles
