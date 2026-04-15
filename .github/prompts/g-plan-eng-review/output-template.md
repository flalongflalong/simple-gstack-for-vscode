# 保存工程评审输出 — 模板与规则

> 本文件是 `g-plan-eng-review.prompt.md` 评审完成后的输出模板和保存规则。

## 保存模式

**逐模块评审模式**：每个模块完成后**立即追加**该模块的内容到文件，不要等全部模块完成。`ARCHITECTURE.md` 和 `MILESTONES.md` 在所有模块完成后统一生成。

**单次评审模式**：全部评审完成后统一保存。

## 1. 保存到 `.context/eng-plan.md`

> **模板原则**：该文件是后续所有角色的单一权威来源。`/tasks` 从中拆分任务，`/implement` 按此编码，`/review` 对照此检查范围漂移。信息密度 > 篇幅——每一节都必须给下游角色提供可操作的信息。

```markdown
# [功能名称] 工程评审计划

> **目标：** [一句话描述本次迭代要交付什么]
>
> **架构概要：** [2-3 句话描述核心技术方案]
>
> **技术栈：** [关键技术/库/框架]

**日期：** YYYY-MM-DD
**分支/任务：** [描述]
**完整性得分：** X/Y 项选择了完整方案

---

## 1. 文件影响图 (File Impact Map)

> 供 `/tasks` 做任务粒度拆分，供 `/review` 对照范围漂移。

| 操作 | 文件路径 | 职责说明 |
|------|----------|----------|
| 新建 | `src/services/example.ts` | [该文件做什么] |
| 修改 | `src/components/App.tsx` | [改动什么、为什么] |
| 新建 | `tests/services/example.test.ts` | [测试覆盖什么] |

## 2. 架构决策与系统图 (Architecture)

[ASCII 架构图 — 组件依赖、数据流向或状态机转换]

**关键决策：**
- **[决策 1]** [Layer 1/2/3]：[选择了什么] — [一句话理由]
- **[决策 2]** [Layer 1/2/3]：[选择了什么] — [一句话理由]

**Design It Twice 记录**（仅限核心模块接口）：
- **[模块名]**：选择了 [方向 A]（深模块 / 浅模块），否决了 [方向 B] 因为 [理由]

## 3. 模块分解与接口契约 (Modules & Interfaces)

### 模块 A: [名称]
- **职责：** [单一职责描述]
- **公共接口：**
  ```
  输入: [类型/格式]
  输出: [类型/格式]
  副作用: [无 / 写入数据库 / 发送事件 等]
  ```
- **依赖：** [依赖哪些模块/服务]
- **错误处理：** [抛出什么异常、调用方如何感知]

### 模块 B: [名称]
[同上格式]

## 4. 测试矩阵 (Test Matrix)

[ASCII 覆盖率路径图 — 来自步骤 3 的输出]

**关键 GAP：**
| # | 路径 | 类型 | 优先级 |
|---|------|------|--------|
| 1 | [描述] | 单元/E2E/eval | CRITICAL/HIGH |

## 5. 已知失败模式 (Failure Modes)

| # | 失败场景 | 有测试? | 有错误处理? | 用户感知 | 评级 |
|---|----------|---------|-------------|----------|------|
| 1 | [超时/竞态/空引用...] | ✅/❌ | ✅/❌ | [明确报错/静默失败] | 关键盲点/已覆盖 |

## 6. 领域模型 (Domain Model)

> 供 `/implement` 编写类型骨架，供 `/review` 校验数据结构一致性。

### 实体关系图

[ASCII 实体关系图 — 实体名、关键属性、关系线（1:1 / 1:N / N:M）]

### 实体与值对象定义

```typescript
// 领域实体（有唯一标识）
interface EntityName {
  id: string;
  // ... 关键属性及类型
}

