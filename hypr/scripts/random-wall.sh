#!/usr/bin/env bash
WALL_DIR="$HOME/walls"
chosen=$(find "$WALL_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)
[ -n "$chosen" ] && hyprctl hyprpaper wallpaper ",$chosen"
