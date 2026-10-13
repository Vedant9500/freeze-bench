# freeze-bench

Cheat-proof harness for testing models on hard, real software questions.

Each task pins a `base_commit` and runs the model in a sanitized worktree with
no git history, no reference solutions, and no network. Grading is by execution
(fail-to-pass repro + pass-to-pass regression), not by LLM judge. See
`DESIGN.md` for the threat model and literature grounding (SWE-bench, Live*,
Terminal-Bench, R2E, Commit0).

## Repository layout

- `miner.md` — Freeze stage. In a target repo: `Read ~/freeze-bench/miner.md`.
  Records base/fix SHAs and dates with pre-fix wording.
  Output: `proposals/<repo>-<date>.md`.
- `eval.md` — Bench stage. The model works only in `/tmp/eval/<ISSUE-ID>/`
  (no `.git`, no history).
  Prompt: `Read ~/freeze-bench/eval.md then solve ~/freeze-bench/issues/ISSUE-XXX.yaml`.
- `AGENTS.md` — agent guard rails.
- `QUESTIONS.md` — central task index.
- `issues/` — public task definitions (type, `base_commit`, dates, worktree; no fix data).
- `rubrics/` — private grading data (`fix_commit`, repro and regression commands,
  cheat checks). Not committed to this repo.
- `proposals/` — raw curation reports. Not committed to this repo.
- `runs/` — model reports.
- `scripts/make-worktree.sh` — builds a sanitized snapshot, e.g.
  `scripts/make-worktree.sh ISSUE-005`.

## Freeze — curate tasks

1. `cd /target/repo` → `Read ~/freeze-bench/miner.md`
2. Review `proposals/`, select the strongest candidates, and promote them
   per `QUESTIONS.md` (4 steps).

## Bench — evaluate models (per model, per issue)

1. `scripts/make-worktree.sh <ISSUE-ID>` (verifies the pre-fix state).
2. Headless batch (preferred):
   `scripts/run-batch.sh "<provider/model>" ISSUE-009 ISSUE-011 ISSUE-039`,
   or `--all` for the active set (builds missing worktrees, one `opencode run`
   per issue from its worktree).
   Manual equivalent: `cd /tmp/eval/<ISSUE-ID>` →
   `Read ~/freeze-bench/eval.md, then solve ~/freeze-bench/issues/<ISSUE>.yaml`
3. Grade `runs/...` against `rubrics/...`: the repro must flip fail-to-pass,
   regressions must stay green, and all `cheat_checks` must hold
   (no git log/show/blame in the transcript).
4. Use the same worktree and prompt for every model under comparison.

## Rules

- Never place rubric content, fix SHAs, or diffs in the evaluated repo or pre-run chat.
- A known-answer (K/S) run without a worktree is invalid and scores 0.
- Record each model's knowledge-cutoff date with its scores; filter tasks
  newer than the cutoff following LiveCodeBench practice.
