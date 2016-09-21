+++
categories = ["Linux"]
date = "2016-09-20T20:44:39+02:00"
draft = false
spelling = 0
tags = ["Linux", "history", "bash", ".bashrc"]
title = "101 - History"
toc = false
type = "post"
updated = "2016-09-21"

+++

## Inleiding
Linux kan alle uitgevoerde commando's op de shell prompt bijhouden in een lijst.
Dat is bijvoorbeeld handig voor je als commando's nog een keer wilt uitvoeren,
je hoeft ze dan niet weer in te typen maar kunt door een lijst bladeren of de
lijst met uitgevoerde commando's doorzoeken.
Meestal staat deze functionaliteit aan.


## History
Met het commando `history` kun je alle uitgevoerde commando's bekijken.
![History](/img/101-history-01-history.jpg)


## Datum en tijd
De lijst bevat geen inzicht in wanneer de commando's zijn uitgevoerd. Die optie
is er wel maar moet je zelf aanzetten. Edit `.bashrc` en voeg het volgende
toe: `export HISTTIMEFORMAT='%F %T  '`. Wanneer opnieuw wordt ingelogd dan zal
de datum en tijd van de uitgevoerde commando's worden bijgehouden.

![History datum en tijd](/img/101-history-02-datum-en-tijd.jpg)


## Niet alles naar de historie
Het is vaak niet nodig alle uitgevoerde commando's in de historie op te slaan.
Voeg bijvoorbeeld dit `export HISTIGNORE='ll:history:pwd:date:'` toe aan `.bashrc`.
De genoemde commando's zullen nu niet meer aan de historie worden toegevoegd.


## Historie beperken
Voeg `HISTCONTROL=ignoreboth` dit toe aan `.bashrc`om de opbouw van de historie
verder te beperken. Effect hiervan is dat achter elkaar uitgevoerde dezelfde
commando's niet worden opgeslagen. Eveneens worden opdracht regels die beginnen
met een spatie niet opgeslagen, bijvoorbeeld ` du` wordt niet opgeslagen, maar
`du` wel.

Met `HISTCONTROL=ignoreboth:erasedups` wordt de historie lijst uniek. Eerder
uitgevoerde dezelfde commando's worden verwijderd en maar één keer opgenomen in
de lijst, namelijk de laatste keer.  Om dit te laten werken moet
`HISTTIMEFORMAT` uit staan.


## Historie bestand
De historie wordt bewaard in een bestand in de home directory van de gebruiker,
met als naam: `.bash_history`. Het bestand wordt bijgewerkt als een terminal
sessie wordt afgesloten.


## `HISTSIZE` en `HISTFILESZIE`
Met `HISTSIZE` wordt het aantal commando regels dat in het geheugen moet worden
bewaard beïnvloed. `export HISTSIZE=100` zorgt ervoor dat `history` maximaal 100
regels weergeeft. 
`HISTFILESIZE` regelt het aantal regels dat in het `.bash_history` wordt
bewaard. `export HISTFILESIZE=200` stelt het aantal regels op maximaal 200.


## Historie in het geheugen opschonen
Met `history -c` wordt de historie in het geheugen opgeschoond. Aan het historie
bestand veranderd niets, na uit- en inloggen is de historie uit het bestand weer
geladen.
Dus het opschonen is maar tijdelijk.


## Zoeken in de historie
Doe `\<ctrl-r>` en begin te typen. Vervolgens wordt het laatste uitgevoerde
commando getoond dat overeenkomt met de ingetypte tekst.


## `.bashrc`
Afhankelijk van je doel, kun je de opbouw van de historie configureren. Ik heb
het nu op de volgende manier gedaan, hiermee wordt een lijst van unieke 
uitgevoerde commando's bijgehouden, en niet zo zeer een lijst van uitgevoerde
commando's in de tijd.
```bash
# history configuratie
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=1000
```


## Bronnen

* Tecmint: http://www.tecmint.com/history-command-examples/
* man pagina's van `history` en `bash`


![Linux](/img/logo_linux.jpg)

* * *

