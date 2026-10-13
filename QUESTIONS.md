# Eval Questions Index — central location (v2)
# Owner edits when promoting proposals/*.md → issues/*.yaml.

| ID | Title | Type | Repo @ base | Mode | Difficulty | Fixed | Question file | Rubric |
|----|-------|------|-------------|------|------------|-------|---------------|--------|
| ISSUE-001 | Numpy save merge overwrites tombstones | O | LMlib @ `e93a95c` | fix | hard | — | `issues/ISSUE-001-tombstones.yaml` | none (open) |
| ISSUE-002 | FTS AND-then-OR fallback with unclamped limits and hit-count-first fusion | O | LMlib @ `e93a95c` | research | hard | — | `issues/ISSUE-002-fts-fallback.yaml` | none (open) |
| ISSUE-003 | rebuild_vector_index full re-embed with lost-update window | O | LMlib @ `e93a95c` | research | hard | — | `issues/ISSUE-003-rebuild-race.yaml` | none (open) |
| ISSUE-004 | Forgiving save-gate vs trusted_export bypass | O | LMlib @ `e93a95c` | research | hard | — | `issues/ISSUE-004-save-gate.yaml` | none (open) |
| ISSUE-005 | Fail-closed corrupt index and backup restore integrity | K | LMlib @ `ae740c7` | research | hard | 2026-08-23 | `issues/ISSUE-005-fail-closed.yaml` | `rubrics/ISSUE-005.yaml` |
| ISSUE-006 | Filtered poll_messages never advances offsets | O | LMlib @ `e93a95c` | research | hard | — | `issues/ISSUE-006-poll-offset.yaml` | none (open) |
| ISSUE-007 | Verification grounding is syntax-existence not semantic support | O | LMlib @ `e93a95c` | research | hard | — | `issues/ISSUE-007-grounding.yaml` | none (open) |
| ISSUE-008 | Ranking blend ignored by selection plus keyword safety | O | LMlib @ `e93a95c` | research | medium | — | `issues/ISSUE-008-ranking.yaml` | none (open) |
| ISSUE-009 | Calculator renders cards for non-finite inputs | K | blink @ `d18507e` | research | easy | 2026-08-26 | `issues/ISSUE-009-blink-calc.yaml` | `rubrics/ISSUE-009.yaml` |
| ISSUE-010 | Progress never advances | K | UD @ `961caa3` | fix | easy | 2026-09-03 | `issues/ISSUE-010-ud-progress.yaml` | `rubrics/ISSUE-010.yaml` |
| ISSUE-011 | Hidden sweep deletes page scripts and styles | K | CLOE @ `f771f61` | research | easy | 2026-10-04 | `issues/ISSUE-011-cloe-sweep.yaml` | `rubrics/ISSUE-011.yaml` |
| ISSUE-012 | Game-seed RNG collapses to one stream | K | LiNN @ `707e464` | fix | medium | 2026-09-15 | `issues/ISSUE-012-linn-rng.yaml` | `rubrics/ISSUE-012.yaml` |
| ISSUE-013 | Tiled finalize scratch under-sized corrupts heap | K | aether @ `d4bbf0a` | research | hard | 2026-08-15 | `issues/ISSUE-013-aether-scratch.yaml` | `rubrics/ISSUE-013.yaml` |
| ISSUE-014 | Reset leaves .bak behind so deleted state resurrects on restart | O | BAM @ `d64a0bf` | fix | easy | — | `issues/ISSUE-014-bam-reset.yaml` | none (open) |
| ISSUE-015 | Free-variant sessions billed at paid rates and stored zero costs recomputed | K | Usage monitor @ `d619601` | research | easy | 2026-09-25 | `issues/ISSUE-015-usagemon-free.yaml` | `rubrics/ISSUE-015.yaml` |
| ISSUE-016 | Hardcoded IST shift with naive datetimes | O | Youtube Recap @ `d727fd3` | research | easy | — | `issues/ISSUE-016-youtube-tz.yaml` | none (open) |
| ISSUE-017 | Mirror-augment result mapping corrupts short results | K | NNUE @ `61131c2` | fix | easy | 2026-09-14 | `issues/ISSUE-017-nnue-mirror.yaml` | `rubrics/ISSUE-017.yaml` |
| ISSUE-018 | Scoped deep search walks wrong root and matches substrings | K | blink @ `27353dd` | research | medium | 2026-08-28 | `issues/ISSUE-018-blink-scope.yaml` | `rubrics/ISSUE-018.yaml` |
| ISSUE-019 | Hand-rolled JSON parser is the single trust root | O | AD-DSP @ `2ec4691` | fix | medium | — | `issues/ISSUE-019-addsp-json.yaml` | none (open) |
| ISSUE-020 | Local-git fallback passes the login as a path filter | O | gitstat @ `29afd1d` | research | medium | — | `issues/ISSUE-020-gitstat-login.yaml` | none (open) |
| ISSUE-021 | Burst keystrokes interleave stale ghost tail | K | DOWSE @ `2c291d4` | research | medium | 2026-09-29 | `issues/ISSUE-021-dowse-burst.yaml` | `rubrics/ISSUE-021.yaml` |
| ISSUE-022 | Secret-bearing commands stored verbatim outside known patterns | O | DOWSE @ `3543df8` | fix | easy | — | `issues/ISSUE-022-dowse-redact.yaml` | none (open) |
| ISSUE-023 | Elimination uses start-straight half width on variable-width track | O | F1-AI @ `771e0b1` | fix | medium | — | `issues/ISSUE-023-f1-width.yaml` | none (open) |
| ISSUE-024 | MAC accept root plus pre-pass self-branch | K | FMMS @ `9ad4f3f` | fix | medium | 2026-08-22 | `issues/ISSUE-024-mac-sqrt.yaml` | `rubrics/ISSUE-024.yaml` |
| ISSUE-025 | Residual second stage judges on data it was built from | K | Glassbox @ `fbe2898` | research | medium | 2026-09-09 | `issues/ISSUE-025-glassbox-holdout.yaml` | `rubrics/ISSUE-025.yaml` |
| ISSUE-026 | Chained receivers leak false-Exact, miss field/subscript links | K | grast @ `1527864` | research | medium | 2026-09-18 | `issues/ISSUE-026-grast-receivers.yaml` | `rubrics/ISSUE-026.yaml` |
| ISSUE-027 | Quiescence pruning hides a mating sacrifice | K | lily @ `99e1695` | research | medium | 2026-09-12 | `issues/ISSUE-027-lily-quiescence.yaml` | `rubrics/ISSUE-027.yaml` |
| ISSUE-028 | Verify-results clear bypasses serialized writes | O | Password Manager @ `52c6ce8` | fix | medium | — | `issues/ISSUE-028-pwm-verify-clear.yaml` | none (open) |
| ISSUE-029 | Geometric prune protects wrong tail and mis-deletes duplicates | K | PRISM @ `c8f734e` | fix | medium | 2026-08-09 | `issues/ISSUE-029-prism-prune-tail.yaml` | `rubrics/ISSUE-029.yaml` |
| ISSUE-030 | Big Vulkan renders hang past the fence | K | rt-approx @ `50a5ea3` | research | medium | 2026-10-07 | `issues/ISSUE-030-rt-vulkan-hang.yaml` | `rubrics/ISSUE-030.yaml` |
| ISSUE-031 | Error-spam hang with stuck cancel | K | UD @ `961caa3` | fix | medium | 2026-09-03 | `issues/ISSUE-031-ud-error-spam.yaml` | `rubrics/ISSUE-031.yaml` |
| ISSUE-032 | Burst completion waits on dropped result callbacks | K | aether @ `5fcba36` | research | hard | 2026-08-14 | `issues/ISSUE-032-aether-burst-stall.yaml` | `rubrics/ISSUE-032.yaml` |
| ISSUE-033 | Worker/backend lost-update window with pop-before-commit queue | O | BAM @ `d64a0bf` | research | hard | — | `issues/ISSUE-033-bam-worker-race.yaml` | none (open) |
| ISSUE-035 | Compare harness races reloads and toggles, measures cache instead of modules | K | CLOE @ `e6d6699` | research | hard | 2026-10-05 | `issues/ISSUE-035-cloe-compare.yaml` | `rubrics/ISSUE-035.yaml` |
| ISSUE-037 | Board vs accumulator occupancy diverge on victimless diagonal pawn push | K | NNUE @ `9f20bee` | fix | hard | 2026-09-13 | `issues/ISSUE-037-nnue-occupancy.yaml` | `rubrics/ISSUE-037.yaml` |
| ISSUE-039 | Eager scan double-counts root-level files in stats | K | liz-tree @ `f56299c` | fix | medium | 2026-09-25 | `issues/ISSUE-039-liz-eager.yaml` | `rubrics/ISSUE-039.yaml` |
| ISSUE-040 | Gallery thumb worker panic strands pending plus no retry | K | image-viewer @ `65050d7` | research | hard | 2026-09-25 | `issues/ISSUE-040-viewer-thumb.yaml` | `rubrics/ISSUE-040.yaml` |
| ISSUE-041 | Pawn-structure cache serves stale scores across king positions | K | lily @ `4449444` | research | hard | 2026-09-22 | `issues/ISSUE-041-lily-pawncache.yaml` | `rubrics/ISSUE-041.yaml` |
<!-- add rows, keep ID order. Type: K=known fix (isolated) / O=open / S=reverted -->

## Promote a mined candidate (4 steps)

1. `scripts/make-worktree.sh ISSUE-XXX` — verifies base SHA exports cleanly.
2. Copy YAML → `issues/ISSUE-XXX-slug.yaml` (v2 template: qtype/base_commit/dates, pre-fix wording, worktree = `/tmp/eval/ISSUE-XXX`).
3. K/S only: write `rubrics/ISSUE-XXX.yaml` (fix_commit + repro/regression + cheat_checks). O: skip rubric.
4. Add row above. Promoted 2026-10-10: 30 new (ISSUE-009..013 + ISSUE-014..018 + ISSUE-019..023 + ISSUE-024..038 = 5+5+5+15) reusing 2 existing OLM rows (ISSUE-001, 005) for a 32-set; 6 legacy OLM rows (002-004, 006-008) remain outside the set.
5. Swap 2026-10-10 (TRIAGE §7): demoted ISSUE-034/036/038 (files + rows removed, IDs retired), promoted ISSUE-039 (liz-041), 040 (viewer-050), 041 (lily-083) — worktree-verified via make-worktree.sh. Net new stays 30 (27 retained + 3 replacements); active set stays 32; total rows = 38.
