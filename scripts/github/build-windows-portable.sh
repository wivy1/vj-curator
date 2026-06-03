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

# CI builds target local clip curation, so avoid optional disc, network,
# stream-output, resampler, and AV1/WebM codec contribs that often slow or
# break hosted Windows builds.
export CONTRIBFLAGS="${CONTRIBFLAGS:-} --disable-disc --disable-net --disable-sout --disable-samplerate --disable-soxr --disable-vpx --disable-aom --disable-rav1e --disable-dav1d"
export CONFIGFLAGS="${CONFIGFLAGS:-} --disable-sout --disable-live555 --disable-dvdread --disable-dvdnav --disable-bluray --disable-vcd --disable-shout --disable-samplerate --disable-soxr --disable-vpx --disable-aom --disable-rav1e --disable-dav1d"

# Build Windows contribs from source. The public prebuilt contrib archive can
# lag this VLC source tree and provide older FFmpeg libraries than configure
# accepts. Set RELEASE without -r so the upstream script does not try to build
# the NSIS installer after compiling VLC.
RELEASE=yes extras/package/win32/build.sh -a "$ARCH" -g a
make -C "$BUILD_DIR" package-vjcurator-win32-portable

mkdir -p dist
cp "$BUILD_DIR"/vj-curator-*.zip dist/
cp "$BUILD_DIR"/vj-curator-*.7z dist/
