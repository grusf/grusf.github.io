#!/bin/sh
set -e

if [ -d out ]; then
    rm -r out
fi

mkdir out

cd pages

for p in *.md; do
    if [ "$p" != "index.md" ]; then
        meta="-M not_main_page=true"
    else
        meta=""
    fi

    pandoc "$p" $meta --template ../template.html -o "../out/${p%md}html"
done

cp -r res/ ../out/

cd ..

cp favicon.ico out/
cp stylesheet.css out/


# redirect

ln -sf qr.html out/qr
ln -sf cene-del-sabato.html out/cene-della-domenica.html
