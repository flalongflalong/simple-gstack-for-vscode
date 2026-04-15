# 保存产出 — 模板与完成摘要

> 本文件是 `g-tasks.prompt.md` 分解完成后的输出模板和保存规则。

## 1. 保存到 `.context/tasks.md`

```markdown
# 任务清单 (Task List)
来源：.context/eng-plan.md
生成日期：YYYY-MM-DD
更新日期：YYYY-MM-DD

## 任务统计
- 总任务数：XX
- [ ] TODO：XX
- [→] IN PROGRESS：XX
- [✓] DONE：XX
- [!] BLOCKED：XX
- [DEFERRED]：XX

---

## 模块一：{模块名}

### TASK-001: {标题}
...（完整任务格式）

---

## 模块二：{模块名}
...

---

## [DEFERRED] 已推迟任务

### TASK-XXX: {标题}
...
```

## 2. 保存到 `.context/sprint.md`（迭代看板，Phase 2 产出）

```markdown
# 迭代看板 (Sprint Board)
生成日期：YYYY-MM-DD
目标：{本轮目标}

## 本轮在做

| 任务 | 标题 | 状态 | 估算 | 优先级 |
|------|------|------|------|--------|
| TASK-001 | {标题} | [ ] TODO | ~30m | P1 |

## 下轮积压

| 任务 | 标题 | 推迟原因 |
|------|------|----------|
| TASK-007 | {标题} | 依赖 TASK-003 |

## 明确不做

| 任务 | 标题 | 来源 |
|------|------|------|
| TASK-015 | {标题} | NOT in scope |
```

## 3. 更新 `TODOS.md`（推迟任务备忘）

追加 Phase 3 整理的条目到 `TODOS.md`。如文件不存在，先创建：

```markdown
# TODOS

<!-- 格式：## 模块名 → ### 任务标题 → What/Why/Context/Effort/Priority -->
```

## 4. 在 `MILESTONES.md` 末尾追加一行

```
| YYYY-MM-DD | /tasks | 完成任务分解：共 XX 个原子任务，本轮迭代 XX 个 | .context/tasks.md, .context/sprint.md |
```

---

## 完成摘要模板

分解结束时展示：

```
任务分解完成摘要
══════════════════════════════
总原子任务：XX 个
  - 实现类：XX 个
  - 测试类：XX 个（其中 CRITICAL 回归测试：XX 个）
  - 修复/边界处理：XX 个
  - 文档/配置：XX 个

本轮迭代（sprint.md）：XX 个任务，预计 ~XX 小时（AI 辅助）
推迟到 TODOS.md：XX 条
明确不做（DEFERRED）：XX 个

下一步建议：
  → 运行 /implement 开始实现（从 P0/BLOCKER 任务开始）
  → 每完成一批任务后运行 /review 进行合并前审查
══════════════════════════════
```
