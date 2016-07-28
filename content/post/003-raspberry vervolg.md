+++
date = "2015-03-03T00:00:00+02:00"
draft = false
title = "003 - Raspberry, vervolg"
tags = ['raspberry', 'linux']
+++

# Rasberry, vervolg

 Document | |
--- | ---
 Door | Dirk 
 Bijgewerkt | 2015-08, 2016-03 |


**Tip:**
Onderstaand edit ik verschillende bestanden. Het is altijd verstandig om voordat een bestand wordt aangepast hiervan een kopie te maken!


## Todo
Firewall toevoegen, zoek een simpele.


## Wachtwoord wijzigen
Wijzig het wachtwoord van de gebruiker pi waarmee nu is ingelogd. Doe:
```bash
passwd
```
Voer vervolgens eerst oude, en daarna 2x nieuwe wachtwoord in.
Het is nog beter om een nieuwe gebruiker aan te maken, ipv door te gaan met de gebruiker pi.


## Hostnaam wijzigen
Hier leg ik uit hoe de hostnaam gewijzigd kan worden, De naam van de computer. Nu niet vanuit het configuratie menu, maar handmatig. 
Sinds een tijdje gaat dat echter prima vanuit het configuratie menu (raspi-config).
Hiervoor moeten de volgende bestanden moeten ge-edit worden, doe:
```bash
vi /etc/hostname
```

Sla het bestand op en doe vervolgens:
```bash
vi /etc/hosts
```

Zorg ervoor dat hostname in beide bestanden wordt aangepast, en dat deze gelijk is!
Voer nu de wijzigingen door, draai script:
```bash
sudo /etc/init.d/hostname.sh
```

Indien een foutmelding volgt, voer deze stap dan nogmaals uit.
Start een nieuwe shell om te kijken of hostname nu is gewijzigd, doe:
```bash
bash
```

**LET OP!
Na wijzigingen hostname raspberry rebooten. Koude reboot doen (stroom eraf) als hij niet goed opstart!**


## Grafische desktop starten
Het starten van de grafische desktop is erg eenvoudig, doe:
```bash
startx
```
En meer komt er niet bij kijken om een grafische werkomgeving te krijgen op de raspberry.


## ll commando activeren
ls, geeft niet zoveel informatie over bestanden. Meer informatie geeft het commando: ls -l, daarom maak ik het "commando" ll aan door hiervoor een alias te maken.
Ga naar de home map van de gebruiker, doe:
```bash
cd
```
Edit bestand .bashrc, doe:
```bash
vi .bashrc
```

Zoek naar de sectie waar alias commando's staan. Haal het commentaar (een hekje) weg dat er voor staat. Voeg aan ls de opties toe: ia, zodat het er uit ziet als onderstaand:
```bash
alias ll='ls -lia'
```

Start nu een nieuwe shell om de gewijzigde .bashrc te activeren, en probeer het nieuwe commando ll uit.

Herladen van de van .bashrc is ook mogelijk voor het huidige venster, doe:
```bash
cd
source .bashrc
```

## Wolfram verwijderen
Met Wolfram kunnen mathematische berekeningen worden uitgevoerd.
Wolfram is een package die ik niet gebruik en nogal wat ruimte inneemt (450mb), dus die verwijder ik:
```bash
sudo apt-get purge wolfram-engine -y
```

## X Sever en Desktop Manager verwijderen
Deze programma's zijn nodig indien de grafische desktop gebruikt wordt. 
Indien dat niet het geval is kunnen ze weg. Ze nemen nogal wat schijfruimte ingebruik.
Proef draaien gaat als volgt:
```bash
sudo apt-get remove --dry-run --auto-remove --purge libx11-.*
```
Om het echt uit te voeren, verwijder “dry-run” uit de commando regel.
Het verwijderen duurt even. 

Sinds een tijdje (vanaf 2016?) is er ook een lite versie van raspbian, daar zit de grafisch omgeving niet in.
Referentie: http://raspberrypi.stackexchange.com/questions/4745/how-to-uninstall-x-server-and-desktop-manager-when-running-as-headless-server


## Updates installeren
Werk het systeem helemaal met de laatste software versies en patches. Doe:
```bash
sudo apt-get update
```
En als dat klaar is doe:
```bash
sudo apt-get upgrade
```
Of doe alles in één keer achter elkaar aan, met:
```bash
sudo apt-get update && sudo apt-get -y upgrade
```
Toelichting: opdracht 2 wordt alleen opgestart als opdracht 1 is gelukt, bovendien wordt niet gevraagd of de updates geïnstalleerd moeten worden, dat gaat dan automatisch.

Het bijwerken van de systeem software (de kernel) gaat als volgt:
```bash
sudo apt-get update && sudo apt-get dist-upgrade -y
```
Opvragen van de huidige kernel versie gaat als volgt:
```bash
uname -a
```

## Updaten –dry-run
Om te zien wat er geïnstalleerd gaat worden kan apt-get proef gedraaid worden, dat gaat als volgt.
```bash
sudo apt-get upgrade --dry-run
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be upgraded:
  omxplayer
1 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Inst omxplayer [0.3.6~git20150210~337004e] (0.3.6~git20150912~d99bd86 Raspberry Pi Foundation:oldstable [armhf])
Conf omxplayer (0.3.6~git20150912~d99bd86 Raspberry Pi Foundation:oldstable [armhf])
```
Uiteraard moet eerst een update zijn uitgevoerd.


