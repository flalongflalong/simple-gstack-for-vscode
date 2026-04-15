# simple-gstack-for-vscode

> 基于 [garrytan/gstack](https://github.com/garrytan/gstack) 的简化版本，专为 **VS Code Copilot Chat** 用户整理的工程化 Prompt 集合。

原项目 gstack 提供了一套完整的虚拟研发团队 Prompt 体系，涵盖从产品构思到代码上线的全流程角色分工。本仓库在此基础上做了精简与适配，将核心 Prompt 整理为 VS Code `.prompt.md` 文件格式，开箱即用。

## 特性

- 17 个角色 Prompt，覆盖从需求孵化到版本发布、再到上下文归档的完整研发周期
- 直接在 VS Code Copilot Chat 中通过 `/指令名` 调用，零配置
- 提供模型选择建议，帮助在不同开发阶段选用最合适的 AI 模型
- 强化 `.context/` 迭代上下文约定，支持读取当前活跃迭代与历史方案
- 关键角色支持结构化审查模式与经验沉淀，减少重复讨论和重复踩坑
- 核心链路角色均内置角色边界声明 + 上下文栅栏，防止 AI 越权或误把蓝图当指令执行

## 快速开始

1. 克隆本仓库到本地（或直接复制 `.github/` 目录到你的项目中）
2. 用 VS Code 打开项目
3. 打开 Copilot Chat，输入 `/` 即可看到可用的 Prompt 列表
4. 按照下方[协作流水线](#%EF%B8%8F-标准协作流水线-the-sprint-workflow)中的顺序调用各角色

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
| **`/qa-only`** | QA 报告员 | **只报不修** | 只输出 Bug 报告与健康度评分，不修改任何代码。 |
| **`/investigate`** | 排障专家 | **根因调查** | 事故中，通过假设验证寻找深层报错的真实原因。 |
| **`/design-review`** | 视觉审计员 | **审美抛光** | 发布前，对已实现的 UI 进行实物打磨与细节纠偏。 |
| **`/design-shotgun`** | 设计探索师 | **多向探索** | 设计决策前，生成多种截然不同的设计方向供对比评审。 |
| **`/ship`** | 发布工程师 | **安全发版** | 发版时，执行合并前检查、版本号管理、Changelog 生成与 PR 创建。 |
| **`/document-release`** | 技术作家 | **商业包装** | 发版前，将代码改动包装为面向用户的 Changelog。 |
| **`/context-archive`** | 归档师 | **上下文治理** | 里程碑后，清理过程制品、提炼决策摘要、归档历史文件，为下轮迭代留下干净现场。 |

---

## 🤖 模型选择建议 (Brain Selection)

为了获得最佳输出质量，建议在 VS Code Copilot 中根据开发阶段手动切换底层模型：

| 开发阶段 | 建议模型 | 匹配理由 |
| :--- | :--- | :--- |
| **构思与架构 (`/ceo`, `/plan-eng-review`, `/tasks`)** | Claude Opus | 擅长复杂系统设计和深度推理，幻觉极低。任务拆分需要对架构蓝图做深度理解与依赖排序。 |
| **业务编码 (`/implement` - UI/业务)** | Claude Sonnet | 速度极快，对前端框架和现代语法支持完善。 |
| **核心攻坚 (`/implement` - 算法/底层)** | o3 / Codex | 擅长复杂算法、底层协议、并发锁逻辑及数学闭环。 |
| **严苛审查 (`/review`, `/cso`)** | GPT-4o / o3 | 规则遵循严格，易发现隐藏的安全与逻辑漏洞。 |
| **深度排障 (`/investigate`, `/qa`)** | o3 / Codex | 针对编程深度优化，逻辑链路清晰，适合死磕疑难杂症。 |
| **视觉与文档 (`/design-review`, `/document-release`)** | Claude Sonnet | 输出最像人类，文字有温度，对 CSS 色彩和间距感官敏锐。 |
| **上下文归档 (`/context-archive`)** | Claude Opus | 需要理解全量上下文后做信息提炼与取舍判断，对精确度要求高。 |

---

## 🏎️ 标准协作流水线 (The Sprint Workflow)

```
/office-hours → /ceo → /plan-eng-review → /tasks → /implement → /review → /qa → /cso → /ship → /document-release → /context-archive
```

### 阶段 1：需求与架构 (Think)

1. **`/office-hours`**：产品发现 — 通过灵魂拷问确认需求不是伪命题
2. **`/ceo`**：战略过滤 — 决定做什么、不做什么、边界在哪，产出 `ceo-review.md`
3. **`/plan-eng-review`**：架构蓝图 — 锁定数据流、接口契约、测试矩阵，产出 `eng-plan.md`
4. **`/design-consultation` ➔ `/plan-design-review`**（可选）：前端项目的视觉规范和交互预审

### 阶段 2：任务规划与编码 (Build)

5. **`/tasks`**：将架构蓝图拆解为原子任务清单与迭代看板，产出 `tasks.md` 和 `sprint.md`
6. **`/implement`**：严格按照架构蓝图编写代码与单元测试，逐任务提交

### 阶段 3：审查与质量 (Verify)

7. **`/review`**：合并前审查，寻找竞态条件、安全漏洞、范围漂移，产出 `review-findings.md`
8. 根据发现分流：
   - 🔀 **逻辑漏洞 / 回归缺陷** ➔ **`/qa`**（缺陷修复 + 回归测试）
   - 🔀 **越权 / 供应链风险** ➔ **`/cso`**（安全审计 + STRIDE 威胁建模）
   - 🔀 **深层疑难 Bug** ➔ **`/investigate`**（根因分析 + 假设验证链路）

### 阶段 4：交付 (Ship)

9. **`/design-review`**（可选）：消除 UI 上的"AI 塑料感"
10. **`/ship`**：合并前检查、版本号管理、Changelog 生成与 PR 创建
11. **`/document-release`**：生成面向用户的 Release Notes

### 阶段 5：归档 (Archive)

12. **`/context-archive`**：提炼 `eng-plan.md`、`ceo-review.md` 为决策摘要，将 `tasks.md`、`sprint.md`、审查发现等过程文件移入 `.context-archive/{功能名}/`，合并 `learnings.md` 到根目录，为下轮迭代留下干净现场。

---

## 📂 制品目录说明

| 目录 | 来源 | 内容 |
|------|------|------|
| `.context/{功能名}/` | gstack 角色 | `eng-plan.md`（架构蓝图）、`ceo-review.md`（范围定义）、`review-findings.md`（审查发现）等 |
| `.context-archive/{功能名}/` | `/context-archive` | 归档的过程制品原件（`tasks.md`、`sprint.md`、审查发现等）及提炼前的原始文件 |
| `MILESTONES.md` | 全局共享 | 里程碑日志，各角色完成核心产出后追加 |
| `ARCHITECTURE.md` | 跨迭代累积 | ADR 条目，每次架构决策后追加，不可删除 |

---

## 💡 核心协作铁律

1. **角色隔离**：画图纸的（`/plan-eng-review`）绝对不直接写核心代码；写代码的（`/implement`）绝对不自己做代码审查。隔离能最大程度消除 AI 的"自恋偏见"。
2. **拒绝盲目修改**：遵循 `/investigate` 的精神——没有明确的日志证据或错误栈，绝对不瞎改代码。
3. **测试驱动闭环**：无论是首次编码还是修 Bug，都必须伴随测试用例的产出。
4. **只看文件**：所有角色的决策依据来自 `.context/` 文件和代码库，不基于对话中"之前讨论过"的内容。

---

## 致谢

本项目基于 [garrytan/gstack](https://github.com/garrytan/gstack) 改编，感谢原作者的优秀工作。
