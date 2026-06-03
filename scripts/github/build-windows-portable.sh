#!/usr/bin/env bash
set -euo pipefail

ARCH="${1:-x86_64}"
RELEASE_VERSION="${VJ_CURATOR_RELEASE_VERSION:-${VJ_CURATOR_RELEASE_TAG:-${GITHUB_REF_NAME:-dev}}}"
RELEASE_VERSION="${RELEASE_VERSION#v}"

if [ -z "$RELEASE_VERSION" ]; then
  RELEASE_VERSION="dev"
fi

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
zip_artifact="$(find "$BUILD_DIR" -maxdepth 1 -type f -name 'vj-curator-*.zip' | sort | head -n 1)"
seven_zip_artifact="$(find "$BUILD_DIR" -maxdepth 1 -type f -name 'vj-curator-*.7z' | sort | head -n 1)"

if [ -z "$zip_artifact" ] || [ -z "$seven_zip_artifact" ]; then
  echo "Expected Windows portable artifacts were not created" >&2
  exit 1
fi

cp "$zip_artifact" "dist/vj-curator-${RELEASE_VERSION}-${BUILD_DIR}.zip"
cp "$seven_zip_artifact" "dist/vj-curator-${RELEASE_VERSION}-${BUILD_DIR}.7z"
