#!/usr/bin/env bash
set -euo pipefail

# 只在 Claude Code remote 环境执行
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
RUST_DIR="$PROJECT_DIR/src-rust"

if [ ! -f "$RUST_DIR/Cargo.toml" ]; then
  exit 0
fi

cd "$RUST_DIR"
cargo fetch