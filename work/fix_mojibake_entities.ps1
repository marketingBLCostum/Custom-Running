$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$root = (Get-Location).Path

function Bad2($a, $b) {
  return [string]([char]$a) + [string]([char]$b)
}

function Bad3($a, $b, $c) {
  return [string]([char]$a) + [string]([char]$b) + [string]([char]$c)
}

$replacements = [ordered]@{
  (Bad2 0x00C3 0x00A0) = '&agrave;'
  (Bad2 0x00C3 0x00A2) = '&acirc;'
  (Bad2 0x00C3 0x00A7) = '&ccedil;'
  (Bad2 0x00C3 0x00A8) = '&egrave;'
  (Bad2 0x00C3 0x00A9) = '&eacute;'
  (Bad2 0x00C3 0x00AA) = '&ecirc;'
  (Bad2 0x00C3 0x00AE) = '&icirc;'
  (Bad2 0x00C3 0x00B4) = '&ocirc;'
  (Bad2 0x00C3 0x00B9) = '&ugrave;'
  (Bad2 0x00C3 0x00BB) = '&ucirc;'
  (Bad3 0x00E2 0x20AC 0x2122) = '&rsquo;'
  (Bad3 0x00E2 0x20AC 0x0153) = '&ldquo;'
  (Bad3 0x00E2 0x20AC 0x009D) = '&rdquo;'
  ([string]([char]0x00C2)) = ''
}

$changed = New-Object System.Collections.Generic.List[string]
foreach ($file in Get-ChildItem -LiteralPath $root -Recurse -Filter '*.html' -File) {
  $text = [System.IO.File]::ReadAllText($file.FullName, $utf8)
  $original = $text
  foreach ($bad in $replacements.Keys) {
    $text = $text.Replace($bad, $replacements[$bad])
  }
  if ($text -ne $original) {
    [System.IO.File]::WriteAllText($file.FullName, $text, $utf8)
    $changed.Add($file.FullName.Substring($root.Length + 1)) | Out-Null
  }
}

$changed | Sort-Object
