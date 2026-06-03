# VJ Curator

VJ Curator is a portable video-sorting app for VJs.

It looks and feels like VLC, but it is built for one job: quickly watching a folder of clips and sorting them with the number keys.

## Why Use It

When you have hundreds or thousands of loops, edits, renders, grabs, and experiments, sorting them by dragging files around is slow.

VJ Curator lets you play through a folder one clip at a time. While a clip is playing, press `0` through `9` to move that clip into a matching folder.

For example:

- Press `1` for keepers.
- Press `2` for maybes.
- Press `3` for texture clips.
- Press `0` for rejects.

You decide what the numbers mean.

## How It Works

1. Put VJ Curator in the same folder as your video clips.
2. Open VJ Curator.
3. It loads the clips in that folder.
4. Watch the current clip.
5. Press a number key from `0` to `9`.
6. The clip moves into a folder with that number, and the next clip starts.

VJ Curator only looks at files in the same folder as the app. It ignores subfolders, including the numbered folders it creates.

It moves files instead of copying them. Try it on a test folder first if you are working with important originals.

## Download

Download the newest release here:

[Download VJ Curator](https://github.com/wivy1/vj-curator/releases/latest)

All releases are here:

[All VJ Curator releases](https://github.com/wivy1/vj-curator/releases)

On the release page:

- Windows: download the `win64.zip` or `win64.7z` file.
- macOS: download the `macosx.zip` file.

## Install

### Windows

1. Download the Windows archive from [the latest release](https://github.com/wivy1/vj-curator/releases/latest).
2. Extract the archive.
3. Put the extracted VJ Curator folder next to the clips you want to sort.
4. Open `VJ Curator.exe`.

### macOS

1. Download the macOS archive from [the latest release](https://github.com/wivy1/vj-curator/releases/latest).
2. Unzip it.
3. Put `VJ Curator.app` next to the clips you want to sort.
4. Open the app.

If macOS blocks the app the first time, right-click `VJ Curator.app`, choose `Open`, then choose `Open` again.

## Notes

- Top-row number keys and numpad keys both work.
- Holding a number key down will not repeatedly sort the same clip.
- The counter beside the volume controls shows how many clips are left.
- When the folder is empty, the app shows a simple prompt telling you what to do next.

## Credits

VJ Curator is based on [VLC media player](https://www.videolan.org/vlc/). It keeps VLC's open-source licensing and attribution files.

This project is not an official VideoLAN release.
