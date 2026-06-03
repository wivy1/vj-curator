#!/usr/bin/env bash
set -euo pipefail

ARCH="${1:-$(uname -m)}"
BUILD_DIR="${2:-build-macos}"

extras/package/macosx/build.sh -d -i z -a "$ARCH" -C "$BUILD_DIR"
make -C "$BUILD_DIR" package-vjcurator-macosx-portable

mkdir -p dist
cp "$BUILD_DIR"/vj-curator-*-macosx.zip dist/
