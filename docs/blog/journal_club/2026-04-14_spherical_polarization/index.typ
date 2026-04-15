#import "@preview/touying:0.7.1": *
#import themes.university: *

#show: university-theme.with(
  config-info(
    title: [Alfvénic Fluctuations in the Expanding Solar Wind],
    subtitle: [Formation and Radial Evolution of Spherical Polarization],
    author: [L. Matteini et al. (2024) — _Physics of Plasmas_],
    institution: [Journal Club],
    date: datetime(year: 2026, month: 4, day: 15),
  ),
  config-colors(
    primary: rgb("#1a5c8e"),
    secondary: rgb("#2980b9"),
    tertiary: rgb("#5dade2"),
  ),
)

#let hi(x) = text(fill: rgb("#c0392b"), weight: "bold", x)
#let kw(x) = text(fill: rgb("#1a5c8e"), weight: "bold", x)
#let note(x) = block(
  fill: rgb("#f4f8fc"),
  inset: 0.8em,
  radius: 3pt,
  width: 100%,
  text(size: 0.85em, x),
)

#show figure.caption: set text(size: 0.8em)

#set text(size: 22pt)

#title-slide()

== Context & Motivation

#text(size: 22pt)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.4em,
    [
      - Fast-wind streams are highly #kw[Alfvénic]: $delta bold(v) "∝" delta bold(B)$
      - Have large-amplitude fluctuations ($delta B \/ B_0 ~ 1$)
      - Yet

      #block(fill: rgb("#eaf3fb"), inset: 0.7em)[
        $|bold(B)| = |bold(B)_0 + delta bold(B)|$ has *much smaller variance* than $delta bold(B)$
      ]

      Geometrically: tip of $bold(B)$ traces a #kw[sphere] of constant radius $B$ — *spherical polarization*.
    ],
    [

      #pause
      *Why is it puzzling?*

      - $B = "const"$ is an exact MHD solution for *unidirectional* Alfvén waves ($|sigma_c| = 1$)
      - While real solar wind has *balanced turbulence* ($sigma_c approx 0$). Yet spherical polarization is observed everywhere!

      *Questions:*
      - How does this form in the turbulent expanding solar wind?
      - How is it maintained during expansion?
      - What is its link to switchbacks?
    ],
  )
]

== Spherical Polarization: The Key Concept

// FIG 1: Cartoon of spherical polarization concept
// ─────────────────────────────────────────────────────────────
#figure(
  image("./figures/img-035.jpg"),
  caption: [
    Cartoon showing the evolution of transverse Alfvénic fluctuations into spherical polarization with constant total field B. Small amplitude fluctuations (left) cause small changes in |B|; as fluctuations grow relative to B₀ during expansion (center), large-amplitude fluctuations would cause big variations in |B| unless field-aligned components develop (right), keeping B on a spherical surface of constant radius. For large enough dB, this induces magnetic field reversals (switchbacks).
  ],
)

// FIG 2: PSP scatterplots

#figure(
  image("./figures/img-036.jpg", width: 80%),
  caption: [
    PSP first-perihelion data at 0.15 AU showing spherical polarization. Left: scatterplot of radial BR vs normal BN component in RTN coordinates. Right: BR vs transverse component B⊥ showing the circular shell of constant B ≈ 80 nT. Data from a ≈6-hour interval with nearly constant magnitude.

    #note[$delta B_R$ fluctuations are #hi[one-sided] (asymmetric PDF) — a direct observational signature of spherical polarization]
  ],
)


// ═══════════════════════════════════════════════════════════════
// METHODS
// ═══════════════════════════════════════════════════════════════
== Methods: Hybrid Expanding Box Simulations

