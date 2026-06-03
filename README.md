# VJ Curator

VJ Curator is a portable VLC fork for VJs who need to preview and sort thousands of video clips quickly from a familiar VLC-style interface.

Drop the app into a folder of clips, launch it, and press `0` through `9` while each clip plays. VJ Curator moves the current clip into a sibling folder named for that number, removes it from the queue, and starts the next clip.

## Features

- Automatically indexes visible files directly next to the app on launch.
- Ignores hidden files and every subdirectory.
- Uses VLC's playback engine, so files are handed to VLC rather than filtered by extension.
- Sorts the queue alphabetically by filename.
- Plays clips sequentially with shuffle and repeat disabled at startup.
- Supports top-row digit keys and numpad digit keys.
- Runs the curation action on a single keypress, not while a key is held down.
- Creates destination folders named exactly `0` through `9` when needed.
- Moves files instead of copying them.
- Keeps a remaining-clip counter beside the volume controls.
- Shows a VJ Curator-specific empty queue message after the last clip is moved.

## Downloads

Published releases should include portable, no-installer archives:

- `vj-curator-*-win64.zip`
- `vj-curator-*-win64.7z`
- `vj-curator-*-macosx.zip`

See [PUBLISHING.md](PUBLISHING.md) for the release process and build requirements.

## Usage

1. Download and extract the portable archive for your platform.
2. Put the app in the same folder as the clips you want to curate.
3. Launch VJ Curator.
4. While each clip plays, press a number from `0` to `9`.
5. Find sorted clips in sibling folders named `0`, `1`, `2`, and so on.

Only files directly next to the app are indexed. Files inside subfolders are ignored, including files inside the numeric destination folders.

## Build

This fork keeps VLC's build system and adds portable package targets:

```sh
# Windows cross-build, from the configured win64 build directory
make package-vjcurator-win32-portable

# macOS, from the configured macOS build directory
make package-vjcurator-macosx-portable
```

GitHub Actions workflows are included under `.github/workflows/` to build release artifacts on tag pushes or manual dispatch. VLC is a large native project with substantial platform toolchain requirements, so first release runs may require runner dependency tuning.

## Attribution And License

VJ Curator is derived from VLC. VLC's original license, author, and contributor attribution files are preserved:

- [COPYING](COPYING)
- [COPYING.LIB](COPYING.LIB)
- [AUTHORS](AUTHORS)
- [THANKS](THANKS)
- [README-VLC.md](README-VLC.md)

VJ Curator is distributed under the same GPL terms as VLC. libVLC remains under VLC's LGPL terms.
