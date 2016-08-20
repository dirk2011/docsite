+++
date = "2016-08-20T00:00:00+02:00"
draft = false
title = "096 - Hugo, kenmerken alfabetisch sorteren"
tags = ['hugo', 'linux']
topics = ['hugo']
updated = "2016-08-20"
+++

Aan artikelen kunnen in Hugo kenmerken worden toegekend, ook wel taxonmien
genoemd. Hugo maakt vervolgens lijstjes hiervan, zodat artikelen via kenmerken
kunnen worden terug gevonden.   
Standaard sorteert het door mij gebruikte template Hyde-Y de kenmerken op meest
voorkomend. Ik wilde dat op alfabetische volgorde hebben. Met onderstaande
kleine ingreep is dat gerealiseerd.

Ga op schijf naar de directory waar de website staat.
```bash
cd website
```

Ga naar de map waar het te wijzigen bestand staat.
```
cd themes/hyde-y/layouts/_default/terms.html
```

Maak een kopie van het te wijzigen bestand.
```bash
cp terms.html terms.html.org
```

Het bestand heeft de volgende inhoud.
```html
{{ partial "head" . }}
<article id="main-content" class="container main_content terms">
  <header class="container">
    {{ partial "bloc/content/h1-title" . }}
  </header>
  <ul class="container content">
  {{ $baseurl := .Site.BaseURL }}
  {{ $data := .Data }}
  {{ range $key,$value := .Data.Terms.Alphabetical }}
    <li>
      <a href="{{ $baseurl }}{{ $data.Plural }}/{{ $value.Name | urlize }}">
        {{ $value.Name }}
      </a>
      <strong>
        {{ $value.Count }}
      </strong>
    </li>
  {{ end }}
  </ul>
</article>
{{ partial "foot" . }}
```

Vervang in het bestand  
`{{ range $key,$value := .Data.Terms.ByCount }}`  
door  
`{{ range $key,$value := .Data.Terms.Alphabetical }}`



![linux](/img/logo_linux.jpg)

