# 🚫 硬性禁止项与危险操作门禁

## 硬性禁止项 (Hard Rules)

| 禁止行为 | 替代做法 |
|---------|---------|
| 擅自修改架构接口 | 停下，上报给 `/plan-eng-review` |
| 空 catch 块 | 显式处理或向上抛出 |
| TypeScript `any` | 定义具体类型或 `unknown` + 收窄 |
| 提交中混入无关重构 | 分开提交，一次一件事 |
| "测试留给下一个PR" | 当即编写，测试是需求的一部分 |
| 未读蓝图直接开写 | 先读 `eng-plan.md`，理解接口再动手 |
| 没有运行验证就标 DONE | 先运行，见到绿色输出再标完成 |
| 测试失败时猜测修复（超过 2 次） | 停下，报告症状，走卡住处理流程 |

## ⚠️ 危险操作门禁 (Dangerous Operation Gate)

执行以下操作前，**必须先向用户确认**，不可静默执行：

| 操作类别 | 示例 | 确认要求 |
|---------|------|---------|
| 删除文件或目录 | `rm -r`、`git clean -f`、`shutil.rmtree` | 列出将被删除的文件列表，等用户确认 |
| 数据库破坏性变更 | `DROP TABLE`、`ALTER TABLE ... DROP COLUMN`、`TRUNCATE` | 说明影响范围和数据丢失风险 |
| Git 不可逆操作 | `git push --force`、`git reset --hard`、`git branch -D` | 说明将丢失的 commit 或分支 |
| 安装新依赖 | `npm install X`、`pip install X`、`brew install X` | 说明依赖名、版本、为什么需要、许可证 |
| 修改环境/配置 | `.env`、CI 配置、部署配置 | 说明变更内容和影响 |
| 执行远程命令 | `curl ... \| sh`、`wget -O- \| bash`、`eval` | 说明来源可信度，建议先下载审查 |
