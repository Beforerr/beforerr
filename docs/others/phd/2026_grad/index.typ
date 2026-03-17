#import "@local/uclathesis:0.1.0": uclathesis
#import "@preview/cmarker:0.1.8"

#let citet(..citation) = cite(..citation, form: "prose")

#show: uclathesis.with(
  title: [My Dissertation Title],
  author: "Your Name",
  degree: "Doctor of Philosophy",
  major: "Your Major",
  year: 2024,
  doc-type: "dissertation", // or "thesis" for master's
  committee-chair: "Vassilis Angelopoulos",
  committee-members: (
    "Member One",
    "Member Two",
  ),
  abstract: [Your abstract text here.],
  bibliography: bibliography("../../../../files/bibliography/research.bib"),
)


#pagebreak()

#include "_review_current_sheet.typ"
