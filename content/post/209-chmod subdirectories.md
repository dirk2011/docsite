+++
date = "2012-05-01T00:00:00+02:00"
draft = false
title = "209 - chmod subdirectories"
tags = ['linux', 'chmod']
+++


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2012-05           |


Bestandsrechten pas je in linux aan met het commando: `chmod`. De variant hiervan om een directory met alle onderliggende
bestanden en subdirectories aan te passen is bijvoorbeeld:
```bash
chmod 755 /bestanden* -R
```

Deze eenvoudige tip is ook voor mezelf bedoeld als geheugen steuntje omdat ik elders op internet ingewikkelde
oplossingen tegenkwam. Dus moeilijke oplossingen met find en exec zijn helemaal niet nodig. 

![linux](/img/logo_linux.jpg)

