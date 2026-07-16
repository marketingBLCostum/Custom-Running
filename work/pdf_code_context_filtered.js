const fs = require('fs');

const [,, file, lang = 'fr'] = process.argv;
const lines = fs.readFileSync(file, 'utf8').split(/\r?\n/).map(s => s.trim()).filter(Boolean);
const codes = [...new Set(lines.flatMap(line => [...line.matchAll(/\bW\d{4}\b/g)].map(m => m[0])))];
const langNeedle = {
  fr: /homme|femme|enfant|T-shirt à|Débardeur|Combinaison|Short|Collants|Fuseaux|Brassière|Maillot|Veste|Gilet|coupe-vent|manches/i,
  en: /Men|Women|Kid|T-shirt|Tank|Short|Tights|jersey|jacket|vest|bodysuit|sports bra|crop top/i,
  it: /uomo|donna|ragazzi|bambino|T-shirt|Canotta|Pantalonc|Fuseaux|Maglia|Mantellina|Gilet|Reggiseno/i,
}[lang] || /./;

for (const code of codes) {
  const blocks = [];
  for (let i = 0; i < lines.length; i++) {
    if (!lines[i].includes(code)) continue;
    const block = lines.slice(Math.max(0, i - 1), Math.min(lines.length, i + 7));
    if (langNeedle.test(block.join(' '))) blocks.push(block.join(' | '));
  }
  if (!blocks.length) continue;
  console.log(`\n## ${code}`);
  for (const block of blocks.slice(-3)) console.log(block);
}
