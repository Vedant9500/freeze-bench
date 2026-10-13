# Freeze task — curate hard questions, FREEZE them against cheating

You are helping the owner build a local eval harness. Mine THIS repo for
5-10 hard questions. Read-only. Do NOT solve them — surface + freeze them.

## What counts (unchanged)

- Open limitations (no fix): TODO/FIXME/HACK, skipped tests, races, perf
  cliffs, fragile error handling. These are cheat-proof by construction.
- Past hard-won answers: bugs that took days (`git log --grep=fix`,
  revert chains). HIGH cheat risk — must capture SHAs, never paste the fix.
- Tradeoffs with no single answer (`status` unknown). Cheat-proof, grade by rubric.

## New: every candidate must be freezable

For EACH candidate record (owner needs this to build the worktree):

1. `base_commit`: full SHA the model will see.
   - Known-answer: parent of the fix (`git rev-parse <fix>^`). Verify the bug
     reproduces there.
   - Open: current HEAD (`git rev-parse HEAD`).
2. `fix_commit`: full SHA of the fix, or `null` for open. Put in proposal for
   owner to move into `rubrics/` — NEVER paste the diff.
3. `mined_date` = today, `fixed_date` = fix commit date (`git show -s --format=%ad --date=short <fix>`) or null.
4. Write `background`/`task` from the PRE-FIX perspective. No fix mechanism,
   no post-fix symbol names, no commit hashes in the text.

## Rules

- Do NOT edit repo files. `git status` clean after.
- Cite `path:line_number` verified by reading.
- Do NOT write to `issues/` or `rubrics/`. Write ONE report to
  `~/freeze-bench/proposals/<repo>-YYYYMMDD.md` with per-candidate YAML
  blocks matching `issues/_template.yaml` v2 (include qtype/base_commit/fix hint
  for owner). Mark fix SHA lines `# OWNER-MOVE-TO-RUBRIC`.
- BAD: trivial lint, secrets/network-dependent, nondeterministic, >15-min grade.

## Output format — per candidate

```markdown
## Candidate N: <title>
- qtype: K | O | S + why
- difficulty, mode_suggestion
- base_commit: <sha> / fix_commit: <sha|null> (OWNER-MOVE-TO-RUBRIC)
- mined_date / fixed_date
- background (pre-fix, no spoilers), task, evidence `path:line`
- why_good_eval, gradeability (<15 min), repro idea (F2P)
```yaml (ready for issues/, fix SHA flagged for owner)
```

End with ranked top 3 + top-3 summary in chat. Stop.
