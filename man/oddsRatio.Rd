\name{oddsRatio}
\alias{oddsRatio}
\alias{print.oddsRatio}
\title{Odds Ratio for 2X2 Contingency Tables}
\usage{
  oddsRatio(x, conf.level = 0.95)

  \method{print}{oddsRatio} (x, digits = 4, ...)
}
\arguments{
  \item{x}{a 2 X 2 matrix, data frame or table of counts}

  \item{conf.level}{the confidence interval level}

  \item{digits}{number of digits to display}

  \item{\dots}{additional arguments}
}
\value{
  \item{p1, p2}{Proportions for rows 1 and 2} \item{o1,
  o2}{Odds for rows 1 and 2} \item{OR}{Odds ratio}
  \item{lower}{the lower bound of the confidence interval}
  \item{upper}{the upper bound of the confidence interval}
  \item{conf.level}{the confidence interval level}
}
\description{
  This function calculates the odds ratio for a 2 X 2
  contingency table and a confidence interval (default
  \code{conf.level} is 95 percent) for the estimated odds
  ratio. \code{x} should be a matrix, data frame or table.
  "Successes" should be located in column 1 of \code{x},
  and the treatment of interest should be located in row 2.
  The odds ratio is calculated as (Odds row 2) / (Odds row
  1). The confidence interval is calculated from the
  log(OR) and backtransformed.
}
\examples{
M1 <- matrix(c(14, 38, 51, 11), nrow = 2)
M1
oddsRatio(M1)

M2 <- matrix(c(18515, 18496, 1427, 1438), nrow = 2)
rownames(M2) <- c("Placebo", "Aspirin")
colnames(M2) <- c("No", "Yes")
M2
oddsRatio(M2)
}
\author{
  Kevin Middleton (\email{kmm@csusb.edu})
}
\seealso{
  \code{\link{chisq.test}}
}
\keyword{stats}

