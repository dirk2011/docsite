+++
date = "2015-10-01T00:00:00+02:00"
draft = false
title = "061 - Dsh, distributed ssh"
tags = ['raspberry', 'linux', 'ssh', 'dsh']
topics = ['Raspberry']

+++

# Dsh, distributed ssh


| Document info       |             |
|---------------------|-------------|
| Laatst bijgewerkt   | 2015-10     |


## Inleiding
Dsh is een eenvoudig te gebruiken tool om via ssh, commando's op meerdere hosts uit te voeren. 
Het uit te voeren commando kan naar meerdere hosts tegelijk verzonden worden, 
of in volgorde na een aantal hosts ééń voor één.
Het dsh programma hoeft alleen maar geïnstalleerd te worden op de "commando" host.
De client hosts worden via ssh aangestuurd. 
Toegang tot deze aan te sturen hosts via ssh keys moet vooraf geregeld zijn. 
Er zijn maar weinig configuratie werkzaamheden nodig om met dsh aan de slag te kunnen.

Er zijn meerdere van dit soort tools bijvoorbeeld: ansible, pssh. Deze 2 zijn geschreven in python.
Ansible is een oplossing voor het beheren van grote server farms. 
Dsh vond ik zelf het meest plezierige om mee te werken.


## Installatie
Dsh zit in de programma bilbiotheek van debian en ook raspbian. Het installeren van dsh is daarom eenvoudig.
```bash
sudo apt-get install dsh
```


## Configuratie
Configuratie kan plaats vinden op één centrale plek, of per gebruiker. Ik heb gekozen voor  
centrale configuratie, de locatie daarvan is: `/etc/dsh`.

Het bestand `dsh.conf` ziet er na configuratie bij mij als volgt uit.
```bash
# default configuration file for dsh.
# suppled as part of dancer's shell

verbose = 0

remoteshell = ssh
showmachinenames = 1
waitshell=1  # whether to wait for execution

# remoteshellopt=...

# default config file end.
```

Toelichting.

Optie | Toelichting
----- | -----------
remoteshell = ssh    | Hoe inloggen op de aan te sturen hosts, met rsh of ssh, gewijzigd in ssh.  
showmachinenames = 1 | Toont tijdens de uitvoering de naam van de host vooraan op de regel.
waitshell = 1        | Voer het uit te voeren commando op de aan te sturen hosts één voor één uit.


In het bestand `machines.list` heb ik alle aan te sturen hosts vermeld.
```bash
# 2015-10
raspberry62
raspberry64
raspberry66
```
Zorg ervoor dat de host namen ook voor komen in het bestand ~/.ssh/config, anders werkt het niet!


## Voorbeeld
Het meest eenvoudige en kortste voorbeeld ziet er bijvoorbeeld als volgt uit.
```bash
dsh -a w
```

verklaring | toelichting
---------- | -----------
 dsh | het dsh programma :-)
  -a | alle hosts in het configuratie bestand
   w | uit te voeren programma



## Voorbeeld, alle hosts tegelijk

```bash
dsh -ac sudo apt-get update
```
Dit voorbeeld voert `sudo apt-get update` op alle hosts tegelijk uit (`c`).

Door de optie `w` mee te geven worden opdracht host voor host uitgevoerd, 
ik hoef dat niet op te geven, want dat heb ik als standaard op gegeven in het 
dsh configuratie bestand.


## Voorbeeld, één host
```bash
dsh -m raspberry64 df -h
```
Na de optie `-m` kan de naam van één host worden opgegeven. Er kan eveneens een lijst van hosts worden opgegeven
gescheiden door een komma gebruik dan geen spaties!


## Meer info
* zie de man page van dsh
* tecmint http://www.tecmint.com/using-dsh-distributed-shell-to-run-linux-commands-across-multiple-machines/



![linux](/img/logo_linux.jpg)


