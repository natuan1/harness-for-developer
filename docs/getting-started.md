# Getting Started — Harness for Developer

Huong dan chi tiet cach cai dat, cau hinh, va su dung Harness for Developer.

---

## Buoc 1: Cai dat Skill

### Claude Code

```bash
# Clone repo
git clone https://github.com/nguyenanhtuan21/harness-for-developer.git

# Copy vao project cua ban
cp -r harness-for-developer/ /your-project/.claude/skills/hybrid-harness/

# Verify
ls /your-project/.claude/skills/hybrid-harness/SKILL.md
# Phai thay file SKILL.md
```

### Cursor / Windsurf

Copy noi dung `SKILL.md` vao file `.cursorrules` hoac `.windsurfrules` trong project cua ban.

### Codex CLI

Them `SKILL.md` vao `AGENTS.md` hoac `codex.md` trong thu muc goc project.

---

## Buoc 2: Tao Harness cho Project

Mo AI agent va go:

```
/hybrid-harness
```

Agent se hoi ban muon lam gi. Chon "Tao harness moi".

Agent se tu dong tao:

```
your-project/
├── .claude/
│   └── skills/hybrid-harness/
├── docs/
│   ├── specs/
│   │   └── constitution.md     ← Nguyen tac bat bien
│   └── harness/
│       ├── AGENTS.md           ← Agent entry point
│       ├── feature-list.json   ← Feature tracking
│       ├── progress.md         ← Progress log
│       └── session-handoff.md  ← Session handoff
├── init.sh                     ← Bootstrap script
└── src/
```

---

## Buoc 3: Tao Constitution

Constitution la tap hop nguyen tac bat bien cua project. Mac dinh 7 articles:

1. **Spec-First Development** — Moi feature bat dau bang specification
2. **Test-First Imperative** — Viet test truoc code
3. **One Feature at a Time** — Lam dung 1 feature luc
4. **No Premature Abstraction** — 3 pattern giong nhau moi tao abstraction
5. **Verify Before Declare** — Phai verify truoc khi bao "xong"
6. **Document Decisions** — Ghi lai moi quyet dinh ky thuat
7. **Human-in-the-Loop at Gates** — Phase transitions can human approval

Ban co the tuy chinh: them, bot, sua articles cho phu hop voi project.

Go: `/constitution` de bat dau.

---

## Buoc 4: Viet Spec cho Feature dau tien

```
/specify Feature: User authentication voi email/password
```

Agent se tao:
- `docs/specs/features/001-user-auth/spec.md` — WHAT + WHY
- Danh dau `[NEEDS CLARIFICATION]` cho nhung gi chua ro

Sau do go `/clarify` de giai quyet cac diem chua ro.

---

## Buoc 5: Thiet ke va Implement

```bash
# Thiet ke kien truc
/plan

# Chia thanh stories
/stories

# Gate check — phai PASS moi duoc code
# Agent se tu dong kiem tra

# Tao tasks
/tasks

# Implement tung task
/implement
/verify    # Bat buoc sau moi task!
```

---

## Buoc 6: Ket thuc Session

```bash
/handoff
```

Agent se tu dong:
1. Cap nhat `progress.md`
2. Cap nhat `session-handoff.md`
3. Cap nhat `feature-list.json`
4. Commit tat ca thay doi
5. Bao cao summary cho ban

---

## Workflow cho moi Session

```
1. Mo AI agent
2. Agent doc AGENTS.md (tu dong)
3. Agent doc constitution (tu dong)
4. Agent doc progress.md (tu dong)
5. Agent bao cao: "Dang o feature X, task Y, blocker Z"
6. Ban noi: "Tiep tuc" hoac "Chuyen sang feature khac"
7. Lam viec...
8. /verify
9. /handoff
```

---

## Troubleshooting

| Van de | Giai quyet |
|--------|-----------|
| Agent khong load skill | Kiem tra `.claude/skills/hybrid-harness/SKILL.md` ton tai |
| Agent bo qua constitution | Them `Read constitution at start` vao CLAUDE.md |
| Feature-list khong cap nhat | Go `/progress` de cap nhat thu cong |
| Agent code truoc khi spec xong | Nho agent ve Phase Router — chua xong Phase 2 thi khong vao Phase 4 |
| Session handoff mat | Kiem tra `docs/harness/session-handoff.md` co duoc commit khong |
