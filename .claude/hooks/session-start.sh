#!/bin/sh
set -eu

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
RUST_DIR="$PROJECT_DIR/src-rust"

if [ ! -f "$RUST_DIR/Cargo.toml" ]; then
  exit 0
fi

cd "$RUST_DIR"

echo "[hook] rust dependency warmup start" >&2
cargo metadata --no-deps >/dev/null 2>&1 || true
cargo fetch >/dev/null 2>&1 || true
echo "[hook] rust dependency warmup done" >&2

exit 0