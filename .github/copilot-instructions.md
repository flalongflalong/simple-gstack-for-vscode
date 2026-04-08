# 项目全局开发规则

> 此文件中的规则对所有 Copilot 对话自动生效，无需用户额外提醒。

---

## 🧭 回答态度准则 (Response Integrity)

**核心原则：诚实 > 迎合。正确 > 讨喜。**

1. **方案有缺陷必须直说**：当用户的思路存在技术错误、安全隐患或明显的工程反模式时，先指出问题并给出依据，再提供替代方案。不得为了避免冲突而跳过纠正。
2. **区分偏好与对错**：代码风格、框架选型等偏好问题尊重用户；安全漏洞、逻辑错误、数据一致性等对错问题必须明确指出。
3. **反对时给理由**：指出问题时附带具体依据（标准、文档、已知缺陷），而非空泛否定。
4. **坚持后标注风险**：用户被告知风险后仍坚持时，在实现中用注释标注已知风险（如 `// RISK: ...`）。
5. **不做信息堆砌**：回答直击要害，不用大段"正确但无关"的内容来填充回复。
6. **不确定时明说**：对没有把握的判断，标注不确定性和缺失的前提条件，而非伪装成定论。

---

## 📁 上下文文档约定 (Context Document Convention)

**每个角色在启动时，先检查相关前序文档是否存在并读取；在完成核心输出后，将结果持久化到对应文件。** 这使整个研发流程可追溯、可中断后继续。

### `.context/{功能名}/` — 功能迭代隔离目录

**每个功能迭代拥有独立的上下文子目录**，避免多轮迭代的阶段产出相互污染。

#### 命名约定

```
.context/
  v1-core/              # 第一版核心功能
  v2-auth/              # 鉴权功能迭代
  v3-payment/           # 支付功能迭代
  ...
```

- 格式：`{版本或序号}-{功能简称}`，全小写、用连字符，例如 `v2-search`、`sprint3-dashboard`
- 启动新功能时，由 `/office-hours` 或 `/ceo` 在第一次写文件前**创建该子目录**，并同步创建/更新 `.context/README.md`
- 所有角色的阶段产出写入 **当前功能子目录**，而非 `.context/` 根目录

#### `.context/README.md` 格式

```markdown
# 当前活跃迭代

**目录：** `.context/v2-auth/`
**功能：** 鉴权功能
**启动日期：** YYYY-MM-DD
**状态：** 进行中
```

每次切换迭代时更新此文件。所有角色启动时首先读取它以确定当前应写入哪个子目录。

#### 跨迭代读取规则

- 启动新功能时，可跨目录读取前一迭代的 `eng-plan.md`、`design-plan.md` 作为历史背景参考
- 例：`/plan-eng-review` 启动时可读 `.context/v1-core/eng-plan.md` 了解既有架构，再输出到 `.context/v2-auth/eng-plan.md`

---

### 各目录中的阶段产出文件

| 文件 | 由谁写入 | 内容摘要 |
|------|----------|----------|
| `office-hours-output.md` | `/office-hours` | 产品定位、需求证据、设计备忘录（含推荐方案） |
| `ceo-review.md` | `/ceo` | 模式决策、范围定义（做什么/不做什么）、盲点与风险 |
| `eng-plan.md` | `/plan-eng-review` | 架构蓝图、数据流、接口契约、测试矩阵 |
| `design-plan.md` | `/plan-design-review` | UI 状态清单、交互规范、空状态/错误状态边界 |
| `tasks.md` | `/tasks` | 原子任务清单、任务状态、验收条件、Bug 修复闭环记录 |
| `sprint.md` | `/tasks` | 当前迭代看板：本轮在做、下轮积压、明确不做 |
| `review-findings.md` | `/review` | 代码审查发现、竞态条件、逻辑盲点 |
| `cso-findings.md` | `/cso` | 安全审计发现、威胁模型、修复优先级 |
| `qa-findings.md` | `/qa` | 缺陷列表、复现步骤、回归测试覆盖情况 |
| `investigation-report.md` | `/investigate` | 根因分析链路、已排除假设、已验证假设 |
| `design-review-findings.md` | `/design-review` | 视觉审计发现、AI 劣质感检测结果、评分（A-F）、修复优先级清单 |
| `learnings.md` | `/review`、`/qa`、`/investigate`、`/cso`、`/plan-eng-review` | 项目学习记录：模式、陷阱、架构洞察（只追加，不修改已有条目） |
| `eng-plan.md`（精简版） | `/context-archive` | 架构决策摘要（提炼自归档前的完整版） |
| `ceo-review.md`（精简版） | `/context-archive` | 范围定义摘要（提炼自归档前的完整版） |

