# Workflow Walkthrough — Vi du day du

Day la vi du hoan chinh cach su dung Harness for Developer de xay dung mot feature tu dau den cuoi.

---

## Scenario: Tao feature "Document Search" cho Electron app

### Session 1: Planning

```
You: /hybrid-harness

Agent: Harness for Developer activated.
       Ban muon lam gi?
       1. Tao harness moi
       2. Them feature vao project hien co
       3. Assess harness hien tai

You: 2

Agent: OK, bat dau Phase 2: Planning.
       Truoc het, can tao constitution.
```

#### Tao Constitution

```
You: /constitution

Agent: Tao constitution mac dinh voi 7 articles.
       Ban muon tuy chinh gi khong?

You: Them article: "All data stored locally, no cloud"

Agent: ✅ Constitution created at docs/specs/constitution.md (8 articles)
```

#### Viet Spec

```
You: /specify Feature: Full-text search cho documents trong knowledge base.
       User go tu khoa, app tra ve danh sach documents match.
       Highlight keyword trong ket qua.

Agent: Tao spec...
       Created: docs/specs/features/001-document-search/spec.md

       [NEEDS CLARIFICATION]:
       1. Search theo content hoac chi theo title?
       2. Co support search tieng Viet khong?
       3. Highlight o dau? List view hoac detail view?
```

#### Lam ro yeu cau

```
You: /clarify

Agent: Let's resolve 3 items:
       Q1: Search theo content hay chi title?
       [a] Chi title  [b] Title + content  [c] All metadata

You: b

Agent: ✅ Resolved: Search title + content.

       Q2: Co support search tieng Viet khong?
       [a] Chi English  [b] Tieng Viet basic  [c] Full Unicode

You: b

Agent: ✅ Resolved: Tieng Viet basic (khong can diacritics matching).

       Q3: Highlight o dau?
       [a] List view only  [b] Detail view only  [c] Ca hai

You: c

Agent: ✅ All [NEEDS CLARIFICATION] resolved.
       Updated: docs/specs/features/001-document-search/clarification.md
```

---

### Session 2: Solutioning

```
You: /hybrid-harness

Agent: [Startup Protocol]
       Constitution: ✅ loaded
       Current feature: 001-document-search (Phase 2 complete)
       Last session: Spec created, 3 clarifications resolved
       Recommended: Phase 3 — Solutioning

You: OK, thiet ke kien truc
```

#### Plan Architecture

```
You: /plan

Agent: Thiet ke kien truc cho Document Search...

       Tech choices:
       - Search engine: Fuse.js (local, lightweight)
       - Indexing: Chay khi document add/update
       - Highlight: CSS-based mark tags

       ADR-001: Choose Fuse.js over Lunr.js
       Ly do: Lunr co regex search nhung Fuse.js co fuzzy matching,
       tot hon cho tieng Viet basic.

       Created: docs/specs/architecture.md
       Created: docs/specs/features/001-document-search/plan.md
```

#### Break into Stories

```
You: /stories

Agent: Breaking feature into stories:

       Story 001-1: Index documents for search
       Story 001-2: Implement search query API
       Story 001-3: Add search UI with results list
       Story 001-4: Add keyword highlighting
       Story 001-5: Integration tests

       Each story: independent, testable, completable in 1 session.
```

#### Implementation Readiness Gate

```
Agent: 🔒 IMPLEMENTATION READINESS GATE

       [✅] All [NEEDS CLARIFICATION] resolved — 3/3
       [✅] Architecture decisions documented — ADR-001
       [✅] Feature dependencies mapped — standalone feature
       [✅] Stories small enough — 5 stories, each ~1 session
       [✅] Constitution constraints addressed — local data, spec-first

       Result: GATE:PASS ✅
       San sang code!
```

---

### Session 3: Implementation

```
You: /hybrid-harness

Agent: [Startup Protocol]
       Constitution: ✅ loaded
       Current feature: 001-document-search (Gate PASSED)
       Recommended: Story 001-1 — Index documents

You: OK, bat dau
```

#### Tasks

```
You: /tasks

Agent: Breaking Story 001-1 into tasks:

       Task 1: Create IndexingService interface
       Task 2: Implement document indexing with Fuse.js
       Task 3: Add index update on document add/remove
       Task 4: Write unit tests for IndexingService

Created: docs/specs/features/001-document-search/tasks.md
```

#### Implement + Verify

```
You: /implement

Agent: Implementing Task 1: Create IndexingService interface...
       [viet code...]
       ✅ Created src/services/IndexingService.ts

You: /verify

Agent: Verification Checklist:
       [✅] Tests pass — npm test (0 tests yet, just interface)
       [✅] Type-check clean — npm run check
       [✅] Self-review — no dead code, no console.log, no hardcoded values
       [✅] Constitution: spec-first ✅, document decisions ✅
       [✅] feature-list.json updated
       [✅] progress.md updated

       Task 1: DONE ✅
```

#### Handoff

```
You: /handoff

Agent: Session Handoff:
       Feature: 001-document-search
       Current story: 001-1 (Index documents)
       Completed: Task 1 (IndexingService interface)
       Next: Task 2 (Implement indexing with Fuse.js)
       Blockers: None

       Updated:
       - docs/harness/progress.md
       - docs/harness/session-handoff.md
       - docs/harness/feature-list.json

       Committed: "feat: add IndexingService interface for document search"
```

---

### Session 4: Tiep tuc

```
You: /hybrid-harness

Agent: [Startup Protocol]
       Constitution: ✅ loaded
       Feature: 001-document-search
       Story: 001-1, Task 2 (Implement indexing with Fuse.js)
       No blockers

       Ready to continue. Ban muon tiep tuc Task 2?

You: Yes
```

...va cu tiep tuc nhu vay cho den khi tat ca stories hoan thanh.

---

## Summary

| Session | Phase | Lam gi |
|---------|-------|--------|
| 1 | Planning | Constitution, Spec, Clarify |
| 2 | Solutioning | Architecture, Stories, Gate |
| 3 | Implementation | Tasks 1-2, Verify, Handoff |
| 4 | Implementation | Tasks 3-4, Verify, Handoff |
| 5 | Implementation | Task 5, Integration tests, Verify |

**Ky luc moi buoc**: Spec → Clarification → Plan → Tasks → Code → Verify → Handoff. Moi buoc de lai artifact, khong co gi mat mat.