#grid(
  columns: (1fr, 1fr),
  gutter: 1.4em,
  [
    *CAMELIA hybrid-PIC code*
    - First *kinetic* simulation: Kinetic ions (PIC) + fluid electrons (ion-scale physics: reconnection, instabilities)
    - #kw[Expanding box model]: co-moving parcel at $R = R_0(1 + t \/ t_"exp")$

    *Key scalings with heliocentric distance $R$:*
    $ n prop R^(-2), quad B_0 prop R^(-2), quad delta B_perp prop R^(-1) $
    $ delta B \/ B_0 prop R quad "(relative amplitude grows!)" $
  ],
  [
    *Simulation setup:*

    - Grid: $2128^2$ cells, $Delta x = 0.5 d_"p0"$ (MHD-scale focus)
    - Balanced Alfvénic initial spectrum ($sigma_c = 0$)
    - Initial rms: $delta B \/ B_0 = 0.23$; $beta_p = 0.1$
    - Covers effectively 0.15 AU → ~2 AU

    #note[Faster expansion than real wind (×10–100) trades realism for wider $R$ coverage per run]

  ],
)


== Simulation overview

Turbulent cascade develops, Kolmogorov-like power law ( peak at $R approx 4R_0$)

#figure(
  image("./figures/img-037.jpg", width: 100%),
  caption: [
    Simulation overview at R = 5R₀. Left: map of in-plane fluctuation amplitude dB⊥ showing 2D turbulence with vortical structures and current sheets. Middle: power spectra of normalized fluctuations dB/B₀ (red), dv/V_A (blue), |dB|/B₀ (orange). Bottom: magnetic spectrum compensated by k^(−5/3) showing inertial range. Right: evolution of dB/B vs R (red); dashed line shows dB/B₀ ∝ R prediction; dash-dotted shows dB/B evolution accounting for finite B.
  ],
)

== Results I: Spherical Polarization Emerges Naturally

#figure(
  image("./figures/img-038.jpg", width: 40%),
  caption: [
    Radial profiles of magnetic field quantities. Top: total magnitude B (black), rms of total fluctuations dB (red), and radial dB_R (blue) vs R. Bottom: dB/B (red), dB⊥/B (black), and dB_R/B (blue) ratios vs R. Shows transition from R^(−2) scaling at small R toward saturation when dB ~ B. The key result: dB_R decays slower than expected (R^(−1.5) or R^(−2)), indicating spontaneous generation.
  ],
)

// + Fast magnetosonic waves respond immediately (in-plane)
// + Field-aligned $delta B_R$ grows to compensate

#set text(size: 15pt)


#grid(
  columns: (0.8fr, 1fr),
  gutter: 1.4em,
  [
    *What the simulation shows:*
    - Start: purely transverse $delta bold(B)$, no $delta B_R$
    - Expansion amplifies $delta B \/ B_0$ from 0.23 toward 1
    - Scatterplot $(B_T, B_R)$ evolves from arc → #kw[spherical shell]
    - $|bold(B)|$ stays nearly constant despite $delta B \/ B_0 ~ 1$

    #table(
      columns: (1.5fr, 1fr, 1.2fr),
      stroke: 0.5pt + luma(180),
      inset: 0.5em,
      fill: (_, y) => if calc.odd(y) { rgb("#f4f8fc") } else { white },
      [*Quantity*], [*Expected*], [*Simulation*],
      [$B_0$], [$R^(-2)$], [$R^(-2)$],
      [$delta B_perp$], [$R^(-1)$], [$R^(-1)$],
      [$delta B \/ B_0$], [$R^(+1)$], [$R^(+1)$ (early)],
      [$|B|$], [$R^(-2)$], [intermediate],
      [$delta B_R$], [$R^(-1.5)$ or $R^(-2)$], [#hi[*slower — key!*]],
    )

    #note[
      $delta B_R$ is spontaneously generated and decays *slower than expected* — it is the plasma's dynamic response to maintain $|B| approx "const"$ everywhere.
    ]

  ],
  [
    *Radial scaling summary:*

    #figure(
      image("./figures/img-039.jpg", width: 100%),
      caption: [
        Evolution of magnetic field polarization in the (B_T, B_R) plane at different radial distances (color-coded). Left: projections showing arc-like pattern at early times evolving toward spherical shell projection as R increases. Right: same data normalized to local ⟨B⟩ = B_m, showing B_R vs dB⊥ with points lying on a spherical shell of radius B_m — the hallmark of spherical polarization.
      ],
    )
  ],
)

