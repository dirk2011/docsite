+++
date = "2015-03-04T00:00:00+02:00"
draft = false
title = "004 - Rasberry aansluiten op Synology nas"
tags = ['raspberry', 'linux', 'nas', 'synology']
categories = ['Raspberry']
+++

# Rasberry aansluiten op Synology nas.

 Document | |
--- | ---
 Bijgewerkt | 2015-03, 2016-03 |


## Inleiding
Hier beschrijf ik hoe de raspberry toegang krijgt tot mijn nas. De raspberry krijgt verschillende rechten, op de muziek
map alleen maar leesrechten. Tevens krijgt de rapsberry een eigen map met alle rechten daarop op de nas.
Ik maak gebruik van het cifs protocol. 


## Gebruikersnaam en wachtwoord
Maak in de /etc directory een bestandje aan met de naam: nas.conf.
Dit moet de volgende inhoud krijgen:
```bash
# nas inlog gegevens
# aangemaakt <datum van vandaag>
username=c-gebruiker
password=wachtwoord
```

Toelichting, de eerste 2 regels zijn ter info, regel 3 bevat gebruikers naam, regel 4 bevat het wachtwoord voor de
raspberry voor mijn nas. 
Doe daarna:
```bash
sudo chmod go-rwx nas.conf
```
Toelichting, alleen user root hoeft het bestand in te kunnen zien, voor de andere gebruikers is dat niet nodig


## Nas opnemen in hosts file
Voeg de nas toe aan het /etc/hosts bestand.
**Gebruik nu eigen dhcp/dns server, dus dit is niet meer nodig.**


## Mappen om nas te koppelen
Map aanmaken om nas te koppelen
```bash
sudo mkdir /media/raspberry-v
```

## fstab aanpassen
In dit bestand staan alle mappen waarmee de raspberry kan koppeelen. 
Pas het aan voeg een map voor koppelen met de nas toe, doe:
```bash
sudo vi /etc/fstab
```
Voeg toe:
```bash
//dp-ds413/muziek-v        /media/muziek-v        cifs credentials=/etc/nas.conf,noperm,dir_mode=0777,file_mode=0777 0
0
```


## Raspberry koppelen met de nas
koppel nu met de nas, doe:
```bash
sudo mount /media/muziek-v
```
Als het goed is heeft de raspberry nu toegang tot de nas.


## Drivers
Meestal zijn de drivers al geïnstalleerd. Controleer het met:
```bash
sudo apt-get install cifs-utils
```
Indien de computer lange tijd niet gereboot is, kan dat ook een oplossing zijn.


