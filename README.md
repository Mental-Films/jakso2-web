# Jakso 2 — web-videosoitin kuvauksiin

iPhonen näyttöproppi: YouTube-tyylinen treenivideosoitin, joka toimii
selaimessa ilman asennuksia. Kaksi näkymää käsikirjoituksen mukaan:

1. **Video 1** — YouTube-kehys ja otsikko
   *KILLER NON-STOP // HIIT TREENI (CARDIO + PAINOT)*
2. **Video 2** — pelkkä video ja liikeilmaisin *SKULLCRUSHER* kulmassa

Julkaistu GitHub Pagesissa: **https://mental-films.github.io/jakso2-web/**

Kellosovelluksen esikatselu selaimessa (graafikolle, ei vaadi asennuksia):
**https://mental-films.github.io/jakso2-web/kello.html**

## Käyttöönotto kuvattavassa iPhonessa

1. Avaa osoite Safarissa.
2. Jaa-nappi → **Lisää Kotivalikkoon** → avaa sovellus kotivalikosta
   (koko näyttö ilman selaimen palkkeja).
3. Napauta ruutua kerran (sallii äänen ja näytön sammumisen eston).
4. Varmuuden vuoksi: Asetukset → Näyttö ja kirkkaus → Automaattilukitus
   → **Ei koskaan** (kuvausten ajaksi), kirkkaus täysille, Ei häiritse päälle.

## Ohjaus

**Bluetooth-näppäimistöllä** (pariliitetty iPhoneen):

| Näppäin | Toiminto |
|---|---|
| `1` / `2` | Näkymä 1 (YouTube) / Näkymä 2 (SKULLCRUSHER) |
| väli / `K` | Toisto / tauko |
| `J` / `L` | Kelaus −10 s / +10 s |
| `A` | Alusta |
| `S` | Ääni päälle/pois (käynnistyy mykistettynä) |
| `O` | Soittimen kehys (otsikko, kanavarivi, aikapalkki) |
| `M` | Liikelaatikko päälle/pois |
| `N` / `B` | Seuraava / edellinen liike |
| `Z` | Videon sovitus / täyttö |
| `H` | Ohjauspaneeli (ei kuvaan!) |

**Ilman näppäimistöä:** kolme nopeaa napautusta vasempaan yläkulmaan
avaa ohjauspaneelin, jossa samat toiminnot ovat nappeina.

## Videoiden päivitys

**Pysyvästi (git):** korvaa tiedostot ja pushaa — sivu päivittyy
noin minuutissa:

```bash
./pakkaa-video.sh uusi-video.mov videot/video1.mp4
git add videot && git commit -m "Päivitä video 1" && git push
```

`pakkaa-video.sh` pakkaa videon 1080p H.264 -muotoon macOS:n omalla
avconvert-työkalulla (ei asennuksia). GitHubin kova raja on 100 Mt /
tiedosto — pakattuna 26 s video on n. 31 Mt.

**Kuvauspaikalla ilman gitiä:** ohjauspaneeli (`H` tai kolmoisnapautus
kulmaan) → *Valitse video 1/2…* → poimi video Kuvista tai Tiedostoista.
Vaihto koskee vain sitä istuntoa.

## Graafikon peittokuvat

Soittimen päällysgrafiikat (otsikkopalkki, kanavarivi, aikapalkki,
liikelaatikko) piirtyvät oletuksena koodista väliaikaisina. Kun
graafikko toimittaa valmiit peittokuvat, ne korvaavat koodigrafiikan
kokonaan — mitään väliaikaista ei jää näkyviin:

| Tiedosto | Näkymä |
|---|---|
| `grafiikat/overlay1.png` | Näkymä 1: YouTube-kehys ja otsikko |
| `grafiikat/overlay2.png` | Näkymä 2: SKULLCRUSHER-liikeilmaisin |

PNG, läpinäkyvä tausta, videon kokoinen (esim. 1080 × 1920).
Puuttuva tiedosto ohitetaan automaattisesti. Vaihtoehtoisesti
grafiikat voi polttaa suoraan videoon, jolloin peittokuvia ei
tarvita lainkaan.

## Tekstien ja värien muokkaus

Kaikki sisällöt (otsikko, liikelista, kanavan nimi) ja värit ovat
`index.html`-tiedoston alussa: CSS-muuttujat `:root`-lohkossa ja
`ASETUKSET`-objekti skriptin alussa.

## Huomiot

- Sivu toimii pysty- ja vaakasuunnassa; `Z` vaihtaa sovittaako video
  ruutuun (mustat palkit) vai täyttääkö sen (rajautuu).
- Näytön sammumisen esto (Wake Lock) toimii GitHub Pagesin yli
  automaattisesti ensimmäisestä kosketuksesta; paneeli näyttää tilan.
- Apple Watch -proppi on erillinen natiivisovellus (ks. pääkansion
  README) — web-sivu ei voi ohjata kelloa.
