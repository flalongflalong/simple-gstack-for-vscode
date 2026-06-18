# Simple Gstack for Codex 0.2.0

这个插件提供一组面向 Codex 的工程技能：一层是文件优先的完整工程操作系统，另一层是日常全栈研发中可以单独调用的小技能。

0.2.0 分为两类能力：

- `gstack-*`：完整工程 OS 工作流。它们通过 `references/engineering-os-contract.md` 共享模式选择、事实源、产物、停止条件和验证规则。
- `skill-*`：轻量单点技能。适合不需要完整 gstack 流程的小任务，比如修一个 bug、对齐接口契约、补测试、写技术文档或做一次发布检查。

## Gstack 工作流技能

- `gstack-office-hours`
- `gstack-ceo`
- `gstack-design-consultation`
- `gstack-design-shotgun`
- `gstack-plan`
- `gstack-plan-design-review`
- `gstack-tasks`
- `gstack-implement`
- `gstack-review`
- `gstack-qa`
- `gstack-qa-only`
- `gstack-design-review`
- `gstack-ship`
- `gstack-document-release`
- `gstack-context-archive`

## 独立小技能

日常核心工作：

- `skill-fullstack-dev` - 小型全栈功能或配置改动，覆盖 React/Vue、Python/Java、API、Docker 和文档。
- `skill-bug-fix` - 单个 bug 的复现、诊断、最小修复、回归覆盖和验证。
- `skill-test-quality` - 测试补强、红绿重构、flaky test 清理和质量检查。
- `skill-eng-planning` - 轻量工程规划、方案对比和垂直切片拆解。
- `skill-docs-change` - 文档、需求变更、ADR、API docs 以及代码/文档同步。

接口与数据：

- `skill-api-contract` - 前后端接口契约对齐，覆盖 DTO、mock、文档、生成客户端和测试。
- `skill-database-change` - 安全处理 MySQL/Postgres 表结构、SQL、索引、迁移、回滚和补数据。
- `skill-db-api` - 当一次改动同时跨 API 行为和持久化层时使用的宽入口。

交付与审查：

- `skill-code-review` - 轻量 diff 审查，关注代码规范、需求匹配、回归风险和测试缺口。
- `skill-release-devops` - Docker、本地 CI、环境配置、冒烟检查、部署说明、回滚和发布准备。
- `skill-requirement-change` - 需求变更影响分析，输出影响矩阵、实现调整和测试范围。
- `skill-technical-doc` - 技术方案、接口文档、数据库文档、部署指南、测试计划、排障和交接文档。

设计与页面风格：

- `skill-design-ui` - 轻量页面风格与 DESIGN.md 方向选择，可从参考站点提炼视觉语法、设计 token、组件样式、响应式规则和 AI 生成 UI 的 do/don't。

探索与理解：

- `skill-codebase-map` - 只读梳理陌生模块、调用链、数据流和安全改动点。
- `skill-prototype-spike` - 用抛弃式 UI、逻辑、状态机、数据流或集成原型在正式实现前快速验证想法。
- `skill-update` - 对比 `.tmp/gstack`、`.tmp/superpowers`、`.tmp/skills`、`.tmp/awesome-design-md` 等外部 skill 更新，选择性增强 0.2.0 的现有技能或提出新增技能。

## 本地开发

这个目录是本地 Codex 安装的事实源。开发阶段建议把本地插件源和缓存都符号链接到这里，这样仓库中的 skill 更新可以直接被后续 Codex 新线程加载，而不需要手动复制文件。
