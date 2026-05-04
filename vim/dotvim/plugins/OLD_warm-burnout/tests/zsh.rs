mod common;

use common::{extract_hex_colors, is_valid_hex};

const DARK_THEME: &str = include_str!("../zsh/warm-burnout-dark.zsh-theme");
const LIGHT_THEME: &str = include_str!("../zsh/warm-burnout-light.zsh-theme");
const DARK_FZF: &str = include_str!("../zsh/warm-burnout-dark-fzf.zsh");
const LIGHT_FZF: &str = include_str!("../zsh/warm-burnout-light-fzf.zsh");

fn extract_style_keys(src: &str) -> Vec<&str> {
  src
    .lines()
    .filter_map(|l| {
      let l = l.trim();
      if l.starts_with("ZSH_HIGHLIGHT_STYLES[") {
        l.split('[').nth(1).and_then(|s| s.split(']').next())
      } else {
        None
      }
    })
    .collect()
}

#[test]
fn dark_theme_uses_zsh_highlight_styles() {
  assert!(
    DARK_THEME.contains("ZSH_HIGHLIGHT_STYLES"),
    "dark theme missing ZSH_HIGHLIGHT_STYLES"
  );
}

#[test]
fn light_theme_uses_zsh_highlight_styles() {
  assert!(
    LIGHT_THEME.contains("ZSH_HIGHLIGHT_STYLES"),
    "light theme missing ZSH_HIGHLIGHT_STYLES"
  );
}

#[test]
fn dark_fzf_sets_default_opts() {
  assert!(
    DARK_FZF.contains("FZF_DEFAULT_OPTS"),
    "dark fzf missing FZF_DEFAULT_OPTS"
  );
}

#[test]
fn light_fzf_sets_default_opts() {
  assert!(
    LIGHT_FZF.contains("FZF_DEFAULT_OPTS"),
    "light fzf missing FZF_DEFAULT_OPTS"
  );
}

#[test]
fn dark_theme_hex_colors_valid() {
  for (line, hex) in extract_hex_colors(DARK_THEME) {
    assert!(is_valid_hex(hex), "line {line}: invalid hex: {hex}");
  }
}

#[test]
fn light_theme_hex_colors_valid() {
  for (line, hex) in extract_hex_colors(LIGHT_THEME) {
    assert!(is_valid_hex(hex), "line {line}: invalid hex: {hex}");
  }
}

#[test]
fn dark_fzf_hex_colors_valid() {
  for (line, hex) in extract_hex_colors(DARK_FZF) {
    assert!(is_valid_hex(hex), "line {line}: invalid hex: {hex}");
  }
}

#[test]
fn light_fzf_hex_colors_valid() {
  for (line, hex) in extract_hex_colors(LIGHT_FZF) {
    assert!(is_valid_hex(hex), "line {line}: invalid hex: {hex}");
  }
}

#[test]
fn dark_and_light_themes_have_same_style_keys() {
  let dark_keys = extract_style_keys(DARK_THEME);
  let light_keys = extract_style_keys(LIGHT_THEME);
  assert_eq!(
    dark_keys, light_keys,
    "dark and light zsh themes should style the same keys"
  );
}

#[test]
fn dark_theme_uses_canonical_foreground() {
  assert!(
    DARK_THEME.contains("#bfbdb6"),
    "dark zsh theme should use canonical foreground #bfbdb6"
  );
}

#[test]
fn light_theme_uses_canonical_foreground() {
  assert!(
    LIGHT_THEME.contains("#3a3630"),
    "light zsh theme should use canonical foreground #3a3630"
  );
}

#[test]
fn dark_fzf_uses_canonical_background() {
  assert!(
    DARK_FZF.contains("#1a1510"),
    "dark fzf theme should use canonical background #1a1510"
  );
}

#[test]
fn light_fzf_uses_canonical_background() {
  assert!(
    LIGHT_FZF.contains("#F5EDE0") || LIGHT_FZF.contains("#f5ede0"),
    "light fzf theme should use canonical background #F5EDE0"
  );
}
