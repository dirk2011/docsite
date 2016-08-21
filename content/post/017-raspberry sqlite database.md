+++
date = "2014-08-01T00:00:00+02:00"
draft = false
title = "017 - Raspberry, sqlite database"
tags = ['raspberry', 'linux', 'sqlite', 'database']
categories = ['Raspberry']
+++

# Raspberry, sqlite database


| Document info       |                   |
|---------------------|-------------------|
| Door                | Dirk              |
| Laatst bijgewerkt   | 2014-08           |

## sqlite

Sqlite een klein database systeem met veel power en dus mogelijkheden. Versie 3 gebruikt.
Klein, snel, ondersteunt ook ingewikkelde sql bevragingen. Group by wordt echter niet afgedwongen en daardoor kunnen
andere dan de bedoelde resultaten ontstaan.
Lijkt ideaal voor kleine toepassingen. Raakte echter op een gegeven moment op mijn raspberry records kwijt in tabellen.
Daarna ben ik overgestapt op postgres die ook prima bleek te draaien op de Raspberry en veel betrouwbaarder is.

Voorbeeld sql voor Sqlite3, Top N records ophalen uit sqlite3 database. Gebruik Limit `<n>` om het aantal records dat
wordt teruggegeven te beperken.

```sql
-- top N meest afgespeeld
select artist, count(*) as aantal
from played
left join songs
on played.song_id = songs.song_id 
group by artist 
order by 2 desc
limit 25 ;
```

