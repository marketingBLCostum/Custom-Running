const fs = require('fs');

const [,, file] = process.argv;
const lines = fs.readFileSync(file, 'utf8').split(/\r?\n/).map(s => s.trim()).filter(Boolean);
const codes = [...new Set(lines.flatMap(line => [...line.matchAll(/\bW\d{4}\b/g)].map(m => m[0])))];

for (const code of codes) {
  const idxs = [];
  for (let i = 0; i < lines.length; i++) if (lines[i].includes(code)) idxs.push(i);
  console.log(`\n## ${code}`);
  for (const idx of idxs.slice(0, 3)) {
    const block = lines.slice(Math.max(0, idx - 1), Math.min(lines.length, idx + 5));
    console.log(block.join(' | '));
  }
}
