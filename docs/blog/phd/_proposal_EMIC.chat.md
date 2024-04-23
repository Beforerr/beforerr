
---

Write a phd proposal about the topic “EMIC waves/radiation bell” for the draft paper I need to publish.

```
\journalname{JGR: Space Physics}

\begin{document}

%% ---------------------------------------------------------------%%

\title{Relativistic electron flux decay and recovery: relative roles of EMIC waves, whistler-mode waves, and plasma sheet injections}

\authors{Zijin Zhang\affil{1}, Anton Artemyev\affil{1}, Didier Mourenas\affil{2,3}, Vassilis Angelopoulos\affil{1}, Xiao-Jia Zhang\affil{4,1}, 
  S. Kasahara\affil{5}, Y. Miyoshi\affil{6}, A. Matsuoka\affil{7}, Y. Kasahara\affil{8}, T. Mitani\affil{9}, S. Yokota\affil{10}, T. Hori\affil{6}, K. Keika\affil{5}, T. Takashima\affil{9}, M. Teramoto\affil{11}, S. Matsuda\affil{8}, I. Shinohara\affil{9}} 
\affiliation{1}{Department of Earth, Planetary, and Space Sciences, University of California, Los Angeles, Los Angeles, CA, 90095, USA}
\affiliation{2}{CEA, DAM, DIF, Arpajon, France}
\affiliation{3}{Laboratoire Matière en Conditions Extrêmes, Université Paris-Saclay, CEA, Bruyères-le-Châtel, France}
\affiliation{4}{Department of Physics, University of Texas at Dallas, Richardson, TX, USA}
\affiliation{5}{Department of Earth and Planetary Science, School of Science, The University of Tokyo, Tokyo, Japan}
\affiliation{6}{Institute for Space Earth Environmental Research, Nagoya University, Nagoya, Japan}
\affiliation{7}{Graduate School of Science, Kyoto University, Kyoto, Japan}
\affiliation{8}{Graduate School of Natural Science and Technology, Kanazawa University, Kakuma, Kanazawa, Japan}
\affiliation{9}{Institute of Space and Astronautical Science, Japan Aerospace Exploration Agency, Sagamihara, 252-5210, Kanagawa, Japan}
\affiliation{10}{Osaka University, Osaka, Japan}
\affiliation{11}{Kyushu Institute of Technology, Faculty of Engineering, Department of Space Systems Engineering, Kitakyushu, Fukuoka, Japan}
\correspondingauthor{Zijin Zhang}{zijin@ucla.edu}

\begin{abstract}
We investigate the importance of relativistic electron flux depletion in the outer radiation belt by electron precipitation into the atmosphere due to chorus or electromagnetic ion cyclotron (EMIC) waves.
By examining a weak geomagnetic storm on April 17, 2021, we assess the contributions of electron and ion injections from the plasma sheet and associated electron precipitation through observations from various spacecraft, including GOES, Van Allen Probes, ERG/ARASE, MMS, ELFIN, and POES.
We find that despite strong EMIC- and whistler-mode chorus wave-driven electron precipitation in the outer radiation belt, trapped 0.1-1.5 MeV electron fluxes actually increased. We use theoretical estimates of electron quasi-linear diffusion rates by chorus and EMIC waves, based on statistics of their wave power distribution, to examine the role of those waves in the observed relativistic electron flux variations. We find that a significant supply of electron flux by plasma sheet injections at the lower part of the flux spectrum, and the chorus wave-driven acceleration accompanying them, were together sufficient to overcome the rate of chorus- and EMIC wave-driven pitch-angle scattering toward the loss cone, explaining the observed increase in the electron fluxes. Our study emphasizes the importance of simultaneously taking into account resonant wave-particle interactions and modelled local energy gradients of electron phase space density following injections, to accurately forecast the dynamical evolution of trapped electron fluxes.
\end{abstract}

\begin{keypoints}
\item We report multi-satellite observations of EMIC waves, chorus waves and injections and investigate their relative importance in controlling the trapped flux of relativistic electrons
\item We show that chorus-driven acceleration during plasma sheet injections can overcome EMIC-driven losses
\item We develop an analytical model of relativistic electron flux variations subject to acceleration and losses 
\end{keypoints}


\section{Introduction}\label{sec:intro} 
Relativistic electron fluxes in Earth's inner magnetosphere are greatly affected by electron scattering to the atmosphere via resonant interactions with whistler-mode and electromagnetic ion cyclotron (EMIC) waves \cite{Millan&Thorne07, Summers07:rates,Miyoshi08,Shprits08:JASTP_local}. Near the loss-cone, electron scattering rates for EMIC waves at such energies are much larger than for whistler-mode waves \cite<e.g.,>{Glauert&Horne05,Summers07:rates,Ni15}. Thus, EMIC wave-driven electron precipitation is considered a key contributor to relativistic electron losses at energies exceeding the minimum energy for cyclotron resonance with such waves, $E_{\min}\sim 0.5-1$ MeV \cite{Summers&Thorne03,Summers07:theory,Usanova14,Kurita18:emic,Nakamura22:emic}. Numerical simulations of the outer radiation belt dynamics \cite{Ma15,Shprits16,Drozdov17} and data-model comparisons \cite{Shprits17,Kim21:emic,Drozdov22:dropout,Adair22,Angelopoulos23:SSR} have demonstrated that EMIC waves can scatter relativistic electrons efficiently and deplete their fluxes quickly in the outer radiation belt. 

For energies below ultra-relativistic energies (below several MeV) and for typical plasma characteristics, EMIC wave-driven electron scattering mostly affects low pitch-angle electrons \cite< equatorial $\alpha_{eq}<30^\circ$, see>{Ni15, Kersten14}. Therefore, additional high pitch-angle electron scattering by whistler-mode waves is required to assist EMIC waves in the precipitation of the main, near-equatorial, (trapped) electron population \cite{Mourenas16:grl, Zhang17, Drozdov20}. A combination of electron scattering by whistler-mode and EMIC waves at the same $L$-shell (even if at different longitudes) can result in a very effective electron flux depletion \cite{Mourenas16:grl, Kim21:emic,Drozdov22:dropout}. Verification of this electron loss mechanism requires a combination of satellites near the equator (to measure the waves and equatorial pitch-angle electron fluxes) and at low-altitude (to measure precipitating electron fluxes). 

EMIC waves are often generated by anisotropic ion populations from plasma sheet injections \cite{Jun19:emic,Jun21:emic}. These injections also create anisotropic "seed" electrons \cite{Miyoshi13,Jaynes15:seedelectrons}, the free energy source for whistler-mode chorus waves \cite{Tao11,Fu14:radiation_belts,Zhang18:whistlers&injections}. Such chorus waves can effectively accelerate the same seed electrons to relativistic energies \cite<e.g.,>{Miyoshi03,Thorne13:nature,Li14:storm,Mourenas14:fluxes,Allison&Shprits20}. Therefore, there is a competition between electron acceleration by whistler-mode waves \cite<supported by direct adiabatic heating during injections, see, e.g.>{Sorathia18} and electron precipitation by EMIC and chorus waves, and this competition should ultimately shape the energy spectrum of radiation belt electrons after a series of plasma sheet injections. Several recent publications indicate that the electron energy spectrum may have an upper limit corresponding to a balance between electron injections and precipitation loss, controlled by whistler-mode waves \cite{Olifer21, Olifer22, Walton23}. The existence of such an upper limit has been predicted by \citeA{Kennel&Petschek66}, and reevaluated for relativistic electrons by \citeA{Summers09} and \citeA{SummersShi14}. Several of its main assumptions have been verified using ELFIN data \cite{Mourenas24}. The Kennel-Petschek upper limit is based on the idea that injected electrons generate whistler-mode waves (with exponentially higher wave power for electron fluxes above the flux limit) that ultimately scatter these same injected electrons into the atmosphere. The competition between linearly increasing anisotropic electron fluxes and exponentially faster electron losses into the atmosphere due to exponentially increasing wave growth, leads to a stationary solution in the diffusion (Fokker-Planck) equation describing electron flux dynamics. Inclusion of EMIC wave-driven loss into this balance reduces the upper limit of the electron flux at high energy \cite{Mourenas22:ExtremeSpectra, Summers04B}. 

In this study, we consider a fortuitous equatorial and low-altitude satellite conjunction event allowing direct observations of electron loss due to scattering by EMIC and whistler-mode waves, electron acceleration by whistler-mode waves, and plasma sheet injections. Combining these observations with theoretical estimates of electron scattering rates, we show that even long-lasting ($\sim 4$ hours) electron losses driven by EMIC waves cannot deplete $\sim 0.1-1.5$ MeV electron fluxes in the outer radiation belt if plasma sheet electron injections are sufficiently strong to overcome the losses. The replenishment of the relativistic electron fluxes by the (lower energy) injections occurs due to whistler-mode chorus wave-driven electron acceleration.

The structure of this paper includes Sect.~\ref{sec:data} with the general description of spacecraft instruments and the event overview, Sect.~\ref{sec:injections} describing near-equatorial observations of plasma sheet injections during the event, Sect.~\ref{sec:emic} describing low-altitude observations of EMIC wave-driven electron precipitation, Sect.~\ref{sec:emic&whistlers} assessing the relative importance of whistler-mode waves in replenishing the EMIC wave-driven electron precipitation losses, and Sect.~\ref{sec:conclusions} summarizing the obtained results. 

\section{Spacecraft and Dataset}\label{sec:data}
In this study we use low altitude measurements of ELFIN A and B CubeSats \cite{Angelopoulos20:elfin} that provide energy (16 channels within $[50,6000]$ keV) and pitch-angle (8 channels within $[0,180^\circ]$) resolved electron flux measurements. We mainly use electron fluxes averaged within 
the local loss-cone (precipitating fluxes, $j_{prec}$) and outside the local loss-cone (trapped fluxes, $j_{trap}$), and the precipitating-to-trapped flux ratio, $j_{prec}/j_{trap}$. ELFIN measurements are used to reveal the energy range and $L$-shell (determined from magnetic field models) localization of EMIC wave-driven electron precipitation, distinguished by a typical peak of $j_{prec}/j_{trap}$ at relativistic energies \cite<see examples of such EMIC wave-driven precipitation events in>{Grach22:elfin,An22:prl,Angelopoulos23:SSR}. To confirm our interpretation that electron precipitation bursts are associated with EMIC waves, we use POES/NOAA measurements of energetic proton precipitation \cite{Evans&Greer04} within the same MLT sector. Such proton precipitation bursts are generally a good indication of the equatorial EMIC wave source region \cite<see discussion in>{Yahnin07:emic&protons,Yahnin17,Capannolo23:elfin}.

The equatorial measurements of energetic electron and ion fluxes are obtained from the fleet of spacecraft: GOES-16 and 17 provide  $[70,1000]$ keV ion and electron fluxes \cite{Dichter15:goesr,Boudouridis20:goesr}, Magnetospheric Multiscale (MMS) Mission \cite{Burch16} provide $[50,500]$ keV ion and electron fluxes \cite{Mauk16,Blake16}, Exploration of energization and Radiation in Geospace (ERG/Arase) spacecraft \cite{Miyoshi18:ERG} provide $[20,120]$keV ion fluxes \cite{Yokota17:ERG_MEPi} and $[10,2000]$keV electron fluxes \cite{Kasahara18:ERG_MEPe,Mitani18:ERG_HEP}. We also use ERG wave instrument \cite{Kasahara18:ERG_PWE,Matsuda18} providing magnetic field spectrum in the whistler-mode frequency range, and GOES\cite{GOES:mag}, MMS\cite{Russell16:mms}, and ERG \cite{Matsuoka18:ERG_MGF} magnetometers for DC magnetic field measurements.



Figure \ref{fig1} shows the orbits of all spacecraft providing the data analyzed in this study. An overview of the various phenomena occurring during the investigated period on 17 April 2021 demonstrate the following sequence of events:
\begin{itemize}
  \item At $\sim$ 01:15 UT: ERG observed strong electron injections likely supporting whistler-mode wave generation (the onset of whistler-mode chorus waves  coincides with this injection).
  \item At 01:30--02:30 UT: GOES-16\&17 observed strong ion injections that arrived at ELFIN's MLT ($\sim$16.5) around 02:30-03:00 UT (based on ion azimuthal drift estimates) and should have driven EMIC wave generation.
  \item At 02:40--06:00 UT: ELFIN observed continuous precipitation of relativistic electrons at MLT$\sim 16$; NOAA/POES observations suggest precipitation are located right at the inner edge of the ion plasma sheet; to support such precipitation by EMIC waves, whistler-mode waves recorded by ERG (at MLT$\sim20$) should continuously scatter relativistic electrons from higher equatorial pitch-angles into the pitch-angle range resonating with EMIC waves.
  \item At 07:10--07:30 UT: ERG and GOES-16\&17 observed a strong electron injection: dispersionless on ERG (MLT$\sim 20$) and dispersive on GOES-17 (MLT $\sim 4$); This injection appears to restore electron fluxes and to largely compensate for losses from EMIC wave-driven scattering, at least at $E \leq 1.5$ MeV.
\end{itemize}
Some elements of this scenario are also observed by MMS spacecraft.

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig1_orbit_multi_mission_conjunctions}
\caption{(top) An overview of the mission orbits recorded on April 17, 2021, from 00:00 to 12:00 UTC. The orbits of the various missions are projected onto the MLT and $L$-shell plane, using Tsyganenko 2001 model \cite{tsyganenkoModelMagnetosphereDawndusk2002, tsyganenkoModelMagnetosphereDawndusk2002a} for active conditions. Distinct colors differentiate between missions, with stars marking the commencement of orbits, squares indicating their termination points, and temporal annotations highlighting the periods of interest. ELFIN-B's trajectory is displayed during three time intervals: 02:42-02:46, 04:14-04:18, and 05:47-05:51 UT. NOAA-19's trajectory is plotted for 01:47-01:52 and 03:30-03:36 UT, while NOAA-15's is displayed at 01:15-01:20 and 02:58-03:03 UT. The trajectories of GOES, MMS, and Arase span the entire 12-hour interval from 00:00 to 12:00 UT. (bottom) Sym-H and SME indices during this event.}
\label{fig1}
\end{figure*}

\section{Plasma sheet injections}\label{sec:injections}

In this section, we describe plasma sheet injections observed by near-equatorial GOES-16\&17, MMS, and ERG spacecraft. 

Figure \ref{fig2} shows GOES-16\&17 ion and electron fluxes for the first twelve hours of 17 April, 2021: GOES spacecraft started at post-midnight local time (MLT $\sim 1-4$) and moved along geostationary orbit until reaching MLT $\sim 12$ at 12:00 UT. At 1:30 UT, both GOES spacecraft detected strong ion injections (almost dispersionless at GOES-16 around MLT $\sim 2$, and quite dispersive at GOES-17 around MLT $\sim 6$). Between 01:30 and 07:00 UT, GOES spacecraft detected a series of ion and electron injections. Finally, at 07:10-07:30 UT GOES spacecraft detected a very strong substorm injection: a dipolarization of the magnetic field, with $B_x$, $B_y$ magnitude decrease and $B_z$ increase (both spacecraft are at the dawn flank, MLT $\sim 6-8$, but still detect typical plasma sheet substorm dynamics) and the increase of electron and ion fluxes, by more than one order of magnitude. The electron flux increase is almost dispersionless at GOES-16, and slightly dispersive at GOES-17 (located more dawnward). Ion injections are quite dispersive on both GOES spacecraft, as ions have to drift around the Earth from dusk to dawn.  

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig2_goes_mpsh}
\caption{GOES-R electron and proton flux observations (70 keV to $\sim$1 MeV) from two geostationary operational satellites. Ion injections are seen from 2 UT (right when ELFIN starts observing EMIC wave-driven precipitation) to 8 UT. A series of strong electron injections are observed around 07:10-07:30 UT at MLT$\sim6-8$ after drifting from midnight.}
\label{fig2}
\end{figure*}

Figure \ref{fig3} shows ERG observations of $\leq 100$ keV ion and electron flux dynamics. The first strong injection was observed by ERG at $\sim$ 01:00 UT, around midnight (MLT $\sim 0$). This injection was associated with an onset of whistler-mode wave activity (discussed below). Then ERG moved to the post-midnight sector and observed a series of electron injections (between 01:30 and 03:00 UT), also detected by GOES-16\&17 (see Fig. \ref{fig2}). Turning around the Earth, ERG reached the pre-midnight sector (MLT $ \sim 21$) after 06:00 UT, and then detected a very strong substorm injection at 07:10 UT (also recorded by GOES-16\&17). At 07:00 UT ERG was at middle latitudes (MLAT $\sim 25^\circ$) and, thus, ERG observed a very clear electron flux depletion during the substorm growth phase (when the spacecraft effectively moves away from the equator due to magnetic field line stretching; see \citeA{Artemyev16:jgr:thinning,Angelopoulos20}). A similar, but less evident electron flux depletion is seen at the equatorial GOES-16 (see Fig. \ref{fig2}). The substorm onset is associated with electron flux increase and magnetic field dipolarization ($B_z$ increase), which is weaker at middle latitudes covered by the ERG than at the equatorial GOES-16 data.

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig3_arase_mep}
\caption{ERG(Arase) electron and proton flux observations ($\sim$10 keV to $\sim$120 keV). Strong electron injections are visible at the beginning of EMIC wave-driven electron precipitation and at the end of the time interval.}
\label{fig3}
\end{figure*}

Figure \ref{fig4} shows the MMS observations of $<500$ keV ion and electron fluxes. The spacecraft were in the magnetosheath at the beginning of the time interval, and crossed the magnetopause, entering the magnetosphere, around 02:30 UT. Around 04:45 UT MMS were within the region where ELFIN observed EMIC wave-driven precipitation (see below), and there MMS detected a spatially localized decrease of $>300$ keV electron fluxes. This decrease may be interpreted as a result of energetic electron loss driven by EMIC waves \cite{Drozdov20, Denton19, Hendry19, Angelopoulos23:SSR}. Around 07:30-08:00 UT MMS observed a dipolarization ($B_z$ variations) and electron and ion flux increases in the near-Earth plasma sheet (at $L>9$). This is likely the same substorm injection that ERG and GOES detected at $\sim$07:30 UT (see Figs. \ref{fig2}, \ref{fig3}).  

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig4_mms_epd}
\caption{MMS electron and proton flux observations ($\sim$50 keV to $\sim$500 keV). A localized decrease of electron fluxes is notable around the time of ELFIN observations of EMIC wave-driven electron precipitation (around  04:30 UT, at MLT$\sim16$).}
\label{fig4}
\end{figure*}

Overall GOES, ERG, and MMS observations (Figs. \ref{fig2}-\ref{fig4}) show two strong series of injections. The first series took place within 01:00-02:00 UT; it transported energetic electrons and ions that drove whistler-mode wave and EMIC wave generation: ERG recorded an appearance of intense whistler-mode waves at $\sim$01:00 UT, and intense EMIC waves have been indirectly detected through ELFIN observations of strong relativistic electron precipitation. The second series of injections occurred at 07:00-08:00 UT, bringing in energetic electrons that filled back the depleted radiation belt population. 

\section{EMIC wave driven precipitation}\label{sec:emic}
Figure \ref{fig5} shows precipitating-to-trapped flux ratio $j_{prec}/j_{trap}$ during four ELFIN orbits, with the clear signatures of EMIC wave-driven precipitation (a full information about ELFIN measurements for the entire interval, 00:00-12:00 UT, can be found in the Supplementary Information). Within $L\in[5,6]$ there is a peak of precipitating-to-trapped flux ratio above $300$ keV. This peak moves from $L\sim 6$ around 02:45 UT to $L\sim 5$ at 05:15 UT. Only EMIC wave-driven precipitation may have a low-energy cut-off of scattering fluxes around $\sim 500$ keV, which is a typical minimum resonant energy for EMIC waves \cite<see the identification of other EMIC wave-driven precipitation events with similar precipitating-to-trapped ratios in>{An22:prl, Grach22:elfin, Capannolo23:elfin, Angelopoulos23:SSR}.

Note that the efficient precipitation (large $j_{prec}/j_{trap}$) observed at $L>6.5$ is likely due to a combination of whistler-mode wave-driven precipitation \cite<see, e.g.,>{Shi22:jgr:ELFIN&ULF,Tsai22} and precipitation due to the curvature scattering \cite<e.g.,>{Wilkins23}, while precipitation of $<300$keV electrons at $L<5$ is driven by whistler-mode wave scattering \cite<see similar examples of quasi-periodical precipitation on the dusk flank in>{Artemyev21:jgr:ducts,Zhang23:jgr:ELFIN&scales}. 

Therefore, Fig. \ref{fig5} demonstrates that during at least three hours, ELFIN observed continuous EMIC wave-driven losses of relativistic electrons. Note that this period may be $\sim 1.5$ hour longer, as the nearest ELFIN orbits without signature of EMIC wave-driven precipitation are at 08:50UT (see the Supplementary Information). Taking into account that $j_{prec}/j_{trap}$ reaches one, we deal with the strong diffusion regime \cite<see>{Kennel69} for $\sim$ 0.3--1 MeV electrons and, thus, one may expect a significant depletion of equatorial electron flux in this energy range, at least at low pitch-angles \cite<e.g.,>{Usanova14,Drozdov20}.

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig_elfin_j_ratio}
\caption{Two ELFIN CubeSats observations of EMIC wave-driven electron precipitation, where the precipitating flux reaches the trapped flux in high-energy channels, over an interval exceeding three hours, from 02:42 to 05:53 UT. The locations are projected to the equatorial  $L$-Shell and MLT, using the \citeA{Tsyganenko89} magnetic field model. Panels (a), (b), and (d) show data from ELFIN-B, while panel (c) features observations from ELFIN-A.}
\label{fig5}
\end{figure*}

Although ELFIN energetic particle detectors may measure $>50$ keV ions \cite{Angelopoulos20:elfin}, these measurements were not available during our event. Thus, we use POES/NOAA ion measurements around the same MLT and UT to confirm the presence of EMIC waves \cite<$<100$keV ion precipitation is often used as an indication of the presence of EMIC waves, see, e.g.,>[]{Carson13, Miyoshi08, Kim21:emic, Yahnin16}. Figure \ref{fig6} shows four POES/NOAA orbits with ion precipitating and trapped fluxes for two energy ranges. The $L$-shell range $>5$ is characterised by isotropic precipitation ($j_{prec}/j_{trap}\sim1$), and such precipitation should be attributed to magnetic field curvature ion scattering \cite<e.g.,>{Dubyagin02,Sergeev11}. Therefore, the inner edge of the ion plasma sheet reached $L\sim 5.5$ during this event. Earthward from the isotropic precipitation, between $L\sim 4.5$ and $5.5$, POES/NOAA shows bursty precipitating ion fluxes with a magnitude lower than trapped fluxes. Such precipitation bursts are likely due to ion scattering by EMIC waves. Therefore, POES/NOAA observations confirm the presence of EMIC waves within the same MLT sector as ELFIN observations and additionally suggest that the inner edge of the ion plasma sheet (actually the region of penetration of plasma sheet injections) reached $L\sim 5.5$. 

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig_poes}
\caption{POES observations of proton precipitating (blue) and trapped (orange) fluxes. Four orbits are shown (for each orbit two energy ranges).}
\label{fig6}
\end{figure*}

\section{Wave-Driven Electron Diffusion and Flux Variations}\label{sec:emic&whistlers}

In the absence of dropouts related to magnetopause shadowing \cite{Shprits06, Matsumura11, Turner12, Boynton16}, three main processes can modify the flux of trapped electrons at $L=5-7$: EMIC wave-driven electron precipitation into the atmosphere \cite{Thorne&Kennel71, Albert03, Summers&Thorne03, Sandanger07, Miyoshi08, Usanova14, Blum15:precipitation, Gao15, Zhang21}, chorus wave-driven electron precipitation and/or acceleration \cite{Horne05JGR, Thorne13:nature, Ma20}, and injections from the plasma sheet and/or ULF wave-driven electron radial diffusion \cite{Turner12, Ozeke14, Gabrielse14, Runov15}. We examine below the effects of these different processes, alone or in combination, on the trapped electron flux.

\subsection{Role of EMIC waves alone}

During disturbed periods, intense EMIC waves are often present in the 10--18 MLT noon-dusk sector in a plasmaspheric high-density region (often at the edge of the plasmasphere or inside a plasmaspheric plume), corresponding to a high plasma frequency to gyrofrequency ratio ratio $f_{pe}/f_{ce}>15$ \cite{Meredith14, Kersten14, Ross21}. Such left-hand polarized, quasi-parallel EMIC waves are generated by substorm ion injections in the dusk sector \cite{Cornwall70, Horne&Thorne93, Kozyra97, Chen10:emic, ChenH20} and by solar wind pressure enhancements around noon \cite{OlsonLee83, Usanova10, ChenH20, Ross21}.

When EMIC waves in the H-band have a sufficiently high frequency $f\geq 0.4\,f_{cH}$, with $f_{cH}$ the proton gyrofrequency, they can reach cyclotron resonance with high energy electrons above $\sim 1-2$ MeV near the loss-cone and lead to their fast precipitation into the atmosphere via quasi-linear diffusion \cite{Albert03, Summers&Thorne03, Meredith03:jgr} or through non-linear interactions \cite{Albert&Bortnik09, Kubota15, Kubota&Omura17, Grach22:EMIC}. Even in the case of intense EMIC wave-packets, when such packets remain relatively short and are separated by random frequency and phase jumps as in various observations \cite{Usanova10, An22:prl}, electron transport should still be amenable to a quasi-linear diffusive treatment \cite{Zhang20:grl:phase, Artemyev22:NLQL}.
However, the most intense H-band EMIC waves usually reach not-too-high frequencies and, therefore, cannot reach cyclotron resonance with electrons of energy $E<3$ MeV up to high equatorial pitch-angles $\alpha>60^\circ$ \cite{Summers&Thorne03, Kersten14, Ross21}, preventing them from leading, alone, to a significant decrease of the omnidirection trapped electron flux mainly present at $\alpha>60^\circ$ \cite{Mourenas16:grl}.

The maximum equatorial pitch-angle $\alpha_{max}(\text{EMIC})$ of electrons of energy $E$ (in MeV) reaching cyclotron resonance with H-band EMIC waves is given by \cite{Summers&Thorne03, Mourenas16:grl}:

\begin{equation}
\cos\alpha_{max}(\text{EMIC}) \simeq \frac{{\Omega_{ce}^2}}{{2\omega _{\text{EMIC}}\Omega_{pe}}}\times \sqrt{\frac{{(1-\omega _{\text{EMIC}}/\Omega_{cp})(m_e/m_p)}}{{(E^2+E)}}}
\label{Eq1}
\end{equation}
for a quasi-parallel H-band EMIC wave frequency to proton gyrofrequency ratio $\omega _{\text{EMIC}}/\Omega_{cp}$ at the equator in a plasma usually composed of protons with only a small fraction ($<5$\%) of helium ions during observations of such waves \cite{Kersten14}. Figure \ref{fig7} shows $\alpha_{max}(\text{EMIC})$ as a function of energy and $\omega _{\text{EMIC}} / \Omega _{\text{cp}}$ at $L=5$, based on an empirical model of plasma density inside the plasmasphere \cite{Sheeley01}. Low energy ($<1$ MeV) electron precipitation by H-band EMIC waves can be obtained only for $\omega _{\text{EMIC}} / \Omega_{\text{cp}}>0.65-0.7$.

\begin{figure}
\centering
\includegraphics[width=0.8\textwidth]{draftfigures/fig_alpha_max_EMIC}
\centering
\caption{(a) $\alpha_{max}(\text{EMIC})$ as a function of energy and $\omega _{\text{EMIC}} / \Omega _{\text{cp}}$ at $L=5$ and $L=6$ using the empirical model of plasma density inside the plasmasphere from \citeA{Sheeley01}.
\label{fig7}}
\end{figure}


An analytical estimate (validated by comparisons with numerical simulations) of the bounce-averaged pitch-angle diffusion rate $D_{\alpha\alpha}$ of relativistic ($>1$ MeV) electrons by H-band EMIC waves near the loss-cone has been provided in Equation (1) from \cite{Mourenas16:grl}. Multiplying this estimate of $D_{\alpha\alpha}$ by a factor $(1+2E)/(4E^2+4E)^{1/2}$ (and multiplying its inner variable $G_0$ by the square of the same factor) allows to extend the validity of this expression of $D_{\alpha\alpha}$ to lower energy electrons \cite{Su12EMIC, Angelopoulos23:SSR}.

Based on quasi-linear theory in the limit of near-equilibrium of the electron distribution near the loss-cone \cite{Kennel&Petschek66, Li13:POES}, the average precipitating electron flux measured within the loss-cone by ELFIN CubeSats \cite{Angelopoulos20:elfin} at low altitude, $j_{prec}$, can be expressed as a function of the trapped flux measured at an equatorial pitch-angle $5$\% above the loss-cone angle $\alpha_{LC}$, denoted $j_{trap}$ \cite{Mourenas22:jgr:ELFIN, Mourenas23}. In the latest ELFIN data release, $j_{prec}$ is averaged weighted by solid angle, giving $j_{prec}/j_{trap}\approx 1.3/(z_0+z_0^2/200)$ with $z_0=2\alpha_{LC}/(\tau_B D_{\alpha\alpha})^{1/2}$ and $\tau_B$ the electron bounce period, valid for $j_{prec}/j_{trap}\in[0.001,0.85]$ \cite{Mourenas23}. Accordingly, $D_{\alpha\alpha}$ at $\alpha_0=\alpha_{LC}$ can be inferred from the measured ratio $j_{prec}/j_{trap}$ at ELFIN, giving

\begin{equation}
D_{\alpha\alpha} \approx \frac{{\alpha_{LC}^2}}{{2500\, \tau_B }} \left(\sqrt{1+ \frac{{ j_{trap} }}{{ 38.5\, j_{prec} }} } -1 \right)^{-2},
\label{Eq2}
\end{equation}
where the above Equation (\ref{Eq2}) applies for any wave mode in the quasi-linear diffusion regime.

The diffusion rates $D_{\alpha\alpha}$ inferred, using Equation (\ref{Eq2}), from time-averaged ELFIN measurements of precipitating and trapped electron fluxes (averaged over 10-20 spacecraft spins and taking into account periods without precipitation) are displayed in Figure \ref{fig8}(a) for different electron energies and different $L$. We use $j_{prec}$ approximately corrected for atmospheric backscatter in the conjugate region, which is done by subtracting from the measured precipitating flux the upward flux recorded by ELFIN \cite{Mourenas21:elfin}. Note that $D_{\alpha\alpha}$ inferred from ELFIN measurements of $j_{prec}/j_{trap}$ is valid only near 16 MLT, at the location and time of measurements. Since EMIC waves are likely mainly present only at noon-dusk with varying levels of wave power \cite{Meredith14, Ross21} and less than half of the time, the MLT-averaged and time-averaged diffusion rates should be smaller to much smaller than $\sim 1/8$ of the diffusion rates inferred from ELFIN measurements in Figure \ref{fig8}(a).

For a typical ratio $f_{pe}/f_{ce} \approx 20$ in a noon-dusk plasmaspheric plume at $L\approx 5-6$ \cite{Sheeley01, Zhang16:grl, Ross21}, one finds that cyclotron resonance is impossible between $0.5-2$ MeV electrons and EMIC waves at the typical frequency $\omega _{\text{EMIC}}/\Omega_{cp}= 0.4$ of peak wave power \cite{Meredith14, Kersten14, Zhang16:grl, Ross21}. However, various works have already reported a significant low-energy ($\sim0.3-1$ MeV) electron precipitation by EMIC waves in the noon-dusk sector simultaneously with a much more efficient $>1.5$ MeV precipitation, similar to ELFIN results displayed in Figure \ref{fig8} \cite{Hendry17, Hendry19, Capannolo19, Angelopoulos23:SSR}. This less efficient low-energy electron precipitation can be explained by quasi-linear electron scattering through cyclotron resonance with a finite tail of high frequency, high wave number H-band EMIC waves, of much lower amplitudes than at the peak power frequency $\omega _{\text{EMIC}}/\Omega_{cp}\sim 0.4$ \cite{Angelopoulos23:SSR}, present in Van Allen Probes statistics in the 12-22 MLT sector when $f_{pe}/f_{ce}>15$ \cite{Zhang16:grl}. This high-frequency wave power tail in the noon-dusk sector, displayed in Figure 19(a) from \citeA{Angelopoulos23:SSR}, can be approximately fitted as $B_w^2(\omega_{\text{EMIC}}/\Omega_{\text{cp}})\approx (0.4\, \Omega_{\text{cp}}/\omega_{\text{EMIC}})^7 \, B_w^2(\omega_{\text{EMIC}}/\Omega_{\text{cp}}=0.4)$. In Figure \ref{fig8}, we adopt this statistical power spectrum fit, a typical ratio $f_{pe}/f_{ce}\sim20$, a (minimum) frequency $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.45$ for cyclotron resonance with $\sim2$ MeV electrons in Figure \ref{fig8}(a), and a (minimum) frequency $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.7$ for cyclotron resonance with $\sim0.75$ MeV electrons in Figure \ref{fig8}(b). Figures \ref{fig8}(a,b) show analytical estimates \cite{Mourenas16:grl, Angelopoulos23:SSR} of EMIC wave-driven quasi-linear diffusion rates $D_{\alpha\alpha}$ of electrons near the loss-cone (dashed lines) calculated with these parameters, using a peak EMIC wave amplitude of $B_w\approx 0.5$ nT at $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.4$ that allows to roughly recover diffusion rates $D_{\alpha\alpha}$ inferred from ELFIN measurements (solid lines), both at $L=5$ near 2 MeV in Figure \ref{fig8}(a) and at $L=5-6$ near 0.75 MeV in Figure \ref{fig8}(b). These results suggest the presence of duskside EMIC wave bursts with peak amplitudes $B_w\approx 0.5$ nT and a typical low-amplitude tail at high frequencies \cite{Angelopoulos23:SSR} during this event. 

\begin{figure}
\centering
\includegraphics[width=1.0\textwidth]{draftfigures/fig_Daa}
\caption{(a) Diffusion rates $D_{\alpha\alpha}$ of electrons near the loss-cone inferred, using Equation (\ref{Eq2}), from ELFIN measurements of precipitating and trapped electron fluxes in the dusk sector near 16 MLT, at $L=5$ (solid red) and $L=6$ (solid black) as a function of electron energy $E$. Diffusion rates $D_{\alpha\alpha}$ near the loss-cone evaluated based on analytical estimates for H-band EMIC waves with typical wave and plasma parameters at $L=5$ (red) and $L=6$ (black) in a noon-dusk plasmaspheric plume, as a function of energy $E$ are shown for a typical ratio $f_{pe}/f_{ce}=20$, a peak wave amplitude of $B_w=0.5$ nT at $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.4$, and a (minimum) frequency $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.45$ for cyclotron resonance with $\sim2$ MeV electrons (dashed lines). (b) Same as (a) with analytical estimates of $D_{\alpha\alpha}$ shown for H-band EMIC waves with a peak wave amplitude of $B_w=0.5$ nT at $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.4$ and a (minimum) frequency $\omega_{\text{EMIC}}/\Omega_{cp}\sim 0.7$ for cyclotron resonance with $\sim0.75$ MeV electrons (dashed lines).
\label{fig8} }
\end{figure}


\subsection{Role of Chorus waves alone}\label{sec:whistler}

Energetic electrons of $\sim10-300$ keV injected from the plasma sheet at $L\sim5-6$ around midnight drift azimuthally toward noon and generate there intense lower-band chorus waves outside the plasmasphere \cite{Tsurutani&Smith74, Meredith01, Omura08, Li10chorus}. In turn, such chorus waves can efficiently precipitate low equatorial pitch-angle electrons into the atmosphere and energize high equatorial pitch-angle electrons up to several MeVs \cite{Horne05JGR, Omura07, Thorne13:nature, Ma16:tds, Kubota&Omura17}. Although chorus waves mainly consist of wave packets of relatively high amplitudes \cite{Santolik03:storm, Santolik14:rbsp} that may reach the threshold for nonlinear interaction \cite{Zhang19:grl}, most chorus packets are relatively short and separated by strong and random wave frequency and phase jumps \cite{Zhang20:grl:frequency, Zhang20:grl:phase}, allowing an approximate quasi-linear diffusive treatment \cite{Artemyev22:NLQL, Gan22:QLNL, An22:QLNL}.

A simplified analytical expression (validated versus numerical calculations) for the pitch-angle diffusion rate $D_{\alpha\alpha}$ of relativistic ($\sim0.1-1$ MeV) electrons near the loss-cone by quasi-parallel lower-band chorus waves is \cite{Mourenas14, Agapitov19:fpe}:

\begin{equation}
D_{\alpha\alpha}\,[{\rm s}^{-1}] \,\, \approx  \,\frac{{ B_{w}^2 \, \Omega_{ce}^{4/3}  }}{{ 1400\, \Omega_{pe}^{14/9}\omega_{ch}^{7/9} \,(2E+1)(E^2+E)^{7/9} \, \cos^2\alpha_0 }},
\label{Eq3}
\end{equation}
with $E$ in MeV, $\alpha_0$ the equatorial pitch-angle, $B_{w}^2$ in pT$^2$ and $\omega_{ch}/\Omega_{ce}\sim 0.15$ the MLT-averaged wave power and normalized chorus frequency at magnetic latitudes $\lambda\in[10^\circ,35^\circ]$ of cyclotron resonance with $\sim 0.1-2$ MeV electrons near the loss-cone \cite{Agapitov18:jgr, Mourenas21:elfin}. The corresponding electron lifetime is approximately given by $\tau_L\approx 1/(2 D_{\alpha\alpha})$ above $100$ keV as $D_{\alpha\alpha}\tan\alpha_0$ has a minimum at low equatorial pitch-angles $\alpha_0$ \cite{Albert&Shprits09:JASTP, Mourenas14, Aryan2020}. The bounce- and MLT-averaged energy diffusion rate of relativistic electrons at $\alpha>60^\circ$ can be similarly written as \cite{Mourenas12:JGR:acceleration, Mourenas14, Agapitov19:fpe}:

\begin{equation}
\frac{{ D_{EE}}}{{ E^2 }}  \,[{\rm s}^{-1}]\,\, \approx  \,\, \frac{{ B_{w}^2 \Omega_{ce}^{3/2}\omega_{ch}^{1/2} \,(E+1)^{1/2}\, \Xi(E) }}{{ 190\, \Omega_{pe}^3\, (1+2E)\, E^{3/2}  }},
\label{Eq4}
\end{equation}
with $B_{w}^2$ in pT$^2$, $E$ in MeV, $\Xi(E)\approx (\min(E,1))^{1/2}$ a factor allowing to approximately recover full numerical calculations of $D_{EE}$ for $E\in[0.1,2]$ MeV \cite{Agapitov18:jgr, Agapitov19:fpe}, and $\omega_{ch}/\Omega_{ce}\sim0.25$ the MLT-averaged parallel chorus wave power and frequency at latitudes $\lambda<10^\circ$ \cite{Agapitov18:jgr, Li16:statistics}. 

Figure \ref{fig9} shows typical whistler-mode wave spectra measured during the investigated event by the ERG spacecraft \cite{Miyoshi18:ERG, Kasahara18:ERG_PWE} at latitudes $\sim 0^\circ-3^\circ$ and $L\sim5-6$. Strong lower-band chorus waves are seen from 2 UT on April 18, 2021, to 21 UT on April 19. The time- and MLT-averaged diffusion rates $D_{\alpha\alpha}$ and $D_{EE}$ of electrons by chorus waves have been estimated based on ERG measurements of chorus wave power and frequency, using Equations (\ref{Eq3})-(\ref{Eq4}), and are displayed in Figure \ref{fig10}. 



\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/fig_erg_pwe_spec}
\caption{Whistler-mode wave spectra measured by ERG spacecraft during the investigated event. White curves show (from bottom to top) $0.1f_{ce}$, $0.5f_{ce}$, $f_{ce}$.  }
\label{fig9}
\end{figure*}

\begin{figure*}
\includegraphics[width=1\textwidth]{draftfigures/fig_Dch}
\centering
\caption{Chorus wave-driven electron quasi-linear pitch-angle and energy diffusion rates $D_{\alpha\alpha}(CH)$ and $D_{EE}(CH)/E^2$ as a function of energy at $L=5$ and 6, MLT-averaged based on ERG chorus wave data during this event (assuming a typical MLT distribution of chorus power, see \cite{Agapitov18:jgr}), adopting an empirical plasma density model outside the plasmasphere. Here, chorus wave power is assumed constant at latitudes $\sim 0^\circ - 30^\circ$ to first order.}
\label{fig10} 
\end{figure*}

\subsection{Combined roles of EMIC and chorus waves in different MLT sectors}

Based on Van Allen Probes statistics, H-band EMIC waves excited in the noon-dusk sector often reach a similar or higher wave power than chorus waves excited in low plasma density regions in the night/dawn sector \cite{Zhang16:grl, Agapitov18:jgr, Agapitov19:fpe, Ross21}. These two types of waves can frequently be observed contemporaneously on the same $L$-shells in these two MLT sectors \cite{Zhang17}, because injections from the plasma sheet provide anisotropic electron and ion populations respectively generating chorus and EMIC waves \cite<e.g.,>{Birn96,Birn14,Tao11,Gabrielse14,Ukhorskiy22:NatSR}. 

The combined effects of EMIC and chorus waves can lead to stronger and faster losses (in less than $\sim 0.5-1$ day) of trapped electron flux at $>1.5-2$ MeV than when considering either wave mode alone \cite{Li07, Mourenas16:grl, Mourenas21:elfin, Boynton17, Zhang17, Drozdov20}. However, this requires an initial electron flux decreasing more slowly toward higher energy than its asymptotic steady-state energy spectrum for given EMIC and chorus wave power and frequency distributions \cite{Mourenas22:ExtremeSpectra}. In such a situation, the main effect of EMIC waves is to quickly precipitate low equatorial pitch-angle electrons into the atmosphere, an effect equivalent to a widening of the effective loss-cone for subsequent chorus-driven electron pitch-angle diffusion, leading to a strong reduction of electron lifetimes above $\sim1.5$ MeV compared to lifetimes in the absence of EMIC waves \cite{Mourenas16:grl, Mourenas21:elfin, Zhang17}. 

Such fast electron losses typically require H-band EMIC waves with a time- and MLT-averaged power $\langle B_{w,EMIC}^2\rangle$ near the equator larger than the average chorus power $\langle B_{w,chorus}^2\rangle$ at middle latitudes (where chorus wave cyclotron resonance with electrons near the loss-cone occurs), a sufficiently high $\omega _{\text{EMIC}} / \Omega _{\text{cp}}>0.45$, and a sufficiently high ratio $f_{pe}/f_{ce}>15$ in the dusk region where EMIC waves are present \cite{Mourenas16:grl, Zhang17}. To prevent an initial, or subsequent, increase of electron flux due to chorus wave-driven electron energization \cite{Summers98, Horne05JGR, Mourenas12:JGR:acceleration, Agapitov19:fpe}, the MLT-averaged chorus wave power at low latitudes must not be too large compared to the MLT-averaged EMIC wave power, and $f_{pe}/f_{ce}$ must not be too low (typically $>4-5$) in the 23-10 MLT sector where low-latitude chorus waves are most intense \cite{Mourenas22:ExtremeSpectra}.

The time-averaged and MLT-averaged H-band EMIC wave power at the frequency of peak power is expected to be roughly $B_w^2(\omega_{\text{EMIC}}/\Omega_{\text{cp}}=0.4)\sim 0.001$ nT$^2$ at $L\sim5-6$ based on Van Allen Probes statistics when $Pdyn\simeq3$nPa as during the present event \cite{Ross21}, and the local plasma density in the duskside high-density plasmaspheric plume region is given by an empirical model \cite{Sheeley01}. Low intensity H-band EMIC waves present at $\omega_{\text{EMIC}}/\Omega_{\text{cp}}>0.4$ when $f_{pe}/f_{ce}>15$ in the dusk sector in Van Allen Probes statistics \cite{Zhang16:grl, Angelopoulos23:SSR} are taken into account by using the EMIC wave-driven pitch-angle diffusion rate near the loss-cone $D_{\alpha\alpha}(\text{EMIC})$ inferred from ELFIN measurements in Figure \ref{fig8} during this event at 16 MLT, multiplied by a factor $\sim 0.001/0.5^2 = 1/250$ to agree with the statistical MLT-averaged and time-averaged EMIC wave power. The time-averaged lower-band chorus wave power is taken as $B_w^2\sim 0.003$ nT$^2$ at the equator and $L\sim5-6$ based on spacecraft statistics \cite{Agapitov18:jgr} in agreement with ERG (Arase) measurements during this event, and the local plasma density in the dawn sector is given by an empirical trough density model \cite{Sheeley01}. The decrease of MLT- and time-averaged chorus wave power from the equator to higher latitudes in statistical observations \cite{Agapitov18:jgr} is taken into account in $D_{\alpha\alpha}(\text{chorus})$ via an approximate factor $\xi(E)=B_w^2(\lambda)/B_w^2(\lambda<10^\circ)\approx \max(0.08,\sqrt{0.06/(E+6E^5)})$ as a function of the energy $E\in[0.06,2]$ MeV of electrons near the loss-cone in cyclotron resonance with such chorus waves \cite{Mourenas23}. This allows us to refine the electron lifetime formulas provided by \citeA{Mourenas16:grl} and \citeA{ Zhang17} in the presence of contemporaneous EMIC and chorus waves in the high-density dusk sector and in the low-density dawn sector, respectively.

Using electron pitch-angle diffusion rates for chorus waves from Equation (\ref{Eq3}) and for H-band EMIC waves from Equation (1) in \cite{Mourenas16:grl} corrected at low energy as detailed above, and taking in to account the H-band EMIC wave power tail at high frequency \cite{Zhang16:grl, Angelopoulos23:SSR}, the total diffusion rate at each pitch-angle is $\langle D_{\alpha\alpha}\rangle\approx D_{\alpha\alpha}(\text{chorus})+D_{\alpha\alpha}(\text{EMIC})$. The corresponding electron lifetime $\tau_{L}$ can be estimated as \cite{Albert&Shprits09:JASTP, Mourenas16:grl, Mourenas22:ExtremeSpectra}:

\begin{equation}
\tau_{L}(E) \, \approx  \, \int_{\alpha_{0,LC}}^{\alpha_{0,max}} \frac{{ d\alpha_0 }}{{ 4 \, \langle D_{\alpha\alpha}(\alpha_0)\rangle \, \tan\alpha_0 }},
\label{Eq5}
\end{equation}
with $\alpha_{0,LC}$ the equatorial loss-cone angle and $\alpha_{0,max}\sim80^\circ-85^\circ$ the typical maximum pitch-angle of cyclotron resonance with lower-band chorus waves of high frequencies \cite{Mourenas16:grl, Agapitov18:jgr}. Here, the main contribution to the integral in Equation (\ref{Eq5}) at $E\sim0.1-2$ MeV usually comes from low to moderate equatorial pitch-angles, allowing us to use the approximation $\tau_{L}(E)\approx 0.5/\langle D_{\alpha\alpha}(\alpha_{0,LC})\rangle$ \cite{Albert&Shprits09:JASTP}.

In the presence of sustained energetic electron injections at $0.05$ MeV $\leq E\leq0.15$ MeV and significant energy diffusion by chorus waves and pitch-angle diffusion by chorus and EMIC waves, it has been shown both numerically and analytically \cite{Hua2022, Mourenas22:ExtremeSpectra, Mourenas23} that the electron flux energy spectrum should rapidly tend toward a steady-state attractor $J_{UL}(E)$. $J_{UL}(E)$ can be calculated numerically, by solving the corresponding simplified Fokker-Planck diffusion equation, using $\tau_L(E)$ from Equation (\ref{Eq5}) and $D_{EE}(E)$ from Equation (\ref{Eq4}) \cite{Mourenas22:ExtremeSpectra, Mourenas23}. Alternatively, one can use the approximate analytical solution (validated by numerical simulations) obtained by \citeA{Mourenas23}:
\begin{equation}
J_{UL}(E) \approx [(1+2E)(E^2+E)]^{1/2} \cdot I_{ \frac{{1}}{{2}} }\left( \frac{{ \sqrt{ \epsilon \, K - R } }}{{ 4E+2 }} \right), 
\label{Eq6}
\end{equation}
with $I_z$ the modified Bessel function of the first kind, $K=20+13\,E^2+0.06/E^2$, $R=4+1/E^{3/2}$, $\epsilon(E)= E^{5/4}(E+1)^{5/4}/(D_{EE}(E)\,\tau_L(E))$, where $\tau_L(E)$ is taken to first order as $\tau_{L}(E)\approx 0.5/\langle D_{\alpha\alpha}(\alpha_{0,LC})\rangle$ using $\langle D_{\alpha\alpha}\rangle\approx D_{\alpha\alpha}(\text{chorus})+D_{\alpha\alpha}(\text{EMIC})$ using $\xi(E)$ to estimate chorus power at the latitude of resonance based on its average equatorial power $B_w^2\sim 0.003$ nT$^2$, $D_{EE}(E)$ is given by Equation (\ref{Eq4}) using the equatorial average chorus wave power, and $E$ is in MeV. The corresponding $\epsilon(E)$ for chorus waves alone is as in a previous work \cite{Mourenas23}. Note that $J_{UL}(E)$ provided in Equation (\ref{Eq6}) is a discontinuous solution, which has to be calculated separately over each $E$-bin and renormalized at each $E$-bin start, with constant $K$, $R$, $\epsilon(E)$ values inside each bin \cite<see details in>[]{Mourenas23}. Chorus waves are present in the plasma trough in the dawn sector, while EMIC waves are in a plasmaspheric plume with corresponding plasma densities taken from empirical models \cite{Sheeley01}. 

Figure \ref{fig11} shows electron flux energy spectra measured at different times on April 17, 2021 at $L\sim5-6$ (black to magenta curves), by ERG near the magnetic equator (panel a) and by ELFIN at low altitude (panel b), and projected to the equator (i.e., to equatorial pitch-angles $\alpha_0=90^\circ$) by assuming a typical distribution shape $J(\alpha_0=90^\circ)/J(\alpha_0) \approx 1/\sin\alpha_0$ \cite{Shi16}, with $\sin\alpha_0\approx (B(\lambda=0^\circ)/B(\lambda))^{1/2}$ and $B(\lambda)$ the geomagnetic field strength at the latitude $\lambda$ of flux measurement. ERG latitudes of measurements $\lambda<30^\circ$ correspond to a measured $\alpha_0\gtrsim35^\circ$. At $L>5$, trapped electron fluxes usually vary coherently with fluxes at $\alpha_0=90^\circ$ \cite{Mourenas21:elfin, Mourenas23, Shane23}. This is confirmed by the similar equatorial trapped fluxes $J(\alpha_0=90^\circ)$ of $100-2000$ keV electrons at $9:55-11:30$ UT and $L\simeq5-6$ inferred from near-equatorial ERG measurements at $\alpha_0\simeq77^\circ$ in Figure \ref{fig11}(a) and inferred from high-latitude ELFIN measurements at $\alpha_0\approx3^\circ$ in Figure \ref{fig11}(b) (compare the dashed blue curve with solid red and magenta curves in panel (b)). The similarity of inferred fluxes $J(\alpha_0=90^\circ)$ at $1-2$ MeV further indicates that $\langle D_{\alpha\alpha}(\alpha_0)\rangle \tan\alpha_0$ has a minimum at low $\alpha_0$, and no deeper minimum at $\alpha_0\sim45^\circ-70^\circ$. A deeper minimum at $\alpha_0\sim45^\circ-70^\circ$ would indeed have led to a strong drop of $J(\alpha_0)$ from $\alpha_0\simeq77^\circ$ to $\alpha_0\simeq30^\circ$ \cite{Mourenas14:fluxes} and a much smaller $J(\alpha_0=90^\circ)$ inferred from ELFIN than $J(\alpha_0=90^\circ)$ inferred from ERG. This is consistent with an EMIC wave power spectrum with a tail extending to high frequencies as in statistical observations \cite{Zhang16:grl, Angelopoulos23:SSR}.

On April 17, 2021, $Dst$ varied from $-38$ nT at 0-2 UT to $-24$ nT at 11-12 UT, reaching a minimum of $\sim-50$ nT at 4-7 UT, indicating a weak $Dst$-effect on trapped fluxes at $L<6$ \cite{Kim&Chan97}, much weaker than the effect of injections. Besides, the Last Closed Drift Shell (LCDS) has been calculated using the LANL$^*$ neural network \cite{Yu12} with the TS04 magnetic field model \cite{Tsyganenko&Sitnov05}. It decreased to $L($LCDS$)\simeq6.1-6.2$ at 2-5 UT, but increased back to $L($LCDS$)\simeq6.5-7.0$ at 5:30-11:30 UT. This implies that outward electron loss was likely limited to $L>6.1$ at 2-5 UT and to $L>6.5$ after 5:30 UT during this event.

The theoretical steady-state attractor $J_{UL}(E)$ from Equation (\ref{Eq6}) is also shown (solid blue curve) in Figures \ref{fig11}(a,b), normalized at 100 keV to the latest equatorial trapped flux inferred from ERG data around 10:30 UT. It represents the hardest trapped electron flux energy spectrum that can theoretically be reached during sufficiently strong and sustained injections in the presence of both EMIC and chorus wave-driven electron pitch-angle and energy diffusion \cite{Hua2022, Mourenas22:ExtremeSpectra, Mourenas23}. The reduction of the lifetime of low-energy electrons at 0.3-1 MeV by the high-frequency wave power tail of H-band EMIC waves \cite{Angelopoulos23:SSR} leads to a slightly faster decrease of $J_{UL}(E)$ over $0.4-1.0$ MeV than in previous calculations where this tail was neglected to first order \cite{Mourenas22:ExtremeSpectra, Mourenas23}. 

The equatorial trapped fluxes inferred from ERG and ELFIN measurements near the end of this event, at 10-11 UT (magenta curves), decrease slightly faster toward higher energy than the upper-limit spectrum $J_{UL}(E)$ in Figures \ref{fig11}(a,b). This implies that the dynamical system did not yet reach this limiting energy spectrum shape, probably due to too weak time-integrated injections and chorus wave-driven electron energization. In such a situation, over time scales larger than $\sim5-10$ hours, the electron flux is expected to increase above $0.5-1$ MeV despite the precipitation loss driven by EMIC waves, due to a strong electron acceleration by chorus waves in the presence of a steep decreasing phase space density (PSD) gradient toward higher energy \cite{Mourenas22:ExtremeSpectra, Mourenas23}. It is only after a sufficiently long period of sustained injections that the trapped flux $J(E)$ is expected to reach a similar slope as the asymptotic spectrum $J_{UL}(E)$. A fast dropout of $>1-2$ MeV electron flux up to high equatorial pitch-angles due to combined pitch-angle scattering by chorus and EMIC waves can occur only when the trapped flux $J(E)$ decreases less fast than the steady-state spectrum $J_{UL}(E)$ toward higher $E$ \cite{Mourenas22:ExtremeSpectra, Mourenas23}, or else only over short time scales, $<3-5$ hours, if chorus wave-driven energization has not yet efficiently transported low energy electrons to such high energies \cite{Mourenas16:grl}. 

During the present event, one cannot fully exclude another possible scenario: additional electron loss via outward radial diffusion to the LCDS \cite{Shprits06:magnetopause, Turner12:sst, Turner14, Olifer18, Pinto20} could have increased electron loss compared to the sole EMIC and chorus wave-driven precipitation loss into the atmosphere, potentially leading to an asymptotic spectrum decreasing faster toward higher $E$ than the estimate $J_{UL}(E)$ calculated in the absence of such additional losses. However, fast outward electron loss at $L=4.2-6.6$ is statistically much less frequent and weaker below $\sim500-800$ keV than above $\sim500-800$ keV \cite{Turner12:sst, Boynton16, Boynton17}, whereas Figure \ref{fig11} shows that the faster decrease of measured fluxes than $J_{UL}(E)$ mainly occurs below 500-800 keV.

\begin{figure*}
\centering
\includegraphics[width=1\textwidth]{draftfigures/figure11+.pdf}
\caption{(a) Trapped electron flux energy spectra $J(\alpha_0=90^\circ, E)$ (black to magenta curves) measured by ERG near the magnetic equator at different times on April 17, 2021, and projected to the equator by assuming a typical shape $J(\alpha_0=90^\circ)/J(\alpha_0)\approx 1/\sin\alpha_0$, with $\sin\alpha_0\approx (B(\lambda=0^\circ)/B(\lambda))^{1/2}$ and $B(\lambda)$ the geomagnetic field strength at the latitude of measurement. The approximate steady-state spectrum shape $J_{UL}(E)$ expected to be reached asymptotically in time in the presence of both EMIC and chorus wave-driven pitch-angle and energy diffusion is also shown (blue curve), normalized at the measured flux level at 100 keV and 10:30 UT. (b) Same as (a) but showing trapped electron flux energy spectra $J(\alpha_0=90^\circ, E)$ (black to magenta curves) measured by ELFIN at low altitude at different times and projected to the equator. Two curves from panel (a) are reproduced for the sake comparison: $J(\alpha_0=90^\circ,E)$ inferred from ERG data at 10:30 UT (dashed blue) and $J_{UL}(E)$ normalized to ERG flux at 100 keV and 10:30 UT (solid blue). }
\label{fig11}
\end{figure*}


\section{Discussion and Conclusions}\label{sec:conclusions}

In this study, we examined a particular event on 17 April 2021 characterized by a series of strong electron and ion injections from the plasma sheet, significant electron precipitation driven by EMIC and whistler-mode chorus waves, and electron acceleration attributable to chorus waves. During this event, GOES, Van Allen Probes, ERG (ARASE) and MMS spacecraft have measured waves and trapped particle fluxes at high altitude near the magnetic equator, while ELFIN and POES spacecraft have recorded trapped and precipitating particle fluxes at low altitude, providing sufficient data to enable a thorough analysis of the involved physical phenomena.

Despite the observations by ELFIN and POES indicating effective precipitation of electrons in the $\sim0.1-1.5$ MeV range in the outer radiation belt due to EMIC and chorus waves, increase in trapped electron fluxes were observed across nearly all energy ranges. Combining theoretical estimates of electron quasi-linear pitch-angle and energy diffusion by chorus and EMIC waves with statistics of their wave power distribution, we have shown that long-lasting electron losses driven by EMIC waves may not deplete $\sim0.1-1.5$ MeV electron fluxes in the outer radiation belt over the long run ($>8$ hours) when a sufficiently negative derivative $\partial f/\partial E<0$ of the electron PSD $f(E)$ is present. This negative PSD gradient may, in fact, trigger strong transport of lower-energy injected electrons to higher energies via chorus wave-driven acceleration, thus more than compensating potential losses of relativistic electrons due to EMIC and chorus wave-induced precipitation into the atmosphere \cite{Mourenas22:ExtremeSpectra, Mourenas23} -- although a brief initial net loss at high energy can cause an early decrease of $\gtrsim1$ MeV electron flux \cite{Mourenas16:grl}. In addition, electron injections from the plasma sheet, measured near $L\approx 7$ by GOES, may have been sufficiently strong after 7 UT to compensate electron losses due to wave-driven electron precipitation below $\sim 1.5$ MeV at $L=5-6.5$, leading, together with chorus wave-driven acceleration, to a net increase of relativistic electron fluxes. This case study therefore underlines the fact that strong EMIC and chorus wave-driven electron losses do not necessarily correspond to a simultaneous decrease of trapped electron fluxes. Both local electron energy PSD gradients and radial PSD gradients and injections can balance such wave-driven losses. As such, these factors should be integrated into global simulation models for an accurate depiction of the evolution of trapped electron fluxes.

\acknowledgments

Z.Z., X.J.Z., A.V.A., and V.A. acknowledge support by NASA awards 80NSSC23K0108, 80NSSC23K0403, 80NSSC23K1038, and NSF grants AGS-1242918, AGS-2019950, and AGS-2021749. Y. M. acknowledge support by JSPS-grant 23H01229, 22KK0046, 22H00173, 21H04526, 22K21345.

We are grateful to NASA's CubeSat Launch Initiative for ELFIN's successful launch in the desired orbits. We acknowledge early support of ELFIN project by the AFOSR, under its University Nanosat Program, UNP-8 project, contract FA9453-12-D-0285, and by the California Space Grant program. We acknowledge critical contributions of numerous volunteer ELFIN team student members.

\section*{Open Research}

\noindent ELFIN data is available at http://themis-data.igpp.ucla.edu/ela/, THEMIS data is avaliable at http://themis.ssl.berkeley.edu. Science data of the ERG (Arase) satellite were obtained from the ERG Science Center operated by ISAS/JAXA and ISEE/Nagoya University (https://ergsc.isee.nagoya-u.ac.jp/index.shtml.en, \citeA{Miyoshi18:center}). The present study analyzed the HEP L2\_v03\_01 data \cite{Mitani18:data}, MEPe L2\_v01\_02 data \cite{Kasahara18:data}, MGF L2\_v04\_04 data \cite{Matsuoka18:data}, ORB L2\_v03 data \cite{Miyoshi18:data}, PWE OFA L2.v02\_03 data \cite{Kasahara18:data_pwe}.
\noindent Data was retrieved and analyzed using PySPEDAS and SPEDAS \cite{Angelopoulos19}.

\bibliography{full,addon}

\end{document}
```

