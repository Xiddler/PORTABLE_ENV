# Warm Burnout for Ghostty

Your terminal was also burning your retinas. Now it matches the rest of the damage.

## Install

Copy the theme files to your Ghostty themes directory:

```sh
mkdir -p ~/.config/ghostty/themes
cp warm-burnout-dark warm-burnout-light ~/.config/ghostty/themes/
```

## Configure

Add to your `~/.config/ghostty/config`:

```
# Dark theme
theme = warm-burnout-dark

# Light theme
theme = warm-burnout-light
```

### Auto-switching (dark/light)

If your system handles light/dark mode switching:

```
theme = dark:warm-burnout-dark,light:warm-burnout-light
```

Restart Ghostty after changing the config.

## Verify

Run any ANSI color test script or just `ls --color`. Warm browns instead of searing blues.

## Palette

Both themes derive from the canonical Warm Burnout palette defined in the root [`AGENTS.md`](../AGENTS.md). The ANSI colors map directly from the VS Code terminal colors.
