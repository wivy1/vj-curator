#!/usr/bin/env bash
set -euo pipefail

ARCH="${1:-$(uname -m)}"
BUILD_DIR="${2:-build-macos}"
RELEASE_VERSION="${VJ_CURATOR_RELEASE_VERSION:-${VJ_CURATOR_RELEASE_TAG:-${GITHUB_REF_NAME:-dev}}}"
RELEASE_VERSION="${RELEASE_VERSION#v}"

if [ -z "$RELEASE_VERSION" ]; then
  RELEASE_VERSION="dev"
fi

# The fixed-point Tremor contrib can be selected incorrectly on hosted macOS
# runners and fails autoreconf because its Xiph Ogg macro is not expanded.
export CONTRIBFLAGS="${CONTRIBFLAGS:-} --disable-tremor"
export VLC_CONFIGURE_ARGS="${VLC_CONFIGURE_ARGS:-} --disable-tremor"

extras/package/macosx/build.sh -d -i z -a "$ARCH" -C "$BUILD_DIR"
make -C "$BUILD_DIR" package-vjcurator-macosx-portable

mkdir -p dist
dmg_artifact="$(find "$BUILD_DIR" -maxdepth 1 -type f -name 'vj-curator-*-macos.dmg' | sort | head -n 1)"

if [ -z "$dmg_artifact" ]; then
  echo "Expected macOS portable artifact was not created" >&2
  exit 1
fi

cp "$dmg_artifact" "dist/vj-curator-${RELEASE_VERSION}-macos.dmg"