## Opschonen
Nadat de update klaar is kunnen tijdelijke bestanden worden opgeschoond met:
```bash
sudo apt-get clean
```
Verwijder niet langer benodigde packages met:
```bash
sudo apt-get autoremove -y
```
Datum 2015-08-22. Na het bijwerken van de software, opschonen etc. geeft df -h nu het volgende over het schijf gebruik. 
```bash
df -h

pi@rasp163 ~ $ df -h
Filesystem      Size  Used Avail Use% Mounted on
rootfs          7.3G  998M  6.0G  15% /
/dev/root       7.3G  998M  6.0G  15% /
devtmpfs        484M     0  484M   0% /dev
tmpfs            98M  244K   98M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           195M     0  195M   0% /run/shm
/dev/mmcblk0p1   56M   19M   37M  34% /boot
pi@rasp163 ~ $ 
```


## Firmware updaten
Met rpi-update kan de firmware van de raspberry worden geupdate. 

Eventueel installeren gaat als onderstaand.
```bash
sudo apt-get install rpi-update
```
Maar in mijn geval was het niet nodig, het programma was er al. Uitvoeren als onderstaand.
```bash
sudo rpi-update
```
Output
```bash
pi@rasp168 ~ $ sudo rpi-update 
 *** Raspberry Pi firmware updater by Hexxeh, enhanced by AndrewS and Dom
 *** Performing self-update
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 10206  100 10206    0     0  15822      0 --:--:-- --:--:-- --:--:-- 18935
 *** Relaunching after update
 *** Raspberry Pi firmware updater by Hexxeh, enhanced by AndrewS and Dom
 *** We're running for the first time
 *** Backing up files (this will take a few minutes)
 *** Backing up firmware
 *** Backing up modules 3.18.7-v7+
#############################################################
This update bumps to rpi-4.1.y linux tree
Be aware there could be compatibility issues with some drivers
Discussion here:
https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=113753
##############################################################
 *** Downloading specific firmware revision (this will take a few minutes)
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   168    0   168    0     0    228      0 --:--:-- --:--:-- --:--:--   303
100 47.1M  100 47.1M    0     0  1408k      0  0:00:34  0:00:34 --:--:--  849k
 *** Updating firmware
 *** Updating kernel modules
 *** depmod 4.1.6-v7+
 *** depmod 4.1.6+
 *** Updating VideoCore libraries
 *** Using HardFP libraries
 *** Updating SDK
 *** Running ldconfig
 *** Storing current firmware revision
 *** Deleting downloaded files
 *** Syncing changes to disk
 *** If no errors appeared, your firmware was successfully updated to 8fa6f17ce494512aad92ef643765c7e79e2ea938
 *** A reboot is needed to activate the new firmware                                                                                                                                                               
pi@rasp168 ~ $
```

Nadat de update gelukt is dient de raspberry opnieuw te worden opgestart.


## Vast ip adres
Om de Raspberry op het eigen netwerk te kunnen terugvinden is een vast ip adres wel handig.
Edit het bestand interfaces, doe:
```bash
sudo vi /etc/network/interfaces
```
Vervang de regel:
```bash
iface eth0 inet dhcp
```
Door:
```bash
iface eth0 inet static
address 192.168.1.115
netmask 255.255.255.0
network 192.168.1.0
broadcast 192.168.1.255
gateway 192.168.1.1
```
Bovenstaand krijgt de Raspberry bijvoorbeeld het vaste adres:  192.168.1.115, en wordt er van uitgegaan dan het eigen netwerk begint met 192.168.1.
Indien in deze wijziging iets fout gaat, is de kans groot dat niet meer remote kan worden ingelogd. Aansluiten van een scherm en toetsenbord is dan de enige weg om dit te herstellen.

**Heb nu eigen dhcp/dns server draaien, deze stap is niet meer nodig.**


## Reboot commando
Reboot de raspberry met het volgende commando
```bash
sudo reboot
```


## Bestand hosts configureren
In het bestand /etc/hosts staan de andere computers die zich in het eigen netwerk bevinden en een vast ip adres hebben. Het is alleen maar nuttig die computers te noemen 
waar de raspberry bij moet kunnen, denk aan bijvoorbeeld een nas.

**Heb nu eigen dhcp/dns server draaien, deze stap is niet meer nodig.**


## Extra software installeren
Installeer eventueel onderstaande extra en ook handige software.
Vim is een uitgebreidere variant van vi. Mc is een soort Norton Commander. Met tmux kunnen meerdere werk sessie's gebruikt worden, enorm handig.
```bash
sudo apt-get install -y vim mc tmux
```

Voor python en postgres zijn deze toevoegingen handig:
```bash
sudo apt-get install -y python-pip postgresql  python-psycopg2
```

Een “lichter” alternatief voor apache voor hosten websites:
```bash
sudo apt-get install -y  nginx
```

Met python-pip kunnen python extensies geïnstalleerd worden.
Postgres is een geweldige open source database. Ik gebruik (febr. 2015) versie 9.1.
Met de package python-psycopg2, kan python gebruik maken van de postgres database.
Nginx is een webserver.


## Vim als standaard editor
Voeg dit toe aan .bashrc, om vim de standaard editor te maken:
```bash
export EDITOR="vi"
export VISUAL="vi"
```

## tmux
Met tmux kunnen meerdere schermen cq. sessies gebruiken worden. Erg handig, en programma's in een remote sessie blijven doordraaien zelfs als de verbinding met de computer wegvalt. 
Voeg daarom onderstaande toe aan .bashrc, na inloggen kom je dan automatisch in een lopende sessie terecht.
```bash
tmux attach || tmux
```


## ssh keys kopieren
Om automatisch te kunnen inloggen kopieer de ssh key file. Voer dit commando uit vanaf de werkpc.
```bash
ssh-copy-id pi@192.168.3.28
```

