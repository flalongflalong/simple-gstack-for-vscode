# Changelog

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