// 值对象（无标识、不可变）
type ValueObjectName = {
  // ... 属性及类型
};
```

### 数据转换边界

| 边界 | 源类型 | 目标类型 | 转换位置 | 说明 |
|------|--------|----------|----------|------|
| API → Domain | [DTO] | [Entity] | `src/mappers/` | [转换逻辑摘要] |
| Domain → UI | [Entity] | [ViewModel] | `src/viewModels/` | [转换逻辑摘要] |

## 7. 复用抽象清单 (Reusable Abstractions)

> 供 `/tasks` 生成 EXTRACT 任务，供 `/implement` 优先实现复用模块。

### Hooks（前端）

| Hook 名 | 接口签名 | 使用模块 | 抽象理由 |
|---------|---------|---------|----------|
| `useExample()` | `() => { data: T; loading: boolean }` | ModuleA, ModuleB | 2+ 处相同的数据获取模式 |

### 共享组件（前端）

| 组件名 | Props 接口 | 使用场景 | 抽象理由 |
|-------|-----------|---------|----------|
| `DataTable` | `{ columns: Column[]; data: T[] }` | PageA, PageB | 2+ 处相同的表格渲染 |

### 工具函数 / 服务

| 函数/服务名 | 签名 | 使用模块 | 备注 |
|------------|------|---------|------|
| `validateEmail` | `(input: string) => ValidationResult` | FormA, FormB | 通用验证逻辑 |

### 组件层级树（前端项目）

```
[Container] AppShell         → 数据获取 + 路由
  [Container] PageDashboard  → 聚合查询 + 状态
    [Presentational] StatCard → 纯渲染
    [Shared] DataTable        → 通用表格
  [Container] PageSettings   → 配置读写
    [Shared] FormField        → 通用表单项
```

## 8. 模块依赖规则 (Module Dependency Rules)

> 供 `/implement` 检查 import 方向，供 `/review` 审计依赖合规。

### 依赖方向图

```
Pages/Views → Containers → Services → Repository → DB/API
     ↓              ↓          ↓
  Shared Components  Hooks    Utils

禁止反向依赖：Service 不得 import Page，Repository 不得 import Service
```

### 依赖约束表

| 源模块 | 允许依赖 | 禁止依赖 |
|--------|---------|----------|
| Pages | Containers, Shared, Hooks, Services | Repository, DB |
| Services | Repository, Utils | Pages, Components |
| Repository | DB/API adapter, Utils | Services, Pages |

## 9. 验收标准 (Acceptance Criteria)

> 供 `/qa` 和 `/review` 判断"完成"的定义。

- [ ] [用户可做到 X，且 Y 条件下不报错]
- [ ] [接口返回格式符合第 3 节契约]
- [ ] [测试覆盖率达到第 4 节要求，关键盲点归零]
- [ ] [性能指标：核心操作响应 < Nms]

## 10. NOT in scope

| 推迟项 | 理由 |
|--------|------|
| [功能/优化] | [为什么不在本次做] |

## 11. 已有代码复用 (Existing Code Leverage)

| 子问题 | 已有代码/模式 | 本计划处理方式 |
|--------|---------------|----------------|
| [描述] | `src/utils/xxx.ts` | 直接复用 / 扩展 / 重建（附理由） |

## 完成摘要

- 范围挑战：___（按原计划推进 / 已缩减范围）
- 架构评审：___ 个问题
- 领域建模：___ 个实体，___ 个值对象，建模自检 ___/6 通过
- 复用抽象：___ 个 Hook / ___ 个共享组件 / ___ 个工具函数
- 模块依赖：___（无环 / 存在循环——已修正）
- 代码质量评审：___ 个问题
- 测试评审：已生成图，___ 个 GAP
- 性能评审：___ 个问题
- 失败模式：___ 个关键盲点
- 完整性得分：X/Y 项选择了完整方案
```

## 2. 更新或创建 `ARCHITECTURE.md`

如果文件存在，在末尾追加本次的 ADR 条目：

```markdown
## ADR-{N}: [决策标题]
日期: YYYY-MM-DD
状态: 已接受

### 背景
[为什么需要做这个决策]

### 决策
[做了什么决定]

### 后果
[选择此方案的权衡：优点/缺点/已知限制]
```

如果文件不存在，先创建：

```markdown
# 架构决策记录 (Architecture Decision Records)

## ADR-1: [决策标题]
...
```

## 3. 在 `MILESTONES.md` 末尾追加一行

```
| YYYY-MM-DD | /plan-eng-review | 完成架构评审：[一句话总结] | .context/eng-plan.md, .context/test-plan.md, ARCHITECTURE.md |
```

## 4. 追加学习记录到 `.context/learnings.md`

评审过程中如发现值得记录的**架构洞察、技术选型经验或复杂度模式**，追加到 `.context/learnings.md`（不存在则创建）。只追加，不修改已有条目。

**记录准则**：只记录"下次还会遇到"的架构级洞察，不记录具体实现细节。例如：
- ✅ "本项目使用 event sourcing 时需特别注意快照策略"
- ✅ "微服务间通信选择同步 RPC 而非消息队列的原因"
- ❌ "在 src/services/billing.ts 中用了 Stripe SDK v3"

格式：
```markdown
### [模式|陷阱|架构] (Patterns|Pitfalls|Architecture)
- **[关键词]**: [洞察] — 来源: /plan-eng-review, YYYY-MM-DD
```
