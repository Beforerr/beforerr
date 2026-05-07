#import "@preview/touying:0.7.3": *
#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Kinetic-scale solar wind current sheets],
    subtitle: [Statistical characteristics and their role in energetic particle transport],
    author: [Zijin Zhang],
    date: datetime.today(),
    institution: [UCLA],
  ),
  config-common(
    new-section-slide-fn: none,
  ),
  // Shrink the section label in the top-right header
  header-right: self => text(
    size: 0.6em,
    box(utils.display-current-heading(level: 1, style: auto))
      + h(0.3em)
      + self.info.logo,
  ),
)

// ── helpers ──────────────────────────────────────────────────────────────────
#let img(path, width: 100%, height: auto) = image(path, width: width, height: height, fit: "contain")

#let quote-block(body, attribution) = block(
  width: 100%,
  inset: (left: 0.8em, top: 0.25em, bottom: 0.25em, right: 0.4em),
  stroke: (left: 1.5pt + luma(160)),
)[
  #text(size: 0.78em, style: "italic", fill: luma(60))[#body]
  #linebreak()
  #text(size: 0.7em, fill: luma(110))[#h(1fr) --- #attribution]
]

#let toc-content(active: 0) = {
  let entries = (
    [Part 0: Research Context and Background],
    [Part 1: Observational Analysis of Current Sheets],
    [Part 2: Quantitative Modeling of Particle Scattering],
    [Part 1.5: Multifluid Model for Current Sheet Alfvenicity],
    [Part 0.5: Software Development],
    [Part 3: Proposed Research],
    [Conclusion],
  )
  for (i, p) in entries.enumerate() {
    if i == active {
      text(weight: "bold", fill: blue)[#sym.bullet #p]
    } else {
      text(fill: gray)[#sym.bullet #p]
    }
    linebreak()
  }
}


// ══════════════════════════════════════════════════════════════════════════════
// Slide 1 — Title
// ══════════════════════════════════════════════════════════════════════════════
#title-slide(
  extra: [
    Graduate Student: Zijin Zhang \
    Supervisor: Vassilis Angelopoulos \
    Committee: Marco Velli, Hao Cao, Paulo Alves, Anton Artemyev

    #v(1em)
    #quote-block(
      [The dinosaurs became extinct because they didn't have a space programme.],
      [Larry Niven],
    )
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 2 — Outline (Part 0 highlighted)
// ══════════════════════════════════════════════════════════════════════════════
= Part 0: Research Context and Background

== Outline

#quote-block(
  [You don't have to know everything. You simply need to know where to find it when necessary.],
  [John Brunner],
)
#v(0.5em)
#toc-content(active: 0)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 3 — Motivation
// ══════════════════════════════════════════════════════════════════════════════
== Energetic Particle Transport in the Heliosphere

#set text(size: 0.88em)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    Understanding how energetic particles are transported in the heliosphere remains one of the central problems in space physics & astrophysics.

    #v(0.4em)
    *Four main transport processes:*
    - Spatial diffusion (particle scattering)
    - Advection with the solar wind
    - Drifts (gradient and curvature)
    - Adiabatic energy change

    However, these frameworks struggle to explain all observed dynamics.
  ],
  [
    #img("figures/ref/desaiLargeGradualSolar2016-fig3.png", height: 4.5cm)
    #text(size: 0.7em, style: "italic")[Desai and Giacalone (2016)]
    #v(0.3em)
    #img("figures_extracted/slide03_img02_92e32c43.png", height: 4cm)
    #text(size: 0.7em, style: "italic")[(Parker 1965)]
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 4 — Dropouts
// ══════════════════════════════════════════════════════════════════════════════
== Dropouts

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.5em,
  img("figures/ref/tanTurbulentOriginsParticle2023-fig1b.png", height: 7.5cm),
  img("figures/ref/tanTurbulentOriginsParticle2023-fig4.png", height: 7.5cm),
  img("figures_extracted/slide04_img03_7a39ae3e.png", height: 7.5cm),
)
#v(0.3em)
#text(size: 0.75em)[Time profiles of low-energy He ion intensities. A dropout in ion intensity lasting about 2 hr (Tan 2023)]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 5 — Reservoir
// ══════════════════════════════════════════════════════════════════════════════
== Reservoir --- Anomalous Transport and Non-Markovian Phenomena

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1em,
  [
    The intensities and energy spectra throughout much of the inner heliosphere at different azimuthal, radial, and latitudinal locations are nearly identical.

    #v(0.5em)
    $=>$ Effective cross-field and non-diffusive transport (Lario 2010)
  ],
  [
    #img("figures/ref/reamesTwoSourcesSolar2013-fig6.png")
    #text(size: 0.7em, style: "italic")[Intensity-time profiles for protons in the 1979 March 1 event at 3 spacecraft (Reames 2013)]
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 6 — Turbulent Magnetic Fluctuations
// ══════════════════════════════════════════════════════════════════════════════
== Turbulent Magnetic Fluctuations

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #img("figures/ref/grecoPartialVarianceIncrements2017-fig1.png", height: 6cm)
    #text(size: 0.7em, style: "italic")[(Greco et al. 2017)]
  ],
  [
    Nonlinear energy cascade results in coherent structures: current sheets, rotational discontinuities, tangential discontinuities, magnetic holes, switchbacks...

    #v(0.5em)
    #img("figures/baleHighlyStructuredSlow2019-fig5.png", height: 4.5cm)
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 7 — Turbulence Transport Models
// ══════════════════════════════════════════════════════════════════════════════
== Turbulence Transport Models (TTMs)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *Quasilinear theory*

    Wavelet-based synthetic turbulence model (Juneja et al. 1994) similar to p-model (Meneveau and Sreenivasan 1987).
  ],
  img("figures_extracted/slide07_img01_d9878c98.png"),
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 8 — Role of Coherent Structure
// ══════════════════════════════════════════════════════════════════════════════
== The Role of Coherent Structure in Particle Transport

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #img("figures/malaraEnergeticParticleDynamics2023-fig8.png", height: 7.5cm)
    #text(size: 0.7em, style: "italic")[Trajectories of 1 MeV SEP particles interacting with a switchback (Malara 2023)]
  ],
  [
    #img("figures_extracted/slide08_img02_c1b665d9.png", height: 7.5cm)
    #text(size: 0.7em, style: "italic")[(Moraal 2013)]
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 9 — Main Scientific Objective
// ══════════════════════════════════════════════════════════════════════════════
== Main Scientific Objective

*Motivation / Gap:* No prior studies systematically characterize particle interactions with solar wind current sheets.

#v(0.5em)
*Goals:*
- Quantitative understanding of how current sheets influence energetic particle transport
- Observational characterization of solar wind current sheets across the heliosphere
- Development of data-driven theoretical models for current sheet-induced particle scattering and transport


// ══════════════════════════════════════════════════════════════════════════════
// Slide 10 — Section: Part 1
// ══════════════════════════════════════════════════════════════════════════════
= Part 1: Observational Analysis of Current Sheets

== Outline

#quote-block(
  [Wanderer, there is no path --- the path is forged as you wander.],
  [Antonio Machado],
)
#v(0.5em)
#toc-content(active: 1)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 11 — Properties relevant to particle transport
// ══════════════════════════════════════════════════════════════════════════════
== What are the properties of current sheets most relevant to particle transport?

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    Similar to the role of turbulence level, spectral index, anisotropy and intermittency in turbulence transport models?

    #v(0.5em)
    Current sheets detected by PSP, Juno, STEREO and near-Earth ARTEMIS satellite.

    #v(0.5em)
    As a first-order approximation, we use a simple magnetic field configuration.
  ],
  img("figures/fig-ids_examples.png"),
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 12 — Hamiltonian Formalism
// ══════════════════════════════════════════════════════════════════════════════
== Hamiltonian Formalism

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    The motion of a particle after simplification and normalization.

    #v(0.5em)
    Hamiltonian in a Harris-type current sheet:
    $ H = p_z^2 / 2 + p_y^2 / 2 + (p_x - A_x (z))^2 / 2 $

    with $A_x (z) = -kappa ln cosh(z \/ kappa)$.

    Conservation of $p_y$ and $p_x$ gives a 1D effective problem in $z$.
  ],
  // Original EMF figure — replace with rendered version if available
  rect(
    width: 100%, height: 5cm,
    stroke: gray, fill: luma(240), inset: 1em,
  )[#align(center + horizon)[_[Hamiltonian equations figure]_]],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 13 — What do we know across the heliosphere?
// ══════════════════════════════════════════════════════════════════════════════
== What do we know about these parameters across the heliosphere?

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    Past studies often:
    - Lacked simultaneous multi-point measurements
    - Employed different identification and quantification methods
    - Did not sufficiently separate temporal variability from spatial trends

    Leading to significant uncertainties.
  ],
  [
    #img("figures_extracted/slide13_img01_a62ac19a.png")
    #text(size: 0.7em, style: "italic")[From inner heliosphere (PSP) to 1 AU (ARTEMIS, Wind) to outer heliosphere (Juno).]
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 14 — Dataset and Methods
// ══════════════════════════════════════════════════════════════════════════════
== Dataset and Methods

#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  img("figures/fig_juno_sw_comparision.png", height: 8cm),
  [
    Comparison of solar wind properties (top) and discontinuity properties (bottom) using model (x-axis) vs. JADE observations.
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 15 — Dataset and Methods (cont.)
// ══════════════════════════════════════════════════════════════════════════════
== Dataset and Methods

#align(center)[
  #img("figures/fig_psp_overview.png", width: 90%, height: 8cm)
]
#text(size: 0.7em, style: "italic")[Overview of solar wind properties during encounter 8 (PSP aligned with Earth observations)]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 16 — Occurrence rate
// ══════════════════════════════════════════════════════════════════════════════
== Discontinuity Properties: Occurrence Rate

#align(center)[
  #img("figures/fig_occurence_rate.pdf", width: 95%)
]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 17 — Occurrence rate (cont.)
// ══════════════════════════════════════════════════════════════════════════════
== Discontinuity Properties: Occurrence Rate

