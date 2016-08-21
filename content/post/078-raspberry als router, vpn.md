+++
date = "2016-07-26T10:07:00+02:00"
draft = false
title = "078 - Raspberry als router"
tags = ['raspberry', 'linux']
categories = ['Raspberry']
updated = "2016-08-08"
+++

# Raspberry als router

 Doc info | |
--- | ---
| Door | Dirk |
| Laatst bijgewerkt | 2016-07|


## Todo 
Moet nog naar dns instellingen kijken


## Kernel aanpassingen
Als eerste moet package forwardering in de kernel worden aangezet. Edit de kernel parameters.
```
sudo vi /etc/sysctl.conf
```

Zoek de regel op waar staat
```bash
 #net.ipv4.ip_forward=1
```
verwijder het commentaar (hekje).

Laad de gewijzigde parameters, met
```bash
sudo sysctl -p
```
Als het goed is worden de gewijzigde instellingen geladen en wordt dit getoond
```
net.ipv4.ip_forward = 1
```

## Firewall
Nu moet de firewall worden aangepast.
```
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo iptables -A FORWARD -i tun0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT
```

Voor meer info zie hier
http://www.cyberciti.biz/faq/linux-setup-default-gateway-with-route-command/


## Andere hosts
Op de andere hosts moet ook wat gebeuren, de default gateway (router) moeten worden aangepast.
```bash
 # nieuwe toevoegen
 sudo route add default gw raspvpn
 # huidige weggooien
 sudo route del default gw 192.168.0.1
 # toon de route
 route
```


