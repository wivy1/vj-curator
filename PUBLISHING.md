# Publishing VJ Curator

This repository is prepared for GitHub hosting and GitHub Releases.

## One-Time GitHub Setup

1. Create a public GitHub repository named `vj-curator`.
2. Add it as `origin` and publish the current commit as GitHub's `main` branch:

   ```sh
   git remote add origin https://github.com/<your-user-or-org>/vj-curator.git
   git push -u origin HEAD:main
   ```

3. Confirm Actions are enabled in the repository.

## Creating A Release

1. Tag the commit:

   ```sh
   git tag v0.1.0
   git push origin v0.1.0
   ```

2. The `release.yml` workflow builds portable Windows and macOS archives.
3. When both build jobs finish, the workflow creates or updates the matching GitHub Release and uploads the archives.

You can also run the workflow manually from the GitHub Actions tab and provide a tag name.

## Local Build Notes

VLC builds require a full native toolchain and VLC contrib dependencies.

Windows portable archive:

```sh
extras/package/win32/build.sh -r -p -a x86_64
make -C win64 package-vjcurator-win32-portable
```

macOS portable archive:

```sh
extras/package/macosx/build.sh -d -i z -C build-macos
make -C build-macos package-vjcurator-macosx-portable
```

## Maintainer Checklist

- Keep `COPYING`, `COPYING.LIB`, `AUTHORS`, `THANKS`, and `README-VLC.md` in distributed source archives.
- Do not replace VLC attribution in source headers.
- Test curation with a folder containing ordinary clips plus nested folders, hidden files, and existing `0` through `9` folders.
- Confirm releases contain no installer-only artifacts unless intentionally added.