#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  img("figures/fig_occurence_rate.pdf"),
  [
    *Left:* Occurrence rate measured by Juno, STEREO-A, THEMIS-B, and Wind.

    *Right:* Normalized occurrence rate as a function of radial distance.
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 18 — Current density and thickness
// ══════════════════════════════════════════════════════════════════════════════
== Discontinuity Properties: Current Density and Thickness

#align(center)[
  #img("figures/juno_distribution_r_sw.pdf", width: 95%, height: 8cm)
]
#text(size: 0.7em, style: "italic")[Distribution of various SWD properties observed by Juno, grouped by radial distance from the Sun.]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 19 — Current density and thickness (cont.)
// ══════════════════════════════════════════════════════════════════════════════
== Discontinuity Properties: Current Density and Thickness

#align(center)[
  #img("figures_extracted/slide19_img01_f0135a4b.png", width: 90%)
]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 20 — Critical empirical constraints
// ══════════════════════════════════════════════════════════════════════════════
== Critical Empirical Constraints for Particle Transport Modeling

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  img("figures/zhangSolarWindDiscontinuities2025.png"),
  img("figures/fig_wind_hist3d.png"),
)
#v(0.3em)
#text(size: 0.8em)[
  Solar wind current sheets maintain *kinetic-scale thicknesses* throughout the inner heliosphere: normalized thickness and current density remain nearly constant from 0.1 to 5 AU.

  #text(style: "italic")["Solar wind discontinuities in the outer heliosphere: Spatial distribution between 1 and 5 AU" (Zhang et al., JGR Space Physics, 2025)]
]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 21 — Section: Part 2
// ══════════════════════════════════════════════════════════════════════════════
= Part 2: Quantitative Modeling of Particle Scattering