== *Why does it work even with $sigma_c = 0$?* Cross-helicity analysis


#grid(
  columns: (1.5fr, 1fr),
  gutter: 1.4em,
  [
    #figure(
      image("./figures/img-040.jpg", width: 55%),
      caption: [
        Top: PDF of cos(θ) where θ is the angle between db⊥ and dv⊥ at R = 5R₀, showing strong alignment despite zero mean cross-helicity. Middle: spatial map of σ_c at R = 3R₀ showing patches of high |σ_c| ≈ ±1 (red/blue). Bottom: polarization Bx vs BR within a subregion showing arc-shaped distribution for both σ_c > 0 (blue) and σ_c < 0 (red)
      ],
    )
  ],
  [
    - Large-scale structures #hi[self-organize] into patches of high $|sigma_c|$
    - Each patch: weak nonlinearities → spherical polarization is locally stable
    - Patch boundaries: turbulent cascade (peak at $R approx 4R_0$)
    - Small scales dissipate; large scales survive and grow to $delta B \/ B ~ 1$
  ],
)

== Results II: Switchbacks as the Large-Amplitude Limit

// ─────────────────────────────────────────────────────────────
// FIG 7: dBR PDF evolution + PSP comparison
// ─────────────────────────────────────────────────────────────
#figure(
  image("./figures/img-041.jpg", width: 100%),
  caption: [
    Evolution of dB_R distribution. Left: histogram of dB_R normalized to local B₀ at different R (black→red). Initially narrow and symmetric around zero; as expansion proceeds, develops asymmetric long tail toward negative dB_R — a direct signature of spherical polarization. Right: PSP observation at 0.15 AU showing PDF of dB_R (red) and dB_N (black) with the characteristic asymmetric tail and geometric cutoff at |dB/B_m| = 2.
  ],
)

*PDF of $delta B_R$ evolves with expansion:*
- Early: narrow, symmetric around 0. As $delta B \/ B_0 arrow 1$: #hi[asymmetric long tail] toward negative $B_R$
- Tail reaches $delta B_R \/ B_0 < -1$ → #kw[polarity reversal = switchback], Geometric cutoff at $|delta B \/ B_m| = 2$

== Generation of dBR, evolution and switchbacks

#grid(
  columns: (1.5fr, 1fr),
  gutter: 1.4em,
  [
    #figure(
      image("./figures/img-042.jpg", width: 100%),
      caption: [
        1D cuts through the simulation box at different radial distances. Left: BR/B₀ vs position — shows growing negative peaks (polarity reversals) as dB/B increases with expansion. Right: total B/⟨B⟩ at the same R — much smaller variations despite large BR reversals. Largest B variations do NOT coincide with largest dBR reversals, confirming that BR fluctuations compensate for B⊥ variations to keep |B| ≈ const.
      ],
    )

    *Important caveat:*

    In this simulation ($sigma_c = 0$, 2D), $B_R$ reversals are #hi[not accompanied by velocity jets] — unlike real switchbacks.

    #note[
      *Key insight:* Switchbacks are the inevitable outcome of any Alfvénic system reaching $delta B \/ B_0 ~ 1$ under spherical polarization.
    ]
  ],
  [

    #pause

    #figure(
      image("./figures/image.png", width: 80%),
      caption: [
        Two examples of particularly large deflections in the magnetic field.
      ],
    )

    *Simulated switchback properties:*
    - Sharp rotational-discontinuity-like boundaries
    - #kw[Nearly constant $|B|$] throughout reversal
    - Strong $B_perp$ ↑ when $B_R$ ↓ (anti-correlation)

  ],
)

// #figure(
//   image("./figures/img-043.jpg", width: 35%),
//   caption: [
//   ],
// )
== The Key Analytical Result

