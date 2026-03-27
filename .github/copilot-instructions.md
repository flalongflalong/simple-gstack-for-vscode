# 项目全局开发规则

> 此文件中的规则对所有 Copilot 对话自动生效，无需用户额外提醒。

---

## 📁 上下文文档约定 (Context Document Convention)

**每个角色在启动时，先检查相关前序文档是否存在并读取；在完成核心输出后，将结果持久化到对应文件。** 这使整个研发流程可追溯、可中断后继续。

### `.context/` — 阶段产出目录（会话工作记忆）

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

### 永久制品（提交到版本库）

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

1. `MILESTONES.md` — 了解项目整体进度和已完成阶段
2. 直接前序阶段产出（例：`/implement` 先读 `eng-plan.md` 和 `ceo-review.md`）
3. `DESIGN.md` — 所有涉及 UI/前端的角色必读
4. `CLAUDE.md` — 项目级技术约束

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
