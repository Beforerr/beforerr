default:
    just --list

ensure-env: ln-bib
    pixi install

publish:
    quarto publish gh-pages --no-prompt --no-render

preview:
    quarto preview

[private]
ln-bib:
    mkdir -p files/bibliography
    [ -e files/bibliography/research.bib ] || ln -s ~/projects/share/bibliography/research.bib files/bibliography/research.bib