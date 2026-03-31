# Changelog

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