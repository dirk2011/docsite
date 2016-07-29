+++
date = "2016-07-29T00:00:00+02:00"
draft = false
title = "085 - Ncftpput, kort"
tags = ['ftp', 'linux']
+++

# Ncftpput, kort

Overzetten van een aantal bestanden door middel van ftp met ncftpput.

## Installeren
```bash
sudo apt-get install ncftp
```

## Voorbeeld
```bash
ncftpput -R -v -u "gebruiker" -p "wachtwoord" ftpsite /pad/op/ftpsite /lokale/pad
```

commando | verklaring
-------- | ----------
 -R      | recursive, kopieer een directory structuur
 -v      | verbose, toon gedetaileerde voortgangsinfo

Bron:
http://www.cyberciti.biz/tips/linux-upload-the-files-and-directory-tree-to-remote-ftp-server.html

![linux](/img/logo_linux.jpg)

