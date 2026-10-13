#!/usr/bin/env bash
# Batch-run the eval: build missing worktrees, then one headless `opencode run` per issue.
# Usage:
#   scripts/run-batch.sh "<provider/model>" ISSUE-009 ISSUE-011 ISSUE-039
#   scripts/run-batch.sh "<provider/model>" --all   # active set from QUESTIONS.md
# Env override: MODEL="<provider/model>" scripts/run-batch.sh ISSUE-009 ...
set -euo pipefail
HARNESS="$HOME/freeze-bench"

if [[ "${1:-}" == "" ]]; then echo "usage: run-batch.sh <model> <ISSUE-IDs...|--all>" >&2; exit 1; fi
MODEL="$1"; shift
if [[ "${1:-}" == "--all" ]]; then
  # Active set: QUESTIONS.md rows minus legacy OLM rows outside the set.
  mapfile -t IDS < <(grep -o '^| ISSUE-[0-9]*' "$HARNESS/QUESTIONS.md" | grep -o 'ISSUE-[0-9]*' | grep -v -e ISSUE-002 -e ISSUE-003 -e ISSUE-004 -e ISSUE-006 -e ISSUE-007 -e ISSUE-008 | sort -u)
else
  IDS=("$@")
fi
[[ "${#IDS[@]}" -gt 0 ]] || { echo "no issue IDs given" >&2; exit 1; }

for id in "${IDS[@]}"; do
  YAML="$(ls "$HARNESS/issues/${id}"*.yaml 2>/dev/null | head -1 || true)"
  [[ -n "$YAML" ]] || { echo "SKIP $id: no issues/${id}*.yaml" >&2; continue; }
  [[ -d "/tmp/eval/$id" ]] || "$HARNESS/scripts/make-worktree.sh" "$id"
  echo "=== $id <- $(basename "$YAML") ==="
  (cd "/tmp/eval/$id" && opencode run -m "$MODEL" --title "$id-eval" --auto \
    "Read $HARNESS/eval.md then solve $YAML")
done