== Outline

#quote-block(
  [In physics, you don't have to go around making trouble for yourself --- nature does it for you.],
  [Frank Wilczek],
)
#v(0.5em)
#toc-content(active: 2)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 22 — Scattering by Current Sheets
// ══════════════════════════════════════════════════════════════════════════════
== The Problem: Scattering by Current Sheets (Geometrical Chaotization)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    Key references:
    - Malara et al. (2023); Malara, Perri & Zimbardo (2021)
    - Artemyev et al. (2020); Artemyev, Neishtadt & Zelenyi (2013)
    - Zelenyi et al. (2013); Neishtadt (2000)
    - Buchner & Zelenyi (1989); Chen (1986); Tennyson et al. (1986)
  ],
  img("figures/ref/artemyevRapidGeometricalChaotization2014-fig3.png"),
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 23 — Adiabatic Invariance and Pitch Angle
// ══════════════════════════════════════════════════════════════════════════════
== Adiabatic Invariance and Pitch Angle

#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  img("figures/ref/neishtadtMechanismsDestructionAdiabatic2019-fig3.png"),
  [Particle trajectories in phase space],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 24 — Destruction of Adiabatic Invariance
// ══════════════════════════════════════════════════════════════════════════════
== Destruction of Adiabatic Invariance: Separatrix and Uncertainty Curve

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #img("figures_extracted/slide24_img01_8186bf68.gif")
    #text(size: 0.7em)[One solution (left) $arrow$ Two solutions (right)]
  ],
  [
    #img("figures_extracted/slide24_img02_791fd195.png")
    #text(size: 0.7em, style: "italic")[Uncertainty curve]
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 25 — Phase portraits and Potential energy profiles
// ══════════════════════════════════════════════════════════════════════════════
== Phase Portraits and Potential Energy Profiles

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  img("figures/scattering/fig-bcPlot.pdf"),
  img("figures/scattering/zPz_phase_portraits.pdf"),
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 26 — Uncertainty curve
// ══════════════════════════════════════════════════════════════════════════════
== Uncertainty Curve

#align(center)[
  #img("figures/scattering/UCLength.pdf", width: 80%)
]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 27 — Examples of Pitch Angle Scattering
// ══════════════════════════════════════════════════════════════════════════════
== Examples of Pitch Angle Scattering

