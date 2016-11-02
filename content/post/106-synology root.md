+++
categories = ["Synology"]
date = "2016-11-02T18:56:59+02:00"
draft = false
spelling = 0
tags = ["Synology", "Linux", 'root']
title = "106 - Synology inloggen als root"
toc = false
type = "post"
updated = "2016-11-02"

+++

## Synology inloggen als root

Sinds Synology versie 6 gaat het inloggen als root op de nas wat anders.

Log in met `ssh` als beheerder. Uiteraard niet met het standaard admin account
want dat is geblokkeerd en een eigen aangemaakte user heeft beheerders rechten
gekregen.

Doe `sudo su - `. Het systeem vraagt om een wachtwoord. Voer hier nogmaals het
wachtwoord in van het eigen beheerders account, en de root prompt volgt.

## Bronnen

http://mysynology.nl/inloggen-als-root-gaat-nu-anders-dsm-6-0-beta-2/


![Linux](/img/logo_linux.jpg)

* * *

