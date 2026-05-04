# Obsidian -- Agent Instructions

## Platform Reference

See the root [`AGENTS.md`](../AGENTS.md) for the canonical palette, design principles, and brand rules. Do not duplicate palette tables here.

## Obsidian Theme Format

- Obsidian community themes consist of `theme.css` and `manifest.json` at the repo/directory root.
- Both dark and light variants live in a single `theme.css`, switched via `.theme-dark` / `.theme-light` body class selectors.
- `manifest.json` contains name, version, minAppVersion, author, and optional authorUrl.

## CSS Architecture

The theme uses a five-layer CSS custom property system:

1. **Font declarations**: `@font-face` for Inter (text/interface) and Geist Mono (code). Loaded from `fonts/` directory via relative URL. Falls back to system fonts.
2. **Palette layer** (`--wb-*`): Canonical hex values inside `.theme-dark` / `.theme-light`. Only place raw hex appears. Test harness reads from these.
3. **Base mapping**: Maps `--wb-*` into Obsidian's `--color-base-*` ramp (13 steps) and `--color-*` extended colors.
4. **Code syntax**: `--code-*` variables mapped to `--wb-*` for both CodeMirror 6 and Prism.js. Additional `.token.*` rules for reading view.
5. **Warmth tweaks**: Warm shadows, scrollbar tints, softer radii. No layout changes.

## Color Variable Extraction

The test harness uses `obsidian_color(src, variant, key)` to extract `--wb-{key}: #hex;` from inside the `.theme-{variant}` block. When adding new palette colors, add them as `--wb-*` declarations in both variant blocks.

## Surface Ramp

The `--color-base-*` scale uses 13 steps (00, 05, 10, 20, 25, 30, 35, 40, 50, 60, 70, 100). All intermediates carry a warm undertone. In dark mode, 00 = deepest surface, 100 = primary text. In light mode, 00 = lightest surface, 100 = primary text.

## Heading Colors

H1 through H6 are mapped to palette materials by visual weight: amber, burnt orange, aged brass, terra cotta, steel patina, warm stone. Set via `--h1-color` through `--h6-color` in each variant block.

## Distribution

The theme is distributed via a mirror repo (`felipefdl/warm-burnout-obsidian`) that CI syncs on tag push. The mirror receives `theme.css`, `manifest.json`, `README.md`, `screenshot.png`, `fonts/`, `screenshots/`, and `LICENSE`. The Obsidian community directory pulls from that mirror. Source of truth is always this monorepo.

## File Structure

```
obsidian/
  theme.css        # Single CSS file, both dark + light variants
  manifest.json    # Obsidian theme manifest
  README.md        # Install instructions, screenshots, feature docs
  AGENTS.md        # This file
  screenshot.png   # Community theme directory screenshot
  fonts/
    InterVariable.woff2      # Inter variable font (interface/body text)
    GeistMono[wght].woff2    # Geist Mono variable font (code blocks)
  screenshots/
    callouts-dark.png        # Callout showcase, dark mode
    callouts-light.png       # Callout showcase, light mode
    headings-dark.png        # Heading gradient showcase, dark mode
    headings-light.png       # Heading gradient showcase, light mode
    code-dark.png            # Syntax highlighting showcase, dark mode
    code-light.png           # Syntax highlighting showcase, light mode
```

## Rules

1. Every hex value in `--wb-*` declarations must come from the canonical palette. No approximations.
2. Surface ramp intermediates must carry warm undertone (R > G > B in hex channels).
3. Do not add blues outside of the steel patina type accent.
4. Keep both `.theme-dark` and `.theme-light` blocks in sync: same `--wb-*` variable set, different values.
5. Test changes with `cargo test --test obsidian`.
