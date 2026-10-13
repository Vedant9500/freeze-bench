# Harness design v2 — why repo-at-HEAD cheats, and how we fix it

Your doubt is correct and is the central problem in code evals.

## Threat model (your case)

- Known-answer Q cites repo at HEAD which already contains the fix.
- Model can `git log --grep=fix`, `git show <fix_sha>`, `git blame` the fixed
  lines, or read the PR/commit message — and parrot it with correct
  `file:line` citations. Looks like reasoning, is retrieval.
- Same leak via `rubrics/`, commit messages mentioning the mechanism,
  CHANGELOG, or tests added by the fix commit.

## What the literature does (synthesis of 4 subagent reports + papers)

1. **SWE-bench (Jimenez et al. 2024, arXiv:2310.06770)** — the canonical fix:
   each task pins `base_commit` (parent of fix PR). Model sees repo at
   `base_commit` + pre-fix issue text only. Gold `patch` and `test_patch`
   are withheld fields. Grade = apply model patch, run FAIL_TO_PASS (fail
   before, pass after) + PASS_TO_PASS (regression). Execution, not LLM judge.
   Docker per instance. SWE-bench-Verified adds human filtering of leaky/vague issues.
2. **Live family (LiveCodeBench 2403.07974, LiveBench, EvoCodeBench 2404.00599,
   SWE-bench-Live 2505.23419, SWE-PolyBench 2504.08703)** — contamination via
   training data: tag every task with a date, eval only on tasks newer than the
   model's cutoff ("scrolling through time"). Continuously refresh from new
   issues. Lesson for you: record `fixed_date` / `mined_date` per question so
   you can filter when a new model claims a later cutoff.
3. **Agentic execution (Terminal-Bench/Harbor, R2E-Gym 2504.07164, Commit0,
   RepoLaunch, BundleBench)** — isolation pattern: solve-container vs
   eval-container. Agent filesystem never contains `tests/` (hidden tests
   staged only at verify), never contains `solution/`, `.git` stripped or
   re-initialized to a "sanitized base", no network during solve. `git log/show`
   blocked. Agent patch captured via `git diff`, applied fresh elsewhere.
   TB2 `TB2_WITHHOLD_TESTS=1` and R2E `hide_tests_from_agent=True` are the
   exact flags for this.
4. **Synthetic bugs (SWE-smith 2504.21798, R2E-Gym SWE-GEN)** — when no natural
   pre-fix state exists, inject a bug (revert a fix, break an invariant) and
   keep it only if ≥1 test flips fail→pass. Backtranslate the issue text from
   the failing test, not from the fix diff. Lesson: your open-limitation
   questions are already cheat-proof (no fix exists); your known-answer ones
   should be stored as base/fix pairs, optionally re-injected.

## Decisions for this local harness (v2)

- **Three question types**, not one `status` string:
  - `K` (known-answer / regression): fix exists. MUST pin `base_commit`
    (= parent of fix), run model in a sanitized worktree, withhold
    `fix_commit` + gold patch + new tests. Highest cheat risk, highest signal.
  - `O` (open-limitation): no fix. Run at pinned `base_commit` (= HEAD at
    mining time) for reproducibility. Nothing to leak; grade by rubric/repro script.
  - `S` (synthetic/reverted): take a K fix, revert it on top of HEAD to make
    a bug. Same isolation as K. Use when HEAD has moved far past the fix.
- **Worktree isolation is mandatory for K and S** (recommended for O):
  `scripts/make-worktree.sh <ISSUE-ID>` → detached worktree at `base_commit`
  under `/tmp/eval/<ISSUE-ID>/`, with `.git` removed. Model's
  `allowed_repo_root` = worktree, never the original checkout.
- **Forbidden in eval.md**: `git log/show/diff/blame`, reading `rubrics/`,
  `CHANGELOG` entries newer than `base_commit`, network. Violation = score 0.
- **Execution over opinion**: every K/S ships a `repro_command` (F2P) + optional
  `regression_command` (P2P) in the rubric. Research-mode Ks still require a
  fault-injection or failing-test proof, not just prose.
- **Date tagging**: every issue records `mined_date` (+ `fixed_date` for K).
  Filter by model cutoff when comparing models across time.

## What changed in the repo (v2 files)

- `issues/_template.yaml`: added `qtype`, `base_commit`, `mined_date`,
  `fixed_date`, `worktree` block.
- `rubrics/_template.yaml`: added `fix_commit`, `gold_patch_hint` (owner-only
  pointer, never a full diff in the file the model could reach), `repro_command`
  (F2P), `regression_command` (P2P).
- `miner.md`: must capture SHAs + dates, must not paste fix diffs into proposals.
- `eval.md`: worktree protocol + forbidden commands + cheat = 0 rule.
- `scripts/make-worktree.sh`: builds the sanitized worktree.
- `QUESTIONS.md`: new `Type` + `Base` columns.
