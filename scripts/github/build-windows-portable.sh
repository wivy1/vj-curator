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

# CI builds target local clip curation, so avoid optional disc and RTSP modules
# that often require unavailable contribs on the generic GitHub runner.
export CONTRIBFLAGS="${CONTRIBFLAGS:-} --disable-disc"
export CONFIGFLAGS="${CONFIGFLAGS:-} --disable-live555 --disable-dvdread --disable-dvdnav --disable-bluray --disable-vcd --disable-shout"

extras/package/win32/build.sh -r -p -a "$ARCH" -g a
make -C "$BUILD_DIR" package-vjcurator-win32-portable

mkdir -p dist
cp "$BUILD_DIR"/vj-curator-*.zip dist/
cp "$BUILD_DIR"/vj-curator-*.7z dist/
