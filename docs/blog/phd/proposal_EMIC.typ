// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

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

#show raw.where(block: true): block.with(
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
    fields.below = fields.below.amount
  }
  return block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == "string" {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == "content" {
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

#show figure: it => {
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match != none {
    let kind = kind_match.captures.at(0, default: "other")
    kind = upper(kind.first()) + kind.slice(1)
    // now we pull apart the callout and reassemble it with the crossref name and counter

    // when we cleanup pandoc's emitted code to avoid spaces this will have to change
    let old_callout = it.body.children.at(1).body.children.at(1)
    let old_title_block = old_callout.body.children.at(0)
    let old_title = old_title_block.body.body.children.at(2)

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
        old_title_block.body.body.children.at(0) +
        old_title_block.body.body.children.at(1) +
        new_title))

    block_with_new_content(old_callout,
      new_title_block +
      old_callout.body.children.at(1))
  } else {
    it
  }
}

#show ref: it => locate(loc => {
  let target = query(it.target, loc).first()
  if it.at("supplement", default: none) == none {
    it
    return
  }

  let sup = it.supplement.text.matches(regex("^45127368-afa1-446a-820f-fc64c546b2c5%(.*)")).at(0, default: none)
  if sup != none {
    let parent_id = sup.captures.first()
    let parent_figure = query(label(parent_id), loc).first()
    let parent_location = parent_figure.location()

    let counters = numbering(
      parent_figure.at("numbering"), 
      ..parent_figure.at("counter").at(parent_location))
      
    let subcounter = numbering(
      target.at("numbering"),
      ..target.at("counter").at(target.location()))
    
    // NOTE there's a nonbreaking space in the block below
    link(target.location(), [#parent_figure.at("supplement") #counters#subcounter])
  } else {
    it
  }
})

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black) = {
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
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      block(
        inset: 1pt, 
        width: 100%, 
        block(fill: white, width: 100%, inset: 8pt, body)))
}



