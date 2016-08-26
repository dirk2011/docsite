+++
date = "2012-04-12T00:00:00+02:00"
draft = false
title = "211 - Split, merge en check van bestanden"
tags = ['raspberry', 'linux']
toc = false
updated = '2016-08-25'
+++


## Inleiding
Het opslitsen, weer samenvoegen van bestanden, en controleren of dat goed is
gegaan is met linux niet zo moeilijk.  Linux heeft een uitgebreide
gereedschapskist waarin ook voor deze klus genoeg tools zitten. Bijvoorbeeld
onderstaande.

## Binair splitsen van bestanden

Voorbeeld
```bash
split -b 40MB bestand bestand
```

Verklaring | Toelichting
---------- | -----------
split      | het programma
-b40MB     | splits bestanden binair in stukken van bijvoorbeeld 40.000.000 bytes (40mb)
bestand    | het te splitsen bestand
bestand    |  bestandsnaam waarmee opgesplitste bestanden moeten beginnen

In onderstaand voorbeeld wordt een mp3 bestand van ruim 100mb in stukken verdeeld van 40mb. 
![split](/img/211-1-split.jpg)


## Checksums berekenen
Met een checksum (controle getal) kan gecontroleerd worden of een bestand niet
beschadigd is en het nog volledig is.  Het is daarom handig na het splitsen
checksums te berekenen, zodat na transport van de bestanden gecontroleerd kan
worden of ze volledig zijn overgekomen.  Er zijn verschillende utilities om een
checksum te berekenen, met md5sum wordt een 128 bits checksum berekend.

Voorbeeld
```bash
md5sum bestanden* > files.md5
```

Verklaring | Toelichting
---------- | -----------
md5sum     | het programma
bestanden\* | lijst van bestanden waarvan de checksum berekend moet worden
 >         | stuur de output ergens heen
files.md5  | bestand waarin de berekende checksums worden opgeslagen.

Onderstaand wordt de checksum berekend van het originele bestand en de deelbestanden.

![checksum](/img/211-2-md5sum.jpg)


## Samenvoegen
Het samenvoegen van de gesplitst bestanden kan bijvoorbeeld gedaan worden met
`cat`.
```bash
cat deelbestanden* > bestand
```

Verklaring      | Toelichting
--------------- | -----------
cat             | het programma
deelbestanden\*  | spreekt voor zich
 >              | normaal gaat de output van cat naar het scherm, nu sturen we dat naar een bestand
bestand         | het doelbestand, waarin alle deelbestanden waar samen komen

In onderstaand voorbeeld worden alle deelbestanden weer samengevoegd. 

![cat](/img/211-3-cat.jpg)


## Checksums controleren
Na transport van de deelbestanden en het samenvoegen hiervan tot het originele
bestand worden de bestanden gecontroleerd.

Voorbeeld
```bash
md5sum -c files.md5
```

Verklaring | Toelichting
---------- | -----------
md5sum     | het programma
-c         | optie om checksum te controleren
files.md5  | het bestand met de checksum


![linux](/img/211-4-md5sum.jpg)

![linux](/img/logo_linux.jpg)

* * *

