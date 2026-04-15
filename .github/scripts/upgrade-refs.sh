#!/usr/bin/env bash
# upgrade-refs.sh — 拉取 .tmp/ 下所有参考仓库的最新内容，生成 SYNC_REPORT.md
#
# 用法：
#   bash .github/scripts/upgrade-refs.sh
#
# 产出：
#   .tmp/SYNC_REPORT.md  — 本次拉取的变更摘要（供 /upgrade 角色读取）
#   .tmp/LAST_SYNC       — 最后同步时间戳

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TMP_DIR="$PROJECT_ROOT/.tmp"
REPORT="$TMP_DIR/SYNC_REPORT.md"

# 需要追踪的参考仓库（相对于 .tmp/）
# 如需新增，在此列表追加即可
REPOS=(
  "gstack"
  "hermes-agent"
  "andrej-karpathy-skills"
  "superpowers"
  "skills"
)

echo "🔄 拉取参考仓库..."
echo ""

# 生成报告头
{
  echo "# Sync Report — $(date '+%Y-%m-%d %H:%M')"
  echo ""
  echo "| 仓库 | 拉取前 | 拉取后 | 状态 |"
  echo "|------|--------|--------|------|"
} > "$REPORT"

CHANGED_REPOS=()

for repo in "${REPOS[@]}"; do
  dir="$TMP_DIR/$repo"

  if [[ ! -d "$dir/.git" ]]; then
    echo "| \`$repo\` | — | — | ⚠️ 目录不存在，跳过 |" >> "$REPORT"
    echo "  ⚠️  $repo — 目录不存在，跳过"
    continue
  fi

  before=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null || echo "unknown")

  if ! git -C "$dir" pull --quiet 2>/dev/null; then
    echo "| \`$repo\` | \`$before\` | — | ❌ pull 失败 |" >> "$REPORT"
    echo "  ❌  $repo — pull 失败"
    continue
  fi

  after=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null || echo "unknown")

  if [[ "$before" == "$after" ]]; then
    echo "| \`$repo\` | \`$before\` | \`$after\` | ✅ 已是最新 |" >> "$REPORT"
    echo "  ✅  $repo — 已是最新 ($after)"
  else
    changed_files=$(git -C "$dir" diff --name-only "$before" "$after" 2>/dev/null | wc -l | tr -d ' ')
    echo "| \`$repo\` | \`$before\` | \`$after\` | 🆕 ${changed_files} 个文件变更 |" >> "$REPORT"
    echo "  🆕  $repo — ${changed_files} 个文件变更 ($before → $after)"
    CHANGED_REPOS+=("$repo")
  fi
done

# 为每个有变更的仓库输出详细文件列表
if [[ ${#CHANGED_REPOS[@]} -gt 0 ]]; then
  {
    echo ""
    echo "---"
    echo ""
    echo "## 变更详情"
  } >> "$REPORT"

  for repo in "${CHANGED_REPOS[@]}"; do
    dir="$TMP_DIR/$repo"
    before=$(git -C "$dir" rev-parse --short HEAD~1 2>/dev/null || echo "unknown")
    # FIXME: 拉取后 HEAD 已更新，需重新获取拉取前的 hash
    # 这里通过 FETCH_HEAD 拿到拉取前的实际对比点
    old_ref=$(git -C "$dir" rev-parse --short ORIG_HEAD 2>/dev/null || git -C "$dir" rev-parse --short HEAD^ 2>/dev/null || echo "HEAD^")
    {
      echo ""
      echo "### \`$repo\`"
      echo ""
      echo '```'
      git -C "$dir" diff --name-status "$old_ref" HEAD 2>/dev/null || echo "(无法获取 diff)"
      echo '```'
    } >> "$REPORT"
  done
fi

# 尾部摘要
{
  echo ""
  echo "---"
  echo ""
  echo "**有变更的仓库：${#CHANGED_REPOS[@]} 个**"
  echo ""
  if [[ ${#CHANGED_REPOS[@]} -gt 0 ]]; then
    echo "下一步：在 Copilot Chat 中运行 \`/upgrade\`，分析变更并生成角色优化提案。"
  else
    echo "所有仓库均已是最新，无需运行 \`/upgrade\`。"
  fi
} >> "$REPORT"

# 更新最后同步时间戳
echo "$(date '+%Y-%m-%d %H:%M:%S')" > "$TMP_DIR/LAST_SYNC"

echo ""
echo "📄 报告已写入：.tmp/SYNC_REPORT.md"
echo "   有变更的仓库：${#CHANGED_REPOS[@]} 个"
if [[ ${#CHANGED_REPOS[@]} -gt 0 ]]; then
  echo "   变更仓库：${CHANGED_REPOS[*]}"
  echo ""
  echo "✅ 完成。在 Copilot Chat 中运行 /upgrade 开始分析。"
else
  echo ""
  echo "✅ 完成。所有仓库均已是最新。"
fi
