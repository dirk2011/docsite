+++
date = "2015-02-15T00:00:00+02:00"
draft = false
title = "032 - Nginx webserver"
tags = ['raspberry', 'linux', 'nginx', 'webserver']
updated = "2016-08-25"
toc = false
+++



## Inleiding
Nginx is een veel “lichter” webserver dan Apache. In mijn geval hoeft het
programma alleen maar bestanden te hosten, dat kan het prima doen.


## Installatie en opstarten
Installatie gaat op de bekende manier.
```bash
sudo apt-get install nginx
```

Na de installatie moet de webserver worden gestart.
```bash
sudo service nginx restart
```

## Configuratie
Voor het hosten van bestanden heb ik de volgende wijzigingen
doorgevoerd.

Edit het bestand: `/etc/nginx/sites-avialable/default` 
Kopje `server`, regel `root`. Zet een `#` voor de bestaande regel voeg deze
regel toe.
`root /media/bestanden-v;`. Vergeet de puntkomma op het einde niet!

Kopje `location`. Voeg hieraan een regel toe `autoindex on;`. Denk ook hier weer
om de puntkomma op het einde.

Herstart nu nogmaals de webserver om de wijzigingen actief te maken.

## Bronen
* http://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md

![linux](/img/logo_linux.jpg)

* * *

