#!/usr/bin/env bash
# Builds the Linux AppImage and an Arch/CachyOS pacman package (x64).
set -euo pipefail
cd "$(dirname "$0")/.."

npm run build
npm run electron:build-main
rm -rf release/linux-unpacked release/NextNote-*.AppImage release/nextnote-*.pkg.tar.*
# VS Code terminals export ELECTRON_RUN_AS_NODE, which breaks electron-builder's helpers
env -u ELECTRON_RUN_AS_NODE npx electron-builder --linux AppImage pacman --x64
ls -la release/*.AppImage release/*.pkg.tar.*
