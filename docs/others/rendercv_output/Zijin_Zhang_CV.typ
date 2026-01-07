// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.1.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Zijin Zhang",
  footer: context { [#emph[Zijin Zhang -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Jan 2026] ],
  locale-catalog-language: "en",
  page-size: "us-letter",
  page-top-margin: 0.7in,
  page-bottom-margin: 0.7in,
  page-left-margin: 0.7in,
  page-right-margin: 0.7in,
  page-show-footer: true,
  page-show-top-note: true,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(0, 79, 144),
  colors-headline: rgb(0, 79, 144),
  colors-connections: rgb(0, 79, 144),
  colors-section-titles: rgb(0, 79, 144),
  colors-links: rgb(0, 79, 144),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Source Sans 3",
  typography-font-family-name: "Source Sans 3",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "Source Sans 3",
  typography-font-family-section-titles: "Source Sans 3",
  typography-font-size-body: 10pt,
  typography-font-size-name: 30pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 10pt,
  typography-font-size-section-titles: 1.4em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: center,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.7cm,
  header-space-below-headline: 0.7cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_partial_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.5cm,
  section-titles-space-below: 0.3cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.3em,
  sections-space-between-regular-entries: 1.2em,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: true,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "•" ,
  entries-highlights-space-left: 0.15cm,
  entries-highlights-space-above: 0cm,
  entries-highlights-space-between-items: 0cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 1,
    day: 6,
  ),
)


= Zijin Zhang

#connections(
  [#link("mailto:zijin@ucla.edu", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[zijin\@ucla.edu]]],
  [#link("https://beforerr.github.io/beforerr/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[beforerr.github.io\/beforerr]]],
  [#link("https://orcid.org/0000-0002-9968-067X", icon: false, if-underline: false, if-color: false)[#connection-with-icon("orcid")[0000-0002-9968-067X]]],
  [#link("https://github.com/Beforerr", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[Beforerr]]],
)


== Education

#education-entry(
  [
    #strong[University of California, Los Angeles], Planetary Science

    - Thesis: Kinetic-scale solar wind current sheets: statistical characteristics and their role in energetic particle transport

  ],
  [
    2022 – present

  ],
  degree-column: [
    #strong[Ph.D.]
  ],
)

#education-entry(
  [
    #strong[University of Science and Technology of China], Space Physics

    - Thesis: Kinetic simulation of the interaction between the Moon's magnetic anomalies and the solar wind (DOI: #link("http://dx.doi.org/10.13140/RG.2.2.15841.68968")[10.13140\/RG.2.2.15841.68968])

    - Advisor: Prof. Xin Tao

  ],
  [
    2018 – 2022

  ],
  degree-column: [
    #strong[B.Sc.]
  ],
)

#education-entry(
  [
    #strong[University Corporation for Atmospheric Research], NASA's Living with a Star Heliophysics Summer School

  ],
  [
    2024

  ],
  degree-column: [
    
  ],
)

== Research Interests

- Heliophysics: Solar wind current sheets and energetic particle transport

- Magnetosphere-ionosphere coupling: energetic particle precipitation

- Computational plasma physics and space physics environment data analysis

== Publications

#regular-entry(
  [
    #strong[Quantification of ion scattering by solar-wind current sheets: Pitch-angle diffusion rates]

    #strong[Zhang, Z.], Artemyev, A. V., Angelopoulos, V.

    #link("https://doi.org/10.1103/pkzv-k5t3")[10.1103\/pkzv-k5t3] (Physical Review E)

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Solar wind discontinuities in the outer heliosphere: Spatial distribution between 1 and 5 AU]

    #strong[Zhang, Z.], Artemyev, A. V., Angelopoulos, V., Vasko, I.

    #link("https://doi.org/10.1029/2025JA034039")[10.1029\/2025JA034039] (Journal of Geophysical Research: Space Physics)

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Relativistic Electron Flux Decay and Recovery: Relative Roles of EMIC Waves, Chorus Waves, and Electron Injections]

    #strong[Zhang, Z.], Artemyev, A., Mourenas, D., Angelopoulos, V., Zhang, X.-J., et al.

    #link("https://doi.org/10.1029/2024JA033174")[10.1029\/2024JA033174] (Journal of Geophysical Research: Space Physics)

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[A search for technosignatures around 11680 stars with the green bank telescope at 1.15–1.73 GHz]

    Margot, J.-L., Li, M. G., Pinchuk, P., ... #strong[Zhang, Z.]

    #link("https://doi.org/10.3847/1538-3881/acfda4")[10.3847\/1538-3881\/acfda4] (Astronomical Journal)

  ],
  [
    2023

  ],
)

== Software

#strong[SPEDAS.jl:] Julia-based space physics environment data analysis software (DOI: #link("https://doi.org/10.5281/zenodo.15181866")[10.5281\/zenodo.15181866])

#strong[PlasmaBO.jl:] Efficient plasma electromagnetic dispersion-relation solver (DOI: #link("https://doi.org/10.5281/zenodo.18058843")[10.5281\/zenodo.18058843])

== Other Research Experience

#regular-entry(
  [
    #strong[Artificial Intelligence of Things Lab], Undergraduate Research Assistant

    - Implemented a distributed system to monitor edge devices and automate IT deployment and management

  ],
  [
    2021 – 2022

  ],
)
