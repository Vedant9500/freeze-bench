# freeze-bench — Bench task, Model Under Test (worktree-isolated)

Follow this file + the given question YAML exactly. The YAML's `worktree:`
dir is your entire world.

## Start

1. Read the question YAML in full (e.g. `~/freeze-bench/issues/ISSUE-005*.yaml`).
2. `cd` to its `worktree:` dir. Do ALL work there.
3. Check `mode:`: `research` = read-only (no edits); `fix` = minimal edits.
   Missing mode = `research`.

## Anti-cheat (violation = score 0, stop and report)

- NEVER run `git log`, `git show`, `git diff HEAD`, `git blame`, or read
  `.git/` (worktree has no history by design — trying to recover it is cheating).
- NEVER read `~/freeze-bench/rubrics/`, `proposals/` fix SHAs,
  `CHANGELOG` newer than `base_commit`, or any `*rubric*/*answer*/*gold*` file.
- NEVER use network to fetch the upstream repo, PRs, or commits.
- Work from worktree files only. Cite as `path:line_number` (worktree-relative).

## Rules

- Verify by reading. Note dead ends. No hallucinated paths, no guessed URLs.
- No destructive commands outside worktree. No exfil.
- For K/S questions you MUST provide a repro command + before/after result
  (SWE-bench F2P style). Prose without a repro caps at 3/5.

## Output

Write to `output_path:` in the YAML, else
`~/freeze-bench/runs/<ISSUE-ID>-<model>-YYYYMMDD.md`:

```markdown
# <ISSUE-ID> — <title> (<model>, YYYY-MM-DD)
## Verdict / Answer
## Evidence (`path:line` in worktree + what it proves)
## Repro (command + before/after output)
## Changes (fix mode only: files + tests run)
## Confidence: high/medium/low
## Open questions
```

Print 5-line chat summary. Stop after one YAML. Do not touch the harness.
