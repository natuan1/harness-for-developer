<p align="center">
  <strong>Harness for Developer</strong><br>
  <em>Lam cho AI coding agent cua ban dung nhu mot developer that su.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue" alt="version">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="license">
  <img src="https://img.shields.io/badge/compatible-Claude%20Code%20%7C%20Codex%20%7C%20Cursor%20%7C%20Windsurf-purple" alt="compatibility">
</p>

---

## Xin chao, toi la Nguyen Anh Tuan

Toi la mot developer. Toi dung AI coding agents moi ngay — Claude Code, Cursor, Windsurf. Va toi da phat hien mot van de:

**AI agents khoi nhanh, nhung cham dut kem.**

Chung co the viet code nhanh chang, nhung:
- Quen mat ngu canh giua cac phien lam viec
- Khong biet khi nao nen dung, khi nao nen hoi
- Viet code ma khong hieu ro yeu cau
- Khong co ky luc quyet dinh, khong co verify truoc khi bao "xong"

Do la ly do toi tao ra **Harness for Developer** — mot bo skill giup ban dieu khien AI coding agent nhu mot thanh vien trong team, co ky luat, co quy trinh, co tracerability.

---

## Harness for Developer la gi?

Day la mot **AI agent skill** — mot bo huong dan ma ban tai vao project, va AI agent se tu dong theo dung quy trinh:

```
Yeu cau → Phan tich → Dac ta → Thiet ke → Lap trinh → Kiem chung → Hoan thanh
```

Skill nay ket hop 3 phuong phap da duoc chung minh:

| Nguon gon | Lay gi tu do |
|-----------|-------------|
| **harness-creator** | Patterns van hanh: memory, verification, scope control, session continuity |
| **Speckit** | Spec-driven workflow: specify → clarify → plan → tasks, constitution |
| **BMAD Method** | Phased lifecycle: analysis → planning → solutioning → implementation, readiness gates |

---

## Tai sao ban can no?

| Van de | Harness giai quyet the nao |
|--------|---------------------------|
| Agent quen context giua session | Session handoff + progress tracking tu dong |
| Agent code truoc khi hieu yeu cau | Spec-driven: phai co spec truoc khi code |
| Agent bao "xong" nhung chua xong | Verification checklist bat buoc truoc khi mark done |
| Agent lam qua nhieu (scope creep) | Constitution + scope control + one feature at a time |
| Khong biet agent dang o buoc nao | Phase routing + feature-list tracking |
| Team khong nhat quan giua cac agent | Templates chuan + shared constitution |

---

## Quick Start

### 1. Cai dat

```bash
# Clone repo
git clone https://github.com/nguyenanhtuan21/harness-for-developer.git

# Copy skill vao project cua ban
cp -r harness-for-developer/ /path/to/your-project/.claude/skills/hybrid-harness/
```

### 2. Kich hoat

Mo Claude Code (hoac agent ban su dung) va go:

```
/hybrid-harness
```

Agent se tu dong:
1. Doc SKILL.md
2. Hoi ban muon lam gi
3. Route den dung phase

### 3. Su dung

| Ban muon... | Go lenh |
|-------------|---------|
| Tao harness moi | `/constitution` → `/specify <mo ta>` |
| Dinh nghia yeu cau | `/specify <mo ta>` → `/clarify` |
| Thiet ke kien truc | `/plan` → `/stories` |
| Bat dau code | `/tasks` → `/implement` → `/verify` |
| Lam task nho | Quick Flow: `/specify` → `/plan` → `/tasks` |

---

## 4-Phase Workflow

```
Phase 1: Analysis (optional)     Phase 2: Planning
  /brainstorm → /research          /constitution → /specify → /clarify
          |                                  |
Phase 3: Solutioning             Phase 4: Implementation
  /plan → /stories → GATE         /tasks → /implement → /verify
```

### Phase 1: Analysis — Phan tich (tuy chon)
Khi bat dau project moi hoac yeu cau phuc tap. Brainstorm, research, viet product brief.

### Phase 2: Planning — Lap ke hoach (bat buoc)
**Luon luon phai qua buoc nay.** Tao constitution (nguyen tac bat bien), viet spec, lam ro yeu cau.

### Phase 3: Solutioning — Thiet ke giai phap
Chon tech stack, thiet ke kien truc, chia stories. **Implementation Readiness Gate** — phai PASS moi duoc code.

### Phase 4: Implementation — Lap trinh
Code, test, verify. 80% thoi gian o day. Moi task phai verify truoc khi mark done.

### Quick Flow — Cho task nho
```
/specify → /plan → /tasks → implement → verify
```
Bo qua Analysis va Planning day du, nhung **van phai qua Gate**.