### 永久制品（全工程共享，提交到版本库）

> 这些文件**不随功能迭代隔离**，始终写在项目根目录，记录整个工程的演进。

| 文件 | 由谁写入 | 内容摘要 |
|------|----------|----------|
| `DESIGN.md` | `/design-consultation` | 设计系统唯一真相：色彩、字体、间距、动效、CSS 变量 |
| `ARCHITECTURE.md` | `/plan-eng-review` | 架构决策记录（ADR）：选型理由、数据模型、关键约束 |
| `MILESTONES.md` | **所有角色** | 项目里程碑日志，只追加，不修改历史行 |

### MILESTONES.md 追加规则

每个角色完成其核心输出后，在 `MILESTONES.md` 末尾追加一行：

```
| YYYY-MM-DD | /角色名 | 一句话描述本次完成了什么 | 关键产出文件 |
```

如文件不存在，先创建：

```markdown
# 项目里程碑日志 (Milestones)

| 日期 | 阶段 | 完成内容 | 关键产出 |
|------|------|----------|----------|
```

### 上下文读取优先级

启动任意角色时，按以下顺序读取（文件存在则读，不存在则跳过）：

1. `.context/README.md` — 确定当前活跃迭代目录；若不存在且即将写入文件，则先创建它
2. `MILESTONES.md` — 了解项目整体进度和已完成阶段
3. 直接前序阶段产出（例：`/implement` 先读 `eng-plan.md` 和 `ceo-review.md`）
4. `DESIGN.md` — 所有涉及 UI/前端的角色必读

### 各角色的前序依赖（快速索引）

| 角色 | 启动时读取 |
|------|------------|
| `/ceo` | `office-hours-output.md` |
| `/design-consultation` | `office-hours-output.md`、`ceo-review.md` |
| `/plan-eng-review` | `ceo-review.md`、`office-hours-output.md` |
| `/plan-design-review` | `eng-plan.md`、`DESIGN.md` |
| `/tasks` | `eng-plan.md`、`ceo-review.md`、`design-plan.md`（可选） |
| `/implement` | `tasks.md`、`sprint.md`、`eng-plan.md`、`design-plan.md`、`DESIGN.md`、`ceo-review.md` |
| `/review` | `eng-plan.md`（用于对照架构约束） |
| `/cso` | `eng-plan.md`、`review-findings.md` |
| `/qa` | `review-findings.md`、`eng-plan.md` |
| `/investigate` | `qa-findings.md`、`review-findings.md` |
| `/design-review` | `DESIGN.md`、`design-plan.md`（输出：`design-review-findings.md`） |
| `/document-release` | `MILESTONES.md`（生成 Changelog 的依据） |
| `/context-archive` | `MILESTONES.md`、`.context/README.md`、`.context/{功能名}/`（全部文件）（输出：`.context-archive/{功能名}/`） |

> **闭环规则**：`/qa` 和 `/investigate` 修复问题后，需在 `tasks.md` 对应任务追加 `[FIXED]` 记录，并在 `TODOS.md` 标记已关闭，最后追加 `MILESTONES.md`。

---

## ⚡ 增量执行规则 (Incremental Execution)

**目的：防止单次生成内容过多导致会话卡住或内容丢失。**

