+++
date = "2013-08-09T00:00:00+02:00"
draft = false
title = "204 - Oude kernels opruimen"
tags = ['ubuntu', 'linux']
+++

# Oude kernels opruimen


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2013-08           |


## Oude kernels

Regelmatig komen er voor Ubuntu nieuwe kernel versies uit, dus staan er na verloop van tijd op de computer verscheidene
versies.
Oude kernels worden als de nieuwe versie goed werkt niet meer gebruikt. Ze nemen wel schijfruimte in en misschien erger
nog, het grub opstart menu wordt onoverzichtelijk.

Lijstje maken van alle kernels op het systeem:
```bash
$ dpkg --list | grep linux-image
```

Een kernel versie opruimen gaat nu als volgt:
```bash
$ sudo apt-get purge linux-image-<versie>-generic
```

Bij versie moet een versie nummer worden ingevuld. De tab toets is handig bij het intypen voor automatisch aanvullen.

## Apt cache leegmaken

Gedownloade en geïnstalleerde packages worden door Ubuntu in een cache bewaard, directory:
`/var/cache/apt`

Hier kan ook schijfruimte worden teruggewonnen. Deze kan worden opgeruimd met het commando:
```bash
$ sudo apt-get clean
```

![linux](/img/logo_linux.jpg)

