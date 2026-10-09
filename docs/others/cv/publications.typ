#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1in),
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

#set par(justify: true)

#align(center)[
  #text(size: 18pt, weight: "bold")[Publications]

  #v(0.5em)

  #text(size: 12pt)[Zijin Zhang]

  #link("mailto:zijin@ucla.edu")[zijin\@ucla.edu] |
  ORCID: #link("https://orcid.org/0000-0002-9968-067X")[0000-0002-9968-067X]
]

#v(1em)

#let publication(number, title, authors, journal, year, doi) = {
  set par(hanging-indent: 2em, first-line-indent: 0em)

  block(
    width: 100%,
    inset: (bottom: 0.8em),
  )[
    [#number.] #authors. (#year). #emph[#title]. #journal. #link("https://doi.org/" + doi)[doi:#doi]
  ]
}

#publication(
  1,
  "Quantification of ion scattering by solar-wind current sheets: Pitch-angle diffusion rates",
  [*Zhang, Z.*, Artemyev, A. V., and Angelopoulos, V.],
  [_Physical Review E_],
  2025,
  "10.1103/pkzv-k5t3"
)

#publication(
  2,
  "Solar wind discontinuities in the outer heliosphere: Spatial distribution between 1 and 5 AU",
  [*Zhang, Z.*, Artemyev, A. V., Angelopoulos, V., and Vasko, I.],
  [_Journal of Geophysical Research: Space Physics_],
  2025,
  "10.1029/2025JA034039"
)

#publication(
  3,
  "Relativistic Electron Flux Decay and Recovery: Relative Roles of EMIC Waves, Chorus Waves, and Electron Injections",
  [*Zhang, Z.*, Artemyev, A., Mourenas, D., Angelopoulos, V., Zhang, X.-J., et al.],
  [_Journal of Geophysical Research: Space Physics_],
  2024,
  "10.1029/2024JA033174"
)

#publication(
  4,
  "A search for technosignatures around 11680 stars with the green bank telescope at 1.15–1.73 GHz",
  [Margot, J.-L., Li, M. G., Pinchuk, P., ... *Zhang, Z.*],
  [_Astronomical Journal_],
  2023,
  "10.3847/1538-3881/acfda4"
)
