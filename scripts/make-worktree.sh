#!/usr/bin/env bash
# Build a sanitized, cheat-proof snapshot for one issue.
# Usage: scripts/make-worktree.sh ISSUE-005
# Reads issues/ISSUE-005*.yaml (repo:, base_commit:), exports base tree
# via git archive (no .git, no worktree registration, no history to leak).
set -euo pipefail
HARNESS="$HOME/freeze-bench"
ISSUE_ID="${1:?usage: make-worktree.sh <ISSUE-ID>}"
ISSUE_FILE="$(ls "$HARNESS/issues/${ISSUE_ID}"*.yaml | head -1)"
REPO="$(grep -E '^repo:' "$ISSUE_FILE" | sed -E 's/^repo:[[:space:]]*"?//; s/"?[[:space:]]*(#.*)?$//')"
BASE="$(grep -E '^base_commit:' "$ISSUE_FILE" | sed -E 's/^base_commit:[[:space:]]*"?//; s/"?[[:space:]]*(#.*)?$//' | awk '{print $1}')"
OUT="/tmp/eval/$ISSUE_ID"
if [[ ${#BASE} -lt 40 ]]; then echo "ERROR: base_commit not a full SHA in $ISSUE_FILE" >&2; exit 1; fi
rm -rf "$OUT"; mkdir -p "$OUT"
git -C "$REPO" archive "$BASE" | tar -x -C "$OUT"
echo "snapshot: $OUT"
echo "base: $BASE (no .git, no history)"
echo "verify: ls $OUT | head; grep -c BACKUP_MANIFEST_VERSION $OUT/openlmlib/library.py || true (0 = pre-fix state, good for K)"
echo "Next: worktree:/allowed_repo_root: in $ISSUE_FILE already point here"
