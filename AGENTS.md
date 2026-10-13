# Guard: this dir stores the eval harness, it is not a task.

If your working directory is `~/freeze-bench/` itself, do nothing
special — wait for the user's explicit instruction.

- Freeze (curate questions in a TARGET repo): user will say
  `Read ~/freeze-bench/miner.md`. Only then follow miner.md.
- Bench (solve one question): user will say
  `Read ~/freeze-bench/eval.md then solve ~/freeze-bench/issues/ISSUE-XXX.yaml`.
  Only then follow eval.md.

Never auto-start an eval. Never read `rubrics/` unless the user explicitly
asks you to grade as the owner.
