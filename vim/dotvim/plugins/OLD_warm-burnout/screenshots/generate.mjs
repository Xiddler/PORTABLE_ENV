// Usage: npx playwright install chromium && node generate.mjs
// Requires: npm install -g playwright (or npx)
import { chromium } from "playwright";
import { fileURLToPath } from "url";
import { dirname, join } from "path";

const __dirname = dirname(fileURLToPath(import.meta.url));

const PAGES = [
  { html: "editor-dark.html", output: "editor-dark.png" },
  { html: "editor-light.html", output: "editor-light.png" },
  { html: "terminal-dark.html", output: "terminal-dark.png" },
  { html: "split-comparison.html", output: "split-comparison.png" },
];

const WIDTH = 1200;
const HEIGHT = 800;

async function main() {
  const browser = await chromium.launch();
  const context = await browser.newContext({
    viewport: { width: WIDTH, height: HEIGHT },
    deviceScaleFactor: 2,
  });

  for (const { html, output } of PAGES) {
    const page = await context.newPage();
    const filePath = join(__dirname, html);
    await page.goto(`file://${filePath}`);

    // Wait for fonts to load
    await page.waitForFunction(() => document.fonts.ready);
    await page.waitForTimeout(500);

    const outputPath = join(__dirname, output);
    await page.screenshot({ path: outputPath, type: "png" });
    console.log(`  ${output} (${WIDTH * 2}x${HEIGHT * 2} @2x)`);
    await page.close();
  }

  await browser.close();
  console.log("\nDone. 4 screenshots generated.");
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
