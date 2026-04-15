# Changelog

## 2026-04-15

### README 更新：移除 GSD、补全至 17 个角色

移除所有 get-shit-done（GSD）相关内容，将仓库描述还原为纯 gstack 流程；同时补全 `/qa-only`、`/ship`、`/design-shotgun` 三个此前未列入的角色。

- 移除特性列表中的 GSD 集成条目与 `.context/` + `.planning/` 桥接规则
- 移除快速开始中的 `npx get-shit-done-cc` 安装步骤
- 将"标准协作流水线"从 gstack × GSD 联合模式改写为纯 gstack 5 阶段流程
- 制品目录说明移除 `.planning/` 行，改为 `MILESTONES.md` 与 `ARCHITECTURE.md`
- 核心铁律第 4 条从"制品互通"改为"只看文件"原则
- 角色总数从 14 更新为 17，补充 `/qa-only`、`/ship`、`/design-shotgun` 三行

### 涉及文件

- `README.md`

## 2026-04-15

### Prompt 工程增强：Karpathy 原则、微示例与懒加载拆分

本次更新专注于提升角色 prompt 的可执行性和 token 效率，共三个方向：引入 Karpathy 编码纪律、为高频违反规则添加微示例、将三个最大文件拆分为懒加载子模块。

**Karpathy 原则落地（3 条）**

- `/implement` 新增"歧义暂停规则"：发现多种解读时禁止默选，必须停下列出方案并等待确认。
- `/implement` 新增"简洁性自检"作为 Done Gate 第 4 步：200 行能写成 50 行就重写。
- `/implement` 新增"孤儿清理规则"：区分自己产生的死代码（必须清理）与已有死代码（提及不删）。

**全局行为规则增强（Hermes 启发）**

- `copilot-instructions.md` 新增"行动优先准则"和"迭代韧性准则"，防止纯文字描述意图而不行动、因步骤多而简化方案。
- 核心链路 7 个角色（`/implement`、`/plan-eng-review`、`/tasks`、`/review`、`/qa`、`/investigate`、`/ceo`）统一加入角色边界声明和上下文栅栏。

**懒加载拆分（3 个角色，7 个子文件）**

- `/implement`（435→345 行）：提取 `done-gate.md`、`module-doc-standard.md`、`hard-rules.md`。
- `/plan-eng-review`（632→286 行）：提取 `test-matrix.md`、`output-template.md`。
- `/tasks`（532→384 行）：提取 `task-format.md`、`output-template.md`。

**微示例（7 条）**

为最容易被违反的规则添加内联 ❌/✅ 对比示例：契约至上、歧义暂停、孤儿清理、二次出现规则（均在 `/implement`）；过度工程化（`/plan-eng-review`）；任务粒度拆分、占位符扫描（`/tasks`）。

### 涉及文件

- `.github/copilot-instructions.md`
- `.github/prompts/g-ceo.prompt.md`
- `.github/prompts/g-implement.prompt.md`
- `.github/prompts/g-implement/done-gate.md` *(新增)*
- `.github/prompts/g-implement/hard-rules.md` *(新增)*
- `.github/prompts/g-implement/module-doc-standard.md` *(新增)*
- `.github/prompts/g-investigate.prompt.md`
- `.github/prompts/g-plan-eng-review.prompt.md`
- `.github/prompts/g-plan-eng-review/output-template.md` *(新增)*
- `.github/prompts/g-plan-eng-review/test-matrix.md` *(新增)*
- `.github/prompts/g-qa.prompt.md`
- `.github/prompts/g-review.prompt.md`
- `.github/prompts/g-tasks.prompt.md`
- `.github/prompts/g-tasks/output-template.md` *(新增)*
- `.github/prompts/g-tasks/task-format.md` *(新增)*

## 2026-04-08

### 新增上下文归档流程

本次更新补齐了从发布到迭代收尾的最后一环，核心是引入 `/context-archive` 角色，让 `.context/` 中的过程制品可以在里程碑后被系统归档，而关键决策继续保留在工作区中。

- 新增 `/context-archive` 角色，并补充对应的 skill 与 prompt，用于执行归档预检、过程文件搬迁、决策摘要提炼、`learnings.md` 合并，以及 `.context/README.md` 和 `MILESTONES.md` 的后续更新。
- 扩展上下文约定：`.github/copilot-instructions.md` 现在明确了 `.context-archive/{功能名}/` 的定位，并新增精简版 `eng-plan.md`、`ceo-review.md` 的保留规则，以及 `/context-archive` 的读取依赖。
- README 同步更新为 14 个角色，并将 `/context-archive` 纳入完整研发链路、纯 gstack 流程和模型选择建议中，强调“发布后归档、为下轮迭代降噪”的使用场景。

### 涉及文件

- `.github/copilot-instructions.md`
- `.github/prompts/g-context-archive.prompt.md`
- `.github/skills/g-context-archive/SKILL.md`
- `README.md`

## 2026-03-31

### Prompt 升级同步

本次同步基于上游 gstack 变更，重点是增强现有角色的工程化约束，而不是新增角色。

- 强化多迭代上下文读取：多个角色现在会优先读取 `.context/README.md`，并结合 `MILESTONES.md`、`ARCHITECTURE.md`、`DESIGN.md` 以及前序迭代产物建立上下文。
- 增加历史方案对照：`/plan-eng-review`、`/design-consultation`、`/plan-design-review` 会主动参考前序迭代的 `eng-plan.md` 或 `design-plan.md`，减少重复决策。
- 增加项目学习沉淀：`/plan-eng-review`、`/review`、`/qa`、`/cso`、`/investigate` 新增向 `learnings.md` 追加可复用经验的约束。
- 强化前端审查：`/review` 新增 Design Review Lite，在前端文件变更时补查可访问性、响应式、设计一致性与状态完整性。
- 强化 QA 分层：`/qa` 支持 `Quick`、`Standard`、`Exhaustive` 三档测试深度，按严重级别控制修复范围。
- 强化安全审计：`/cso` 支持全量审计、`--comprehensive`、`--infra`、`--code`、`--supply-chain`、`--owasp`、`--scope` 等模式。
- 强化架构对齐：`/plan-eng-review` 会显式对照 `ARCHITECTURE.md` 与历史计划，要求说明与既有 ADR 的一致性或偏离原因。

### 涉及文件

- `.github/copilot-instructions.md`
- `.github/prompts/g-cso.prompt.md`
- `.github/prompts/g-design-consultation.prompt.md`
- `.github/prompts/g-investigate.prompt.md`
- `.github/prompts/g-office-hours.prompt.md`
- `.github/prompts/g-plan-design-review.prompt.md`
- `.github/prompts/g-plan-eng-review.prompt.md`
- `.github/prompts/g-qa.prompt.md`
- `.github/prompts/g-review.prompt.md`