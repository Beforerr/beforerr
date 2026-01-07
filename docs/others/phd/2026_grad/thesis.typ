// Some definitions presupposed by pandoc's typst output.
#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let d = (:)
  let fields = old_block.fields()
  fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  return block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subrefnumbering: "1a",
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => numbering(subrefnumbering, n-super, quartosubfloatcounter.get().first() + 1))
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => block({
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          })

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let children = old_title_block.body.body.children
  let old_title = if children.len() == 1 {
    children.at(0)  // no icon: title at index 0
  } else {
    children.at(1)  // with icon: title at index 1
  }

  // TODO use custom separator if available
  let new_title = if empty(old_title) {
    [#kind #it.counter.display()]
  } else {
    [#kind #it.counter.display(): #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block,
    block_with_new_content(
      old_title_block.body,
      if children.len() == 1 {
        new_title  // no icon: just the title
      } else {
        children.at(0) + new_title  // with icon: preserve icon block + new title
      }))

  block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color,
        width: 100%,
        inset: 8pt)[#if icon != none [#text(icon_color, weight: 900)[#icon] ]#title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}



#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: "libertinus serif",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "libertinus serif",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)
  if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size)[#subtitle]
        }
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
#show link: set text(fill: rgb("#239dad"))

#set page(
  paper: "us-letter",
  margin: (x: 1.25in, y: 1.25in),
  numbering: "1",
)

#show: doc => article(
  title: [Kinetic-scale solar wind current sheets: statistical characteristics and their role in energetic particle transport],
  subtitle: [Thesis Outline],
  authors: (
    ( name: [Zijin Zhang],
      affiliation: [],
      email: [] ),
    ),
  date: [2026-01-06],
  sectionnumbering: "1.1.a",
  toc_title: [Table of contents],
  toc_depth: 3,
  cols: 1,
  doc,
)

= Motivation and Significance
<motivation-and-significance>
Solar energetic particles (SEPs), originating from solar flares and coronal mass ejections, pose significant risks to satellite operations, human spaceflight, and communication systems. Accurate prediction of SEP events and their propagation through the heliosphere requires a detailed understanding of particle transport mechanisms in turbulent solar wind environments.

Traditionally, theoretical studies and numerical models of particle transport in the solar wind have focused on turbulence characterized by broadband, low-amplitude, random-phase magnetic fluctuations described by power-law spectra @jokipiiCosmicRayPropagationCharged1966@jokipiiCosmicRayPropagationIi1967. However, observations consistently reveal the abundance of intermittent, meso-scale, coherent structures within this turbulent medium, notably current sheets---thin plasma boundaries marked by abrupt magnetic field changes. These current sheets deviate significantly from classical magnetohydrodynamic (MHD) picture due to their kinetic-scale features and strong local magnetic gradients.

Recent theoretical and numerical studies suggest that these coherent structures play a critical role in particle scattering, potentially surpassing the scattering efficiency predicted by traditional quasilinear theories @malaraChargedparticleChaoticDynamics2021@artemyevSuperfastIonScattering2020. Current sheets, generated naturally through nonlinear turbulence cascade, provide localized regions of intense electromagnetic interactions, leading to enhanced scattering and modification of the particle's spatial distribution. Despite their importance, a quantitative and systematic understanding of how these structures influence SEP transport remains incomplete.

Addressing this critical gap, this dissertation aims to comprehensively investigate and quantify the impact of solar wind current sheets on SEP transport processes. Specifically, this research seeks to:

+ Characterize the properties and occurrence of current sheets throughout different regions of the heliosphere.
+ Develop and validate theoretical models that describe particle scattering induced by these coherent structures. Provide a improved, quantitative modeling of SEP interactions with current sheets, thereby enabling predictive capabilities and contributing to space weather modeling.

The motivation for this research lies in the critical need for improved SEP transport models that accurately reflect real-world solar wind conditions. By integrating observational data and advanced theoretical frameworks, this dissertation will provide novel insights into heliospheric particle dynamics, ultimately enhancing our ability to predict and mitigate the risks associated with SEP events.

= Research Context and Background
<research-context-and-background>
The study of solar energetic particles @anastasiadisSolarEnergeticParticles2019@kleinAccelerationPropagationSolar2017@desaiLargeGradualSolar2016@reamesTwoSourcesSolar2013, turbulent magnetic fields @schekochihinMHDTurbulenceBiased2022@matthaeusTurbulenceSpacePlasmas2021@oughtonSolarWindTurbulence2021@brunoTurbulenceSolarWind2016@brunoSolarWindTurbulence2013@verscharenMultiscaleNatureSolar2019@tuMHDStructuresWaves1995, and charged particle transport @engelbrechtTheoryCosmicRay2022@vandenbergPrimerFocusedSolar2020 has produced a vast body of literature spanning decades of theoretical, observational, and numerical research. Within this context, current sheets have increasingly been recognized as key structures. In the following sections, we highlight a selection of foundational observations, models, and theoretical developments that are directly or indirectly connected to the role of current sheets. These include both classical frameworks and recent advances that point to the importance of coherent structures in turbulent plasmas. In #ref(<sec-cs>, supplement: [Section]), we summarize how a deeper understanding of current sheets can enhance our ability to model energetic particle transport and, more broadly, improve our understanding of heliospheric particle dynamics.

