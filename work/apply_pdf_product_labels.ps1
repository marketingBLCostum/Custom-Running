$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$root = (Get-Location).Path

$labels = @{
  IT = @{
    W7100 = @{ Catalog='T-shirt manica corta collo a giro - uomo'; Eyebrow='T-shirt manica corta collo a giro' }
    W7114 = @{ Catalog='T-shirt manica corta collo a V - uomo'; Eyebrow='T-shirt manica corta collo a V' }
    W7101 = @{ Catalog='Canotta - uomo'; Eyebrow='Canotta' }
    W7901 = @{ Catalog='Body manica corta atletica - uomo'; Eyebrow='Body manica corta atletica' }
    W7102 = @{ Catalog='Pantaloncini con slip - uomo'; Eyebrow='Pantaloncini con slip' }
    W7112 = @{ Catalog='Pantaloncini senza slip - uomo'; Eyebrow='Pantaloncini senza slip' }
    W2919 = @{ Catalog='Pantaloncini elasticizzati - uomo'; Eyebrow='Pantaloncini elasticizzati' }
    W2901 = @{ Catalog='Maglia manica lunga termica con zip corta - uomo'; Eyebrow='Maglia manica lunga termica con zip corta' }
    W7106 = @{ Catalog='T-shirt manica lunga termica - uomo'; Eyebrow='T-shirt manica lunga termica' }
    W7107 = @{ Catalog='T-shirt manica lunga leggera - uomo'; Eyebrow='T-shirt manica lunga leggera' }
    W7108 = @{ Catalog='Mantellina leggera antivento - uomo'; Eyebrow='Mantellina leggera antivento' }
    W3701 = @{ Catalog='Gilet leggero antivento - uomo'; Eyebrow='Gilet leggero antivento' }
    W2912 = @{ Catalog='Fuseaux lungo - uomo'; Eyebrow='Fuseaux lungo' }
    W7015 = @{ Catalog='Pantaloncino con slip interno - uomo'; Eyebrow='Pantaloncino con slip interno' }
    W7103 = @{ Catalog='T-shirt manica corta collo a giro - donna'; Eyebrow='T-shirt manica corta collo a giro' }
    W7116 = @{ Catalog='T-shirt manica corta collo a V - donna'; Eyebrow='T-shirt manica corta collo a V' }
    W7104 = @{ Catalog='Canotta - donna'; Eyebrow='Canotta' }
    W7118 = @{ Catalog='Reggiseno sportivo - donna'; Eyebrow='Reggiseno sportivo' }
    W7119 = @{ Catalog='Top - donna'; Eyebrow='Top' }
    W7115 = @{ Catalog='Pantaloncini con perizoma - donna'; Eyebrow='Pantaloncini con perizoma' }
    W2915 = @{ Catalog='Pantaloncini elasticizzati - donna'; Eyebrow='Pantaloncini elasticizzati' }
    W7105 = @{ Catalog='Pantaloncino 2-in-1 - donna'; Eyebrow='Pantaloncino 2-in-1' }
    W7113 = @{ Catalog='Pantaloncini senza slip - donna'; Eyebrow='Pantaloncini senza slip' }
    W2930 = @{ Catalog='Maglia manica lunga termica con zip corta - donna'; Eyebrow='Maglia manica lunga termica con zip corta' }
    W7109 = @{ Catalog='T-shirt manica lunga termica - donna'; Eyebrow='T-shirt manica lunga termica' }
    W7111 = @{ Catalog='Mantellina leggera antivento - donna'; Eyebrow='Mantellina leggera antivento' }
    W3705 = @{ Catalog='Gilet leggero antivento - donna'; Eyebrow='Gilet leggero antivento' }
    W7110 = @{ Catalog='T-shirt manica lunga leggera - donna'; Eyebrow='T-shirt manica lunga leggera' }
    W2960 = @{ Catalog='Fuseaux 3/4 - donna'; Eyebrow='Fuseaux 3/4' }
    W2913 = @{ Catalog='Fuseaux lungo - donna'; Eyebrow='Fuseaux lungo' }
    W7120 = @{ Catalog='T-shirt manica corta collo a giro da ragazzi'; Eyebrow='T-shirt manica corta collo a giro da ragazzi' }
    W2948 = @{ Catalog='Pantaloncini elasticizzati da ragazzi'; Eyebrow='Pantaloncini elasticizzati da ragazzi' }
    W7121 = @{ Catalog='Canotta da ragazzi'; Eyebrow='Canotta da ragazzi' }
  }
  EN = @{
    W7100 = @{ Catalog='Men''s Short-sleeved T-shirt round collar'; Eyebrow='Men''s Short-sleeved T-shirt round collar' }
    W7114 = @{ Catalog='Men''s Short-sleeved T-shirt V-collar'; Eyebrow='Men''s Short-sleeved T-shirt V-collar' }
    W7101 = @{ Catalog='Men''s Tank top'; Eyebrow='Men''s Tank top' }
    W7901 = @{ Catalog='Men''s Short-sleeve athletic bodysuit'; Eyebrow='Men''s Short-sleeve athletic bodysuit' }
    W7102 = @{ Catalog='Men''s Shorts with inner slip'; Eyebrow='Men''s Shorts with inner slip' }
    W7112 = @{ Catalog='Men''s Shorts without slip'; Eyebrow='Men''s Shorts without slip' }
    W2919 = @{ Catalog='Men''s Stretch shorts'; Eyebrow='Men''s Stretch shorts' }
    W2901 = @{ Catalog='Men''s Thermal long-sleeved jersey with short zip'; Eyebrow='Men''s Thermal long-sleeved jersey with short zip' }
    W7106 = @{ Catalog='Men''s Thermal long-sleeved T-shirt'; Eyebrow='Men''s Thermal long-sleeved T-shirt' }
    W7107 = @{ Catalog='Men''s Light long-sleeved T-Shirt'; Eyebrow='Men''s Light long-sleeved T-Shirt' }
    W7108 = @{ Catalog='Men''s Light windproof jacket'; Eyebrow='Men''s Light windproof jacket' }
    W3701 = @{ Catalog='Men''s Light windproof vest'; Eyebrow='Men''s Light windproof vest' }
    W2912 = @{ Catalog='Men''s Tights'; Eyebrow='Men''s Tights' }
    W7015 = @{ Catalog='Men''s Shorts with inner slip'; Eyebrow='Men''s Shorts with inner slip' }
    W7103 = @{ Catalog='Women''s Short-sleeved T-shirt round collar'; Eyebrow='Women''s Short-sleeved T-shirt round collar' }
    W7116 = @{ Catalog='Women''s Short-sleeved T-shirt V-collar'; Eyebrow='Women''s Short-sleeved T-shirt V-collar' }
    W7104 = @{ Catalog='Women''s Tank top'; Eyebrow='Women''s Tank top' }
    W7118 = @{ Catalog='Women''s racerback sports bra'; Eyebrow='Women''s racerback sports bra' }
    W7119 = @{ Catalog='Women''s athletic crop top'; Eyebrow='Women''s athletic crop top' }
    W7115 = @{ Catalog='Women''s Shorts with thong'; Eyebrow='Women''s Shorts with thong' }
    W2915 = @{ Catalog='Women''s Stretch shorts'; Eyebrow='Women''s Stretch shorts' }
    W7105 = @{ Catalog='Women''s 2-in-1 Shorts'; Eyebrow='Women''s 2-in-1 Shorts' }
    W7113 = @{ Catalog='Women''s Shorts without slip'; Eyebrow='Women''s Shorts without slip' }
    W2930 = @{ Catalog='Women''s Thermal long-sleeved jersey with short zip'; Eyebrow='Women''s Thermal long-sleeved jersey with short zip' }
    W7109 = @{ Catalog='Women''s Thermal long-sleeved T-shirt'; Eyebrow='Women''s Thermal long-sleeved T-shirt' }
    W7111 = @{ Catalog='Women''s Light windproof jacket'; Eyebrow='Women''s Light windproof jacket' }
    W3705 = @{ Catalog='Women''s Light windproof vest'; Eyebrow='Women''s Light windproof vest' }
    W7110 = @{ Catalog='Women''s Light long-sleeved T-shirt'; Eyebrow='Women''s Light long-sleeved T-shirt' }
    W2960 = @{ Catalog='Women''s 3/4 Tights'; Eyebrow='Women''s 3/4 Tights' }
    W2913 = @{ Catalog='Women''s Tights'; Eyebrow='Women''s Tights' }
    W7120 = @{ Catalog='Kid''s Short-sleeved T-shirt round collar'; Eyebrow='Kid''s Short-sleeved T-shirt round collar' }
    W2948 = @{ Catalog='Kid''s Stretch shorts'; Eyebrow='Kid''s Stretch shorts' }
    W7121 = @{ Catalog='Kid''s Tank top'; Eyebrow='Kid''s Tank top' }
  }
  FR = @{
    W7100 = @{ Catalog='T-shirt &agrave; manches courtes pour homme avec col rond'; Eyebrow='T-shirt &agrave; manches courtes pour homme avec col rond' }
    W7114 = @{ Catalog='T-shirt &agrave; manches courtes pour homme avec col en V'; Eyebrow='T-shirt &agrave; manches courtes pour homme avec col en V' }
    W7101 = @{ Catalog='D&eacute;bardeur pour homme'; Eyebrow='D&eacute;bardeur pour homme' }
    W7901 = @{ Catalog='Combinaison athl&eacute;tique &agrave; manches courtes pour homme'; Eyebrow='Combinaison athl&eacute;tique &agrave; manches courtes pour homme' }
    W7102 = @{ Catalog='Short pour homme avec slip int&eacute;rieur'; Eyebrow='Short pour homme avec slip int&eacute;rieur' }
    W7112 = @{ Catalog='Short pour homme sans slip'; Eyebrow='Short pour homme sans slip' }
    W2919 = @{ Catalog='Short extensible pour homme'; Eyebrow='Short extensible pour homme' }
    W2901 = @{ Catalog='Maillot thermique &agrave; manches longues pour homme avec zip court'; Eyebrow='Maillot thermique &agrave; manches longues pour homme avec zip court' }
    W7106 = @{ Catalog='T-shirt thermique &agrave; manches longues pour homme'; Eyebrow='T-shirt thermique &agrave; manches longues pour homme' }
    W7107 = @{ Catalog='T-shirt l&eacute;ger &agrave; manches longues pour homme'; Eyebrow='T-shirt l&eacute;ger &agrave; manches longues pour homme' }
    W7108 = @{ Catalog='Veste l&eacute;g&egrave;re coupe-vent pour homme'; Eyebrow='Veste l&eacute;g&egrave;re coupe-vent pour homme' }
    W3701 = @{ Catalog='Gilet l&eacute;ger coupe-vent pour homme'; Eyebrow='Gilet l&eacute;ger coupe-vent pour homme' }
    W2912 = @{ Catalog='Collants pour homme'; Eyebrow='Collants pour homme' }
    W7015 = @{ Catalog='Short pour homme avec slip int&eacute;rieur'; Eyebrow='Short pour homme avec slip int&eacute;rieur' }
    W7103 = @{ Catalog='T-shirt &agrave; manches courtes pour femme avec col rond'; Eyebrow='T-shirt &agrave; manches courtes pour femme avec col rond' }
    W7116 = @{ Catalog='T-shirt &agrave; manches courtes pour femme avec col en V'; Eyebrow='T-shirt &agrave; manches courtes pour femme avec col en V' }
    W7104 = @{ Catalog='D&eacute;bardeur pour femme'; Eyebrow='D&eacute;bardeur pour femme' }
    W7118 = @{ Catalog='Brassi&egrave;re de sport pour femme avec dos nageur'; Eyebrow='Brassi&egrave;re de sport pour femme avec dos nageur' }
    W7119 = @{ Catalog='Crop top athl&eacute;tique pour femme'; Eyebrow='Crop top athl&eacute;tique pour femme' }
    W7115 = @{ Catalog='Short pour femme avec string'; Eyebrow='Short pour femme avec string' }
    W2915 = @{ Catalog='Short extensible pour femme'; Eyebrow='Short extensible pour femme' }
    W7105 = @{ Catalog='Short 2-en-1 pour femme'; Eyebrow='Short 2-en-1 pour femme' }
    W7113 = @{ Catalog='Short pour femme sans slip'; Eyebrow='Short pour femme sans slip' }
    W2930 = @{ Catalog='Maillot thermique &agrave; manches longues pour femme avec zip court'; Eyebrow='Maillot thermique &agrave; manches longues pour femme avec zip court' }
    W7109 = @{ Catalog='T-shirt thermique &agrave; manches longues pour femme'; Eyebrow='T-shirt thermique &agrave; manches longues pour femme' }
    W7111 = @{ Catalog='Veste l&eacute;g&egrave;re coupe-vent pour femme'; Eyebrow='Veste l&eacute;g&egrave;re coupe-vent pour femme' }
    W3705 = @{ Catalog='Gilet l&eacute;ger coupe-vent pour femme'; Eyebrow='Gilet l&eacute;ger coupe-vent pour femme' }
    W7110 = @{ Catalog='T-shirt l&eacute;ger &agrave; manches longues pour femme'; Eyebrow='T-shirt l&eacute;ger &agrave; manches longues pour femme' }
    W2960 = @{ Catalog='Fuseaux 3/4 pour femme'; Eyebrow='Fuseaux 3/4 pour femme' }
    W2913 = @{ Catalog='Collants pour femme'; Eyebrow='Collants pour femme' }
    W7120 = @{ Catalog='T-shirt &agrave; manches courtes pour enfant avec col rond'; Eyebrow='T-shirt &agrave; manches courtes pour enfant avec col rond' }
    W2948 = @{ Catalog='Short extensible pour enfant'; Eyebrow='Short extensible pour enfant' }
    W7121 = @{ Catalog='D&eacute;bardeur pour enfant'; Eyebrow='D&eacute;bardeur pour enfant' }
  }
}