---

## Templates (9 file)

| Template | Muc dich |
|----------|----------|
| `agents.md` | Entry point cho AI agent — startup protocol, phase router, working rules |
| `constitution.md` | Nguyen tac bat bien cua project (5-9 articles) |
| `prd.md` | Product Requirements Document |
| `architecture.md` | Kien truc + Architecture Decision Records |
| `feature-list.json` | Tracking features, stories, gate status |
| `feature-list.schema.json` | JSON Schema cho feature-list |
| `init.sh` | Bootstrap script |
| `progress.md` | Session progress log |
| `session-handoff.md` | Cross-session continuity |

---

## Cau truc project sau khi ap dung Harness

```
your-project/
├── .claude/
│   ├── CLAUDE.md
│   └── skills/hybrid-harness/
├── docs/
│   ├── specs/                    # Source of truth
│   │   ├── constitution.md       # Nguyen tac bat bien
│   │   ├── prd.md                # Product Requirements
│   │   ├── architecture.md       # Kien truc + ADRs
│   │   └── features/
│   │       └── 001-feature/
│   │           ├── spec.md       # WHAT + WHY
│   │           ├── clarification.md
│   │           ├── plan.md       # HOW
│   │           └── tasks.md      # Implementable tasks
│   └── harness/                  # Operational
│       ├── AGENTS.md             # Agent entry point
│       ├── feature-list.json     # Tracking
│       ├── progress.md           # Progress log
│       └── session-handoff.md    # Session handoff
├── init.sh
└── src/
```

---

## References (8 patterns)

| Pattern | Nguon | Khi nao doc |
|---------|-------|------------|
| Memory Persistence | harness-creator | Agent quen context |
| Context Engineering | harness-creator | AGENTS.md qua dai |
| Tool Registry & Safety | harness-creator | Agent can tool restrictions |
| Multi-Agent Coordination | harness-creator | Nhieu agent lam viec cung luc |
| Lifecycle & Bootstrap | harness-creator | Setup project moi |
| Spec-Driven Development | Speckit | Tim hieu spec workflow |
| Implementation Readiness Gate | BMAD | Gate checklist |
| Gotchas | All three | Khi gap van de kho doan |

---

## Vi du thuc te

Xem [docs/workflow-walkthrough.md](docs/workflow-walkthrough.md) de xem vi du workflow day du tu dau den cuoi.

---

## Compatible voi

- **Claude Code** (primary — duoc thiet ke cho no)
- **Codex CLI**
- **Cursor**
- **Windsurf**
- **Bat ky AI coding agent nao** co the doc markdown instructions

---

## Khi nao dung / Khong dung

| Dung khi... | Khong dung khi... |
|-------------|-------------------|
| Team nho lam phan mem lon | Script mot lan, throwaway code |
| Can ky luat ma khong quan ly | Prompt engineering, model selection |
| Muon agent lam viec co tracerability | Project khong dung AI agent |
| Can spec-driven workflow | Chi can AGENTS.md don gian |

---

## Cau truc repo

```
harness-for-developer/
├── README.md                 # Ban dang doc day
├── SKILL.md                  # Main skill definition
├── metadata.json             # Skill metadata
├── phases/                   # 4-phase workflow docs
│   ├── 1-analysis/
│   ├── 2-planning/
│   ├── 3-solutioning/
│   └── 4-implementation/
├── references/               # 8 deep-dive pattern docs
├── templates/                # 9 scaffold templates
├── evals/                    # 8 test cases
└── docs/
    ├── getting-started.md    # Huong dan bat dau chi tiet
    ├── workflow-walkthrough.md  # Vi du workflow day du
    └── examples/             # Vi du thuc te
```

---

## Dong gop

Day la open-source project. Contributions are welcome!

1. Fork repo
2. Tao branch: `git checkout -b feature/your-feature`
3. Commit: `git commit -m "feat: add your feature"`
4. Push: `git push origin feature/your-feature`
5. Tao Pull Request

---

## Tac gia

**Nguyen Anh Tuan** — Developer muon lam cho AI coding agents tro nen dang tin cay hon.

Neu project nay huu ich cho ban, hay cho no mot star ⭐

---

## License

MIT — Dung thoai mai, sua doi tu do.

---

## Credit

- [harness-creator](https://github.com/walkinglabs/learn-harness-engineering) — Operational harness patterns
- [Speckit](https://speckit.org/) — Spec-driven development methodology
- [BMAD Method](https://docs.bmad-method.org/) — Phased agile AI-driven development
- [Anthropic](https://docs.anthropic.com/en/docs/build-with-claude/agentic-systems) — Building effective agents