#align(center)[
  #block(fill: rgb("#1a5c8e"), inset: (x: 2.5em, y: 0.8em), radius: 6pt, text(fill: white, weight: "bold", size: 1.3em)[
    $delta B_R approx delta B^2 \/ (2 B_m)$
  ])
]

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    *Two decompositions used in the paper:*

    #block(fill: rgb("#eaf3fb"), inset: 0.5em, radius: 3pt)[
      $bold(B) = bold(B)_0 + Delta bold(B)$ #h(1em) (wrt background field)\
      $bold(B) = bold(B)_m + delta bold(B)$ #h(1em) (wrt mean magnitude $B_m = chevron.l B chevron.r$)
    ]

    Using the second decomposition with $B approx "const" = B_m$:
    $ B^2 = B_m^2 + 2 delta B_R B_m + delta B^2 = B_m^2 $

    The $B_m^2$ cancels — yielding:
    $ delta B_R approx -delta B^2 \/ (2 B_m) $

    - $delta B_R$ is second-order in $delta B$ → one-sided, asymmetric
    - Holds point-by-point in simulations

    *PSP (0.15 AU):*
    - $delta B_R$ PDF: asymmetric negative tail
    - Geometric cutoff at $|delta B \/ B_m| = 2$
  ],
  [
    *Predictions vs. solar wind observations:*

    Using observed $B(R)$ and WKB $delta B_perp^2 prop R^(-3)$:

    #table(
      columns: (1.2fr, 1fr, 1.2fr),
      stroke: 0.5pt + luma(180),
      inset: 0.5em,
      fill: (_, y) => if calc.odd(y) { rgb("#f4f8fc") } else { white },
      [*Region*], [*$B(R)$*], [*Predicted $delta B_R$*],
      [Inner (Helios)], [$R^(-1.6)$], [$R^(-1.4)$ #kw[(shallower)] ],
      [Outer (Ulysses)], [$R^(-1.4)$], [$R^(-1.6)$ #hi[(steeper)]],
    )

    #note[
      $delta B_R$ has *opposite* scalings in inner vs. outer heliosphere (Tenerani et al. 2021).
    ]

    *Helios (0.3–1 AU) fast wind:*
    - $delta B_perp^2 prop R^(-3)$ (WKB)
    - $delta B_R^2$ decays #kw[slower than WKB]

    *Ulysses ($>$1 AU) polar wind:*
    - $delta B_R^2$ decays #hi[faster than WKB]
    - $delta B_R \/ delta B_perp$ ratio *freezes* — sphere coverage saturates
  ],
)

== How well is constant B maintained?

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("./figures/image-1.png", width: 90%),
      caption: [
        Top panel: Comparison between the measured $delta B_R$ (blue) radial profile and the predicted $delta B_R^s$ by relation (22) (black); the scaling of $delta B_perp$ (red) is also shown for reference. Lower panel: radial profiles of ratios $delta B_R / delta B_perp$ and $delta B_R^s / delta B_perp$ between radial and transverse fluctuations. The ratio is a measure of the spread on the polarization sphere.
      ],
    )
  ],
  [

    #pause

    #figure(
      image("./figures/img-044.jpg", width: 90%),
      caption: [
        Verification of the $delta (B^2) approx delta B_R^2$ constraint. Top: B_perp intensity contour map at t = 700 ($R = 2.4 R_0$) showing large-amplitude modulations. Bottom: cuts along x-axis showing anti-correlation between $B_R$ (blue) and $B_perp$ (red) such that total B (black) has much smaller modulation than either component alone. This confirms the spherical polarization constraint holds throughout the simulation.
      ],
    )
  ],
)

// How well can then B2 ¼ const: be maintained? Fig. 12 also shows the radial profile of dB2R, which is indeed smaller, as expected since second order in the field-aligned perturbation; we can see that asymptotically, perturbations in the field magnitude dðB2Þ adjust to the same level

// ═══════════════════════════════════════════════════════════════
// CONCLUSIONS
// ═══════════════════════════════════════════════════════════════
== Conclusions

