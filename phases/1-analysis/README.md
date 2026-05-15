# Phase 1: Analysis

**Optional phase** — use when exploring a new idea or validating assumptions before committing to planning.

## When to Use

- New project with unclear requirements
- Complex feature that needs brainstorming
- Team disagrees on direction
- Want to validate market/technical assumptions

## When to Skip

- Requirements are clear
- Small enhancement to existing system
- Bug fix or refactoring

## Workflows

### /brainstorm

Facilitate a structured brainstorming session.

**Process:**
1. State the problem clearly
2. Generate 5+ diverse approaches (no judgment)
3. Cluster and evaluate top 3
4. Recommend with reasoning

**Artifact:** `docs/specs/product-brief.md` (or `brainstorming-report.md`)

### /research

Validate assumptions through investigation.

**Process:**
1. List key assumptions
2. For each: what evidence would prove/disprove it?
3. Research (web search, code exploration, user interviews)
4. Summarize findings

**Artifact:** Research findings (append to product brief or separate doc)

### /brief

Capture the product vision in 1-2 pages.

**Template structure:**
- Problem statement (1 paragraph)
- Target users (1-3 personas)
- Key capabilities (3-7 bullets)
- Success metrics (2-4 measurable outcomes)
- Constraints and non-goals

**Artifact:** `docs/specs/product-brief.md`

## Exit Criteria

- [ ] Human has reviewed and approved the product brief
- [ ] Key assumptions have been validated or flagged
- [ ] Ready to define specific requirements (Phase 2)

## Anti-Patterns

- Spending more than 1 session in Analysis — it's meant to be lightweight
- Writing detailed specs here — that's Phase 2
- Skipping Analysis when you genuinely don't understand the problem
