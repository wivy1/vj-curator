#!/usr/bin/env bash
set -euo pipefail

ARCH="${1:-$(uname -m)}"
BUILD_DIR="${2:-build-macos}"

# The fixed-point Tremor contrib can be selected incorrectly on hosted macOS
# runners and fails autoreconf because its Xiph Ogg macro is not expanded.
export CONTRIBFLAGS="${CONTRIBFLAGS:-} --disable-tremor"
export VLC_CONFIGURE_ARGS="${VLC_CONFIGURE_ARGS:-} --disable-tremor"

extras/package/macosx/build.sh -d -i z -a "$ARCH" -C "$BUILD_DIR"
make -C "$BUILD_DIR" package-vjcurator-macosx-portable

mkdir -p dist
cp "$BUILD_DIR"/vj-curator-*-macosx.zip dist/
