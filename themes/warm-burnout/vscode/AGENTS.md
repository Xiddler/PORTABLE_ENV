# Warm Burnout VS Code -- Agent Instructions

For brand identity, design principles, canonical palette, and suite-level rules, see the [root AGENTS.md](../AGENTS.md). This file covers VS Code-specific implementation details only.

## Project Structure

```
vscode/
  package.json              # Extension manifest (name: warm-burnout)
  themes/
    warm-burnout-dark.json  # Dark theme
    warm-burnout-light.json # Light theme
  .vscode/
    launch.json             # F5 to test in Extension Development Host
```

## Surface Hierarchy

VS Code has multiple UI surfaces that need distinct background levels.

### Dark

| Surface           | Hex       | VS Code elements                              |
|-------------------|-----------|-----------------------------------------------|
| Sidebar/panel     | `#14120f` | sideBar, panel, statusBar, terminal, titleBar  |
| Editor            | `#1a1510` | editor, active tab, minimap                    |
| Line highlight    | `#222018` | editor.lineHighlightBackground                 |
| Widgets/dropdowns | `#1f1d17` | editorWidget, hover, suggest, menus            |

### Light

| Surface           | Hex       | VS Code elements                              |
|-------------------|-----------|-----------------------------------------------|
| Input fields      | `#FAF6F0` | input, inlineChatInput                        |
| Editor            | `#F5EDE0` | editor, active tab, minimap, commandCenter    |
| Widgets/dropdowns | `#F0E8DC` | editorWidget, hover, suggest, menus, debugBar |
| Sidebar/panels    | `#EDE6DA` | sideBar, panel, statusBar, terminal, titleBar |
| Activity bar      | `#E6E0D4` | activityBar                                   |
| Borders           | `#DDD6CA` | all structural borders and separators         |

Line highlight (light): `#00000014` (8% black overlay).
Find match (light): `#E0C890` (warm gold, hue-distinct from background).

## Do NOT Modify

- Terminal ANSI colors (programs rely on standard color mapping)
- Selection/highlight background blues (must stay neutral/unambiguous)
- Git decoration colors (blue=modified, green=added, red=deleted)

## Modifying Colors

1. Check the [root AGENTS.md](../AGENTS.md) canonical palette first
2. Verify contrast compliance in both themes:
   - Dark: >= 7.0:1 (AAA) against `#1a1510`
   - Light: >= 4.5:1 (AA) against `#F5EDE0`
3. Validate JSON:
   ```bash
   python3 -c "import json; json.load(open('themes/warm-burnout-dark.json'))"
   python3 -c "import json; json.load(open('themes/warm-burnout-light.json'))"
   ```
4. Test in Extension Development Host (F5 -> select theme with Cmd+K Cmd+T)
5. Check multiple languages: TypeScript, HTML/JSX, CSS, Python, Rust, YAML, Markdown
6. If changing a palette color, update the root AGENTS.md canonical tables first

## Testing Checklist

### Dark

1. F5 -> "Warm Burnout Dark" (Cmd+K Cmd+T)
2. Verify:
   - TypeScript/JavaScript: keywords bold, types italic steel-blue, functions amber
   - HTML/JSX: tags terra cotta, attributes amber, components steel-blue
   - CSS: properties brass, pseudo-classes verdigris, tag selectors brass
   - Python/Rust: types italic, strings sage, numbers mauve
   - YAML: keys readable, values distinguishable
   - Markdown: headings sage+bold, links terra cotta, code blocks visible
3. Sidebar symbol outline: icons use warm palette
4. Diff view: added green, deleted red, modified blue
5. No cool blues in syntax (only types)

### Light

1. F5 -> "Warm Burnout Light" (Cmd+K Cmd+T)
2. Background is warm sepia cream (`#F5EDE0`), not white
3. Verify same file types as dark:
   - TypeScript/JavaScript: keywords bold dark amber, types italic teal
   - HTML/JSX: tags terra cotta, attributes amber, components teal
   - CSS: properties aged brass, pseudo-classes forest green
   - Python/Rust: types italic teal, strings olive, numbers dark mauve
4. All borders warm beige (`#DDD6CA`), not cool gray
5. Sidebar/panels warmer/darker than editor
6. Cursor is gold (`#8a6600`), visible on cream
7. Git decorations: blue modified, dark green added, dark red deleted
8. Find match highlights golden (`#E0C890`), not gray
