# Verifica del sito - 2 novembre 2026

Nessuna pagina, immagine, stile o script del sito modificato. Rapporti e schermate generati solo nella cartella work.

## Collegamenti

- 185 pagine IT/EN/FR/ES/DE.
- 4.550 collegamenti interni, inclusi 925 cambi lingua: nessuna destinazione mancante, lingua errata o prodotto errato rilevato.
- 35 cambi lingua provati con clic reali: tutti riusciti.
- Tutte le 165 schede prodotto raggiungibili dai cataloghi della rispettiva lingua.
- 241 immagini uniche decodificate: nessuna immagine mancante o illeggibile.

## Problemi confermati

### Menu mobile non funzionante: 30 schede donna

Manca il collegamento JavaScript al pulsante hamburger. Modelli W7104, W7105, W7110, W7111, W7113 e W7115 in tutte le lingue.

- DONNA SCHEDE PRODOTTO/W7104-SPEED-RUN.html
- DONNA SCHEDE PRODOTTO/W7105-SPEED-RUN.html
- DONNA SCHEDE PRODOTTO/W7110-SPEED-RUN.html
- DONNA SCHEDE PRODOTTO/W7111-SPEED-RUN.html
- DONNA SCHEDE PRODOTTO/W7113-SPEED-RUN.html
- DONNA SCHEDE PRODOTTO/W7115-SPEED-RUN.html
- FRANCESE/DONNA FR/W7104-SPEED-RUN_FR.html
- FRANCESE/DONNA FR/W7105-SPEED-RUN_FR.html
- FRANCESE/DONNA FR/W7110-SPEED-RUN_FR.html
- FRANCESE/DONNA FR/W7111-SPEED-RUN_FR.html
- FRANCESE/DONNA FR/W7113-SPEED-RUN_FR.html
- FRANCESE/DONNA FR/W7115-SPEED-RUN_FR.html
- INGLESE/DONNE EN/W7104-SPEED-RUN_EN.html
- INGLESE/DONNE EN/W7105-SPEED-RUN_EN.html
- INGLESE/DONNE EN/W7110-SPEED-RUN_EN.html
- INGLESE/DONNE EN/W7111-SPEED-RUN_EN.html
- INGLESE/DONNE EN/W7113-SPEED-RUN_EN.html
- INGLESE/DONNE EN/W7115-SPEED-RUN_EN.html
- SPAGNOLO/DONNA ES/W7104-SPEED-RUN_ES.html
- SPAGNOLO/DONNA ES/W7105-SPEED-RUN_ES.html
- SPAGNOLO/DONNA ES/W7110-SPEED-RUN_ES.html
- SPAGNOLO/DONNA ES/W7111-SPEED-RUN_ES.html
- SPAGNOLO/DONNA ES/W7113-SPEED-RUN_ES.html
- SPAGNOLO/DONNA ES/W7115-SPEED-RUN_ES.html
- TEDESCO/DONNA DE/W7104-SPEED-RUN_DE.html
- TEDESCO/DONNA DE/W7105-SPEED-RUN_DE.html
- TEDESCO/DONNA DE/W7110-SPEED-RUN_DE.html
- TEDESCO/DONNA DE/W7111-SPEED-RUN_DE.html
- TEDESCO/DONNA DE/W7113-SPEED-RUN_DE.html
- TEDESCO/DONNA DE/W7115-SPEED-RUN_DE.html

### Menu mobile sempre aperto: 10 schede donna

W7118 e W7119: una regola CSS mostra il menu anche senza la classe open. Copre il contenuto e il selettore lingua; il pulsante di chiusura non lo nasconde.

- DONNA SCHEDE PRODOTTO/W7118-FIONA.html
- DONNA SCHEDE PRODOTTO/W7119-LARY.html
- FRANCESE/DONNA FR/W7118-FIONA_FR.html
- FRANCESE/DONNA FR/W7119-LARY_FR.html
- INGLESE/DONNE EN/W7118-FIONA_EN.html
- INGLESE/DONNE EN/W7119-LARY_EN.html
- SPAGNOLO/DONNA ES/W7118-FIONA_ES.html
- SPAGNOLO/DONNA ES/W7119-LARY_ES.html
- TEDESCO/DONNA DE/W7118-FIONA_DE.html
- TEDESCO/DONNA DE/W7119-LARY_DE.html

