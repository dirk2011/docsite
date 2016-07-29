+++
date = "2011-02-05T00:00:00+02:00"
draft = false
title = "103 - Bestandsnamen met vreemde tekens"
tags = ['linux']
+++


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2011-02           |


Soms ontstaan er bestanden op je harde schijf met vreemde tekens in de bestandsnaam. Het is dan onmogelijk deze
bestanden op de normale manier te openen of te verwijderen. Je kunt die bestanden dan alleen maar benaderen via het
inode nummer van het bestand, of je kunt een tooltje gebruiken om bestanden eerst een “normale” bestandsnaam te geven.
Het tooltje dat ik hiervoor gebruik heet convmv. Aanpassen van bestandsnamen in een directory en subdirectory gaat als
volgt:

```bash
convmv -utf-8 -r --nfc --notest *
```

Parameter | Verklaring
--------- | -----------------------
-utf-8    |  vertaal bestandsnamen naar utf-8 formaat
-r        |  deze directory en alle subdirectories
 –nfc     |  optie voor utf-8 bestandsnamen onder linux
 –notest  |  bestandsnamen wijzigen


website: http://www.j3e.de/linux/convmv/man/

![linux](/img/logo_linux.jpg)

