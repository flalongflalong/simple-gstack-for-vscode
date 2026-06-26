# Simple Gstack for Codex 0.2.0

这个插件提供一组面向 Codex 的工程技能：一层是文件优先的完整工程操作系统，另一层是日常全栈研发中可以单独调用的小技能。

0.2.0 分为两类能力：

- `gstack-*`：完整工程 OS 工作流。它们通过 `references/engineering-os-contract.md` 共享模式选择、事实源、产物、停止条件和验证规则。
- `priv-skill-*`：轻量单点技能。适合不需要完整 gstack 流程的小任务，比如修一个 bug、对齐接口契约、补测试、写技术文档或做一次发布检查。

## Gstack 工作流技能

这些技能适合完整研发流程，按阶段沉淀 `.context/` 制品，并遵守共享工程 OS 契约。

| 技能 | 工作模式 | 用途 |
| --- | --- | --- |
| `gstack-office-hours` | Discover | 在规划或编码前拷问产品、功能、创业点子、内部工具或开源想法是否值得做，输出后续 CEO/计划阶段可用的产品判断。 |
| `gstack-ceo` | Scope | 在工程开始前压测范围和优先级，决定是否缩 MVP、比较备选方案、识别隐藏产品风险，并保存 CEO 风格的范围决策。 |
| `gstack-design-consultation` | Design system | 为需要 UI 的项目创建或刷新 `DESIGN.md`，定义品牌、视觉方向、排版、色彩、间距、动效和可复用设计规则。 |
| `gstack-design-shotgun` | Design options | 在确定视觉系统或实现前探索多种差异明显的 UI 方向，帮助比较风格、布局和产品表达。 |
| `gstack-plan` | Architecture | 创建或刷新可执行的 `eng-plan.md`，锁定架构、数据流、接口契约、故障模式和测试范围。 |
| `gstack-plan-design-review` | UI plan review | 在编码前审查 UI/UX 计划、设计计划或任务清单，补齐状态、响应式、可访问性和交互边界。 |
| `gstack-tasks` | Tasking | 将已批准的工程计划拆成原子任务、sprint 看板、状态规则和延期 TODO，产出 `tasks.md` / `sprint.md`。 |
| `gstack-implement` | Build | 根据活跃 `eng-plan.md` 和 `tasks.md` 实现代码、测试和必要文档，保持最小 diff 并更新任务状态。 |
| `gstack-review` | Review | 对当前 diff、分支或指定文件做 Staff 级预合并审查，寻找范围漂移、生产风险、测试缺口和前端设计问题。 |
| `gstack-qa` | QA repair | 复现 bug 或回归、判断严重性、做最小修复、补回归覆盖并用新证据验证修复。 |
| `gstack-qa-only` | QA report | 只做报告型 QA，不改源码、测试或配置；输出可复现问题、破坏性场景、健康度评分和证据。 |
| `gstack-design-review` | Visual audit | 对已实现 UI 做视觉质量、`DESIGN.md` 对齐、层级、响应式、可访问性和交互状态审计。 |
| `gstack-ship` | Ship | 在实现完成后做发布/合并前验证，检查分支状态、计划完成度、测试门禁、版本和发布材料，给出 go/no-go。 |
| `gstack-document-release` | Release docs | 将已交付代码同步到 README、ARCHITECTURE、CONTRIBUTING、CHANGELOG、TODOS、VERSION 等发布文档。 |
| `gstack-context-archive` | Archive | 里程碑完成后安全归档 `.context` 迭代，保留原件、提炼长期决策、移动过程制品并更新上下文状态。 |

## 独立小技能

这些技能适合单点任务。当前 Codex 插件使用 `priv-skill-*` 命名，覆盖早期计划里提到的 `skill-*` 独立技能层。

### 日常核心工作

| 技能 | 用途 |
| --- | --- |
| `priv-skill-fullstack-dev` | 处理小到中型全栈功能或配置改动，覆盖 React/Vue、Python/Java、API 接线、Docker/服务配置和随改动需要同步的文档。 |
| `priv-skill-bug-fix` | 修一个明确 bug：复现、诊断、最小补丁、必要回归覆盖，并验证原始症状消失。 |
| `priv-skill-test-quality` | 增加测试、补覆盖率、写回归用例、稳定 flaky test、添加 lint/type/build 检查，或执行红绿重构。 |
| `priv-skill-eng-planning` | 为普通改动做轻量工程计划、技术方案对比、任务拆分、风险扫描和改动策略，不启动完整 gstack 计划流程。 |
| `priv-skill-docs-change` | 更新 README、API 文档、设计文档、ADR、需求记录，或同步代码与文档中的字段、术语和行为描述。 |

### 接口与数据

| 技能 | 用途 |
| --- | --- |
| `priv-skill-api-contract` | 对齐 REST、GraphQL、RPC、mock、生成客户端、DTO、schema、OpenAPI、分页、错误、权限和集成测试等前后端契约。 |
| `priv-skill-database-change` | 安全处理 MySQL/Postgres schema、迁移、DDL/DML、索引、查询优化、分页、数据修复、回填和回滚。 |
| `priv-skill-db-api` | 当一次改动同时跨 API 和持久化层时使用，覆盖端点、schema、查询、迁移、验证、DTO 和集成测试。 |

### 交付与审查

| 技能 | 用途 |
| --- | --- |
| `priv-skill-code-review` | 对 diff、分支、指定文件或 WIP 改动做轻量审查，关注标准合规、需求匹配、回归风险、测试缺口和前后端正确性。 |
| `priv-skill-release-devops` | 处理 Docker、docker-compose、环境变量、构建脚本、CI 检查、pre-commit、冒烟测试、部署说明、回滚和发布准备。 |
| `priv-skill-requirement-change` | 分析业务规则、字段、流程、文案、边界、权限、数据语义、验收标准或实现计划变化带来的影响。 |
| `priv-skill-technical-doc` | 创建或更新面向开发、QA、运维、干系人或未来 agent 的技术文档，例如方案、接口、数据库、部署、测试、排障、ADR 和交接文档。 |

### 设计与页面风格

| 技能 | 用途 |
| --- | --- |
| `priv-skill-design-ui` | 为页面、屏幕、landing page、dashboard、文档站和原型提供轻量 UI 风格方向、`DESIGN.md` 建议、设计 token 和组件样式判断。 |

### 探索与维护

| 技能 | 用途 |
| --- | --- |
| `priv-skill-codebase-map` | 只读梳理陌生模块、功能、调用路径、数据流、依赖、边界和现有模式，帮助决定在哪里改、什么调用什么。 |
| `priv-skill-prototype-spike` | 用可抛弃的 UI、状态机、业务规则、数据模型、API 流或交互原型，在正式实现前快速验证不确定性。 |
| `priv-skill-update` | 审查 `.tmp/gstack`、`.tmp/superpowers`、`.tmp/skills`、`.tmp/awesome-design-md` 等外部技能更新，并选择性增强 0.2.0 技能集。 |

## 本地开发

这个目录是本地 Codex 安装的事实源。开发阶段建议把本地插件源和缓存都符号链接到这里，这样仓库中的 skill 更新可以直接被后续 Codex 新线程加载，而不需要手动复制文件。
