# Warm Burnout for Zsh

Your shell was also rendering in fluorescent hospital lighting. Fixed.

## What's Included

- **zsh-syntax-highlighting themes**: colors commands as you type them. Dark and light variants.
- **fzf color schemes**: colors the fuzzy finder UI. Dark and light variants.

No prompt theme. Your prompt layout is your business. Prompt colors inherit from the terminal's ANSI palette. If you're using the Ghostty theme, you're already set.

## Prerequisites

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): the syntax highlighter itself
- [fzf](https://github.com/junegunn/fzf): only needed if you want the fzf theme
- A **truecolor terminal** (Ghostty, iTerm2, WezTerm, Alacritty, etc.). These themes use `fg=#RRGGBB`. 256-color terminals will not work.

## Install

### Syntax Highlighting

Source the theme file **after** loading zsh-syntax-highlighting in your `.zshrc`:

```sh
# Load zsh-syntax-highlighting first (however you installed it)
source /path/to/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Then load the Warm Burnout theme
source /path/to/warm-burnout-dark.zsh-theme
# or
source /path/to/warm-burnout-light.zsh-theme
```

Order matters. The theme sets `ZSH_HIGHLIGHT_STYLES` entries that the plugin reads. Source the theme after the plugin, not before.

### fzf

Source the fzf theme **after** fzf initialization in your `.zshrc`:

```sh
# Initialize fzf first (however you installed it)
eval "$(fzf --zsh)"

# Then load the Warm Burnout fzf theme
source /path/to/warm-burnout-dark-fzf.zsh
# or
source /path/to/warm-burnout-light-fzf.zsh
```

The theme appends `--color` flags to `FZF_DEFAULT_OPTS`, so any fzf invocation picks them up.

## Dark/Light Switching

There's no auto-switch mechanism for Zsh themes. If you switch between dark and light, source the matching files. A conditional in `.zshrc` based on your terminal's mode can automate this. Left as an exercise for the reader.

## Palette

Both themes derive from the canonical Warm Burnout palette defined in the root [`AGENTS.md`](../AGENTS.md).