#grid(
  columns: (0.55fr, 0.45fr),
  gutter: 1.4em,
  [
    *Four main results:*

    + #kw[Spherical polarization emerges spontaneously] in 2D hybrid expanding simulations of balanced Alfvénic turbulence — *first kinetic demonstration*

      - large-scale structures self-organize into locally high-$|sigma_c|$ patches where nonlinearities are weak.

    + #hi[Switchbacks form naturally] as the large-amplitude limit ($delta B \/ B_0 ~ 1$) driven purely by expansion — no special initial conditions needed

    + The formula $delta B_R = delta B^2 \/ (2B_m)$ quantitatively describes both simulations and multi-mission observations (PSP, Helios, Ulysses)

    + The polarization sphere aspect ratio *saturates* at large $R$ when $delta B ~ B$, consistent with Ulysses polar-wind data
  ],
  [
    #v(0.5em)

    *Limitations of this study:*
    - 2D geometry: no Parker spiral, no $k_parallel$
      - $sigma_c = 0$: missing velocity jets in switchbacks
    - Faster artificial expansion than real solar wind

    *Next steps:*
    - 3D simulations + high cross-helicity
    - Role of $beta_p$ in saturation
    - Extension to include solar wind acceleration region

    #note[
      *What drives the constant-$B$ state physically?* This remains the central open question. Fluid compressibility? Ion kinetics? Both?.
    ]
  ],
)

== Discussion: Broader Context and Open Questions

#grid(
  columns: (1fr, 1fr),
  gutter: 1.4em,
  [
    *Spherical polarization as a general attractor*
    - Occurs even with $sigma_c = 0$ (balanced turbulence)
    - Does *not* require propagation along $B_0$ or parallel $bold(k)$
    - Represents a #hi[quasi-MHD nonlinear equilibrium] for large-amplitude fluctuations
    - Both kinetic (hybrid) and fluid (MHD) models recover it

    *Turbulence implications:*
    - Large-scale patches of high $|sigma_c|$: weakly nonlinear → survive expansion
    - Saturation → possible explanation for 1/f range
  ],
  [
  ],
)

// ═══════════════════════════════════════════════════════════════
// BACKUP
// ═══════════════════════════════════════════════════════════════
== Backup: Key Equations

#table(
  columns: (1.6fr, 2fr, 1.4fr),
  stroke: 0.5pt + luma(200),
  inset: 0.7em,
  align: left,
  fill: (_, y) => if calc.odd(y) { rgb("#f4f8fc") } else { white },
  [*Equation*], [*Physical meaning*], [*Regime*],
  [$B_0 prop R^(-2)$], [Background field — radial flux conservation], [Always],
  [$delta B_perp prop R^(-1)$], [Transverse fluctuations — flux conservation], [2D simulation],
  [$delta B_perp^2 prop R^(-3)$], [WKB wave-action conservation], [Propagating Alfvén waves],
  [$delta B \/ B_0 prop R^(+1)$], [Relative amplitude grows during expansion], [2D sim / inner SW],
  [$B_R^2 + B_perp^2 = B_m^2$], [Spherical polarization constraint], [Large amplitude],
  [$delta B_R = delta B^2 \/ (2 B_m)$], [#hi[The key formula] — radial fluctuations from const-$B$], [Large amplitude],
  [$delta B_R \/ delta B_perp arrow "frozen"$], [Saturation of sphere coverage], [$delta B ~ B$],
)


// ─────────────────────────────────────────────────────────────
// FIG 11: Model prediction vs simulation
// ─────────────────────────────────────────────────────────────
#figure(
  image("./figures/img-045.jpg", width: 25%),
  caption: [
    Verification of the analytical model. Comparison of predicted dB_sR = ⟨dB²/2B_m⟩ (black) vs measured rms of dB_R (cyan) as a function of R. The good agreement across all distances confirms that the analytical prediction from the constant-B constraint quantitatively describes the simulation without any free parameters.
  ],
)
