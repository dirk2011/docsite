+++
categories = ["Raspberry"]
date = "2016-10-26T00:00:00+02:00"
draft = true
spelling = 0
tags = ["Linux", "mysql" ]
title = "105 - MySql notities"
toc = false
type = "post"
updated = "2016-10-26"
+++

## Inleiding
MySql is een zeer populaire database en wordt veel gebruikt voor websites. Hier
enkele commando's en andere notities om er mee te kunnen werken.

## Prompt
Log als volgt als beheerder in.
```bash
mysql -u root -p
```
Vervolgens wordt door MySql om het wachtwoord gevraagd. 


## Toon status
Met dit `\s` commando kan de status van een database getoond worden.
```mysql
\s
--------------
mysql  Ver 14.14 Distrib 5.5.52, for debian-linux-gnu (armv7l) using readline 6.3

Connection id:          49
Current database:
Current user:           root@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         5.5.52-0+deb8u1 (Raspbian)
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /var/run/mysqld/mysqld.sock
Uptime:                 5 hours 1 min 10 sec

Threads: 1  Questions: 608  Slow queries: 0  Opens: 189  Flush tables: 1  Open tables: 41  Queries per second avg: 0.033
--------------
```


## Toon alle databases
Toon alle database met `show databases ;`. 
```mysql
mysql> show databases
    -> ;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    +--------------------+
    3 rows in set (0.00 sec)
```


## Bronnen


![Linux](/img/logo_linux.jpg)

* * *