### Schede prodotto troppo larghe

A 390 px, i pannelli prodotto confermati con tutte le risorse caricate hanno larghezze di 520-631 px: taglie e barre tecniche finiscono oltre il bordo. Esempi: W7104, W7118 e W7100. A 1440 px, W7100 arriva a circa 1537 px: il pannello esce anche su desktop. La scansione strutturale segnala lo stesso schema sulle altre schede. Home e catalogo donna provati con tutte le risorse caricate non mostrano questo problema.

### Nomi immagini con estensione diversa

I file reali sono images/UOMO/W2901/1.png e images/UOMO/W7112/4.png; nei riferimenti compare .PNG. Su Windows funzionano, su un hosting sensibile alle maiuscole possono non caricarsi. 15 riferimenti coinvolti:

- FRANCESE/UOMO FR/W2901-SPEED-RUN_FR.html: ../../images/UOMO/W2901/1.PNG
- FRANCESE/UOMO FR/W7112-SPEED-RUN_FR.html: ../../images/UOMO/W7112/4.PNG
- FRANCESE/uomo_FR.html: ../images/UOMO/W2901/1.PNG
- INGLESE/UOMO EN/W2901-SPEED-RUN_EN.html: ../../images/UOMO/W2901/1.PNG
- INGLESE/UOMO EN/W7112-SPEED-RUN_EN.html: ../../images/UOMO/W7112/4.PNG
- INGLESE/uomo_EN.html: ../images/UOMO/W2901/1.PNG
- SPAGNOLO/UOMO ES/W2901-SPEED-RUN_ES.html: ../../images/UOMO/W2901/1.PNG
- SPAGNOLO/UOMO ES/W7112-SPEED-RUN_ES.html: ../../images/UOMO/W7112/4.PNG
- SPAGNOLO/uomo_ES.html: ../images/UOMO/W2901/1.PNG
- TEDESCO/UOMO DE/W2901-SPEED-RUN_DE.html: ../../images/UOMO/W2901/1.PNG
- TEDESCO/UOMO DE/W7112-SPEED-RUN_DE.html: ../../images/UOMO/W7112/4.PNG
- TEDESCO/uomo_DE.html: ../images/UOMO/W2901/1.PNG
- uomo.html: images/UOMO/W2901/1.PNG
- W2901-SPEED-RUN.html: images/UOMO/W2901/1.PNG
- W7112-SPEED-RUN.html: images/UOMO/W7112/4.PNG

### Miniatura W7112 nel catalogo uomo

In tutte le lingue W7112 usa la stessa miniatura W2919: mostra pantaloncini aderenti, mentre la scheda W7112 mostra pantaloncini ampi.

## Altri punti da confermare

- W7015 nel catalogo uomo riusa la miniatura W7102: verificare che rappresenti il modello corretto.
- W7015: la descrizione continua a citare due pratiche tasche; nelle caratteristiche ora compare solo il taschino posteriore con zip. Da confermare il dato prodotto.
- W7115 italiano: nella descrizione si legge "un slip", da scrivere "uno slip".

## Limiti

I link esterni dei footer verso bicycle-line.com rispondono al controllo automatico con Cloudflare 403 "Just a moment...". Non sono dichiarati rotti: le destinazioni finali restano da verificare in una sessione autorizzata dal sito. I moduli di contatto non sono stati inviati al webhook reale.

Il riepilogo definitivo e in verifica-sito-2026-11-02.json. Le prove con tutte le risorse caricate sono in browser-followup.json, i clic tra lingue in language-navigation-test.json e le schermate in audit-sample-0.png fino ad audit-sample-8.png. Il file link-audit-report.json e il risultato preliminare: include segnali poi esclusi o confermati con ulteriori prove.