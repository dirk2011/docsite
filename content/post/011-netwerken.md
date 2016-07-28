+++
date = "2015-03-11T00:00:00+02:00"
draft = false
title = "011 - Netwerken, heel kort"
tags = ['netwerken',  'linux', 'raspberry']
+++

# Netwerken

 Document | |
--- | ---
 Door | Dirk 
 Bijgewerkt | 2015-02-14 |


## Netwerken
Hoe was het ook weer precies?
Mijn lokale netwerk bevat de range: 192.168.1.0 - 192.168.1.255
Het subnet worden als volgt genoteerd: 192.168.1.0/24 of 192.168.1.0 met subnetmask 255.255.255.0


## Netwerk verbindingen
Alle actieve netwerk verbindingen van de Raspberry met het internet of intranet kunnen als volgt worden gecontroleerd:
```bash
sudo netstat -tupn
```


## IP routing
De routing tabel kan als volgt worden opgevraagd:
```bash
sudo route -nee
```