---


Here's a revised PhD proposal draft with a refined background and motivation section, and elaborated details on the proposed data:

---

# Dynamics of EMIC Waves and Their Influence on Radiation Belt Electron Fluxes**

**PhD Candidate: Zijin Zhang**

## Abstract

Electromagnetic Ion Cyclotron (EMIC) waves are fundamental plasma wave phenomena in Earth's magnetosphere, influencing the dynamics of radiation belts through interactions with energetic electrons. These interactions often lead to significant modulation of electron fluxes, contributing to both electron acceleration and loss. This study aims to deepen the understanding of how EMIC waves, in concert with other wave modes such as whistler-mode chorus waves and phenomena like plasma sheet injections, impact the behavior of radiation belt electrons during various geomagnetic conditions.

## Background and Motivation

The Earth's radiation belts are regions of trapped energetic particles, primarily electrons, which are influenced by various types of plasma waves. Among these, EMIC waves are critical in controlling the loss and acceleration of relativistic electrons, potentially leading to significant space weather effects, including damage to satellites and disruptions to communications and navigation systems. Previous research, including pivotal studies such as Zhang et al. (JGR: Space Physics), indicates that interactions between EMIC waves, whistler-mode chorus waves, and dynamic processes such as ion injections from the plasma sheet play a complex role in modulating these electron fluxes.

