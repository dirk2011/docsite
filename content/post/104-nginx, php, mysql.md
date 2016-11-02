+++
categories = ["Raspberry"]
date = "2016-10-18T00:00:00+02:00"
draft = true
spelling = 0
tags = ["Linux", "Raspberry", "nginx", 'php', 'mysql']
title = "104 - Installatie van nginx, php en mysql"
toc = false
type = "post"
updated = "2016-10-19"
+++


## installatie van mysql
sudo  apt-get install mysql-server
```

## Wachtwoord voor MySql
Tijdens het installatie proces wordt om een wachtwoord gevraagd voor de MySql
database beheerder. Het beheerdersaccount is nodig om nieuwe gebruikers aan te
maken.


## Installatie

Onderstaande opdracht installeert de webserver Nginx, de web scripting tall Php
en de databasesoftware MySql.

```bash
sudo apt-get install nginx php5-fpm php5 php5-mysql php5-pgsql php5-imap php-pear php5-sqlite php5-ldap php5-gd php5-imagick php5-curl php-apc
sudo apt-get install php5-mcrypt php5-pspell php5-xmlrpc php5-xsl php5-cgi php-auth php-auth-sasl php-net-smtp
```

## Bronnen

https://dvpizone.wordpress.com/2014/03/11/how-to-install-piwigo-on-a-raspberry-pi/

![Linux](/img/logo_linux.jpg)

* * *

