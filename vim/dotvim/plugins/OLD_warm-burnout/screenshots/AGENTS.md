# Screenshots -- Agent Instructions

## What This Is

HTML mockups of the Warm Burnout theme rendered to PNG via Playwright. These are used in the root README, VS Code Marketplace listing, and other platform READMEs.

The mockups are generic editor/terminal chrome (not VS Code, not Zed, not JetBrains). They exist to show the palette in a familiar but editor-neutral context.

## Files

- `editor-dark.html` / `.png` - TypeScript/React code, dark variant. Sidebar, tabs, line numbers, minimap.
- `editor-light.html` / `.png` - Rust code, light variant. Same layout.
- `terminal-dark.html` / `.png` - Ghostty-style terminal with zsh/starship prompt, tmux status bar.
- `split-comparison.html` / `.png` - Dark and light side by side, HTML/CSS snippet.
- `generate.mjs` - Playwright script that renders all HTML files to PNG at 2400x1600 (@2x retina).

## Regenerating

```sh
cd screenshots
npm install playwright
npx playwright install chromium
node generate.mjs
```

PNGs are committed to the repo. Regenerate after any palette change.

## Rules

1. All colors must come from the canonical palette in the root `AGENTS.md`. No approximations.
2. Use JetBrains Mono from Google Fonts as the monospace font.
3. Do not make the mockups look like any specific editor. Generic chrome only.
4. The tmux status bar in the terminal screenshot must match `tmux/warm-burnout-dark.conf`.
5. Code snippets should be realistic and show as many token types as possible (keywords, types, strings, functions, comments, operators, constants, tags, decorators).
6. Output at 1200x800 viewport with `deviceScaleFactor: 2` for retina PNGs (2400x1600).
7. The split comparison footer uses brand phrases from the root `AGENTS.md`.

## Where Screenshots Are Used

- Root `README.md` - relative paths (`screenshots/*.png`)
- `vscode/README.md` - relative paths (`screenshots/*.png`), images copied into `vscode/` during CI by `release-vscode.yml`
- `zed/README.md` - absolute GitHub raw URLs
- Other platform READMEs reference them via GitHub raw URLs when needed.

## Adding a New Screenshot

1. Create the HTML file with the theme colors as CSS variables.
2. Add the entry to `PAGES` in `generate.mjs`.
3. Run `node generate.mjs`.
4. Add references to the relevant READMEs.