EMIC waves are typically generated by temperature anisotropies in the ion population and can resonate with electrons, leading to changes in their pitch angles and energies. This resonant interaction is a key process in precipitating electrons into the atmosphere, effectively depleting the radiation belts of relativistic electrons. However, the interplay between these losses, the source of fresh electrons from the plasma sheet, and secondary acceleration processes mediated by whistler-mode waves presents a dynamic balance that is not yet fully understood.

This proposal seeks to explore these interactions in depth, employing a combination of satellite data analysis and theoretical modeling to elucidate the mechanisms by which EMIC waves affect electron dynamics in the magnetosphere. Understanding these processes is crucial for improving predictions of space weather impacts and for the design and operation of spaceborne technologies.

## Proposed Data and Detailed Analysis Approach

**Satellite Data Utilization:**

- **Van Allen Probes and ERG (Arase) Data:** Utilize comprehensive datasets including EMIC wave observations, electron and ion flux measurements, and associated wave-particle interaction data. These datasets are crucial for identifying the conditions under which EMIC waves most effectively interact with radiation belt electrons.
- **Magnetospheric Multiscale (MMS) Mission Data:** Analyze high-resolution measurements of ions and electrons to understand the microphysics of wave-particle interactions during EMIC wave events.
- **ELFIN CubeSat Data:** Employ low altitude measurements of precipitating and trapped electron fluxes to quantify the impact of EMIC waves on electron precipitation processes. ELFIN's unique orbital characteristics allow for detailed observation of loss cone dynamics and provide a direct measure of wave-driven electron losses.