== Solar Energetic Particles
<solar-energetic-particles>
Solar energetic particles (SEPs) are high-energy ions and electrons originating at or near the Sun. They span a broad energy spectrum, from Solar energetic particles (SEPs) consist of high-energy ions and electrons originating at or near the Sun. Unlike the solar wind and galactic cosmic rays (GCRs), solar energetic particles (SEPs) manifest as discrete episodic events with intensities that can vary dramatically---by several orders of magnitude---in just minutes. Additionally, SEP events exhibit significant variations in heavy ion composition, spectral shape, and spatial distribution.

SEPs are primarily accelerated through two distinct mechanisms @reamesTwoSourcesSolar2013: (1) shock-wave acceleration associated with fast coronal mass ejections (CMEs), resulting in large gradual SEP events @desaiLargeGradualSolar2016, and (2) magnetic reconnection-driven processes during solar flares, producing impulsive SEP events.

Gradual SEP events typically last for several days and are predominantly proton-rich, often associated with fast CMEs driving shocks in the solar corona and interplanetary space. These shocks accelerate particles over extended regions, producing widespread and intense radiation storms. In contrast, impulsive SEP events are related to short duration (less than 1 h) solar flares. These events typically have shorter durations, lasting from minutes to a few hours, and feature characteristically higher electron-to-proton ratios and enrichments of heavy ions ($zws^3 upright(H e) \/ zws^4 upright(H e)$ and $upright(F e) \/ upright(O)$ ratios).

#figure([
#box(image("figures/desaiLargeGradualSolar2016-fig3.png"))
], caption: figure.caption(
position: bottom, 
[
The two-class picture for SEP events. #cite(<desaiLargeGradualSolar2016>, form: "prose")
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)


In the decay phase of large gradual SEP events, a characteristic phenomenon known as the #strong[reservoir effect] frequently occurs, where particle intensities measured by widely separated spacecraft become nearly uniform across large regions and exhibit similar temporal evolutions. One traditional explanation for reservoir formation suggests that particles become trapped behind a CME-driven magnetic structure, resulting in spatially uniform spectra that adiabatically decrease in intensity as the confining magnetic bottle expands. However, high heliolatitude observations from the Ulysses mission revealed the three-dimensional character of the reservoir effect and favor the cross-field diffusion explanation @larioHeliosphericEnergeticParticle2010@dallaPropertiesHighHeliolatitude2003.

In contrast to these smooth, widespread distributions, certain impulsive SEP events demonstrate remarkably sharp spatial variations (abrupt depletions) in particle intensity, known as dropout events @tesseinEffectCoherentStructures2015@neugebauerEnergeticParticlesTangential2015a. Such behavior is attributed to spacecraft traversing alternating particle-filled and particle-empty magnetic flux tubes, suggesting extremely limited lateral transport of particles across magnetic fields @mazurInterplanetaryMagneticField2000. This phenomenon is typically interpreted as resulting from particles being effectively confined within distinct magnetic flux tubes, due to minimal cross-field diffusion. The sharply defined spatial gradients scales observed in dropout events, are often comparable to particle gyro-radii.

Together, these contrasting observations---extensive spatial uniformity in gradual SEP events (reservoir effects) versus sharp intensity variations in impulsive events (dropouts)---underscore the complexity of SEP transport mechanisms, motivating ongoing studies to reconcile these phenomena within comprehensive transport models.

== Turbulent Magnetic Fluctuations
<turbulent-magnetic-fluctuations>
Solar wind turbulence spans scales from the large‑scale coherence length (∼0.01 AU) down to kinetic dissipation scales on the order of the thermal ion gyro‑radius (∼100 km). Of particular importance for energetic particle transport is the turbulence at intermediate scales, often referred to as inertial-range turbulence. For a 5 nT magnetic field, this range corresponds to proton gyro-radii from about 1 GeV to 1 keV, encompassing nearly all SEPs, whose gyro-radii lie between these two bounds.

The transport of SEPs through the heliosphere is shaped by the properties of magnetic turbulence. Key parameters---such as the spatial inhomogeneity, turbulence level ($delta B \/ B ₀$), spectral index, and anisotropy of wave vectors @pucciEnergeticParticleTransport2016 ---strongly influence how particles scatter in velocity space. These properties govern both parallel and perpendicular transport through mechanisms including pitch-angle diffusion, magnetic field-line meandering, and gradient or curvature drift.

Classical scattering theories and numerical models of particle transport @giacaloneTransportCosmicRays1999 typically model turbulence as a sea of random, phase-uncorrelated fluctuations (common constructions of magnetic fluctuations for the slab component $delta 𝐁^s$ and two-dimensional component $delta 𝐁^(2 D)$ are shown below in #ref(<eq-δ𝐁>, supplement: [Equation])). However, this idealized view neglects the intricate internal nonlinear structures of turbulence. Increasingly, observations and simulations show that solar wind turbulence is highly intermittent and populated with coherent structures---especially current sheets---that arise naturally through nonlinear cascade processes.

#math.equation(block: true, numbering: "(1)", [ $  & delta 𝐁^s = sum_(n = 1)^(N_m) A_n [cos alpha_n (cos phi.alt_n hat(x) + sin phi.alt_n hat(y)) + i sin alpha_n (- sin phi.alt_n hat(x) + cos phi.alt_n hat(y))] times exp (i k_n z + i beta_n)\
 & delta 𝐁^(2 D) = sum_(n = 1)^(N_m) A_n i (- sin phi.alt_n hat(x) + cos phi.alt_n hat(y)) times exp [i k_n (cos phi.alt_n x + sin phi.alt_n y) + i beta_n] $ ])<eq-δ𝐁>

