#!/bin/bash
# install.sh — IINA Zoom Controls installer
# Adds Z / X / Alt+Z keybindings to remove black bars in IINA
#
# Usage: bash install.sh

set -e

SCRIPTS_DIR="$HOME/.config/mpv"
INPUT_CONF="$SCRIPTS_DIR/input.conf"

echo "→ Installing IINA Zoom Controls..."

# Create mpv config dir if needed
mkdir -p "$SCRIPTS_DIR"

# Check if input.conf already exists
if [ -f "$INPUT_CONF" ]; then
    echo "⚠️  input.conf already exists. Appending zoom bindings..."
    echo "" >> "$INPUT_CONF"
    echo "# IINA Zoom Controls (added by install.sh)" >> "$INPUT_CONF"
    echo "z      add video-zoom  0.05" >> "$INPUT_CONF"
    echo "x      add video-zoom -0.05" >> "$INPUT_CONF"
    echo "alt+z  set video-zoom  0" >> "$INPUT_CONF"
else
    cat > "$INPUT_CONF" << 'EOF'
# IINA / mpv Zoom Controls
# Removes black bars (letterbox) by zooming into the video

z      add video-zoom  0.05
x      add video-zoom -0.05
alt+z  set video-zoom  0
EOF
fi

echo ""
echo "✅ Done! Fully quit IINA (⌘Q) and reopen it."
echo ""
echo "Controls:"
echo "  Z       → Zoom in"
echo "  X       → Zoom out"
echo "  Alt+Z   → Reset zoom"
