default:
    just --list

ensure-env: ln-bib
    pixi install

install-julia-deps:
    #!/usr/bin/env -S julia --threads=auto --project=.
    using Pkg
    Pkg.develop([
        PackageSpec(url="https://github.com/Beforerr/Beforerr.jl"),
        PackageSpec(url="https://github.com/Beforerr/SpaceTools.jl"),
        PackageSpec(url="https://github.com/SciQLop/Speasy.jl"),
        PackageSpec(url="https://github.com/Beforerr/PySPEDAS.jl"),
        PackageSpec(url="https://github.com/Beforerr/Discontinuity.jl"),
        PackageSpec(url="https://github.com/JuliaPlasma/PlasmaFormulary.jl"),
    ])
    Pkg.instantiate()

publish:
    quarto publish gh-pages --no-prompt --no-render

preview:
    quarto preview

[private]
ln-bib:
    mkdir -p files/bibliography
    [ -e files/bibliography/research.bib ] || ln -s ~/projects/share/bibliography/research.bib files/bibliography/research.bib
