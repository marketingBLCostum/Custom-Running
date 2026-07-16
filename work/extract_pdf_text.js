const fs = require('fs');
const zlib = require('zlib');

function decodeLiteral(raw) {
  let out = '';
  for (let i = 0; i < raw.length; i++) {
    const ch = raw[i];
    if (ch !== '\\') {
      out += ch;
      continue;
    }
    const n = raw[++i];
    if (n === 'n') out += '\n';
    else if (n === 'r') out += '\r';
    else if (n === 't') out += '\t';
    else if (n === 'b') out += '\b';
    else if (n === 'f') out += '\f';
    else if (n === '(' || n === ')' || n === '\\') out += n;
    else if (/[0-7]/.test(n || '')) {
      let oct = n;
      for (let j = 0; j < 2 && /[0-7]/.test(raw[i + 1] || ''); j++) oct += raw[++i];
      out += String.fromCharCode(parseInt(oct, 8));
    } else if (n === '\r' && raw[i + 1] === '\n') {
      i++;
    } else if (n === '\n' || n === '\r') {
      // line continuation
    } else if (n) {
      out += n;
    }
  }
  return out;
}

function decodeHex(raw) {
  const clean = raw.replace(/\s+/g, '');
  const bytes = [];
  for (let i = 0; i < clean.length; i += 2) bytes.push(parseInt(clean.slice(i, i + 2).padEnd(2, '0'), 16));
  if (bytes.length >= 2 && bytes[0] === 0xfe && bytes[1] === 0xff) {
    let out = '';
    for (let i = 2; i + 1 < bytes.length; i += 2) out += String.fromCharCode((bytes[i] << 8) + bytes[i + 1]);
    return out;
  }
  return Buffer.from(bytes).toString('latin1');
}

function extractStrings(content) {
  const text = content.toString('latin1');
  const pieces = [];
  const token = /(\((?:\\.|[^\\()])*\)|<([0-9a-fA-F\s]+)>|\[|\]|-?\d+(?:\.\d+)?|TJ|Tj|'|")/g;
  let inArray = false;
  let arrayPieces = [];
  let lastString = '';
  let m;
  while ((m = token.exec(text))) {
    const t = m[0];
    if (t[0] === '(') {
      lastString = decodeLiteral(t.slice(1, -1));
      if (inArray) arrayPieces.push(lastString);
    } else if (t[0] === '<' && t[1] !== '<') {
      lastString = decodeHex(t.slice(1, -1));
      if (inArray) arrayPieces.push(lastString);
    } else if (t === '[') {
      inArray = true;
      arrayPieces = [];
    } else if (t === ']') {
      inArray = false;
    } else if (t === 'TJ') {
      if (arrayPieces.length) pieces.push(arrayPieces.join(''));
      arrayPieces = [];
    } else if (t === 'Tj' || t === "'" || t === '"') {
      if (lastString) pieces.push(lastString);
      lastString = '';
    }
  }
  return pieces;
}

function inflateStreams(pdf) {
  const chunks = [];
  let pos = 0;
  const marker = Buffer.from('stream');
  const endMarker = Buffer.from('endstream');
  while (true) {
    const streamAt = pdf.indexOf(marker, pos);
    if (streamAt === -1) break;
    const dictStart = Math.max(0, pdf.lastIndexOf(Buffer.from('<<'), streamAt));
    const dict = pdf.slice(dictStart, streamAt).toString('latin1');
    let dataStart = streamAt + marker.length;
    if (pdf[dataStart] === 0x0d && pdf[dataStart + 1] === 0x0a) dataStart += 2;
    else if (pdf[dataStart] === 0x0a || pdf[dataStart] === 0x0d) dataStart += 1;
    const endAt = pdf.indexOf(endMarker, dataStart);
    if (endAt === -1) break;
    let dataEnd = endAt;
    if (pdf[dataEnd - 2] === 0x0d && pdf[dataEnd - 1] === 0x0a) dataEnd -= 2;
    else if (pdf[dataEnd - 1] === 0x0a || pdf[dataEnd - 1] === 0x0d) dataEnd -= 1;
    const raw = pdf.slice(dataStart, dataEnd);
    if (/\/FlateDecode/.test(dict)) {
      try {
        chunks.push(zlib.inflateSync(raw));
      } catch {
        try { chunks.push(zlib.inflateRawSync(raw)); } catch {}
      }
    } else {
      chunks.push(raw);
    }
    pos = endAt + endMarker.length;
  }
  return chunks;
}

const input = process.argv[2];
const output = process.argv[3];
const pdf = fs.readFileSync(input);
const pieces = inflateStreams(pdf).flatMap(extractStrings);
const lines = pieces
  .map(s => s.replace(/\s+/g, ' ').trim())
  .filter(Boolean)
  .join('\n')
  .replace(/\n{3,}/g, '\n\n');
fs.writeFileSync(output, lines, 'utf8');
console.log(`${input}: ${pieces.length} text pieces -> ${output}`);
