# simple-gstack-for-vscode

> 基于 [garrytan/gstack](https://github.com/garrytan/gstack) 的简化版本，专为 **VS Code Copilot Chat** 用户整理的工程化 Prompt 集合。

原项目 gstack 提供了一套完整的虚拟研发团队 Prompt 体系，涵盖从产品构思到代码上线的全流程角色分工。本仓库在此基础上做了精简与适配，将核心 Prompt 整理为 VS Code `.prompt.md` 文件格式，开箱即用。

## 特性

- 12 个角色 Prompt，覆盖从需求孵化到版本发布的完整研发周期
- 直接在 VS Code Copilot Chat 中通过 `/指令名` 调用，零配置
- 提供模型选择建议，帮助在不同开发阶段选用最合适的 AI 模型

## 快速开始

1. 克隆本仓库到本地（或直接复制 `.github/` 目录到你的项目中）
2. 用 VS Code 打开项目
3. 打开 Copilot Chat，输入 `/` 即可看到可用的 Prompt 列表
4. 按照下方[协作流水线](#%EF%B8%8F-标准协作流水线-the-sprint-workflow)中的顺序调用各角色

## 🧭 角色速查手册 (The Team)

| 指令 | 角色 | 核心价值 | 适用场景 |
| :--- | :--- | :--- | :--- |
| **`/office-hours`** | YC 创业导师 | **点子孵化** | 动工前，通过灵魂拷问确认需求是否为伪命题。 |
| **`/ceo`** | 虚拟 CEO | **范围控制** | 决策前，决定是扩张产品野心还是缩减至 MVP。 |
| **`/design-consultation`** | 资深设计顾问 | **规范定义** | 开坑前，从零构建视觉系统并定义 `DESIGN.md`。 |
| **`/plan-eng-review`** | 工程经理 | **架构蓝图** | 编码前，锁定架构、状态机、数据流与接口契约。 |
| **`/plan-design-review`** | 产品设计师 | **交互预审** | 编码前，补全 UI 遗漏状态，严防 AI 塑料感设计。 |
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

### 1. 需求与规划 (Think & Plan)
- **`/office-hours` ➔ `/ceo`**：确认点子价值，选定战术模式（扩张或缩减）。
- **`/plan-eng-review`**：**[关键步骤]** 生成架构蓝图、数据流和测试矩阵。不要在此步骤直接写业务代码。
- **`/design-consultation` ➔ `/plan-design-review`**：确定前端视觉规范，预审空状态和错误提示。

### 2. 工程施工 (Build)
- 开启 Copilot Edit 模式（或在 Chat 中明确指定文件）。
- 使用 **`/implement`** 指令，附上第一步产出的蓝图。
- *提示：常规业务用 Sonnet；极其复杂的算法或并发逻辑用 o3 / Codex。*

### 3. 验收与分流 (Verify & Route)
完成编码后，使用 **`/review`** 进行合并前审查。根据 Review 建议的性质分流：
- 🔀 **逻辑漏洞 / 性能瓶颈 / 报错** ➔ **`/qa`**【缺陷修复 + 补回归测试】
- 🔀 **功能漏做 / 不符合架构蓝图** ➔ **`/implement`**【代码补全与蓝图对齐】
- 🔀 **敏感操作 / 越权风险** ➔ **`/cso`**【安全重构】

### 4. 交付 (Polish & Ship)
- 运行前端，使用 **`/design-review`** 消除 UI 上的"AI 塑料感"。
- 准备提交 PR，使用 **`/document-release`** 生成专业的 Release Notes。

---

## 💡 核心协作铁律

1. **角色隔离**：画图纸的（`/plan-eng-review`）绝对不直接写核心代码；写代码的（`/implement`）绝对不自己做代码审查。隔离能最大程度消除 AI 的"自恋偏见"。
2. **拒绝盲目修改**：遵循 `/investigate` 的精神——没有明确的日志证据或错误栈，绝对不瞎改代码。
3. **测试驱动闭环**：无论是 `/implement` 首次写代码，还是 `/qa` 修 Bug，都必须伴随测试用例的产出。

---

## 致谢

本项目基于 [garrytan/gstack](https://github.com/garrytan/gstack) 改编，感谢原作者的优秀工作。