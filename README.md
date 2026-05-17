# IINA Zoom Controls — Remove Black Bars

A minimal fix for letterboxed videos in IINA. Adds three keyboard shortcuts to zoom into the video and remove black bars on the top and bottom.

## The Problem

Videos with aspect ratios like 2.35:1 or 21:9 show black bars on a 16:9 or 16:10 display. IINA doesn't currently have a built-in zoom slider or auto-crop toggle that works reliably.

## The Solution

Three mpv key bindings added to `~/.config/mpv/input.conf`:

| Key | Action |
|-----|--------|
| `Z` | Zoom in (press until black bars disappear) |
| `X` | Zoom out |
| `Alt+Z` | Reset to original |

No external scripts, no dependencies — just native mpv commands that IINA passes through directly.

## Install

### Option A — One-line install (recommended)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Rayasurya/iina-zoom-controls/main/install.sh)
```

### Option B — Manual

1. Open Terminal
2. Run:

```bash
mkdir -p ~/.config/mpv
cat >> ~/.config/mpv/input.conf << 'EOF'

# IINA Zoom Controls
z      add video-zoom  0.05
x      add video-zoom -0.05
alt+z  set video-zoom  0
EOF
```

3. Fully quit IINA (`⌘Q`) and reopen it

### Option C — Via IINA Settings (no Terminal)

1. Open **IINA → Settings (`⌘,`) → Key Bindings**
2. Select your profile (duplicate IINA Default if needed)
3. Click **+** and add these three bindings:

| Key | mpv command |
|-----|-------------|
| `Z` | `add video-zoom 0.05` |
| `X` | `add video-zoom -0.05` |
| `Alt+Z` | `set video-zoom 0` |

## Usage

While a video is playing, press **`Z`** repeatedly until the black bars disappear. Press **`X`** to zoom back out. Press **`Alt+Z`** to fully reset.

## How it works

Uses mpv's native `video-zoom` property. Each press of `Z` increases zoom by `0.05` (about 5%), which is enough to incrementally dial in the right amount without overshooting.

## Compatibility

- ✅ IINA 1.3.x and above
- ✅ macOS 12 Monterey and above
- ✅ Works with all video formats IINA supports
- ✅ No Lua scripts or external dependencies

## Related

- [IINA Issue #1805](https://github.com/iina/iina/issues/1805) — Auto cropping feature request
- [mpv manual — video-zoom](https://mpv.io/manual/stable/#command-interface-video-zoom)
