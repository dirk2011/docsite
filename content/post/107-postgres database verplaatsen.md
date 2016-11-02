+++
categories = ["Raspberry"]
date = "2016-11-02T19:00:00+02:00"
draft = false
spelling = 0
tags = ["Raspberry", "Linux", 'Postgres']
title = "107 - Postgres database verplaatsen"
toc = true
type = "post"
updated = "2016-11-02"

+++

# Aanleiding 
Postgres is een geweldige database, en kan veel complexer queries bijvoorbeeld
uitvoeren dan MySql.
Voor mij draait het best wel goed op de Raspberry Pi. Echter als na verloop van
tijd er teveel insert en delete statements zijn uitgevoerd en dit 
dus geleid heeft tot veel schrijf bewerkingen raakt het geheugenkaartje van de
Raspberry 
de kluts kwijt en met als gevolg dat Raspbian opnieuw geïnstalleerd moet worden.

Dat is me recentelijk weer gebeurd. Hoogste tijd nu op de database bestanden van
de Postgres database te verplaatsen naar mijn Synology nas. 

Onderstaand de stappen.

## Synology NFS partitie aanmaken
Maak op de nas een partitie aan, en stel deze aan het netwerk beschikbaar als
een NFS partitie. Ik noem deze: `rasp164pg-v`. Geef alleen de Raspberry Pi rechten op
deze partitie vul daarom het ip adres van de Raspberry in.

## Mount punt op de Raspberry Pi
Maak een directory aan op de Raspberry om daarmee de NFS partitie te verbinden,
bijvoorbeeld: `sudo mkdir /media/rasp164pg-v`

## Automatisch mounten
In het bestand `/etc/fstab` zijn de partities beschreven die tijdens het
opstarten automatisch verbonden moeten worden. Voeg voor de NFS partitie een
regel toe.
```bash
nas://volume1/rasp164pg-v       //media/rasp164pg-v     nfs     nolock
```

## Testen
Probeer de nfs partitie te mounten.
```bash
sudo mount /media/rasp164pg-v
```
Als het goed gaat volgen er geen foutmeldingen. Controleer of de actie gelukt
is en probeer op de nieuwe partitie bestanden en directories aan te maken.
Probeer eveneens de rechten aan te passen met `chmod`.

## Reboot Raspberry
Start de Raspberry opnieuw op. Controleer of de NFS partite meteen gemount is. 
```bash
sudo reboot
```

Nu met succes een NFS partitie verbonden is, kunnen de database bestanden hierna toe
gekopieerd worden. Zorg uiteraard dat er eerst een backup gemaakt is.

De configuratie bestanden van Postgres staan hier: `/etc/postgresql/9.4/main`.
In het bestand `postgresql.conf` is de map van de database bestanden
geconfigureerd met de parameter: `data_directory`.


## Data directory controleren
De runtime data map kan als volgt gecontroleerd worden. Start de `psql` prompt
op.
```bash
sudo -u postgres psql
```
En voer deze opdracht uit.
```bash
show data_directory ;
```
Als het goed is komt dit pad overeen met het geconfigureerde pad.


## Postgres stoppen
Voor de data bestanden gekopieerd kunnen worden, moet Postgres gestopt
worden. Dat kan met deze opdracht.
```bash
sudo systemctl stop postgresql.service
```
Type de opdracht als volgt in `sud<tab> systemc<tab> sto<tab> post<tab>`
Deze eenvoudiger opdracht werkt(e) ook nog.
```bash
sudo service postgresql stop
```


## Postgres status Controleren
Controleer de status. 
```bash
sudo systemctl status postgresql.service 
```
Of gebruik de eenvoudiger variant.
```bash
sudo service postgresql status
```

## Bestanden kopiëren
Nu de Postgres gestopt is, kunnen de bestanden veilig gekopieerd worden. Doe
dat als volgt, de rechten op mappen en bestanden blijven dan ongewijzigd.
```bash
rsync -av /var/lib/postgresql /media/rasp164pg-v
```

## Oude directory hernoemen
Om te voorkomen dat Postgres de oude bestanden nog gaat gebruiken hernoem die
ingang. 
```bash
cd /var/lib
sudo mv postgresql postgresql.bak
```

## Postgres data directory  configuratie aanpassen
Edit het configuratie bestand.
```bash
sudo vi /etc/postgresql/9.5/main/postgresql.conf
```
Kopieer de huidige instellen naar een nieuwe regel. Zet er vervolgens een hekje
voor. Hiermee kan de oude instelling eenvoudig terug gezet worden.
```
# data_directory = '/media/rasp164pg-v/postgresql/9.4/main'
```
Pas de oude regel nu aan, zodat deze nu wijst na de nieuw locatie.
```bash
data_directory = '/media/rasp164pg-v/postgresql/9.4/main'
```

## Postgres niet meer automatisch opstarten
Dit kan waarschijnlijk wel anders maar dat heb ik nog niet uitgezocht. Tijdens
heb booten wil ik niet dat Postgres automatisch opgestart wordt, om te voorkomen
dat er problemen ontstaan omdat de NFS nog niet gemount is.
Edit daarom het volgende bestand. 
```bash
sudo vi /etc/postgresql/9.5/main/start.conf
```
Voor 'auto' zet ik een hekje en voeg op een nieuwe regel toe 'manual'. Postgres
wordt nu niet meer automatisch opgestart.

## Postgres opstarten
Na al deze acties kan Postgres weer opgestart worden. 
```bash
sudo systemctl restart postgresql@9.4-main.service
```
Voer nu wat testje uit om te controleren of alle data weer beschikbaar is. Maak
als laatste een backup. Het backup bestand zou even groot moeten zijn als het
backup bestand dat gemaakt is voor de verhuizing. 


## Testje NFS parititie unmounten
Het lukt terecht niet de NFS partitie te unmounten terwijl Postgres draait. Er
volgt een foutmelding. 
```bash
sudo umount /media/rasp164pg-v/
umount.nfs: /media/rasp164pg-v: device is busy
```

## Bepalen `uid` en `gid` van de Postgres user.
Om op de nas de rechten van de mappen en bestanden te controleren is het handig
om de `uid` en `gid` van de Postgres gebruiker te weten. Vraag deze als volgt
op.
```bash 
id postgres
uid=109(postgres) gid=115(postgres) groups=115(postgres),114(ssl-cert)
```

## Bronnen 

* postgres database verplaatsen
https://www.digitalocean.com/community/tutorials/how-to-move-a-postgresql-data-directory-to-a-new-location-on-ubuntu-16-04
* nfs
https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-16-04


![Linux](/img/logo_linux.jpg)

* * *

