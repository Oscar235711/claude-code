# Claude Code project instructions

## Project layout
- Rust workspace root: `src-rust/`
- Main commands must run from `src-rust/`

## Default workflow for Rust changes
When modifying Rust code, follow this order:

1. Understand the target file and related types before editing
2. Make the smallest correct change
3. Run:
   - `cd src-rust && cargo check`
4. If the error is local and clear, fix it and run `cargo check` again
5. Summarize:
   - what changed
   - whether `cargo check` passed
   - any remaining warnings or risks

## Command policy
- Prefer `cargo check` before `cargo test`
- Only run `cargo test` when explicitly requested or when `cargo check` is insufficient
- Do not run long or expensive commands unless necessary
- Do not push to remote automatically
- Do not create a pull request unless explicitly asked
- If a remote push fails, stop and report the exact error

## Git policy
- You may create local commits only when explicitly asked
- Do not assume push permissions exist
- If code is fixed locally but push is denied, clearly report:
  - branch name
  - commit hash
  - exact push error

## Editing style
- Prefer minimal diffs
- Do not refactor unrelated files
- Preserve existing project style
- Avoid changing public behavior unless required by the task

## Rust-specific rules
- If a struct initializer fails after a type change, inspect the struct definition first
- If compilation fails, fix the root cause before handling warnings
- Warnings can be reported separately after errors are resolved

## Response format
When asked to fix Rust issues, respond with:
- root cause
- exact file(s) changed
- validation result (`cargo check` pass/fail)
- whether there are uncommitted or unpushed changes