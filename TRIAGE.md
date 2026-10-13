# TRIAGE — 204 candidates → diverse quality set (2026-10-10)

5 subagent batches, every candidate read. Method + taxonomy + final 32 below.

## 1. Label taxonomy (applied to every candidate)

- `difficulty`: recalibrated easy/medium/hard (miner claimed ~95% hard; real split below).
  Easy = single-guard/one-line root, minutes-grade. Medium = cross-file trace or
  small tradeoff, concrete fixture. Hard = multi-fault bundle, race/perf cliff,
  or subtle invariant.
- `domain`: concurrency, security, perf, correctness-logic, parsing/validation,
  caching, error-handling, testing, architecture, data-structures, async/IO, UI,
  config, persistence, networking.
- `language`: file's repo language(s).
- `issue_type`: bug-fix | race | perf-regression | security-boundary |
  UX-tradeoff | design-tradeoff | flaky-test.
- `gradeability`: deterministic? minutes? needs-network/GPU? (>15 min or
  timing-only or secrets = DROP.)
- `discrimination`: what a weak model gets wrong (required for KEEP).

## 2. Pool stats (recalibrated)

| Batch | Files | N | easy | med | hard | KEEP | MAYBE | DROP |
|---|---|---|---|---|---|---|---|---|
| A | AD-DSP, Aether, BAM, blink, CLOE | 41 | 6 | 26 | 9 | 23 | 16 | 2 |
| B | DOWSE, F1-AI, FMMS, gitstat, Glassbox | 40 | 8 | 28 | 4 | 19 | 13 | 8 |
| C | goal-loop, grast, image-viewer, jetsim, lily | 41 | 8 | 25 | 8 | 22 | 17 | 2 |
| D | LiNN, liz-tree, NNUE, OpenLMlib, PasswordManager | 41 | 3 | 22 | 16 | 25 | 8 | 8 |
| E | PRISM, rt-approx, UD, Usage-monitor, Youtube | 41 | 13 | 24 | 4 | 17 | 19 | 5 |
| **Total** | 25 files | **204** | **38** | **129** | **37** | **106** | **73** | **25** |

Key findings:
- Miners overclaim hard (~95% claimed hard → 18% real hard after recalibration).
- Duplicate themes across repos: persistence torn-write/atomic-save (BAM, AD-DSP,
  image-viewer, UD), cache-key/invalidation (lily, NNUE, Usage-monitor), threshold
  calibration (F1-AI, Usage-monitor, Youtube). Cap per theme, keep best exemplar.
- Standard DROP patterns: timing-only perf claims (no deterministic F2P),
  needs-GPU/network/secrets, >15-min grade, 3-in-1 bundles, doc-only audits,
  explanation-only with no code change, nondeterministic thread-schedule grades.

## 3. Diversity design (research grounding)

LiveBench-style category coverage + SWE-bench difficulty stratification:
- 8 easy anchors (regression floor) / 16 medium (core signal) / 8 hard (frontier split).
- Cap ≤3 per repo, ≤4 per domain, ≥5 languages, mix of K (execution F2P ~80%)
  and O (judgment ~20%). No repo contributes >10% of the set.

## 4. FINAL 32 (promote in this order)

### Easy anchors (8)
| # | Candidate | Lang | Domain | Why |
|---|---|---|---|---|
| 1 | blink-001 calc non-finite cards (K) | Rust | parsing/validation | 3-guard string F2P, cheapest anchor |
| 2 | BAM-076 reset leaves .bak (O) | Py | persistence | 5-min reset-vs-recover probe |
| 3 | UD-C1 progress never advances (K) | Py | parsing/validation | tiny prefix-vs-bare F2P |
| 4 | UsageMon-C2 free-variant billed paid (K) | Py | correctness/config | pure-python matrix, <5m |
| 5 | Youtube-C4 hardcoded IST shift (O) | Py | correctness/config | one constant corrupts all bins |
| 6 | LiNN-001 RNG collapses to one stream (K) | Rust | correctness-logic | 1-line root, catastrophic effect |
| 7 | NNUE-092 mirror-augment corrupts draws (K) | Py | parsing/validation | mapping-table fixture, trivial grade |
| 8 | CLOE-001 hidden sweep kills scripts (K) | JS | correctness-logic | sharpest black-screen F2P |

