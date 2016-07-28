+++
date = "2010-01-01T00:00:00+02:00"
draft = false
title = "001 - Raspberry, image installeren"
tags = ['raspberry', 'linux']
+++

# Raspberry, image installeren


| Document info       |                   |
|---------------------|-------------------|
| Door                | Dirk Postma       |
| Laatst bijgewerkt   | 2015, 2016-03     |


De Raspberry Pi heeft geen hard disk, maar gebruikt een flash geheugen kaartje om al zijn bestanden op te slaan. Een
geheugen kaartje moet van een linux distributie worden voorzien, daarna  kan de Raspberry computer hiervan op starten.
Er zijn verschillende distrubities. Ik gebruik de distributie Raspbian. 

Download de laatste versie van Raspbian hier: https://www.raspberrypi.org/downloads/

Onderstaand is de procedure voor als met Ubuntu wordt gewerkt. 

Pak het zip bestand uit.
```bash
    unzip 2015-02-16-raspbian-wheezy.zip
```
Stop de sd kaart in de computer, zoek uit hoe de memory card gemount is, doe:
```bash
df -h
```
Dan is deze info nodig, dus het volgcijfer niet:
```bash
/dev/sdh
```


Unmount, de kaart, maar laat de kaart wel in de computer zitten, doe:
```bash
sudo umount /dev/sdh1
```
en eventueel:
```bash
sudo umount /dev/sdh2
```
Schrijf het image, doe (voorbeeld pas aan!):
```bash
sudo dd bs=4M if=2016-03-18-raspbian-jessie-lite.img of=/dev/sdh
```

Daarna flush the cache, met:
```bash
sudo sync
```
Verwijder het medium, stop het in de raspberry en start de raspberry op.

Referentie:
http://www.raspberrypi.org/documentation/installation/installing-images/linux.md

