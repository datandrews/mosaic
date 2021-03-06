\name{binom.test}
\alias{binom.test}
\alias{binom.test,ANY-method}
\alias{binom.test,character-method}
\alias{binom.test,factor-method}
\alias{binom.test,formula-method}
\alias{binom.test,logical-method}
\alias{binom.test,numeric-method}
\title{Exact Tests for Proportions}
\arguments{
  \item{x}{count of successes, length 2 vector of success
  and failure counts, a formula, or a character, numeric,
  or factor vector containing raw data.}

  \item{n}{sample size (successes + failures) or a data
  frame (for the formula interface)}

  \item{p}{probability for null hypothesis}

  \item{alternative}{type of alternative hypothesis}

  \item{conf.level}{confidence level for confidence
  interval}

  \item{success}{level of variable to be considered
  success.  All other levels are considered failure.}

  \item{data.name}{name for data.  If missing, this is
  inferred from variable names.}

  \item{data}{a data frame (if missing, \code{n} may be a
  data frame)}

  \item{\dots}{additional arguments (often ignored)}
}
\value{
  an object of class \code{htest}
}
\description{
  The \code{binom.test} function performs an exact test of
  a simple null hypothesis about the probability of success
  in a Bernoulli experiment from summarized data or from
  raw data. The mosaic \code{binom.test} provides wrapper
  functions around the function of the same name in
  \pkg{stats}. These wrappers provide an extended interface
  (including formulas).
}
\details{
  This is a wrapper around \code{\link{binom.test}} from
  the \code{base} package to simplify its use when the raw
  data are available, in which case an extended syntax for
  \code{binom.test} is provided.
}
\examples{
# Several ways to get a confidence interval for the proportion of Old Faithful
# eruptions lasting more than 3 minutes.
data(faithful)
binom.test(faithful$eruptions > 3)
binom.test(97, 272)
binom.test(c(97, 272-97))
faithful$long <- faithful$eruptions > 3
binom.test(faithful$long)
binom.test(~ long, faithful)
}
\seealso{
  \code{\link[mosaic]{prop.test}},
  \code{\link[stats]{binom.test}}
}
\keyword{stats}