$catalogFiles = @{
  IT = @('uomo.html','donna.html','ragazzi.html')
  EN = @('INGLESE\uomo_EN.html','INGLESE\donna_EN.html','INGLESE\ragazzi_EN.html')
  FR = @('FRANCESE\uomo_FR.html','FRANCESE\donna_FR.html','FRANCESE\ragazzi_FR.html')
}

$allHtml = @(Get-ChildItem -LiteralPath $root -Recurse -Filter '*.html' -File)
$changed = New-Object System.Collections.Generic.List[string]

function Get-LanguageFiles($lang) {
  if ($lang -eq 'IT') {
    return @($allHtml | Where-Object { $_.FullName -notmatch '\\(INGLESE|FRANCESE|SPAGNOLO|TEDESCO)\\' })
  }
  if ($lang -eq 'EN') {
    return @($allHtml | Where-Object { $_.FullName -match '\\INGLESE\\' })
  }
  if ($lang -eq 'FR') {
    return @($allHtml | Where-Object { $_.FullName -match '\\FRANCESE\\' })
  }
  return @()
}

foreach ($lang in @('IT','EN','FR')) {
  foreach ($relative in $catalogFiles[$lang]) {
    $path = Join-Path $root $relative
    $text = [System.IO.File]::ReadAllText($path, $utf8)
    $original = $text
    foreach ($sku in $labels[$lang].Keys) {
      $newLabel = $labels[$lang][$sku].Catalog
      $pattern = "(<a[^>]*>\s*<strong>$sku\b[^<]*</strong>\s*</a>\s*<div class=""product-subtitle"">)(.*?)(</div>)"
      $text = [regex]::Replace($text, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{
        param($m)
        return $m.Groups[1].Value + $newLabel + $m.Groups[3].Value
      }, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    }
    if ($text -ne $original) {
      [System.IO.File]::WriteAllText($path, $text, $utf8)
      $changed.Add($relative) | Out-Null
    }
  }

  $languageFiles = @(Get-LanguageFiles $lang)
  foreach ($sku in $labels[$lang].Keys) {
    $expected = $labels[$lang][$sku].Eyebrow
    $skuPattern = [regex]::Escape($sku)
    foreach ($file in $languageFiles) {
      $text = [System.IO.File]::ReadAllText($file.FullName, $utf8)
      if ($text -notmatch "<h1 class=""product-title"">\s*$skuPattern\b") { continue }
      $original = $text
      $text = [regex]::Replace($text, '(?s)<div class="eyebrow">.*?</div>', "<div class=""eyebrow"">$expected</div>", 1)
      if ($text -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $text, $utf8)
        $changed.Add($file.FullName.Substring($root.Length + 1)) | Out-Null
      }
    }
  }
}

$changed | Sort-Object -Unique
