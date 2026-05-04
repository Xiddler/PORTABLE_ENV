# Warm Burnout for Starship

Your prompt was the last thing still using default colors. Fixed that.

## Install

### Option A: ANSI colors (recommended)

If your terminal already runs a Warm Burnout theme (Ghostty, Alacritty, etc.), the example config references ANSI color names directly. Dark/light switching is handled by the terminal. No palette needed, no hacks.

```sh
cp starship.toml ~/.config/starship.toml
```

That's it. The terminal's theme defines what `yellow`, `blue`, `red` etc. look like.

### Option B: Explicit palette

If your terminal doesn't have a Warm Burnout theme, paste a palette into your config:

**Dark:**

```sh
cat warm-burnout-dark.toml >> ~/.config/starship.toml
```

**Light:**

```sh
cat warm-burnout-light.toml >> ~/.config/starship.toml
```

Then add this line at the top of your config (before any module sections):

```toml
palette = "warm_burnout_dark"
# or
palette = "warm_burnout_light"
```

And use the palette color names in your module styles (e.g. `style = "bold amber"`).

Available palette colors: `background`, `foreground`, `comment`, `cursor`, `accent`, `burnt_orange`, `amber`, `gold`, `aged_brass`, `terra_cotta`, `coral`, `dusty_mauve`, `dried_sage`, `verdigris`, `steel_patina`, `error`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`.

## Dark/light auto-switching

**Option A handles this automatically.** Your terminal switches its ANSI colors when the OS appearance changes, and Starship inherits them. No config changes needed.

**Option B requires manual switching.** Change the `palette` line in your config and restart your shell. Starship doesn't have native appearance detection yet ([starship/starship#6991](https://github.com/starship/starship/issues/6991)).

## Verify

Restart your shell (or open a new terminal). Your prompt should show warm tones instead of whatever default blue situation you had going on.

Navigate to a git repo to confirm branch and status colors.

## Palette

Both themes derive from the canonical Warm Burnout palette defined in the root [`AGENTS.md`](../AGENTS.md).
