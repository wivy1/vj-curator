# VJ Curator 0.1.2

This release fixes a macOS startup crash found in the 0.1.1 build.

VJ Curator 0.1.2 is based on VLC 4.0.0-dev.

## Highlights

- Starts with an empty queue so you can drop in videos or folders.
- Moves each sorted clip into a numbered folder beside that clip.
- Moves the currently playing clip into folders `0` through `9` using top-row or numpad keys.
- Updates the remaining clip counter beside the volume controls.
- Replaces VLC's empty queue text with VJ Curator-specific drop guidance.
- Removes Qt-only launcher options from macOS and adds native macOS numeric-key curation.
- Fixes a macOS crash during launch when VLC menu shortcuts with no assigned key were loaded.
- Provides a one-file Windows launcher and a one-app macOS archive.

## License

VJ Curator is derived from VLC and preserves VLC licensing and attribution. See `COPYING`, `COPYING.LIB`, `AUTHORS`, `THANKS`, and `README-VLC.md`.
