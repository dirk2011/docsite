+++
date = "2016-08-18T00:02:00+02:00"
draft = false
title = "095 - Linux os versie opvragen, /etc/os-release"
tags = ['raspberry', 'linux']
categories = ['linux'] 

+++


Op mijn Linux Mint computer was het programma lsb-release al aanwezig. Met dit
programma kunnen versie gegevens over het huidige os worden opgevraagd.

```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: LinuxMint
Description:    Linux Mint 17.3 Rosa
Release:        17.3
Codename:       rosa
```

Op de Raspberry was het nog niet aanwezig, dus eerst geïnstalleerd.
```bash
sudo apt-get install lsb-release
```
Verwarrend, de package naam heeft een streepje in de naam, en het programma een
underscore.


```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Raspbian
Description:    Raspbian GNU/Linux 8.0 (jessie)
Release:        8.0
Codename:       jessie
```

Onderstaand een eenvoudig alternatief, waarvoor de installatie van extra
software helemaal niet nodig is.
```bash
$ cat /etc/os-release 
PRETTY_NAME="Raspbian GNU/Linux 8 (jessie)"
NAME="Raspbian GNU/Linux"
VERSION_ID="8"
VERSION="8 (jessie)"
ID=raspbian
ID_LIKE=debian
HOME_URL="http://www.raspbian.org/"
SUPPORT_URL="http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL="http://www.raspbian.org/RaspbianBugs"
```

![linux](/img/logo_linux.jpg)