## Analytical and Simulation Framework:

- **Model Development:** Enhance existing diffusion models by incorporating the latest empirical and theoretical understanding of EMIC wave properties. This involves adjusting parameters based on observed statistics of wave amplitudes and spectral characteristics.
- **Numerical Simulations:** Run simulations to predict electron flux variations under different geomagnetic storm conditions and EMIC wave intensities. This will help in understanding how variations in wave activity correlate with changes in electron fluxes.
- **Model Validation and Refinement:** Compare simulation results with observational data to validate and refine the models. This iterative process is essential for achieving a reliable predictive capability.

## Research Questions:

1. How do EMIC waves, in conjunction with chorus waves and plasma sheet injections, influence the energy and spatial distribution of radiation belt electrons?
2. Under what conditions do EMIC waves lead to net losses or gains in radiation belt electron populations?
3. Can enhanced modeling of these interactions improve predictions of electron flux behaviors during geomagnetic storms?

## Expected Contributions:

This research aims to provide new insights into the complex dynamics governing radiation belt electrons, specifically through the lens of EMIC wave interactions. The outcomes will include detailed empirical models and enhanced theoretical understanding, contributing to better space weather forecasting and mitigation strategies. Peer-reviewed publications will disseminate findings to the broader scientific community, fostering further research in this critical area of space physics.

## References:
- Zhang, Z., Artemyev, A., Mourenas, D., et al. (Year). Title of the referenced paper. *Journal of Geophysical Research: Space Physics*.

---

This proposal integrates detailed analyses with a strong theoretical framework, aiming to significantly advance our understanding of magnetospheric physics through focused study on EMIC wave interactions.
