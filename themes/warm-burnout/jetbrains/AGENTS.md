# JetBrains -- Agent Instructions

## Platform Reference

See the root [`AGENTS.md`](../AGENTS.md) for the canonical palette, design principles, and brand rules. Do not duplicate palette tables here.

## Theme Architecture

Warm Burnout for JetBrains uses two layers:

1. **`.theme.json`** -- full UI theme with Islands support (sidebar, tabs, toolbar, popups, buttons, etc.)
2. **`.xml`** -- editor color scheme (syntax highlighting, gutter, caret, selection)

The `.theme.json` references the `.xml` via `editorScheme`. Both are packaged together as a plugin (`.jar`).

## Plugin Structure

```
jetbrains/
  META-INF/
    plugin.xml                              # Plugin manifest
  Warm Burnout Islands Dark.theme.json      # Dark UI theme (Islands)
  Warm Burnout Islands Light.theme.json     # Light UI theme (Islands)
  Warm-Burnout-Dark.xml                     # Dark editor scheme
  Warm-Burnout-Light.xml                    # Light editor scheme
  build.sh                                  # Build plugin JAR
  README.md                                 # Install instructions
  AGENTS.md                                 # This file
```

## `.theme.json` Format

- JSON file with `name`, `dark` (boolean), `author`, `parentTheme`, `editorScheme` (path to `.xml`), and `ui` (component tree).
- UI keys follow `ComponentName.propertyName` pattern with nesting support.
- Colors are 6-digit hex without `#` prefix. 8-digit hex includes alpha.
- The `*` wildcard sets defaults inherited by all components.
- Islands themes require `parentTheme` (`Islands Dark` / `Islands Light`), `Island` section, and `MainWindow.background`.

## `.xml` Format (Editor Scheme)

- XML with `<scheme>` root, `<colors>` section, and `<attributes>` section.
- Colors are 6-digit hex without `#` prefix.
- `parent_scheme="Darcula"` (dark) / `parent_scheme="Default"` (light) for inheritance.
- Language-specific attributes inherit from `DEFAULT_*` automatically.
- Additional editor attributes (search results, breadcrumbs, folded text, TODOs) override parent scheme defaults to prevent blue bleed-through.

## `FONT_TYPE` Values

- `0` = normal
- `1` = bold
- `2` = italic
- `3` = bold italic

## UI Color Hierarchy (Dark)

- `#14120f` -- sidebar, panels, toolbar, status bar
- `#1a1510` -- editor background, selected tab
- `#1f1d17` -- popups, menus, widgets, text fields
- `#222018` -- hover, line highlight, active selections
- `#2a2620` -- borders, separators, indent guides
- `#4a4438` -- muted elements (line numbers, scrollbar thumb)
- `#b8522e` -- accent (buttons, underlines, focus rings)

## UI Color Hierarchy (Light)

- `#ede6da` -- sidebar, panels, toolbar, status bar
- `#f5ede0` -- editor background, selected tab
- `#f0e8dc` -- popups, menus, widgets, text fields
- `#e3dbd0` -- hover, active selections
- `#DDD6CA` -- borders, separators
- `#a89880` -- muted elements (line numbers, scrollbar thumb)
- `#b8522e` -- accent (buttons, underlines, focus rings)
