mod common;

use common::{hex_to_lower, is_valid_hex};

const DARK: &str = include_str!("../ghostty/warm-burnout-dark");
const LIGHT: &str = include_str!("../ghostty/warm-burnout-light");

fn validate_ghostty_theme(src: &str) {
  for (i, line) in src.lines().enumerate() {
    let line = line.trim();
    if line.is_empty() || line.starts_with('#') {
      continue;
    }
    let (key, value) = line
      .split_once('=')
      .unwrap_or_else(|| panic!("line {}: no '=' separator: {line}", i + 1));
    let key = key.trim();
    let value = value.trim();

    if key == "palette" {
      let (_, hex) = value
        .split_once('=')
        .unwrap_or_else(|| panic!("line {}: bad palette entry: {value}", i + 1));
      assert!(
        is_valid_hex(hex.trim()),
        "line {}: invalid hex in palette: {hex}",
        i + 1
      );
    } else if key.contains("color") || key.contains("background") || key.contains("foreground") {
      assert!(is_valid_hex(value), "line {}: {key} has invalid hex: {value}", i + 1);
    }
  }
}

fn get_value<'a>(src: &'a str, key: &str) -> &'a str {
  src
    .lines()
    .find(|l| {
      let l = l.trim();
      l.starts_with(key) && l[key.len()..].trim_start().starts_with('=')
    })
    .and_then(|l| l.split_once('='))
    .map(|(_, v)| v.trim())
    .unwrap_or_else(|| panic!("missing key: {key}"))
}

#[test]
fn dark_is_valid() {
  validate_ghostty_theme(DARK);
}

#[test]
fn light_is_valid() {
  validate_ghostty_theme(LIGHT);
}

#[test]
fn dark_has_16_palette_entries() {
  let count = DARK.lines().filter(|l| l.starts_with("palette")).count();
  assert_eq!(count, 16, "expected 16 palette entries, got {count}");
}

#[test]
fn light_has_16_palette_entries() {
  let count = LIGHT.lines().filter(|l| l.starts_with("palette")).count();
  assert_eq!(count, 16, "expected 16 palette entries, got {count}");
}

#[test]
fn dark_has_required_keys() {
  let keys: Vec<&str> = DARK
    .lines()
    .filter(|l| !l.is_empty() && !l.starts_with('#'))
    .filter_map(|l| l.split_once('=').map(|(k, _)| k.trim()))
    .collect();
  for required in [
    "background",
    "foreground",
    "cursor-color",
    "selection-background",
    "selection-foreground",
  ] {
    assert!(keys.contains(&required), "missing key: {required}");
  }
}

#[test]
fn light_has_required_keys() {
  let keys: Vec<&str> = LIGHT
    .lines()
    .filter(|l| !l.is_empty() && !l.starts_with('#'))
    .filter_map(|l| l.split_once('=').map(|(k, _)| k.trim()))
    .collect();
  for required in [
    "background",
    "foreground",
    "cursor-color",
    "selection-background",
    "selection-foreground",
  ] {
    assert!(keys.contains(&required), "missing key: {required}");
  }
}

#[test]
fn dark_cursor_text_matches_background() {
  let bg = get_value(DARK, "background");
  let cursor_text = get_value(DARK, "cursor-text");
  assert_eq!(
    hex_to_lower(bg),
    hex_to_lower(cursor_text),
    "dark cursor-text should match background for readability"
  );
}

#[test]
fn light_cursor_text_matches_background() {
  let bg = get_value(LIGHT, "background");
  let cursor_text = get_value(LIGHT, "cursor-text");
  assert_eq!(
    hex_to_lower(bg),
    hex_to_lower(cursor_text),
    "light cursor-text should match background for readability"
  );
}

#[test]
fn dark_palette_indices_are_sequential() {
  let indices: Vec<u8> = DARK
    .lines()
    .filter(|l| l.starts_with("palette"))
    .filter_map(|l| {
      let val = l.split_once('=').unwrap().1.trim();
      val.split_once('=').unwrap().0.parse::<u8>().ok()
    })
    .collect();
  for i in 0u8..16 {
    assert!(indices.contains(&i), "dark missing palette index {i}");
  }
}

#[test]
fn light_palette_indices_are_sequential() {
  let indices: Vec<u8> = LIGHT
    .lines()
    .filter(|l| l.starts_with("palette"))
    .filter_map(|l| {
      let val = l.split_once('=').unwrap().1.trim();
      val.split_once('=').unwrap().0.parse::<u8>().ok()
    })
    .collect();
  for i in 0u8..16 {
    assert!(indices.contains(&i), "light missing palette index {i}");
  }
}