$  & D_parallel = v^2 / 8 integral_(- 1)^1 (1 - mu^2)^2 / D_(mu mu) d mu\
 & D_(mu mu) = frac(pi omega_(c i) k, 2 B^2 \/ mu_0) (1 - mu^2) sum_(+ \, -) I_plus.minus (k) $

=== Geometrical Chaotization
<geometrical-chaotization>
A key physical mechanism underlying the strong scattering induced by current sheets is geometrical chaotization---a rapid breakdown of adiabatic invariants caused by separatrix crossings in the particle's phase space @tennysonChangeAdiabaticInvariant1986@zelenyiQuasiadiabaticDynamicsCharged2013. In such slow-fast Hamiltonian systems, even weak asymmetries in the current sheet configuration can produce large, abrupt pitch-angle changes, leading to fast and efficient chaotization of particle motion @artemyevSuperfastIonScattering2020@artemyevRapidGeometricalChaotization2014. This mechanism departs from the diffusive assumptions of classical quasilinear theory and underscores the importance of kinetic-scale structure in driving non-diffusive scattering behaviors.

Therefore, understanding SEP transport requires more than bulk statistical descriptions of turbulence; it demands detailed knowledge of its intermittent nature and the embedded coherent structures that mediate particle scattering. Accurately characterizing these features is essential for developing realistic models of SEP propagation throughout the heliosphere.

== Charged Particle Transport and Turbulence Transport Models
<charged-particle-transport-and-turbulence-transport-models>
The large-scale behavior of energetic charged particles in the heliosphere is commonly described using a diffusive approximation, justified when the particle scattering time is short compared to the timescale of interest. Under this assumption, the evolution of an approximately isotropic particle distribution is governed by the Parker transport equation @parkerPassageEnergeticCharged1965. This foundational framework captures four main transport processes: spatial diffusion due to particle scattering, advection with the solar wind, drifts (such as gradient and curvature drifts due to variations in the large-scale magnetic field), and adiabatic energy change:

#math.equation(block: true, numbering: "(1)", [ $ frac(partial f, partial t) = frac(partial, partial x_i) [kappa_(i j) frac(partial f, partial x_j)] - U_i frac(partial f, partial x_i) - V_(d \, i) frac(partial f, partial x_i) + 1 / 3 frac(partial U_i, partial x_i) [frac(partial f, partial ln p)] + upright("Sources") - upright("Losses") \, $ ])<eq-parker>

where $f$ is the phase-space distribution as a function of the particle momentum, $p$, position, $x_i$, and time, $t$; $kappa_(i j)$ is the symmetric part of the diffusion tensor; $U_i$ is the bulk plasma velocity; $V_(d \, i)$ is the drift velocity. The drift velocity can be formally derived from the guiding center approximation averaged over a nearly isotropic distribution, and can be included as the antisymmetric part of the diffusion tensor.

The symmetric diffusion tensor can be decomposed into components parallel and perpendicular to the mean magnetic field using: $kappa_(i j) = kappa_perp delta_(i j) - frac((kappa_perp - kappa_parallel) B_i B_j, B^2)$. The parallel diffusion coefficient, $kappa_parallel$, is related to the pitch-angle diffusion coefficient $D_(mu mu)$ through the quasilinear theory (QLT) framework @jokipiiCosmicRayPropagationCharged1966@jokipiiAddendumErratumCosmicRay1968 as $kappa_parallel = v^2 / 8 integral_(- 1)^1 frac((1 - mu^2)^2, D_(mu mu) (mu)) d mu$.
While parallel transport is relatively well understood, perpendicular (cross-field) diffusion ($kappa_perp$) remains more elusive due to its nonlinear and non-resonant nature @shalchiPerpendicularDiffusionEnergetic2021@costajr.CrossfieldDiffusionEnergetic2013. A key factor influencing cross-field transport is the dimensionality of the turbulence @giacaloneChargedParticleMotionMultidimensional1994: in models with at least one ignorable spatial coordinate (e.g., slab geometry), cross-field diffusion is artificially suppressed, failing to capture essential physics. In general, cross-field transport arises from two distinct mechanisms: (1) particle motion along stochastic, meandering magnetic field lines, which can lead to substantial displacements relative to the mean field direction; and (2) the true decorrelation of particles from their initial field lines, allowing them to effectively jump between neighboring lines. Though often considered a small fraction of $kappa_parallel$ @giacaloneTransportCosmicRays1999, recent simulations reveal that $kappa_perp$ can be significant and strongly dependent on particle energy and turbulence structure @dundovicNovelAspectsCosmic2020.

