#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.themes"
ln -sT "$SCRIPT_DIR/Redmond97 Binbows" "$HOME/.themes/Redmond97 Binbows"

mkdir -p "$HOME/.icons"
ln -sT "$SCRIPT_DIR/SE98 Binbows" "$HOME/.icons/SE98 Binbows"

MOZILLA_PATH="${HOME}/.mozilla/firefox"
DEFAULT_PROFILE=$(grep "^Path=" "${MOZILLA_PATH}/profiles.ini" | grep "default-release" | cut -d= -f2)
if [ -z "$DEFAULT_PROFILE" ]; then
  echo "Error: Could not find default-release profile"
  exit 1
fi
ln -sT "$SCRIPT_DIR/Firefox Binbows/chrome" "$MOZILLA_PATH/$DEFAULT_PROFILE/chrome"
