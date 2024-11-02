# Sito grusf.it

## Come fare modifiche da GitHub

Per fare un cambiamento a una pagina esistente, basta modificare il file corrispondente nella cartella [pages](pages).

I file hanno due parti:

- un header delimitato da `---`, in cui sono indicati titolo e descrizione della pagina;
- il contenuto della pagina in formato Markdown.

Markdown è molto semplice da imparare, si può consultare questo [cheat sheet](https://www.markdownguide.org/cheat-sheet/), o per informazioni dettagliate il [manuale di Pandoc](https://pandoc.org/MANUAL.html#pandocs-markdown). Per esempio, per fare **grassetto** si scrive `**grassetto**`.

Per creare una nuova pagina, si crea un file in [pages](pages) (con il pulsante `Add Files > Create new file`) con estensione `.md`, sempre con header e corpo in markdown. Si può copiare una pagina già esistente come punto di partenza. Il file `pippo.md` sarà disponibile all'indirizzo `grusf.it/pippo.html`.

Per alcune cose è necessario scrivere un po' di HTML, i casi principali sono descritti nelle prossime sezioni.

### Immagini

Le immagini si inseriscono con la sintassi `![Descrizione immagine](link immagine)`.

Per caricare l'immagine, si va su [res](pages/res) e si preme sul pulsante `Add File` in alto a destra, poi su `Upload files`.

Per esempio, avendo caricato il file `2023-01-24-altruismo-efficace.png` nella cartella [res](pages/res), si può scrivere: `![Locandina "Fare bene il bene"](res/2023-01-24-altruismo-efficace.png)`.

### Pulsanti stile linktree

Per fare i pulsanti come in [grusf.it/qr](https://grusf.it/qr.html), si scrive così:

```html
<nav class="link-boxes">
[Presentazione del gruppo](/)
[Social e contatti](/link.html)
</nav>
```

### A capo nel titolo

Per pagine con il titolo lungo, come *Gruppo Universitari San Frediano* in [grusf.it](https://grusf.it), può essere utile inserire un "a capo" manualmente.

Va scritto nell'header:
- `title: ` seguito dal titolo;
- `body-title: ` seguito dal titolo, con `<br>` nel punto in cui si vuole inserire l'a capo.

Per esempio:

```
---
title: Gruppo Universitari San Frediano
body-title: Gruppo Universitari<br>San Frediano
description: Il GrUSF è un’associazione ecc ecc
---
```

### Galleria

Per fare una griglia di immagini con descrizione vedere [incontri-del-martedi.md](pages/incontri-del-martedi.md).

## Redirect

Per aggiungere dei redirect, per esempio da [grusf.it/cene-della-domenica.html](https://grusf.it/cene-della-domenica.html) a [grusf.it/cene-del-sabato.html](https://grusf.it/cene-del-sabato.html), si aggiunge una riga in fondo al file [build.sh](build.sh):

```sh
redirect cene-della-domenica.html cene-del-sabato.html
```

## Info tecniche

Il sito è generato dallo script [build.sh](build.sh), convertendo i file markdown in HTML tramite pandoc.

Eseguendo lo script in locale verrà generata una cartella `out` con l'HTML generato e una copia di [res](pages/res).

Sul repo è configuraa una GitHub Action che compila e pubblica il sito ad ogni commit.

GitHub pages in automatico fa redirect da `grusf.it/xxx` a `grusf.it/xxx.html`. In caso di cambiamenti del servizio di hosting, assicurarsi di far funzionare [grusf.it/qr](https://grusf.it/qr).