Anisotropy in particle distributions is common in SEP events, particularly in the early phases or near upstream regions of interplanetary shocks. One fundamental source of anisotropy is adiabatic focusing in a diverging magnetic field. To account for such effects, the focused transport equation @roelofPropagationSolarCosmic1969@earlEffectAdiabaticFocusing1976 extends the Parker equation by explicitly retaining the pitch-angle dependence:

$ frac(partial f, partial t) + mu v frac(partial f, partial z) + frac(v, 2 L) (1 - mu^2) frac(partial f, partial mu) = frac(partial, partial mu) (D_(mu mu) frac(partial f, partial mu)) $

where $f = f (z \, mu \, t)$ is the phase-space distribution, $mu$ is the pitch-angle cosine and $L = - B (frac(d B, d z))^(- 1)$ is the focusing length.

Beyond classical diffusion, observations of SEP events and near interplanetary shocks often reveal anomalous transport behavior @zimbardoSuperdiffusiveSubdiffusiveTransport2006, characterized by subdiffusive or superdiffusive scaling of particle displacement with time @zimbardoSuperdiffusiveTransportLaboratory2015 $⟨Delta x^2 (t)⟩ prop t^alpha$. These deviations from normal diffusion are attributed to the intermittent and structured nature of solar wind turbulence, and are better described using generalized frameworks such as fractional diffusion models @del-castillo-negreteNondiffusiveTransportPlasma2005 or Lévy statistics @zaburdaevLevyWalks2015.

== The Role of Current Sheets in Particle Transport
<sec-cs>
Across all major transport models, current sheets emerge as a critical feature influencing energetic particle dynamics. In the Parker equation framework, current sheets modify the pitch-angle scattering rate and hence directly affect $kappa_parallel$. In the context of the focused transport equation, they introduce strong pitch-angle dependencies and rapid scattering events. Moreover, current sheets can induce memory effects that violate the Markov assumption @zimbardoNonMarkovianPitchangleScattering2020 of classical diffusion models and contribute to anomalous diffusion.

These structures also challenge the conventional picture of diffusion. For parallel transport, the intense magnetic shear and sharp field gradients in current sheets can induce nonlinear effects, producing pitch-angle jumps that are too large to be treated as diffusive. For perpendicular transport, it is often assumed that field-line random walk dominates cross-field motion, as the magnetic field is typically smooth on scales comparable to SEP gyro-radii. However, near current sheets, the magnetic field becomes highly inhomogeneous---often varying on scales similar to or smaller than the gyro-radius---thus enabling enhanced particle transfer between field lines and more significant perpendicular diffusion.

Because of their coherent, localized nature and their ability to shape both pitch-angle and spatial scattering processes, current sheets play a central role in accurately modeling particle transport in the turbulent heliospheric environment.

= Objectives and Thesis Plan
<objectives-and-thesis-plan>
The overall goal of this thesis is to quantify and model the impact of solar wind current sheets on energetic particle transport. This research is structured around two primary objectives:

- Observational characterization of solar wind current sheets across the heliosphere

- Development of data-driven theoretical models for current sheet-induced particle scattering and transport

= Work Completed
<work-completed>
== Observational Analysis of Current Sheets
<sec-obs>
#strong[Context:] A critical first step in understanding the role of current sheets in energetic particle transport is to characterize their statistical properties and quantify the parameters most relevant to particle scattering. Although current sheets have been extensively observed---especially near $1$ AU---our knowledge of how their properties evolve across heliocentric distances, and how key scattering-related parameters vary with radial distance, has remained incomplete. Previous studies @sodingRadialLatitudinalDependencies2001[#cite(<lotekarKineticscaleCurrentSheets2022>, form: "prose");, #cite(<liuCharacteristicsInterplanetaryDiscontinuities2021>, form: "prose");, #cite(<vaskoKineticscaleCurrentSheets2022>, form: "prose");, #cite(<vaskoKineticScaleCurrentSheets2024>, form: "prose");] often lacked simultaneous, multi-point measurements and did not adequately separate temporal variability from spatial trends, leading to persistent uncertainties regarding their role in particle transport, their origin, and their evolution within the turbulent solar wind.

#strong[Approach:] To bridge this observational gap, we conducted a detailed statistical analysis using continuous solar wind data from multiple spacecraft: Parker Solar Probe (PSP) at distances down to 0.1 AU, Wind, ARTEMIS, and STEREO at 1 AU, and Juno during its cruise phase out to 5 AU near Jupiter. This combination allowed us to track the evolution of current sheet properties across a wide radial distance, from near Alfvénic critical surface to the outer inner heliosphere.

