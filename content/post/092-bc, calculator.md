+++
date = "2016-08-14T00:02:00+02:00"
draft = false
title = "092 - bc, calculator"
tags = ['raspberry', 'linux', 'tools']
topics = ['linux']

+++

# bc, calculator


| Document info       |             |
|---------------------|-------------|
| Laatst bijgewerkt   | 2016-08     |


Bc is een calculator. Op mijn Raspberry was dit programma nog niet geïnstalleerd. Dus:
```bash
sudo apt-get install bc
```

Opstarten door `bc` in te typen. Vervolgens kunnen sommen worden ingetypt.
Een voorbeeld.
```bash
$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'. 
18 * 7
126
```
Sluit het programma af met ctrl-d.

Het programma kan ook gebruikt worden in scripts, of serie van commando's,
bijvoorbeeld.
```bash
$ echo 5 + 5 | bc
10
```

## Meer info

* man bc


![linux](/img/logo_linux.jpg)

