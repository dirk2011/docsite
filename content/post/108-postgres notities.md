+++
categories = ["Raspberry"]
date = "2016-11-02T20:00:00+02:00"
draft = false
spelling = 0
tags = ["Raspberry", "Postgres", 'Linux']
title = "108 - Postgres notities"
toc = true
type = "post"
updated = "2016-11-02"

+++

# Postgres
Hier wat aantekeningen over het werken met een Postgres database. 


## Configuratie `pg_hba.conf`
In dit configuratie bestand kan o.a. de toegang tot de database geconfigureerd
worden. 
Op het einde van het bestand heb ik deze regel opgenomen. Op de Raspberry zelf
zijn nu voor het werken met de database geen wachtwoorden nodig.
```bash
host    all             all             192.168.0.164/32        trust
```

## Configuratie `postgres.conf`
In dit bestand is o.a. geregeld naar verzoeken van welke hosts Postgres moet
luisteren. Standaard staat deze waarde op `localhost`, dat heb ik gewijzigd in
alle hosts door een `*` in te vullen.
```bash
listen_addresses = '*'
```

## Postgres prompt

Verbinding maken met een Postgres database via `psql`.
Op de `psql` prompt kunnen interactief statements worden ingetypt en uitgevoerd. 
Postgres geeft het resultaat meteen terug.

```bash
#!/bin/bash 
psql -d dbmc -h mc -p 5432 -U pi
```
Verklaring van de parameters.

Parameter | Toelichting
--------- | -----------
`psql`    | Postgres prompt
`-d dbmc` | database naam
`-h mc`   | host, computer naam
`-p 5432` | via poort 5432, is de standaard Postgres poort
`-U pi`   | hoofdletter U, Postgres user pi


## Backup maken

Met dit script maak ik een backup van de database. Het script is gepland om
iedere dag te worden uitgevoerd via de `crontab`.  
Het werkt als volgt. Ga na een bepaalde directory. 
Voor het bepalen van de data dump bestandsnaam vul de variabele `BACKUPDATE` met de huidige datum en tijd. 
Voer het programma `pg_dump` uit, dump de output naar een bestand.

```bash
#!/bin/bash 
#export maken van postgresql database

cd '/media/rasp164-v/mymc/db/backupspostgres'

BACKUPDATE=`date +%Y%m%d-%H%M`

pg_dump -h 192.168.0.164 -p 5432 -U pi dbmc > ./exports/${BACKUPDATE}-dbmc.dump
```


## Backup terugzetten
Onderstaand een scriptje om een Postgres backup terug te zetten.
Hier is één nieuwe parameters. Met de `-f` optie wordt een bestand met SQL
opdrachten ingelezen. 
Er staat een `exit` commando in het bestand om te voorkomen dat het per ongeluk
uitgevoerd wordt. 

```bash
#!/bin/bash 
#postgresql database export teruglezen
exit
psql -d dbmc -h 192.168.0.164 -p 5432 -U pi -f 20160919-0010-dbmc.dump
```


## Bronnen

* Postgres website
https://www.postgresql.org/


![Linux](/img/logo_linux.jpg)

* * *