#figure([
#box(image("figures/fig-ids_examples.png"))
], caption: figure.caption(
position: bottom, 
[
Current sheets detected by PSP, Juno, STEREO and near-Earth ARTEMIS satellite: red, blue, and black lines are $𝐵_𝑙$, $𝐵_𝑚$, and $𝐵$
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)


#strong[Results:] Our analysis reveals that solar wind current sheets maintain kinetic-scale thicknesses throughout the inner heliosphere, with occurrence rates decreasing approximately as $1 \/ r$ with radial distance between 1 and 5 AU. When normalized to the local ion inertial length and Alfvén current, both the current density and thickness of these structures remain nearly constant over the range from 0.1 to 5 AU (see #ref(<fig-juno-distribution-r-sw>, supplement: [Figure])). This suggests that current sheets consistently influence energetic particle transport across heliocentric distances, with their higher occurrence rates closer to the Sun indicating a more pronounced role in shaping particle dynamics in the inner heliosphere. Furthermore, by leveraging simultaneous observations from spacecraft at different radial distances, we demonstrate that the observed radial trends reflect genuine spatial evolution rather than temporal or solar-cycle effects. In particular, we propose that the observed reduction in current sheet occurrence rate at larger heliocentric distances is partly attributable to a geometric effect---namely, the decreasing probability that a spacecraft intersects inclined structures as distance from the Sun increases. This represents an observational bias that must be accounted for when interpreting occurrence statistics. However, even after correcting for this geometric effect, a modest residual decrease remains, which we attribute to possible physical dissipation or annihilation of current sheets as they propagate outward through the solar wind.

Together, these results provide critical empirical constraints for particle transport modeling and establish a robust observational foundation for the theoretical and numerical components of this thesis. This work is presented in #emph["Solar wind discontinuities in the outer heliosphere: Spatial distribution between 1 and 5 AU"] (Zhang et al., submitted to JGR Space Physics, 2025, manuscript is available at #link("https://www.authorea.com/users/814634/articles/1283652-solar-wind-discontinuities-in-the-outer-heliosphere-spatial-distribution-between-1-and-5-au")[10.22541/essoar.174431869.93012071/v1];).

#figure([
#box(image("../2025_atc/figures/fig_wt_dist_no_duplicates.pdf"))
], caption: figure.caption(
position: bottom, 
[
Waiting time probability density functions $p (tau)$ for Juno at 1 AU in 2011 (top) and 5 AU in 2016 (bottom). Observed data (black) are fitted with Weibull (blue) and exponential (orange) distributions. Vertical dashed lines denote the mean waiting times for each fitted distribution.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)


#figure([
#box(image("figures/juno_distribution_r_sw.png"))
], caption: figure.caption(
position: bottom, 
[
Distribution of various SWD properties observed by Juno, grouped by radial distance from the Sun (with colors shown at the top). Panel (a) thickness, (b) current density, (c) normalized thickness, (d) normalized current density.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-juno-distribution-r-sw>


#figure([
#box(image("figures/fig_juno_sw_comparision.png"))
], caption: figure.caption(
position: bottom, 
[
Comparison of solar wind properties (top) and discontinuity properties (bottom) between / using model (x-axis) and JADE observations (y-axis). (a-d) Solar wind velocity, density, temperature, and plasma beta. (e-h) Discontinuity thickness, current density, normalized thickness, and normalized current density. Blue dots indicate values derived using the cross-product normal method, while yellow dots correspond to values obtained using minimum variance analysis.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-juno-sw-comparision>


== Quantitative Modeling of Particle Scattering
<sec-modeling>
#strong[Context:] While it is well established that turbulence governs energetic particle transport in the heliosphere, the specific role of coherent structures---particularly current sheets---in shaping scattering processes remained under-explored. A central objective of this thesis is to develop a physics-based, observation-informed model that directly links solar wind current sheet properties to pitch-angle scattering rates of energetic particles.

#strong[Approach:] To this end, we combined statistical measurements of current sheets at 1 AU with a Hamiltonian analytical framework and test particle simulations to investigate how particle scattering efficiency varies with current sheet geometry and particle energy, using a realistic magnetic field configuration:

$ upright(bold(B)) = B_0 (cos theta med upright(bold(e_z)) + sin theta (sin phi (z) med upright(bold(e_x)) + cos phi (z) med upright(bold(e_y)))) $

where $B_0$ is the magnitude of the magnetic field, $theta$ is the azimuthal angle between the normal and the magnetic field, and $phi (z)$ is the rotation profile of the magnetic field as a function of $z$.

#strong[Results:] Using a newly formulated Hamiltonian framework (see dimensionless form in #ref(<eq-Hamiltonian>, supplement: [Equation]), below) that incorporates the effects of magnetic field shear angle $beta$ and particle energy $H$, we demonstrate that scattering rates depend strongly on the current density---which is directly tied to $beta$---as well as on the ratio of the particle gyroradius to the current sheet thickness. Notably, our results show that current sheets can induce rapid, non-diffusive pitch-angle jumps, particularly for SEPs in the 100 keV to 1 MeV energy ranges (see #ref(<fig-example-subset>, supplement: [Figure])). This behavior deviates significantly from classical quasilinear predictions and highlights the need to account for coherent structures in transport models. To describe long-term pitch-angle evolution, we developed a simplified probabilistic model of pitch-angle scattering due to current sheets and derived an effective pitch-angle diffusion coefficient $D_(mu mu)$ (see #ref(<fig-mixing-rate>, supplement: [Figure])).

These diffusion rate estimates enable direct comparison with other scattering mechanisms, facilitate the incorporation of SWD-induced scattering into global SEP transport models, and directly support the broader goal of this thesis to improve our understanding of how energetic particles interact with turbulence in the solar wind. This work is presented in "Quantification of Ion Scattering by Solar Wind Current Sheets: Pitch-Angle Diffusion Rates" (Zhang et al., submitted to Physical Review E, 2025, manuscript is available at #link("https://github.com/Beforerr/ion_scattering_by_SWD/blob/ec33d3d082bcd463faf7a233ba80138414231b51/files/2024PRE_Scattering_Zijin.pdf")[GitHub];).

#math.equation(block: true, numbering: "(1)", [ $ tilde(H) & = 1 / 2 ((tilde(p_x) - f_1 (z))^2 + (tilde(x) cot theta + f_2 (z))^2 + tilde(p_z)^2)\
f_1 (z) & = 1 / 2 cos beta med (upright("Ci") (beta s_(+) (z)) - upright("Ci") (beta s_(-) (z))) + 1 / 2 sin beta med (upright("Si") (beta s_(+) (z)) - upright("Si") (beta s_(-) (z))) \,\
f_2 (z) & = 1 / 2 sin beta med (upright("Ci") (beta s_(+) (z)) + upright("Ci") (beta s_(-) (z))) - 1 / 2 cos beta med (upright("Si") (beta s_(+) (z)) + upright("Si") (beta s_(-) (z))) $ ])<eq-Hamiltonian>

#figure([
#box(image("figures/example_subset.png", width: 70.0%))
], caption: figure.caption(
position: bottom, 
[
Transition matrix for 100 keV protons under four distinct magnetic field configurations: (i) $v_p = 8 v_0$, $theta = 85 degree$, $beta = 50 degree$; (ii) $v_p = 8 v_0$, $theta = 85 degree$, $beta = 75 degree$; (iii) $v_p = 8 v_0$, $theta = 60 degree$, $beta = 50 degree$; and (iv) $v_p = v_0$, $theta = 85 degree$, $beta = 50 degree$.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-example-subset>


#figure([
#box(image("figures/mixing_rate.png", width: 60.0%))
], caption: figure.caption(
position: bottom, 
[
Second moment of the pitch-angle distribution, $M_2 (n)$, as a function of interaction number ($n$) for different particle energies (100 eV, 5 keV, 100 keV, 1 MeV). The estimated mixing rates, $D_(mu mu)$, are indicated in the legend.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-mixing-rate>


== Multifluid Model for Current Sheet Alfvénicity
<sec-multifluid>
#strong[Context:] Early in this thesis, we identified a consistent radial trend in the Alfvénicity of solar wind current sheets---defined as the ratio of the plasma velocity jump to the Alfvén speed jump. While current sheets near the Sun exhibit high Alfvénicity, this value systematically decreases with increasing heliocentric distance. This raised a fundamental question: why do current sheets appear increasingly non-Alfvénic with distance, despite their force-free magnetic structure? Understanding the internal structure, stability, and evolution of current sheets is crucial, as it directly relates to their role in modulating the transport of energetic particles across the heliosphere.

#figure([
#box(image("figures/vl_ratio.png", width: 60.0%))
], caption: figure.caption(
position: bottom, 
[
Statistics of the asymptotic velocity ratio from PSP, Wind, and ARTEMIS spacecraft observations during PSP encounter 7 period from 2021-01-14 to 2021-01-21.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)


#strong[Approach:] While classical single-fluid MHD models, even when extended to include pressure anisotropy, provide useful modeling of current sheet properties, they fall short of capturing the full complexity encountered in observed current sheets. A natural and necessary extension is to adopt a multifluid framework, which allows for a more realistic treatment of multiple ion populations.

#strong[Results:] To address this challenge, we developed a multifluid theoretical model that includes both a nonzero normal magnetic field and a guide field, and explicitly accounts for the dynamics of counter-streaming ion populations (see #ref(<fig-profiles>, supplement: [Figure])). The model reveals a clear physical interpretation: close to the Sun, current sheets are dominated by a single ion population, leading to high Alfvénicity, while at larger radial distances, the ion populations become more balanced, resulting in reduced Alfvénicity (see #ref(<fig-velocity-profiles>, supplement: [Figure])). By bridging the gap between overly simplified single-fluid models and fully kinetic treatments, this multifluid model offers a physically consistent and computationally tractable framework. It establishes a critical connection between the macroscopic evolution of current sheets and the microscopic processes relevant to energetic particle scattering---thus advancing the broader thesis goal of modeling SEP transport in a realistic, structure-rich solar wind.

This work is presented in "On the Alfvénicity of Multifuild Force-Free Current Sheets" (Zhang et al., submitted to Physics of Plasmas, 2025, manuscript is available at #link("https://github.com/Beforerr/cs_theory/blob/3812b6f1e62b4c954b7b1aa7dcbf092df23834bb/files/2025PoP_Model_Zijin.pdf")[GitHub];).

#figure([
#box(image("figures/profiles_n1Inf=0.6.svg", width: 60.0%))
], caption: figure.caption(
position: bottom, 
[
Magnetic field, ion density, and ion bulk velocity for the case where $n_1 = 1.5 n_2$ and $L = d_i \, B_0 = 2 B_z$. Here, $z$ is the distance from the center of the 1-D current sheet, $n_alpha$ denotes the number density of ion species $alpha$, $d_i$ is the asymptotic ion inertial length, and $B_0$ is the in-plane magnetic field strength.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-profiles>


#figure([
#box(image("figures/UxNormBx.svg", width: 60.0%))
], caption: figure.caption(
position: bottom, 
[
Ion bulk velocity in the $x$ direction (maximum variance direction) $U_x$ profiles normalized by local Alfvén velocity $v_(A \, x) (z) = B_x (z) \/ sqrt(mu_0 m_p n (z))$ for different $n_1 (oo)$
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-velocity-profiles>


== Software Development
<software-development>
#strong[Context];: A central requirement for this thesis is the ability to perform high-performance, interactive, and reproducible analysis of space plasma data and particle dynamics. While the established SPEDAS framework---originally developed in IDL and later ported to Python---remains widely used in the community, its design limitations hinder modern scientific workflows (big data, parallel/distributed computing, etc.).

#strong[Approach];: To address this, we developed a suite of Julia-based software tools that combine the flexibility and speed of a modern language with the functionality of legacy systems.

#strong[Results];: The core of this framework is `SPEDAS.jl`, which has interfaces directly with #link("https://github.com/spedas/pyspedas")[`pyspedas`];, #link("https://github.com/SciQLop/speasy")[`speasy`];, and #link("https://hapi-server.org/")[`HAPI`] while introducing new routines with significantly improved performance. To enable efficient test-particle tracing in both analytic presets and numerical derived electromagnetic fields, we developed `TestParticle.jl`, a lightweight tool for rapid particle trajectory simulations. Additionally, we created #link("https://github.com/beforerr/SpaceDataModel.jl")[`SpaceDataModel.jl`] to implement flexible, standards-compliant data structures aligned with SPASE and HAPI specifications, and contributed physics utilities through #link("https://github.com/JuliaPlasma/ChargedParticles.jl")[`ChargedParticles.jl`] and #link("https://github.com/JuliaPlasma/PlasmaFormulary.jl")[`PlasmaFormulary.jl`];. These tools have been integral to the data analysis (e.g., #ref(<fig-sp>, supplement: [Figure])), modeling, and simulation components of this thesis, enabling scalable and transparent research workflows essential for studying particle transport in the heliosphere.

```julia
f = Figure()
tvars1 = ["cda/OMNI_HRO_1MIN/flow_speed", "cda/OMNI_HRO_1MIN/E", "cda/OMNI_HRO_1MIN/Pressure"]
tvars2 = ["cda/THA_L2_FGM/tha_fgs_gse"]
tvars3 = ["cda/OMNI_HRO_1MIN/BX_GSE", "cda/OMNI_HRO_1MIN/BY_GSE"]
t0,t1 = "2008-09-05T10:00:00", "2008-09-05T22:00:00"
tplot(f[1, 1], tvars1, t0, t1)
tplot(f[1, 2], tvars2, t0, t1)
tplot(f[2, 1:2], tvars3, t0, t1)
f
```

#figure([
#box(image("figures/spedas_jl.png"))
], caption: figure.caption(
position: bottom, 
[
Example code snippet and resulting output from the Julia implementation of the widely used tplot function.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-sp>


#pagebreak()
= Proposed Research Direction
<proposed-research-direction>
== Spatial Diffusion Model Refinement
<spatial-diffusion-model-refinement>
The work completed in this thesis has established that solar wind current sheets are persistent, kinetic-scale structures whose statistical properties evolve predictably with heliocentric distance (see #ref(<sec-obs>, supplement: [Section])). We have demonstrated---both theoretically and through numerical modeling---that SWDs play a significant role in modulating particle transport, particularly by enhancing pitch-angle scattering beyond quasilinear expectations (see #ref(<sec-modeling>, supplement: [Section])). Furthermore, we have shown that their internal structure, including multifluid effects and Alfvénicity variations, are essential to understanding their properties and thereby their transport-modifying capacity (see #ref(<sec-multifluid>, supplement: [Section])).

Building on previous results, the next phase of research will extend the pitch-angle scattering framework to comprehensively model spatial diffusion processes (both parallel and perpendicular). This extension is crucial for accurately capturing the full scope of SEP transport influenced by current sheets.

== Methodology
<methodology>
#strong[Analysis:] To estimate the spatial diffusion coefficients parallel and perpendicular to the mean magnetic field, we must quantify the net displacement a particle experiences due to multiple, consecutive interactions with realistic current sheets. This includes estimating the parallel and perpendicular displacements, $Delta s_parallel$ and $Delta s_perp$, over the duration of one interaction cycle.

The total time between two consecutive current sheet encounters is modeled as the sum of the time spent inside the current sheet $T_(c s)$, and the time spent free-streaming between sheets $T_(f s)$, given by:

$ T = T_(c s) + T_(f s) \, quad T_(f s) = s_(f s) / lr(|v_(parallel \, 1)|) $

where $v_(parallel \, 0)$, $v_(parallel \, 1)$ are the particle's changed parallel velocity before and after interacting with the current sheet, respectively.

In the absence of scattering, the particle would follow the field line and travel a distance:

$ s_0 = v_(parallel \, 0) dot.op T = v_(parallel \, 0) (T_(c s) + s_(f s) / lr(|v_(parallel \, 1)|)) . $

However, when scattering occurs, the total distance traveled becomes:

$ s = s_(c s)^(\*) + upright("sign") (v_(parallel \, 1) / v_(parallel \, 0)) s_(f s) $

where $s_(c s)^(\*)$ is the effective parallel distance the particle travels within the current sheet. The net displacement compared to the unperturbed case is then:

$ Delta s_parallel = s - s_0 = (s_(c s)^(\*) - v_(parallel \, 0) T_(c s)) + s_(f s) (1 - v_(parallel \, 0) / v_(parallel \, 1)) . $

Under the approximation that $s_(c s)^(\*) < < s_(f s)$, we obtain:

$ Delta s_parallel approx s_(f s) (1 - v_(parallel \, 0) / v_(parallel \, 1) - frac(v_(parallel \, 0) T_(c s), s_(f s))) . $

The parallel spatial diffusion coefficient is then expressed as:

$ kappa_parallel = frac((Delta s_parallel)^2, Delta t) = frac([s_(f s) (1 - v_(parallel \, 0) / v_(parallel \, 1) - frac(v_(parallel \, 0) T_(c s), s_(f s)))]^2, T_(c s) + s_(f s) / v_(parallel \, 1)) . $

Similarly, for the perpendicular direction:

$ kappa_perp = frac((Delta s_perp)^2, T_(c s) + s_(f s) / v_(parallel \, 1)) . $

The key parameters---$v_(parallel \, 1)$, $T_(c s)$, $Delta s_perp$, and $Delta t$---are directly extracted from test-particle simulations, while quantities such as the current sheet separation distance $s_(f s)$, thickness, shear angle, and normal orientation are treated as system parameters derived from solar wind observations. Together, these inputs enable a systematic and physically grounded estimation of spatial diffusion coefficients under realistic heliospheric conditions.

#figure([
#box(image("figures/dR_perp.png", width: 70.0%))
], caption: figure.caption(
position: bottom, 
[
Example trajectory of a particle interacting with a current sheet
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-dR-perp>


#strong[Data-Integrated Analytical Modeling:] To ensure consistency with heliospheric observations, we will use realistic solar wind current sheet parameters to derive the diffusion coefficients using multiple spacecraft spanning radial distances from 0.1 to 5 AU. The derived diffusion coefficients will then be incorporated into turbulence-based transport models, providing a current-sheet-informed extension to global energetic particle transport frameworks.

== Timeline
<timeline>
#strong[Months 1--4:]

- Refine the pitch-angle scattering model to incorporate both parallel and perpendicular spatial diffusion effects.

- Conduct detailed test-particle simulations using solar wind parameters derived from multi-spacecraft observations (PSP, Wind, Juno, etc.).

#strong[Months 5--7:]

- Identify observational signatures supporting the proposed scattering model.

- Examine how current sheet properties influence SEP scattering across different heliocentric distances.

#strong[Months 8--10:]

- Finalize the spatial diffusion model and assess its implications for large-scale SEP propagation.

- Synthesize simulation results and observational insights into dissertation chapters. Integrate observational and theoretical findings into comprehensive thesis documentation.

== Relevance and Broader Implications
<relevance-and-broader-implications>
This thesis substantially advances our understanding of particle transport mechanisms within turbulent space plasmas, offering significant enhancements to SEP prediction models. By accurately quantifying the influence of coherent structures such as current sheets, the research outcomes have direct applications to improving space weather forecasting, enhancing spacecraft operational safety, and contributing to the broader understanding of energetic particles transport and acceleration in the solar wind.

== Opportunities for Future Research
<opportunities-for-future-research>
Completion of this thesis opens several avenues for future investigations:

- Exploration of current sheet interactions in other astrophysical environments, such as planetary magnetospheres.

- Advanced integration of mapping techniques with numerical simulations to further refine SEP transport models.

- Expanded observational campaigns utilizing upcoming spacecraft missions designed to probe heliospheric turbulence and particle dynamics at unprecedented resolution.

#pagebreak()
= References
<references>


 

#set bibliography(style: "apa")


#bibliography(("../../../../files/bibliography/research.bib"))

