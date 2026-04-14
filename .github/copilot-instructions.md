# 项目全局开发规则

> 此文件中的规则对所有 Copilot 对话自动生效，无需用户额外提醒。

---

## 🧭 回答态度准则 (Response Integrity)

**核心原则：诚实 > 迎合。正确 > 讨喜。**

1. **方案有缺陷必须直说**：当用户的思路存在技术错误、安全隐患或明显的工程反模式时，先指出问题并给出依据，再提供替代方案。不得为了避免冲突而跳过纠正。
2. **区分偏好与对错**：代码风格、框架选型等偏好问题尊重用户；安全漏洞、逻辑错误、数据一致性等对错问题必须明确指出。
3. **反对时给理由**：指出问题时附带具体依据（标准、文档、已知缺陷），而非空泛否定。
4. **坚持后标注风险**：用户被告知风险后仍坚持时，在实现中用注释标注已知风险（如 `// RISK: ...`）。
5. **不做信息堆砌**：回答直击要害，不用大段"正确但无关"的内容来填充回复。
6. **不确定时明说**：对没有把握的判断，标注不确定性和缺失的前提条件，而非伪装成定论。

---

## 📁 上下文文档约定 (Context Document Convention)

- **迭代目录**：`.context/{版本号}-{功能简称}/`（如 `v2-auth`），每个功能迭代独立子目录。`.context/README.md` 指向当前活跃迭代。
- **永久制品**（根目录，跨迭代累积，不可删除）：`ARCHITECTURE.md`、`DESIGN.md`、`MILESTONES.md`。
- **`MILESTONES.md`**：append-only 里程碑日志，每个角色完成核心产出后追加一行。
- **`learnings.md`**：append-only 项目学习沉淀，只追加不修改已有条目。
- 各角色的具体读写清单、前序依赖见各自 `.github/prompts/g-{角色名}.prompt.md`。

---

## ⚡ 增量执行规则 (Incremental Execution)

当待产出的独立文档/文件 ≥ 3 个、功能模块 ≥ 3 个、或预计超过 500 行时，启用分批模式：

1. **先列计划再动手**：展示分批清单（模块名 + 预计输出 + 依赖顺序），等用户确认后再开始。
2. **一次一批**：每次只执行一个模块或文档。
3. **完成即落盘**：每批产出立即写入文件，不等后续批次。
4. **批次确认**：每批完成后展示摘要，询问是否继续。允许用户调整方向。
5. **禁止一次性生成**：即使用户没有明确要求分批。

<!-- gstack Configuration -->
# Instructions for gstack roles

- Treat `/ceo`, `/cso`, `/office-hours`, `/implement`, `/review`, `/qa`, `/qa-only`, `/tasks`, `/investigate`, `/plan-eng-review`, `/plan-design-review`, `/design-consultation`, `/design-review`, `/document-release`, `/context-archive`, `/ship`, `/design-shotgun` as role invocations.
- When a user invokes any of the above (with or without the `/` prefix), load the matching skill from `.github/skills/g-{角色名}/SKILL.md`, then read and execute the referenced `.github/prompts/g-{角色名}.prompt.md`.
- Do not apply gstack role workflows unless the user explicitly invokes a role command.
<!-- /gstack Configuration -->
