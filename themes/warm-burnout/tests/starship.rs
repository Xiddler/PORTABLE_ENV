mod common;

use common::is_valid_hex;
use toml::Table as TomlTable;

const DARK_PALETTE: &str = include_str!("../starship/warm-burnout-dark.toml");
const LIGHT_PALETTE: &str = include_str!("../starship/warm-burnout-light.toml");
const EXAMPLE: &str = include_str!("../starship/starship.toml");

fn parse_toml(src: &str) -> TomlTable {
  src.parse::<TomlTable>().expect("invalid TOML")
}

const EXPECTED_PALETTE_KEYS: &[&str] = &[
  "background",
  "foreground",
  "comment",
  "cursor",
  "accent",
  "burnt_orange",
  "amber",
  "gold",
  "aged_brass",
  "terra_cotta",
  "coral",
  "dusty_mauve",
  "dried_sage",
  "verdigris",
  "steel_patina",
  "error",
  "red",
  "green",
  "yellow",
  "blue",
  "magenta",
  "cyan",
];

fn get_palette<'a>(table: &'a TomlTable, palette_name: &str) -> &'a TomlTable {
  table
    .get("palettes")
    .and_then(|p| p.as_table())
    .and_then(|p| p.get(palette_name))
    .and_then(|p| p.as_table())
    .unwrap_or_else(|| panic!("missing [palettes.{palette_name}]"))
}

#[test]
fn dark_palette_is_valid_toml() {
  parse_toml(DARK_PALETTE);
}

#[test]
fn light_palette_is_valid_toml() {
  parse_toml(LIGHT_PALETTE);
}

#[test]
fn example_config_is_valid_toml() {
  parse_toml(EXAMPLE);
}

#[test]
fn dark_palette_has_all_colors() {
  let table = parse_toml(DARK_PALETTE);
  let palette = get_palette(&table, "warm_burnout_dark");
  for key in EXPECTED_PALETTE_KEYS {
    assert!(
      palette.contains_key(*key),
      "[palettes.warm_burnout_dark] missing key: {key}"
    );
  }
}

#[test]
fn light_palette_has_all_colors() {
  let table = parse_toml(LIGHT_PALETTE);
  let palette = get_palette(&table, "warm_burnout_light");
  for key in EXPECTED_PALETTE_KEYS {
    assert!(
      palette.contains_key(*key),
      "[palettes.warm_burnout_light] missing key: {key}"
    );
  }
}

#[test]
fn dark_palette_colors_are_valid_hex() {
  let table = parse_toml(DARK_PALETTE);
  let palette = get_palette(&table, "warm_burnout_dark");
  for (key, val) in palette {
    let hex = val.as_str().unwrap_or_else(|| panic!("{key} is not a string"));
    assert!(is_valid_hex(hex), "{key}: '{hex}' is not valid hex");
  }
}

#[test]
fn light_palette_colors_are_valid_hex() {
  let table = parse_toml(LIGHT_PALETTE);
  let palette = get_palette(&table, "warm_burnout_light");
  for (key, val) in palette {
    let hex = val.as_str().unwrap_or_else(|| panic!("{key} is not a string"));
    assert!(is_valid_hex(hex), "{key}: '{hex}' is not valid hex");
  }
}

#[test]
fn dark_and_light_palettes_have_same_keys() {
  let dark_table = parse_toml(DARK_PALETTE);
  let dark = get_palette(&dark_table, "warm_burnout_dark");
  let light_table = parse_toml(LIGHT_PALETTE);
  let light = get_palette(&light_table, "warm_burnout_light");
  let dark_keys: Vec<&String> = dark.keys().collect();
  let light_keys: Vec<&String> = light.keys().collect();
  assert_eq!(
    dark_keys, light_keys,
    "dark and light palettes should have identical keys"
  );
}

#[test]
fn example_config_has_no_palette_directive() {
  let table = parse_toml(EXAMPLE);
  assert!(table.get("palette").is_none(), "ANSI example should not set palette");
}
