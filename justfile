default:
    just --list

ensure-env:
    pixi install

publish:
    quarto publish gh-pages --no-prompt --no-render

preview:
    quarto preview