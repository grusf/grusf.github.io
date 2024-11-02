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

# su GitHub pages non serve (e non funziona)
# ln -s qr.html out/qr

redirect() {
    cat > out/$1 <<EOF
<!DOCTYPE html>
<meta charset="utf-8">
<title>Redirecting to https://grusf.it/$2</title>
<meta http-equiv="refresh" content="0; URL=https://grusf.it/$2">
<link rel="canonical" href="https://grusf.it/$2">
EOF
}

redirect cene-della-domenica.html cene-del-sabato.html
