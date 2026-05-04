#!/bin/sh
set -e
cd "$(dirname "$0")"
rm -f warm-burnout-theme.jar
zip -r warm-burnout-theme.jar \
  META-INF/ \
  "Warm Burnout Islands Dark.theme.json" \
  "Warm Burnout Islands Light.theme.json" \
  Warm-Burnout-Dark.xml \
  Warm-Burnout-Light.xml
echo "Built: jetbrains/warm-burnout-theme.jar"
