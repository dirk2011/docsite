+++
date = "2015-10-13T00:00:00+02:00"
draft = false
title = "029 - Nmap"
tags = ['raspberry', 'linux', 'nmap', 'netwerken']

+++

# Nmap, kort


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2015-10           |


## Inleiding
Welke hosts zitten er allemaal in (je eigen) het netwerk, en welk ip adres hebben die. Om o.a. 
dit te ontdekken kan nmap gebruikt worden. 


## Installeren
Op de raspberry was nmap niet aanwezig, installeren gaat op de bekende manier.
```bash
sudo apt-get install nmap
```


## Hosts ontdekken
Het volgende voorbeeld levert een lijstje op van alle hosts in het onderzochte bereik.

```bash
nmap -sP 192.168.1.* 
```

## Open poorten
Nog een leuke die veel info geeft:
```bash
nmap -sV 192.168.1.117
```bash
of vervang het laatste nummer door een ster.

Hier wordt zichtbaar welke poorten openstaan, wat daar achter zit, en welke versie deze software heeft.


## Poorten opgeven
Met `-p` kan worden opgegeven welke poorten onderzocht moeten worden. Een voorbeeld.
```bash
nmap -sV 192.168.1.117 -p0-1023
```bash

![linux](/img/logo_linux.jpg)

