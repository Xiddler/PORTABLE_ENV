mod common;

use common::{hex_to_lower, is_valid_hex};
use serde_json::Value as JsonValue;

const DARK: &str = include_str!("../vscode/themes/warm-burnout-dark.json");
const LIGHT: &str = include_str!("../vscode/themes/warm-burnout-light.json");
const PACKAGE: &str = include_str!("../vscode/package.json");

fn parse_theme(src: &str) -> JsonValue {
  serde_json::from_str(src).expect("invalid JSON")
}

fn get_color<'a>(theme: &'a JsonValue, key: &str) -> &'a str {
  theme["colors"][key]
    .as_str()
    .unwrap_or_else(|| panic!("missing color key: {key}"))
}

#[test]
fn dark_is_valid_json() {
  parse_theme(DARK);
}

#[test]
fn light_is_valid_json() {
  parse_theme(LIGHT);
}

#[test]
fn dark_has_required_fields() {
  let v = parse_theme(DARK);
  assert!(v.get("colors").is_some(), "missing 'colors'");
  assert!(v.get("tokenColors").is_some(), "missing 'tokenColors'");
  assert_eq!(v["type"].as_str(), Some("dark"));
}

#[test]
fn light_has_required_fields() {
  let v = parse_theme(LIGHT);
  assert!(v.get("colors").is_some(), "missing 'colors'");
  assert!(v.get("tokenColors").is_some(), "missing 'tokenColors'");
  assert_eq!(v["type"].as_str(), Some("light"));
}

#[test]
fn package_json_references_both_themes() {
  let v: JsonValue = serde_json::from_str(PACKAGE).expect("invalid package.json");
  let themes = v["contributes"]["themes"].as_array().expect("missing themes array");
  assert!(themes.len() >= 2, "expected at least 2 themes");

  let labels: Vec<&str> = themes.iter().filter_map(|t| t["label"].as_str()).collect();
  assert!(labels.contains(&"Warm Burnout Dark"), "missing dark theme label");
  assert!(labels.contains(&"Warm Burnout Light"), "missing light theme label");
}

#[test]
fn package_json_theme_paths_exist() {
  let v: JsonValue = serde_json::from_str(PACKAGE).expect("invalid package.json");
  let themes = v["contributes"]["themes"].as_array().unwrap();
  for theme in themes {
    let path = theme["path"].as_str().expect("theme missing path");
    assert!(
      path.contains("warm-burnout-"),
      "theme path should reference warm-burnout files: {path}"
    );
  }
}

#[test]
fn dark_colors_are_valid_hex() {
  let v = parse_theme(DARK);
  let colors = v["colors"].as_object().expect("colors is not an object");
  for (key, val) in colors {
    if let Some(hex) = val.as_str() {
      if hex.is_empty() {
        continue;
      }
      assert!(is_valid_hex(hex), "{key}: '{hex}' is not valid hex");
    }
  }
}

#[test]
fn light_colors_are_valid_hex() {
  let v = parse_theme(LIGHT);
  let colors = v["colors"].as_object().expect("colors is not an object");
  for (key, val) in colors {
    if let Some(hex) = val.as_str() {
      if hex.is_empty() {
        continue;
      }
      assert!(is_valid_hex(hex), "{key}: '{hex}' is not valid hex");
    }
  }
}

#[test]
fn dark_background_is_canonical() {
  let v = parse_theme(DARK);
  assert_eq!(hex_to_lower(get_color(&v, "editor.background")), "#1a1510");
}

#[test]
fn light_background_is_canonical() {
  let v = parse_theme(LIGHT);
  assert_eq!(hex_to_lower(get_color(&v, "editor.background")), "#f5ede0");
}

#[test]
fn dark_foreground_is_canonical() {
  let v = parse_theme(DARK);
  assert_eq!(hex_to_lower(get_color(&v, "editor.foreground")), "#bfbdb6");
}

#[test]
fn light_foreground_is_canonical() {
  let v = parse_theme(LIGHT);
  assert_eq!(hex_to_lower(get_color(&v, "editor.foreground")), "#3a3630");
}

#[test]
fn token_colors_have_valid_structure() {
  for (name, src) in [("dark", DARK), ("light", LIGHT)] {
    let v = parse_theme(src);
    let tokens = v["tokenColors"]
      .as_array()
      .unwrap_or_else(|| panic!("{name}: tokenColors not an array"));
    assert!(!tokens.is_empty(), "{name}: tokenColors is empty");
    for (i, token) in tokens.iter().enumerate() {
      assert!(
        token.get("scope").is_some() || token.get("settings").is_some(),
        "{name}: tokenColors[{i}] missing both scope and settings"
      );
      if let Some(settings) = token.get("settings") {
        assert!(
          settings.is_object(),
          "{name}: tokenColors[{i}].settings is not an object"
        );
      }
    }
  }
}

#[test]
fn dark_and_light_have_same_color_keys() {
  let dark = parse_theme(DARK);
  let light = parse_theme(LIGHT);
  let dark_keys: Vec<&str> = dark["colors"].as_object().unwrap().keys().map(|k| k.as_str()).collect();
  let light_keys: Vec<&str> = light["colors"]
    .as_object()
    .unwrap()
    .keys()
    .map(|k| k.as_str())
    .collect();
  for key in &dark_keys {
    assert!(light_keys.contains(key), "dark has '{key}' but light does not");
  }
  for key in &light_keys {
    assert!(dark_keys.contains(key), "light has '{key}' but dark does not");
  }
}

#[test]
fn no_pure_black_background() {
  let v = parse_theme(DARK);
  let bg = hex_to_lower(get_color(&v, "editor.background"));
  assert_ne!(bg, "#000000", "dark background must not be pure black");
}

#[test]
fn no_pure_white_background() {
  let v = parse_theme(LIGHT);
  let bg = hex_to_lower(get_color(&v, "editor.background"));
  assert_ne!(bg, "#ffffff", "light background must not be pure white");
}
