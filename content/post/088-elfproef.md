+++
date = "2016-08-06T00:00:00+02:00"
draft = false
title = "088 - Elfproef"
tags = ['coda', 'oracle', 'rapportages', 'elfproef']
categories = ['coda']
+++

# Elfproef

| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2016-08           |

## Doel
De elfproef werd gebruikt voor het controleren van onze oude 9 cijferige
banknummers.  Met een rapportage werd dan periodiek gecontroleerd welke nummers
fout waren. De door ons gebruikte software controleerde hier niet op bij de
invoer.

## Oracle functie
Onderstaand de oracle functie. 

```sql
CREATE OR REPLACE function lee_bankelfproef (extern_rekening char)
          return char is
          rekening  varchar2(10);
          controle  number;
begin
    rekening := ltrim(rtrim(extern_rekening)) ;
    IF length(rekening) = 9 then
        controle :=            substr(rekening, 9, 1) * 1 ;
        controle := controle + substr(rekening, 8, 1) * 2 ;
        controle := controle + substr(rekening, 7, 1) * 3 ;
        controle := controle + substr(rekening, 6, 1) * 4 ;
        controle := controle + substr(rekening, 5, 1) * 5 ;
        controle := controle + substr(rekening, 4, 1) * 6 ;
        controle := controle + substr(rekening, 3, 1) * 7 ;
        controle := controle + substr(rekening, 2, 1) * 8 ;
        controle := controle + substr(rekening, 1, 1) * 9 ;

        controle :=   controle - (floor(controle / 11) * 11);
        if controle = 0 then
            return 'goed' ;
        else
            return 'fout' ;
        end if ;
    else
        return 'nvt' ;
    end if;

exception
    when others then
        return 'probleem met oracle' ;
end ;
/
```

## Gebruik
Het aanroepen, cq. gebruik van de functie gaat dan als volgt.
```sql
select lee_bankelfproef('123456789') from dual ;
```

Vervolgens wordt de waarde `goed` of `fout` teruggegeven.