#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  [
    #img("figures_extracted/slide27_img01_6200b1a8.png")
    #text(size: 0.7em, style: "italic")[Malara, Perri & Zimbardo (2021)]
  ],
  [
    The trajectories of two particles starting with slightly different gyrophases.
  ],
)


// ══════════════════════════════════════════════════════════════════════════════
// Slide 28 — Transition Matrix
// ══════════════════════════════════════════════════════════════════════════════
== Transition Matrix

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  img("figures/scattering/tm_stats_100keV.pdf"),
  img("figures/example_subset.png"),
)
#v(0.3em)
#text(size: 0.8em, style: "italic")[Transition matrix for 100 keV protons under four distinct magnetic field configurations]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 29 — Pitch angle scattering by typical discontinuity
// ══════════════════════════════════════════════════════════════════════════════
== Pitch Angle Scattering by Typical Discontinuity

#align(center)[
  #img("figures/scattering/pa_jump_history_high.pdf", width: 85%, height: 8cm)
]
#text(size: 0.8em)[Higher and lower energy particles do not exhibit apparently different scattering probabilities.]


// ══════════════════════════════════════════════════════════════════════════════
// Slide 30 — Transition Matrix (cont.)
// ══════════════════════════════════════════════════════════════════════════════
== Transition Matrix

#align(center)[
  #img("figures/scattering/tm_stats_100keV.pdf", width: 85%)
]
