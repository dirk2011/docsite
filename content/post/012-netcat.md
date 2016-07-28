+++
date = "2015-03-12T00:00:00+02:00"
draft = false
title = "012 - Netcat, heel kort"
tags = ['linux', 'netwerken', 'netcat']
+++

# Netcat


| Document info       |                   |
|---------------------|-------------------|
| Door                | Dirk Postma       |
| Laatst bijgewerkt   | 2015-02-14        |

Een hele korte notitie om het programma netcat niet te vergeten.

Netcat is een hackerstool, bedoeld om inzicht in te krijgen in netwerk zaken.

Met netcat kun je tegen een open poort "praten" van een server, en dat doe je als volgt:
```bash
nc 192.168.1.117 22
```
Waarbij 22 de poort is, en het andere getal is de computer. Het betreft hier een poort waarop meestal ssh draait.

Netcat geeft veel info terug, bijvoorbeeld informatie over het versie nummer van het programma dat luistert. 
Je kunt ook doen als of je een browser bent indien je gaat "praten" tegen poort 80.

Meer info hier:

http://hak5.org/

http://www.cyberciti.biz/faq/show-all-running-processes-in-linux/





