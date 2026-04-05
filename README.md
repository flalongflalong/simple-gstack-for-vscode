# simple-gstack-for-vscode

> 基于 [garrytan/gstack](https://github.com/garrytan/gstack) 的简化版本，专为 **VS Code Copilot Chat** 用户整理的工程化 Prompt 集合。

原项目 gstack 提供了一套完整的虚拟研发团队 Prompt 体系，涵盖从产品构思到代码上线的全流程角色分工。本仓库在此基础上做了精简与适配，将核心 Prompt 整理为 VS Code `.prompt.md` 文件格式，开箱即用。

## 特性

- 13 个角色 Prompt，覆盖从需求孵化到版本发布的完整研发周期
- 直接在 VS Code Copilot Chat 中通过 `/指令名` 调用，零配置
- 提供模型选择建议，帮助在不同开发阶段选用最合适的 AI 模型
- 强化 `.context/` 迭代上下文约定，支持读取当前活跃迭代与历史方案
- 关键角色支持结构化审查模式与经验沉淀，减少重复讨论和重复踩坑
- 集成 [get-shit-done](https://github.com/get-shit-done-cc/get-shit-done) (GSD) 框架，补充状态持久化、wave 并行执行和自动验证闭环能力
- gstack × GSD 跨系统制品桥接，`.context/` 与 `.planning/` 目录自动互通

## 快速开始

1. 克隆本仓库到本地（或直接复制 `.github/` 目录到你的项目中）
2. 安装 GSD 框架（可选但推荐）：
   ```bash
   npx get-shit-done-cc --copilot --local
   ```
3. 用 VS Code 打开项目
4. 打开 Copilot Chat，输入 `/` 即可看到可用的 Prompt 列表
5. 按照下方[协作流水线](#%EF%B8%8F-标准协作流水线-the-sprint-workflow)中的顺序调用各角色

历史升级内容与同步记录见 [CHANGELOG.md](CHANGELOG.md)。

## 🧭 角色速查手册 (The Team)

| 指令 | 角色 | 核心价值 | 适用场景 |
| :--- | :--- | :--- | :--- |
| **`/office-hours`** | YC 创业导师 | **点子孵化** | 动工前，通过灵魂拷问确认需求是否为伪命题。 |
| **`/ceo`** | 虚拟 CEO | **范围控制** | 决策前，决定是扩张产品野心还是缩减至 MVP。 |
| **`/design-consultation`** | 资深设计顾问 | **规范定义** | 开坑前，从零构建视觉系统并定义 `DESIGN.md`。 |
| **`/plan-eng-review`** | 工程经理 | **架构蓝图** | 编码前，锁定架构、状态机、数据流与接口契约。 |
| **`/plan-design-review`** | 产品设计师 | **交互预审** | 编码前，补全 UI 遗漏状态，严防 AI 塑料感设计。 |
| **`/tasks`** | 任务分解师 | **施工路线图** | 编码前，将架构蓝图拆解为原子任务清单与迭代看板，产出 `tasks.md` 和 `sprint.md`。 |
| **`/implement`** | **高级开发** | **编码落地** | **施工期**，严格按照架构蓝图编写代码与单元测试。⚠️ *VS Code 新增角色，原版 gstack 无此指令——因 Copilot Chat 无法像 Claude Code 那样自主操作文件系统，故显式定义施工规则以约束 AI 在对话模式下的实现行为。* |
| **`/review`** | Staff 工程师 | **代码审查** | 提交前，寻找竞态条件、边界漏洞与逻辑盲点。 |
| **`/cso`** | 首席安全官 | **攻防审计** | 合并前，模拟黑客攻击，检查供应链与越权风险。 |
| **`/qa`** | 全链路 QA | **闭环修复** | 调试中，针对缺陷进行“定位 ➔ 修复 ➔ 回归测试”。 |
| **`/investigate`** | 排障专家 | **根因调查** | 事故中，通过假设验证寻找深层报错的真实原因。 |
| **`/design-review`** | 视觉审计员 | **审美抛光** | 发布前，对已实现的 UI 进行实物打磨与细节纠偏。 |
| **`/document-release`** | 技术作家 | **商业包装** | 发版前，将代码改动包装为面向用户的 Changelog。 |

---

## 🤖 模型选择建议 (Brain Selection)

为了获得最佳输出质量，建议在 VS Code Copilot 中根据开发阶段手动切换底层模型：

| 开发阶段 | 建议模型 | 匹配理由 |
| :--- | :--- | :--- |
| **构思与架构 (`/ceo`, `/plan-eng-review`)** | Claude Opus | 擅长复杂系统设计和深度推理，幻觉极低。 |
| **业务编码 (`/implement` - UI/业务)** | Claude Sonnet | 速度极快，对前端框架和现代语法支持完善。 |
| **核心攻坚 (`/implement` - 算法/底层)** | o3 / Codex | 擅长复杂算法、底层协议、并发锁逻辑及数学闭环。 |
| **严苛审查 (`/review`, `/cso`)** | GPT-4o / o3 | 规则遵循严格，易发现隐藏的安全与逻辑漏洞。 |
| **深度排障 (`/investigate`, `/qa`)** | o3 / Codex | 针对编程深度优化，逻辑链路清晰，适合死磕疑难杂症。 |
| **视觉与文档 (`/design-review`, `/document-release`)** | Claude Sonnet | 输出最像人类，文字有温度，对 CSS 色彩和间距感官敏锐。 |

---

## 🏎️ 标准协作流水线 (The Sprint Workflow)

本项目采用 **gstack（角色思考）+ GSD（自动执行）** 联合工作模式，各取所长：

```
  Think（gstack）            Execute（GSD）             Verify（gstack）
┌──────────────────┐    ┌────────────────────────┐    ┌──────────────────┐
│ /office-hours    │    │ /gsd-plan-phase        │    │ /review          │
│ /ceo             │ ─→ │ /gsd-execute-phase     │ ─→ │ /qa              │
│ /plan-eng-review │    │  (状态持久化 + 并行)    │    │ /cso             │
└──────────────────┘    └────────────────────────┘    └──────────────────┘
  产出 → .context/         消费 → --prd eng-plan.md       消费 → .planning/
```

### 阶段 1：需求与架构 — gstack 主导 (Think)

> gstack 的角色扮演体系擅长挑战需求、审视架构，这些是 GSD 不具备的能力。

1. **`/office-hours`**：产品发现 — 通过灵魂拷问确认需求不是伪命题
2. **`/ceo`**：战略过滤 — 决定做什么、不做什么、边界在哪
3. **`/plan-eng-review`**：架构蓝图 — 锁定数据流、接口契约、测试矩阵，产出 `eng-plan.md`
4. **`/design-consultation` ➔ `/plan-design-review`**（可选）：前端视觉规范和交互预审

> **产出位置**：`.context/{功能名}/eng-plan.md`、`ceo-review.md` 等

### 阶段 2：任务规划与执行 — GSD 主导 (Plan & Execute)

> GSD 在任务分解（wave 并行）、状态持久化和自动验证上远强于 gstack 的 `/tasks` + `/implement`。

1. **注入架构蓝图**（关键桥接点——让 GSD 读到 gstack 的产出）：
   ```
   /gsd-plan-phase <phase> --prd .context/{功能名}/eng-plan.md
   ```
   GSD 会自动将 `eng-plan.md` 转换为 `.planning/` 下的 `CONTEXT.md`。

2. **执行**：
   ```
   /gsd-execute-phase <phase>
   ```
   GSD 按 wave 分组并行执行任务，每个 task 原子提交，自动做 checkpoint。

> **产出位置**：`.planning/phases/*/PLAN.md`、`STATE.md`、`VERIFICATION.md`

### 阶段 3：审查与质量 — gstack 主导 (Verify)

> GSD 的 verifier 只检查"目标是否达成"，gstack 的审查角色能发现竞态条件、安全漏洞、范围漂移等深层问题。

使用 **`/review`** 进行合并前审查。它会同时读取 `.context/eng-plan.md` 和 `.planning/PLAN.md`，对照范围漂移。根据发现分流：

- 🔀 **逻辑漏洞 / 性能瓶颈 / 回归缺陷** ➔ **`/qa`**（缺陷修复 + 回归测试）
- 🔀 **功能漏做 / 不符合架构蓝图** ➔ 回到阶段 2 补充执行
- 🔀 **敏感操作 / 越权风险** ➔ **`/cso`**（安全审计 + STRIDE 威胁建模）
- 🔀 **深层疑难 Bug** ➔ **`/investigate`**（根因分析 + 假设验证链路）

### 阶段 4：交付 (Polish & Ship)

- **`/design-review`**：消除 UI 上的"AI 塑料感"
- **`/document-release`**：生成面向用户的 Release Notes

### 纯 gstack 模式（不使用 GSD）

如果不安装 GSD，仍可使用纯 gstack 流程：

```
/office-hours → /ceo → /plan-eng-review → /tasks → /implement → /review → /qa → /cso
```

此模式下由 `/tasks` 替代 GSD 做任务分解，`/implement` 直接编码。适用于小型改动或不需要状态持久化的场景。

---

## 📂 制品目录说明

| 目录 | 来源 | 内容 |
|------|------|------|
| `.context/{功能名}/` | gstack 角色 | `eng-plan.md`（架构蓝图）、`ceo-review.md`（范围定义）、`review-findings.md`（审查发现）等 |
| `.planning/` | GSD 框架 | `STATE.md`（项目状态）、`ROADMAP.md`（路线图）、`phases/*/PLAN.md`（执行计划） |
| `MILESTONES.md` | 两个系统共享 | 全局进度日志，gstack 和 GSD 角色完成工作后都会追加 |

两个系统的制品通过 `copilot-instructions.md` 中的桥接规则自动互通，无需手动同步。

---

## 💡 核心协作铁律

1. **角色隔离**：画图纸的（`/plan-eng-review`）绝对不直接写核心代码；写代码的（`/implement`、GSD executor）绝对不自己做代码审查。隔离能最大程度消除 AI 的"自恋偏见"。
2. **拒绝盲目修改**：遵循 `/investigate` 的精神——没有明确的日志证据或错误栈，绝对不瞎改代码。
3. **测试驱动闭环**：无论是首次编码还是修 Bug，都必须伴随测试用例的产出。
4. **制品互通**：gstack → GSD 用 `--prd` 注入；GSD → gstack 通过 `/review` 等角色自动读取 `.planning/` 制品。不要让任何一方在信息真空中工作。

---

## 致谢

本项目基于 [garrytan/gstack](https://github.com/garrytan/gstack) 改编，感谢原作者的优秀工作。