### Medium core (16)
| # | Candidate | Lang | Domain | Why |
|---|---|---|---|---|
| 9 | AD-DSP-062 hand-rolled JSON trust root (O) | Rust | parsing/security | dup-key/surrogate fixtures |
| 10 | blink-004 scoped search wrong root (K) | Rust | correctness-logic | best FS discriminator |
| 11 | gitstat-013 login-as-path-filter (O) | Rust | parsing/CLI | offline positional-semantics trap |
| 12 | DOWSE-034 burst stale ghost tail (K) | C | concurrency | deterministic pty, strongest in file |
| 13 | DOWSE-039 secrets stored verbatim (O) | Rust | security | seconds-grade redact corpus |
| 14 | F1-AI-068 elimination uses start width (O) | Py | correctness/data-struct | live plant bug, exact verdict-split |
| 15 | FMMS-108 MAC sqrt + self-branch trap (K) | Rust | perf/correctness | gate-caught correctness trap |
| 16 | Glassbox-010 residual holdout leak (K) | Py | testing/architecture | strongest reasoning item |
| 17 | grast-001 chained-receiver false-Exact (K) | Rust | correctness/data-struct | false-Exact + false-dead in one rule |
| 18 | lily-084 quiescence hides mating sac (K) | Rust | correctness-logic | material-vs-mate category error |
| 19 | OLM-001 numpy tombstone overwrite (O) | Py | concurrency/persist | concrete x-proc lost-update |
| 20 | OLM-005 fail-closed index+restore (K) | Py | error-handling | best fault-injection discriminator |
| 21 | PasswordMgr-021 verify-clear chain bypass (O) | TS | async/IO | 1-line chain fix, fully deterministic |
| 22 | PRISM-C3 geometric prune wrong tail (K) | C++ | data-structures | dual-fault (sort slice + identity key) |
| 23 | rt-approx-C4 Vulkan hang past fence (K) | Py/C++ | perf/architecture | hang from config math, no GPU needed |
| 24 | UD-C3 error-spam hang + stuck cancel (K) | Py | concurrency/async | pipe/poll/cancel triple |

### Hard frontier (8)
| # | Candidate | Lang | Domain | Why |
|---|---|---|---|---|
| 25 | Aether-001 scratch under-sized heap (K) | Kotlin | concurrency | seam+dirty-map misdirect, best F2P |
| 26 | Aether-004 first-burst dropped callbacks (K) | Kotlin | async/concurrency | latch discipline + device quirk |
| 27 | BAM-077 worker lost-update + pop-before-commit (O) | Py | concurrency/persist | 2-writer race, at-least/at-most-once |
| 28 | blink-005 single-flight poison-unsafe (O) | Rust | concurrency | only daemon-kill item |
| 29 | CLOE-003 compare reload/toggle races (K) | JS | async/testing | 4 sync races, cheapest asserts |
| 30 | CLOE-007 sensitive-guard 3-layer divergence (O) | JS | security | manifest/ruleset/JS matrix |
| 31 | NNUE-093 board-vs-acc occupancy diverge (K) | Rust | data-structures | cross-module invariant, fuzz-grade |
| 32 | goal-loop-076 verification trust audit (K) | TS | security/concurrency | 6-hole injection + fail-closed test |

Coverage (corrected 2026-10-10): 22 repos, 6 languages (Rust 10, Py 12, Kotlin 2, JS/TS 5, C/C++ 2 — rt-approx counts Py+C++),
13 domains, K/O = 21/11 for the 32-set (was mis-tallied as 26/6).

## 5. Alternates (promote on drops)

viewer-051 truncate-no-backup (Rust persist) · jetsim-115 dead lattice (needs
owner snapshot, base=null) · LIZ-041 eager-scan double-count (Py) · UD-C5
durability bundle · UsageMon-C3 archive-rename + shell-injection (security) ·
Youtube-C6 missing-segment mislabel · PasswordMgr-018 re-saved legacy lockout ·
rt-approx-C1 var-shadow bound · grast-005 torture suites · lily-083 pawn-cache
key bug · BAM-078 genre-alias asymmetry · Aether-002 DNG overflow.

## 6. Next step

Promote top-down per QUESTIONS.md §Promote (worktree → issues/ → rubrics/ →
QUESTIONS row). Suggested first batch: 1, 3, 8, 19, 20 (already have OLM
proposals in-repo) + 6, 25 (new languages). Batch detail rows live in the
5 triage subagent transcripts (sessions ses_edbef78d*, ses_edbef78b* ×3,
ses_edbef788*) — re-emit any batch as CSV on request.

## 7. Audit corrections 2026-10-10 (demote + swaps)

Difficulty/type corrections (YAML is source of truth; table slot was wrong):
- #2 BAM-076 is O (fixed above), not K.
- #6 LiNN-001: YAML `medium` (`issues/ISSUE-012-linn-rng.yaml:9`), table slot easy. Root is 1-line but effort was days (872-game collapse); keep YAML `medium`.
- #13 DOWSE-039: YAML `easy` (`issues/ISSUE-022-dowse-redact.yaml:9`), table slot medium. Keep YAML `easy`.
- #19 OLM-001 / #20 OLM-005: YAML `hard`, table slot medium. Keep YAML `hard`.
- #25 Aether-001: YAML `hard` (`issues/ISSUE-013-aether-scratch.yaml:9`); 1-line capacity root but device-diagnosis effort justifies `hard`. Keep.

Demoted 2026-10-10 (files + QUESTIONS rows removed, IDs 034/036/038 retired — prose/bundle gradeability):
- blink single-flight poison-unsafe audit (was ISSUE-034, O hard, no repro).
- CLOE sensitive-guard 3-layer divergence (was ISSUE-036, O hard, no repro).
- goal-loop 6-hole trust audit (was ISSUE-038, K hard bundle).
Replacements (deterministic K, worktree-verified): ISSUE-039 (liz-tree-041),
ISSUE-040 (viewer-050), ISSUE-041 (lily-083). Active set stays 32.