### 触发条件（满足任一即启用分批模式）

- 待产出的独立文档/文件 ≥ 3 个
- 待实现的功能模块 ≥ 3 个
- 预计单次回复超过约 500 行内容

### 执行规范

1. **先列计划再动手**：开始前展示完整的分批清单（模块名 + 预计输出 + 依赖顺序），等用户确认后再开始第一批。
2. **一次一批**：每次只执行一个模块或一个文档，完成后立即将产出写入对应文件（`.context/` 或永久制品）。
3. **完成即落盘**：每批完成后，该批产出**立即保存到文件**，不等后续批次完成再统一写入——这样即使会话中断，已完成部分不丢失。
4. **批次确认**：每批完成后展示简短摘要（完成了什么、下一批是什么），询问是否继续。允许用户在任意批次间调整方向或优先级。
5. **禁止一次性生成**：不要将多个模块/文档的完整内容合并到单次回复中输出，即使用户没有明确要求分批。

### 分批粒度参考

| 任务类型 | 推荐分批粒度 |
|----------|-------------|
| 架构评审（`/plan-eng-review`） | 每个功能模块一批 |
| 设计评审（`/plan-design-review`） | 每个页面/流程一批 |
| 实现（`/implement`） | 每个文件或每个功能点一批 |
| 代码审查（`/review`、`/qa`） | 每个审查维度（安全/测试/性能）一批 |
| 任务分解（`/tasks`） | 每个功能模块一批 |
| 文档生成（`/document-release`） | 每个章节一批 |

---

## 🔬 任务粒度标准 (Task Granularity Standards)

**目的：所有任务分解（无论由 `/tasks` 还是其他角色产出）都必须遵守统一的原子粒度标准，防止任务过大难以验收或过小制造噪音。**

### 原子任务定义

每个任务必须满足：
- **时间范围**：预估 30 分钟 ~ 4 小时可完成
- **单一职责**：一个任务只做一件事，有明确的完成判定条件
- **可独立验收**：完成后可通过具体的验收条件（测试通过、行为可观测）确认

### 拆分信号（任务过大，需要拆分）

出现以下任一情况时，必须将任务拆分为更小的子任务：
- 描述中包含 **"并且"、"同时"、"以及"** 等并列连接词
- 涉及 **≥ 3 个独立子功能**（如：创建模型 + 写 API + 加验证 + 写测试）
- 预估耗时 **> 4 小时**
- 跨越 **≥ 2 个不相关模块**（如前端 + 后端 + 数据库迁移）

### 合并信号（任务过小，应该合并）

出现以下任一情况时，应将多个任务合并为一个：
- 修改的是 **同一文件中相邻的函数/方法**
- 合并后预估耗时仍 **< 30 分钟**
- 多个任务之间存在 **强顺序依赖**，无法独立验收

### 验收条件书写规则

每个任务的验收条件必须是 **可机器验证** 或 **可 grep 验证** 的，例如：
- ✅ `运行 npm test 全部通过`
- ✅ `GET /api/users 返回 200 且包含 pagination 字段`
- ✅ `文件 src/auth.ts 中存在 validateToken 函数`
- ❌ `代码质量良好`（不可验证）
- ❌ `用户体验提升`（不可量化）

<!-- gstack Configuration -->
# Instructions for gstack roles

- Treat `/ceo`, `/cso`, `/office-hours`, `/implement`, `/review`, `/qa`, `/qa-only`, `/tasks`, `/investigate`, `/plan-eng-review`, `/plan-design-review`, `/design-consultation`, `/design-review`, `/document-release`, `/context-archive` as role invocations.
- When a user invokes any of the above (with or without the `/` prefix), load the matching skill from `.github/skills/g-{角色名}/SKILL.md`, then read and execute the referenced `.github/prompts/g-{角色名}.prompt.md`.
- Do not apply gstack role workflows unless the user explicitly invokes a role command.
<!-- /gstack Configuration -->
