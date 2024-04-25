
---

Write a phd-candidate proposal about the topic “Solar wind discontinuities”, my previous proposal about this topic but for FINESST (Future Investigators in NASA Earth and Space Science and Technology) is attached below. You can use the content material from the attached proposal, but need to adjust for the new one.

```
\noindent{\large{\textbf{
  Solar wind discontinuity propagation in the inner and outer heliosphere
}}}

\section{Scientific/Technical/Management}\label{scientifictechnicalmanagement}

\subsection{Summary}\label{summary}

The study of solar wind magnetic discontinuities, characterized by rapid variations in interplanetary magnetic fields, stands at the forefront of understanding key phenomena in Heliophysics. These discontinuities, manifesting as localized transient rotations or jumps in the magnetic field, are pivotal in processes such as efficient plasma heating and in hosting plasma instabilities associated with discontinuity currents, which are among the most intense currents in the solar wind. Theoretical models suggest that the formation and destruction of discontinuities are closely related to the nonlinear dynamics of Alfvén waves. These nonlinear processes can create significant isolated disturbances to the otherwise adiabatic evolution of the solar wind flow. As such, this project aims to unravel a fundamental puzzle in heliophysics: \textbf{``How do these discontinuities evolve and influence the heating of the solar wind and the turbulence within the magnetic field?''}

Our approach seeks to dissect this puzzle by leveraging the unprecedented opportunities provided by the Parker Solar Probe (PSP) and Juno missions. We propose to construct and analyze two novel datasets: the first dataset combines \(1\) AU measurements from STEREO, WIND, and ARTEMIS with Juno's measurements beyond \(1\) AU, up to Jupiter's orbit; the second fuses \(1\) AU measurements with those from PSP within \(1\) AU. Through this, we intend to address three critical scientific questions:

\begin{enumerate}
\def\labelenumi{\arabic{enumi}.}
\item
  How does the occurrence rate of discontinuities evolve with radial distance \emph{beyond} \(1\) AU?
\item
  How does the occurrence rate of discontinuities evolve with radial distance \emph{within} \(1\) AU?
\item
  How do various discontinuity characteristics, such as the magnetic field magnitude, current density, spatial scale, etc., evolve through the solar wind propagation from the near-Sun regions to 1 AU, and subsequently to 5 AU?
\end{enumerate}

Answering these questions is vital for understanding the processes of solar wind heating and magnetic field turbulence. Our methodology involves integrating Juno measurements between \(1\) and \(5\) AU with those at \(1\) AU to distinguish \emph{temporal} (correlated with solar activity) and \emph{spatial} variations (correlated with radial distance) in discontinuity occurrence rates. This approach is paralleled in our analysis of PSP and \(1\) AU measurements. To respond to the third question, information of solar wind velocity is requisite. While Juno lacks direct plasma measurements during its cruise to Jupiter, we propose to use near-Earth solar wind data and a Two-Dimensional Outer Heliosphere Solar Wind Model (MSWIM2D) to reconstruct solar wind velocity near Juno's path.

\subsection{Significance of Investigation and Expected Impact}\label{significance-of-investigation-and-expected-impact}

Spacecraft investigations of the space plasma environment have revealed that the solar wind magnetic field follows the Parker model of the heliospheric current sheet only on average. Localized transient currents, that can be significantly more intense than the model currents, are carried by various discontinuities observed as strong variations in magnetic field components \citep{colburn1966, burlagaMicroScaleStructuresInterplanetary1968, turnerOrientationsRotationalTangential1971}. Most often such variations are manifested as magnetic field rotations within the plane of two most fluctuating components.
As illustrated in Figure~\ref{fig-1}, these discontinuities are observed at a multitude of radial distances from the Sun. These discontinuities play an important role in energy dissipation \citep[particle acceleration in the solar wind, see][]{dmitrukTestParticleEnergization2004, macbrideTurbulentCascadeAU2008, osmanIntermittencyLocalHeating2012, tesseinAssociationSuprathermalParticles2013}.
Moreover, they contribute significantly to the magnetic fluctuation spectra \citep{borovskyContributionStrongDiscontinuities2010, zhdankinMagneticDiscontinuitiesMagnetohydrodynamic2012, lionCoherentEventsSpectral2016} and can affect space weather \citep{tsurutaniReviewInterplanetaryDiscontinuities2011}.
Previous observations of solar wind discontinuities in the outer heliosphere were rarely in conjunction with measurements closer to the Sun. Thus it is presently
unclear whether their frequency and properties are the result of
solar variability or due to the natural evolution of the discontinuities during their propagation
and interaction with the ambient solar wind.
Juno magnetic field measurements over five years (2011-2016) and PSP magnetic field and plasma measurements over four years (2019-2023), in combination of STEREO, WIND, and ARTEMIS magnetic field and plasma monitor at \(1\) AU during the operation of Juno and PSP, provide the unique datasets needed to address this question by examining the discontinuity characteristics at two radial distances simultaneously in the context of both the inner and in the outer heliosphere.

\begin{wrapfigure}{r}{0.55\textwidth}

\centering{

\includegraphics{figures/schematic.png}

}

\caption{\label{fig-1}Distribution of occurrence rate of solar wind discontinuities \citep{sodingRadialLatitudinalDependencies2001}.}

\end{wrapfigure}%

Several heliospheric spacecraft missions have yielded statistical information about the properties and potential origins of solar wind discontinuities. For instance, Helios-1 and -2 observations showed an abundance of discontinuities within the Earth's orbit (\(<1\) AU from the Sun) \citep{marianiStatisticalStudyMagnetohydrodynamic1983}. Similarly, Ulysses detected discontinuities between 1 and 5 AU \citep{tsurutaniNonlinearElectromagneticWaves1997}, while Voyager 1's findings at \(39-43\) AU \citep{Burlaga96,Burlaga11} suggested that these discontinuities pervade the entire heliosphere.
Combination of Voyager, Ulysses, WIND, and Helios-2 measurements of discontinuities allows to determine the radial variation of their occurrence rate (see Figure~\ref{fig-1} and \citep{sodingRadialLatitudinalDependencies2001}), although measurements at different radial distances were significantly separate in time. Using simultaneous Juno, STEREO, WIND, and ARTEMIS or PSP, STEREO, WIND, and ARTEMIS measurements, we will be able to investigate and quantify the properties of \textbf{solar wind discontinuities at different distances from the Sun, both within \(1\) AU and outside, up to \(5\) AU}.

Ulysses measurements of the high-latitude solar wind at \(1-5\) AU showed that the majority of discontinuities resided within the stream-stream interaction regions and/or within Alfvén wave trains \citep{tsurutaniInterplanetaryDiscontinuitiesAlfven1995, tsurutaniReviewDiscontinuitiesAlfven1999}. The nonlinear evolution of Alfvén waves (wave steepening) can be the main cause of such discontinuities. The background plasma/magnetic field inhomogeneities and various dissipative processes are key to Alfvén wave nonlinear evolution \citep{Lerche75, Prakash&Diamond99, Medvedev97:prl, Nariyuki14, Yang15}. In hybrid simulations \citep[see][]{Vasquez&Hollweg98, Vasquez&Hollweg01, TenBarge&Howes13} and analytical models \citep[e.g.,][]{Kennel88:jetp, Hada89, Malkov91, Wu&Kennel92, Medvedev97:pop}, this steepening was shown to cause formation of discontinuities in configurations resembling the near-Earth observations. There are models predicting discontinuity formation \citep{Servidio15, Podesta&Roytershteyn17} and destruction \citep{Servidio11,Matthaeus15} due to dissipative processes (e.g., Alfvén wave steepening, magnetic reconnection) in the solar wind. However, efficiency of these processes in realistic expanding solar wind was not yet tested against observations. Regular and long-lasting Juno and PSP observations together with almost permanent near-Earth solar wind monitoring provide a unique opportunity to estimate discontinuity occurrence rates over an unprecedentedly large radial distance range (\(\sim 0.1\) AU - \(\sim 45\) AU). We will determine the discontinuity occurrence rates for various radial distances and compare this rate with the prediction of the adiabatic expansion model, \textbf{to understand if discontinuity formation or destruction dominate the statistics of discontinuities far away from the solar wind acceleration region}.

\subsection{Relevance to Heliophysics Overarching Goal}\label{relevance-to-heliophysics-overarching-goal}

This project directly aligns with NASA Heliophysics' goal to ``\emph{Explore and characterize physical processes in the space environment from the Sun to the heliopause and throughout the universe}''. By focusing on solar wind discontinuities --- the key element of magnetic field turbulence and the primary interface of charged particle acceleration --- our research directly addresses the goal to ``\emph{Explore the physical processes from the Sun to Earth and throughout the solar system}.'' This research will not only answer fundamental questions about the solar wind's evolution but also shed light on broader phenomena critical to our understanding of the heliosphere.

\subsection{Science Objectives and Methodology}\label{science-objectives-and-methodology}

The main objective of this research is the examination of how solar wind discontinuities evolve with radial distance. The methodology involves the collection and analysis of two datasets: one that combines \(1\) AU solar wind measurements conducted by STEREO, ARTEMIS, and WIND, alongside Juno spacecraft measurements during its voyage from \(1\) AU to \(5\) AU. The second dataset merges data from the same missions at \(1\) AU and includes information from the PSP within the inner heliosphere. This methodology will enable us to explore the following research objectives:

\begin{enumerate}
\def\labelenumi{\arabic{enumi}.}
\item
  How does the occurrence rate of discontinuity evolve with the radial distance \emph{within} \(1\) AU and \emph{beyond} \(1\) AU?
\item
  How do various discontinuity characteristics, such as the magnetic field magnitude, current density, spatial scale, etc., evolve through the solar wind propagation from the inner heliosphere to outer heliosphere?
\end{enumerate}

In the next sections we briefly demonstrate preliminary results of this project and basic elements of the project methodology.

\subsection{Demonstration of Project Approaches}\label{demonstration-of-project-approaches}

\subsubsection{Dataset, spacecraft instruments, and solar wind model}\label{dataset-spacecraft-instruments-and-solar-wind-model}

In this project we will use datasets of five missions measuring solar wind magnetic field and plasma. Synergistic observations of these missions should advance our understanding of the solar wind discontinuities, their radial distribution and evolution \citep{velli2020}.

\begin{SCfigure}

\centering{

\includegraphics[width=0.75\textwidth,height=\textheight]{figures/juno_model_validation.pdf}

}

\caption{\label{fig-model}Time-series comparison of MSWIM2D (red) and Juno-observed solar wind magnetic field magnitudes.}

\end{SCfigure}%

\paragraph{Juno}\label{juno}

We use the following data collected by Juno: magnetic ﬁelds with a \(16\) Hz resolution measured by the Juno Fluxgate Magnetometer (MAG) \citep{connerney2017}, the ion bulk velocity \(v\), and the plasma density \(n\) with a hourly resolution from solar wind model (see below).

\paragraph{Parker Solar Probe (PSP)}\label{parker-solar-probe-psp}

We use the following data collected by PSP: magnetic ﬁelds with a \(\sim 292\) Hz resolution measured by the FIELDS experiment \citep{bale2016}, the ion bulk velocity \(v\), and the plasma density \(n\) with a \(\sim 1\) Hz resolution by the Solar Wind Electrons Alphas and Protons (SWEAP) Investigation \citep{kasper2016}.

\paragraph{ARTEMIS}\label{artemis}

We use the following data collected by ARTEMIS: magnetic ﬁelds with a \(\sim 5\) Hz resolution measured by the Fluxgate Magnetometer \citep{auster2008}, the ion bulk velocity \(v\), and the plasma density \(n\) calculated from velocity distribution by the Electrostatic Analyzer with a \(\sim 4\) s resolution \citep{mcfadden2009}.

\paragraph{STEREO}\label{stereo}

We use the following data collected by STEREO: magnetic ﬁelds with a \(\sim 8\) Hz resolution by the magnetic ﬁeld experiment \citep{acuña2008} on In-situ Measurements of Particles and CME Transients (IMPACT) \citep{luhmann2008}, the ion bulk velocity \(v\), and the plasma density \(n\) with a minutely resolution by the Plasma and Suprathermal Ion Composition (PLASTIC) \citep{galvin2008}.

\paragraph{Wind}\label{wind}

We use the following data collected by Wind: magnetic ﬁelds with a \(\sim 11\) Hz resolution measured by the Magnetic Field Investigation (MFI) \citep{lepping1995}, the ion bulk velocity \(v\), and the plasma density \(n\) with a \(\sim 1\) Hz resolution by the Solar Wind Experiment (SWE) \citep{ogilvie1995}.

\paragraph{Solar wind model}\label{solar-wind-model}

June measurements do not include plasma characteristics, and to estimate discontinuity spatial scale (thicknesses) we will use solar wind speed obtained from the model of solar wind propagation. The hourly solar wind model data from the Two-Dimensional Outer
Heliosphere Solar Wind Modeling (MSWIM2D) \citep{keebler2022} will be employed to determine the ion bulk velocity \(v\) and plasma density \(n\) at the location of the Juno mission. Utilizing the BATSRUS MHD solver, this model is capable of simulating the propagation of the solar wind from 1 to 75 astronomical units (AU) in the ecliptic plane, effectively encompassing the region of interest for our study. Figure~\ref{fig-model} shows comparison of magnetic field magnitudes obtained from MSWIM2D and measured by Juno.

\subsubsection{Determination of discontinuities}\label{determination-of-discontinuities}

We will use Liu's \citep{liu2022a} method to identify discontinuities in the solar wind. This method has better compatibility for the discontinuities with minor field changes, and is more robust to the situation encountered in the outer heliosphere. For each sampling instant \(t\), we define three intervals: the pre-interval \([-1,-1/2]\cdot T+t\), the middle interval \([-1/,1/2]\cdot T+t\), and the post-interval \([1/2,1]\cdot T+t\), in which \(T\) are time lags. Let time series of the magnetic field data in these three intervals are labeled \({\mathbf B}_-\), \({\mathbf B}_0\), \({\mathbf B}_+\), respectively. Then for an discontinuity, the following three conditions should be satisfied: (1) \(\sigma({\mathbf B}_0)>2\max\left(\sigma({\mathbf B}_-, \sigma({\mathbf B}_+)\right)\), (2) \(\sigma\left({\mathbf B}_-+{\mathbf B}_+\right)>\sigma({\mathbf B}_-)+\sigma({\mathbf B}_+)\), and (3) \(|\Delta {\mathbf B}|>|{\mathbf B}_{bg}|/10\), in which \(\sigma\) and \({\mathbf B}_{bg}\) represent the standard deviation and the background magnetic field magnitude, and \(\Delta {\mathbf B}={\mathbf B}(t+T/2)-{\mathbf B}(t-T/2)\). The first two conditions guarantee that the field changes of the discontinuity identified are large enough to be distinguished from the stochastic fluctuations on magnetic fields, while the third is a supplementary condition to reduce the uncertainty of recognition. We also will use the minimum or maximum variance analysis (MVA) analysis \citep{sonnerupMinimumMaximumVariance1998, sonnerupMagnetopauseStructureAttitude1967} to determine the main (most varying) magnetic field component, \(B_l\), and medium variation component, \(B_m\). Figure~\ref{fig-examples} shows several examples of solar wind discontinuities detected by different spacecraft.

\begin{SCfigure}

\centering{

\includegraphics[width=0.75\textwidth,height=\textheight]{figures/fig-ids_examples.pdf}

}

\caption{\label{fig-examples}Discontinuities detected by PSP, Juno, STEREO and near-Earth ARTEMIS satellite: red, blue, and black lines are \(B_l\), \(B_m\), and \(|{\mathbf B}|\).}

\end{SCfigure}%

\subsubsection{Discontinuity occurrence rate}\label{discontinuity-occurrence-rate}

The basic approach of this proposal is to use solar wind measurements at 1AU (STEREO, ARTEMIS, WIND) to compare with Juno and PSP measurements and distinguish effects of solar wind temporal variations and effects of spatial (with the radial distance from the Sun) variations of discontinuity occurrence rate and characteristics. The example of such comparison for the occurrence rate is shown in Figure~\ref{fig-rate}, where we plot number of discontinuities measured per day by different spacecraft missions (for the same temporal resolution of magnetic field data and the same criteria of discontinuity determination). The radial distance of Juno for 2011-2015 is shown in Figure~\ref{fig-model}, and the number of discontinuities measured by Juno per day coincides with the discontinuity number measured by STEREO, WIND, and ARTEMIS, when Juno is around \(1\) AU. This number (occurrence rate) decreases with distance (with time after \(\sim 2013\)), as Juno moves from \(1\) AU to \(5\) AU. We will use the similar comparison for discontinuity characteristics and occurrence rate derived for PSP and Juno.

\begin{SCfigure}

\centering{

\includegraphics[width=0.45\textwidth,height=\textheight]{figures/ocr_time_cleaned.pdf}

}

\caption{\label{fig-rate}The number of discontinuities measured by Juno per day coincides with the discontinuity number measured by STEREO, WIND, and ARTEMIS, when Juno is around \(1\) AU. This number (occurrence rate) decreases with distance (with time after \(\sim 2013\)), as Juno moves from \(1\) AU to \(5\) AU. We will use the similar comparison for discontinuity characteristics and occurrence rate derived for PSP and Juno. The radial distance of Juno for 2011-2015 is shown in Figure~\ref{fig-model}.}

\end{SCfigure}%

\subsection{Project Schedule}\label{project-schedule}

In this project, spanning three years, we apportion one stated objective to each year: in the \textbf{first year}, the focus will be on compiling and analyzing Juno's observations of solar wind discontinuities, supported by a solar wind model and supplemental observations from \(1\) AU missions (STEREO, ARTEMIS, WIND); in the \textbf{second year}, a similar analysis of solar wind discontinuities will be conducted for PSP, using additional data from the \(1\) AU missions. In the \textbf{third year}, specific discontinuity characteristics, such as spatial scales and current density, will be analyzed for both datasets. The radial evolution of these features will be compared to the expectations predicted from solar wind adiabatic expansion.
```