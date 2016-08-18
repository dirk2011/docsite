+++
date = "2016-08-14T00:03:00+02:00"
draft = false
title = "093 - Speed test met wget en time"
tags = ['raspberry', 'linux', 'tools', 'speed test', 'wget', 'time']
topics = ['linux']

+++

# Speed test 


| Document info       |             |
|---------------------|-------------|
| Laatst bijgewerkt   | 2016-08     |


Speedtest is een website waar je de snelheid van je internet verbinding kunt
testen. Deze website benader je van uit je browser. Als linux gebruiker wil ik
een testje kunnen doen vanaf de command line.

Deze oplossing biedt niet hetzelfde als speedtest, voor mij is het voldoende. Op
deze website
[glasvezel](http://www.glasvezel.nu/speedtest-servers-100mb-1000mb-bin) zijn een
aantal bestanden te vinden die voor een download testje met wget gebruikt kunnen
worden. 

Een test voor de download snelheid van de internet verbinding gaat dan als
volgt.
```bash
time wget --output-document=/dev/null  http://download.xs4all.nl/test/100mb.bin
```

Voorbeeld output
```bash
$ time wget --output-document=/dev/null
http://download.xs4all.nl/test/100mb.bin
--2016-08-14 21:08:51--  http://download.xs4all.nl/test/100mb.bin
Resolving download.xs4all.nl (download.xs4all.nl)... 194.109.21.67,
2001:888:0:25::43
Connecting to download.xs4all.nl (download.xs4all.nl)|194.109.21.67|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 100000000 (95M) [application/octet-stream]
Saving to: `/dev/null'

100%[======================================================================================================================>]
100,000,000 10.8M/s   in 9.0s    

2016-08-14 21:09:00 (10.7 MB/s) - `/dev/null' saved [100000000/100000000]


real    0m9.009s
user    0m0.350s
sys     0m4.320s
```


Met dank aan Hak5 voor het idee.


## Bronnen 

* http://www.speedtest.net/nl/
* test bestanden http://www.glasvezel.nu/speedtest-servers-100mb-1000mb-bin
* Hak5 https://www.youtube.com/watch?v=vrhesofLIcA

![linux](/img/logo_linux.jpg)

