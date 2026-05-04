# Starship -- Agent Instructions

## Platform Reference

See the root [`AGENTS.md`](../AGENTS.md) for the canonical palette, design principles, and brand rules. Do not duplicate palette tables here.

## Starship Theme Format

- Configuration file: `~/.config/starship.toml` (single TOML file).
- Palettes are defined in `[palettes.<name>]` sections.
- Colors defined in a palette are referenced by name in module `style` fields.
- Active palette is set with `palette = '<name>'` at the top level.
- Palette names use underscores (`warm_burnout_dark`) because TOML bare keys cannot contain hyphens.

## Files

- `starship.toml` -- example config using ANSI color names (recommended, auto-switches with terminal theme).
- `warm-burnout-dark.toml` -- standalone dark palette with hex values, for terminals without a Warm Burnout theme.
- `warm-burnout-light.toml` -- standalone light palette with hex values, same use case.

## Two Approaches

### ANSI colors (recommended)

The example config (`starship.toml`) references terminal ANSI color names (`yellow`, `blue`, `red`, etc.) instead of hex values. The terminal's theme defines what those colors look like. This means dark/light switching is handled entirely by the terminal (e.g. Ghostty's `theme = dark:warm-burnout-dark,light:warm-burnout-light`) with zero Starship config changes.

### Explicit palettes (fallback)

The standalone `.toml` files define hex-value palettes for users whose terminal doesn't have a Warm Burnout theme installed. Requires manual `palette` line switching for dark/light.

## Color Mapping

ANSI color names to module roles:

| Module Role        | ANSI Color     | Palette Equivalent | Rationale                       |
|--------------------|----------------|--------------------|---------------------------------|
| Directory path     | `bright-yellow`| `amber`            | High visibility, warm           |
| Git branch         | `blue`         | `steel_patina`     | Cool accent -- VCS is structural|
| Git status (dirty) | `red`          | `coral`            | Attention-drawing               |
| Character success  | `yellow`       | warm accent        | Visible, warm                   |
| Character error    | `red`          | `error`            | Unmistakable failure signal     |
| Character vim      | `green`        | `dried_sage`       | Calm, modal indicator           |
| Command duration   | `bright-black` | `comment`          | Subdued, informational          |
| Git state          | `bright-black` | `comment`          | Subdued, informational          |
| Python virtualenv  | `bright-black` | `comment`          | Subdued, informational          |

## Design Decisions

- ANSI-first approach for seamless dark/light switching without hacks.
- No powerline segments or fancy separators -- consistent with the "comfort over flash" brand.
- Minimal module set in the example config -- users bring their own prompt structure.
- Starship lacks native appearance detection ([starship/starship#6991](https://github.com/starship/starship/issues/6991)), so ANSI delegation is the cleanest workaround.