#let article(
  title: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
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
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }

  if toc {
    block(above: 0em, below: 2em)[
    #outline(
      title: auto,
      depth: none
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
#show: doc => article(
  title: [Dynamics of EMIC Waves and Their Influence on Radiation Belt Electron Fluxes],
  cols: 1,
  doc,
)


#strong[PhD Candidate: Zijin Zhang]

= Abstract
<abstract>
Electromagnetic Ion Cyclotron \(EMIC) waves are fundamental plasma wave phenomena in Earth’s magnetosphere, influencing the dynamics of radiation belts through interactions with energetic electrons. These interactions often lead to significant modulation of electron fluxes, contributing to both electron acceleration and loss. This study aims to deepen the understanding of how EMIC waves, in concert with other wave modes such as whistler-mode chorus waves and phenomena like plasma sheet injections, impact the behavior of radiation belt electrons during various geomagnetic conditions. Leveraging extensive datasets from satellites such as the Van Allen Probes, ERG \(Arase), MMS, and ELFIN, this study will conduct a comprehensive analysis of wave properties, and the resulting effects on electron fluxes. By integrating observational data with advanced simulation techniques, the project seeks to enhance current models of radiation belt dynamics, improving predictions of space weather effects.

= Background and Motivation
<background-and-motivation>
The dynamic environments of Earth’s radiation belts are shaped by a complex interplay of different types of waves and particle populations. Among these, Electromagnetic Ion Cyclotron \(EMIC) waves play a pivotal role in the energy dynamics of radiation belt electrons. These waves, primarily generated through instabilities associated with the anisotropic temperature distribution of ions, have been the focus of significant research due to their ability to effectively resonate with high-energy electrons \(Millan & Thorne, 2007; Jordanova et al., 2010).

#strong[Origin and Characteristics of EMIC Waves:]

EMIC waves arise predominantly during geomagnetic storms when rapid injections of energetic ions from the solar wind into the magnetosphere create temperature anisotropies \(Cornwall et al., 1970; Anderson et al., 1996). These waves have been observed in different frequency bands corresponding to the ion species \(H+, He+, O+) that drive them, each influencing different electron populations within the radiation belts. The interaction of these waves with electrons, particularly through resonant scattering, can lead to significant modifications in electron pitch angles and energies, contributing to both acceleration and loss processes.

#strong[Interactions with Radiation Belt Electrons:]
The resonance with radiation belt electrons typically results in increased pitch angle scattering, particularly for electrons at energies of hundreds of keV to several MeV. This scattering can fill the loss cone and lead to electron precipitation into the Earth’s atmosphere, effectively depleting the radiation belt populations \(Thorne et al., 2005; Summers et al., 2007). Furthermore, recent studies have highlighted that under certain conditions, EMIC waves can also accelerate electrons to ultra-relativistic energies through mechanisms that are not yet fully understood and are a current area of active research \(Miyoshi et al., 2013; Foster et al., 2014).

#strong[Role of EMIC Waves in Space Weather:]
Understanding the interactions between EMIC waves and radiation belt electrons is crucial for predicting space weather effects, particularly since these interactions can lead to rapid changes in radiation belt configurations, posing risks to satellites and other space-based technologies \(Baker et al., 2004; Horne et al., 2005). The 2003 Halloween storm provided a clear example of how enhanced EMIC wave activity correlated with significant radiation belt electron flux decreases, highlighting the importance of including these waves in predictive models \(Turner et al., 2012).

#strong[Gaps in Current Understanding:]
Despite significant advances, there remain substantial gaps in our understanding of the conditions under which EMIC waves are most effective at causing electron losses and what roles other concurrent processes \(e.g., whistler-mode chorus waves and plasma sheet injections) play in modifying these interactions. The proposed study aims to bridge these gaps by combining observational data analysis with theoretical modeling efforts.

This enriched background sets a solid foundation for investigating the interactions of EMIC waves with radiation belt electrons and underscores the importance of this research in advancing our understanding of magnetospheric physics and improving our ability to forecast space weather impacts effectively.

= Proposed Data and Detailed Analysis Approach
<proposed-data-and-detailed-analysis-approach>
#strong[Data Acquisition and Sources:]

- #strong[ELFIN CubeSat:] Employ low-altitude measurements from the ELFIN CubeSat to quantify the effects of EMIC waves on electron precipitation. ELFIN’s unique orbital characteristics allow it to measure loss cone distributions and provide a direct measure of wave-driven electron losses, enhancing our understanding of wave-particle interaction dynamics in the radiation belts.

- #strong[Van Allen Probes:] Utilize extensive datasets from the Van Allen Probes, which include electric and magnetic field measurements, plasma wave spectra, and particle detection \(electron and ion fluxes) across different energy ranges. These data are essential for directly observing EMIC waves and assessing their interactions with radiation belt electrons during different geomagnetic conditions.

- #strong[ERG \(Arase) Satellite:] Draw upon high-resolution data from the ERG satellite, which offers crucial insights into the inner magnetosphere’s dynamics. ERG’s suite of instruments provides critical measurements of electron density, electric fields, and magnetic fields that help identify the conditions conducive to EMIC wave generation and propagation.

- #strong[Magnetospheric Multiscale \(MMS) Mission:] Analyze high-resolution data from the MMS mission, which is key for understanding the microphysics of wave-particle interactions, especially during short-duration events and smaller spatial scales that are not resolved by other satellites.

#strong[Analytical Methods:]

- #strong[Wave-Particle Interaction Analysis:] Use phase space density calculations and quasi-linear theory to analyze how EMIC waves scatter radiation belt electrons into the loss cone, leading to precipitation. This method helps in quantifying the diffusion coefficients which are critical for understanding the rate and extent of electron flux changes.

- #strong[Event Selection and Case Studies:] Identify specific events during which intense EMIC wave activity coincides with significant changes in electron fluxes. These events will be used as case studies to analyze the interaction mechanisms in detail, employing cross-spectral analysis to examine the coherence between EMIC waves and electron flux oscillations.

#strong[Simulation and Modeling:]

- #strong[Diffusion Model Enhancement:] Integrate the latest empirical models of EMIC wave properties into existing radiation belt simulation frameworks. This will involve updating the wave spectral characteristics and amplitudes based on observed data, thus refining the models used to predict electron dynamics under various space weather conditions.

- #strong[Numerical Simulations:] Conduct particle-in-cell and test particle simulations to model the interactions of electrons with EMIC waves, validating the theoretical predictions with observational data. This approach provides a dynamic simulation environment where theoretical assumptions can be rigorously tested against real-world data.

- #strong[Model Validation and Iterative Refinement:] Employ a systematic approach to compare simulated results with satellite observations. This iterative process of validation and refinement is essential to improve the reliability and accuracy of predictive models, ensuring they are robust under a wide range of space weather scenarios.

#strong[Research Questions Addressed:]

+ #strong[Mechanism Elucidation:] How exactly do EMIC waves influence electron pitch angles and energies, and under what specific conditions do these interactions lead to net electron losses or gains?
+ #strong[Modeling Improvements:] Can the integration of enhanced EMIC wave models into simulation frameworks improve the accuracy of forecasts regarding electron dynamics in the radiation belts?
+ #strong[Predictive Capabilities:] How effectively can the refined models predict changes in electron fluxes during geomagnetic storms, and what improvements are necessary to achieve better predictive reliability?

By addressing these questions through a detailed analytical and simulation-based approach, the proposed research aims to significantly advance our understanding of EMIC waves’ role in radiation belt dynamics.

= Expected Contributions
<expected-contributions>
This research project is poised to make contributions to our understanding of magnetospheric dynamics, particularly in relation to how EMIC waves influence radiation belt electrons. The integration of empirical data from multiple satellite sources with advanced simulation techniques aims to create a robust analytical framework capable of deciphering the complex interactions within Earth’s magnetosphere. Specific expected contributions include:

+ #strong[Empirical Analysis of Wave-Particle Interactions:] By leveraging data from the Van Allen Probes, ERG, MMS, and ELFIN, this study will provide comprehensive empirical insights into how EMIC waves interact with radiation belt electrons. This will include detailed case studies where EMIC wave activity is correlated with significant changes in electron fluxes, enhancing our empirical understanding of these critical interactions.

+ #strong[Advanced Theoretical Modeling:] The development and enhancement of diffusion models that incorporate refined EMIC wave characteristics will offer new theoretical insights into the mechanisms driving electron dynamics in the radiation belts. This will facilitate a better understanding of the conditions under which EMIC waves lead to electron acceleration or loss, filling a significant gap in the current scientific literature.

+ #strong[Improved Predictive Capabilities for Space Weather:] By refining simulation models to better predict the impacts of EMIC waves on radiation belt dynamics, this research will enhance our ability to forecast space weather effects, thereby contributing to more effective mitigation strategies for protecting satellites and other space-based technologies from adverse effects.

+ #strong[Publications and Dissemination:] The findings from this study are expected to be disseminated through several peer-reviewed scientific papers, presentations at major international conferences, and integrations into global space weather modeling tools, reaching both academic audiences and space weather practitioners.

= Discussion and Future Work
<discussion-and-future-work>
The findings from this research will deepen our understanding of magnetospheric physics, particularly the role of EMIC waves in electron dynamics. However, several questions are likely to emerge from this study, guiding future research efforts:

- #strong[Wave Source Regions and Propagation:] Further investigations may be required to identify the specific source regions of EMIC waves and their propagation characteristics through the magnetosphere. Understanding these aspects could enhance predictions of when and where EMIC waves will impact electron populations.

- #strong[Interactions with Other Wave Modes:] While this project focuses on EMIC waves, the magnetosphere contains multiple interacting wave modes. Future work could explore the interactions between EMIC waves and other wave types, such as ULF and VLF waves, to provide a more holistic view of the dynamics governing radiation belt electron fluxes.

- #strong[Technological Applications:] The development of real-time monitoring tools based on the findings from this research could be explored. These tools would use satellite data to provide immediate assessments of EMIC wave activity and its potential impacts, offering valuable information for satellite operators and space weather forecasters.

= Summary
<summary>
The proposed research is designed to tackle some of the most pressing questions in space physics regarding the impact of EMIC waves on radiation belt dynamics. Through a combination of detailed empirical analysis and advanced theoretical modeling, this project aims to provide significant insights and tools for predicting space weather, thereby contributing to our ability to safeguard and optimize the operation of space-based technologies.

#bibliography("../../../files/references.bib")

