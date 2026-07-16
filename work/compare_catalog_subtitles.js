const fs = require('fs');
const path = require('path');

const root = process.cwd();
const configs = [
  { lang: 'it', pdf: 'work/pdf_cataloghi_running/ita.txt', pages: ['uomo.html', 'donna.html', 'ragazzi.html'] },
  { lang: 'en', pdf: 'work/pdf_cataloghi_running/eng.txt', pages: ['INGLESE/uomo_EN.html', 'INGLESE/donna_EN.html', 'INGLESE/ragazzi_EN.html'] },
  { lang: 'fr', pdf: 'work/pdf_cataloghi_running/fra.txt', pages: ['FRANCESE/uomo_FR.html', 'FRANCESE/donna_FR.html', 'FRANCESE/ragazzi_FR.html'] },
];

function normalize(s) {
  return s
    .replace(/[\u2018\u2019\u02bc]/g, "'")
    .replace(/[\u201c\u201d]/g, '"')
    .replace(//g, "'")
    .normalize('NFD').replace(/\p{Diacritic}/gu, '')
    .toLowerCase()
    .replace(/&/g, ' and ')
    .replace(/\bmen's\b/g, 'mens')
    .replace(/\bwomen's\b/g, 'womens')
    .replace(/\bkid's\b/g, 'kids')
    .replace(/\bman\b/g, 'men')
    .replace(/\bman's\b/g, 'mens')
    .replace(/\bhomme\b/g, 'homme')
    .replace(/\bfemme\b/g, 'femme')
    .replace(/\s*-\s*/g, ' ')
    .replace(/[^a-z0-9]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function extractCards(html) {
  const re = /<a[^>]*class="product-name"[^>]*>\s*<strong>(.*?)<\/strong>\s*<\/a>\s*<div class="product-subtitle">(.*?)<\/div>/gis;
  const out = [];
  let m;
  while ((m = re.exec(html))) {
    out.push({
      code: m[1].replace(/<[^>]+>/g, '').trim(),
      subtitle: m[2].replace(/<[^>]+>/g, '').trim(),
    });
  }
  return out;
}

const report = [];
for (const cfg of configs) {
  const pdfText = normalize(fs.readFileSync(path.join(root, cfg.pdf), 'utf8'));
  for (const page of cfg.pages) {
    const cards = extractCards(fs.readFileSync(path.join(root, page), 'utf8'));
    for (const card of cards) {
      const exact = pdfText.includes(normalize(card.subtitle));
      const codeNear = pdfText.includes(normalize(card.code));
      report.push({ lang: cfg.lang, page, code: card.code, subtitle: card.subtitle, exactSubtitleInPdf: exact, codeInPdf: codeNear });
    }
  }
}

const grouped = report.reduce((acc, row) => {
  const key = `${row.lang}:${row.page}`;
  (acc[key] ||= []).push(row);
  return acc;
}, {});

for (const [key, rows] of Object.entries(grouped)) {
  console.log(`\n## ${key}`);
  for (const row of rows) {
    console.log(`${row.exactSubtitleInPdf ? 'OK ' : 'DIFF'} ${row.code} :: ${row.subtitle}`);
  }
}
