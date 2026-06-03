#!/usr/bin/env bash
set -euo pipefail

ARCH="${1:-x86_64}"

case "$ARCH" in
  x86_64)
    BUILD_DIR="win64"
    ;;
  i686)
    BUILD_DIR="win32"
    ;;
  aarch64)
    BUILD_DIR="winarm64"
    ;;
  *)
    echo "Unsupported Windows architecture: $ARCH" >&2
    exit 1
    ;;
esac

extras/package/win32/build.sh -r -p -a "$ARCH"
make -C "$BUILD_DIR" package-vjcurator-win32-portable

mkdir -p dist
cp "$BUILD_DIR"/vj-curator-*.zip dist/
cp "$BUILD_DIR"/vj-curator-*.7z dist/
