+++
date = "2015-03-11T00:00:00+02:00"
draft = false
title = "011 - Netwerken"
tags = ['Linux', 'Raspberry', 'netstat', 'route', 'ifconfig', 'bmon', 'tcptrack', 'iftop', 'nethogs', 'ss']
categories = ['Linux']
updated = '2016-09-06'
spelling = 1
+++

# Netwerken


## Lokale netwerk
Hoe was het ook weer precies?
Mijn lokale netwerk bevat de range: 192.168.1.0 - 192.168.1.255
Het subnet worden als volgt genoteerd: 192.168.1.0/24 of 192.168.1.0 met subnetmask 255.255.255.0
* * *

## IP routing met `route`
Door de routing tabel op te vragen wordt duidelijk via welke host met een ander
netwerk verbinding wordt gemaakt. Die andere host is de router.
De routing tabel kan als volgt worden opgevraagd.
```bash
sudo route -n
```
![route](/img/011-route.jpg)
De `-n` optie zorgt ervoor dat het IP adres wordt weergegeven, i.p.v. de naam
van de host.

* * *

## Netwerk verbindingen met `ifconfig`
Met `ifconfig` kunnen de devices worden opgevraagd en geconfigureerd via welke
de netwerkverbindingen lopen. De devices kunnen ook uit en aan worden gezet.
Tevens toont het commando een totaal van het netwerk verkeer via zo'n device.
Opvragen van alle devices gaat als volgt. 
```bash
ifconfig
```
![route](/img/011-ifconfig.jpg)
* * *


## Netwerk verbindingen met `netstat`
Alle actieve netwerk verbindingen van de Raspberry met het internet of intranet
kunnen als volgt worden gecontroleerd:
```bash
sudo netstat -untp
```
![route](/img/011-netstat.jpg)
* * *


## Netwerk gebruik per interface met `bmon`
bmon moet apart geïnstalleerd worden. 
```bash
sudo apt-get install bmon
```

Opstarten.
```bash
sudo bmon
```
![bmon](/img/011-bmon.jpg)

Vervolgens laat het in de loop van de tijd, per interface het netwerk gebruik
zien.
Druk op “q” om het programma af te sluiten.
* * *


## Netwerk gebruik per Ip adres en poort met `tcptrack`
Dit programma laat het netwerk gebruik per IP adres en poort zien.

Installatie.
```bash
sudo apt-get install tcptrack
```

Opstarten.
```bash
sudo tcptrack -i <interface>
```
![tcptrack](/img/011-tcptrack.jpg)

Programma afsluiten gaat weer met “q”.
* * *


## Netwerk gebruik per Ip adres en per poort met `Iftop`
Nog eentje, iftop. Ziet er wel fraai uit, mijn favoriet. Er zijn nog opties die
aan en uitgezet kunnen worden. Type daarvoor op “h” (help). 

Installatie
```bash
sudo apt-get install iftop
```

Opstarten.
```bash
sudo iftop
```

![iftop](/img/011-iftop.jpg)

Met het commando `t` kan door de traffic opties gebladderd worden. 
Type één keer `t` om één regel voor het in- en uitgaande verkeer per
host weer te geven. Indien vervolgens `S` wordt getypt, zie je het verkeer per
poort.

Afsluiten met “q”.
* * *


## Gebruik per programma met ` nethogs`
Nethogs kiest voor weer een andere weergave. Het geeft het netwerk gebruik weer
per gebruiker en per programma.

Installatie.
```bash
sudo apt-get install nethogs
```

Opstarten.
```bash
sudo nethogs
```
Geen scherm afdruk, dit programma deed het niet (meer) op de Raspberry.

Afsluiten met “q”.
* * *


## ss - another utility to investigate sockets

* * *


## Bronnen

* http://askubuntu.com/questions/257263/how-to-display-network-traffic-in-terminal
* http://www.binarytides.com/linux-ss-command/

![Linux](/img/logo_linux.jpg)

* * *


