\name{prop.test}
\alias{prop.test}
\alias{prop.test,ANY-method}
\alias{prop.test,character-method}
\alias{prop.test,factor-method}
\alias{prop.test,formula-method}
\alias{prop.test,logical-method}
\alias{prop.test,numeric-method}
\title{Exact and Approximate Tests for Proportions}
\arguments{
  \item{x}{count of successes, length 2 vector of success
  and failure counts, a formula, or a character, numeric,
  or factor vector containing raw data.}

  \item{groups}{when \code{x} is a formula, \code{groups}
  can be used to compare groups.  (This can also be done
  using by placing both variables into the formula.)  See
  the examples.}

  \item{n}{sample size (successes + failures) or a data
  frame (for the formula interface)}

  \item{p}{a vector of probabilities of success. The length
  of p must be the same as the number of groups specified
  by x, and its elements must be greater than 0 and less
  than 1.}

  \item{alternative}{character string specifying the
  alternative hypothesis, must be one of \code{"two.sided"}
  (default), \code{"greater"} or \code{"less"}. You can
  specify just the initial letter. Only used for testing
  the null that a single proportion equals a given value,
  or that two proportions are equal; ignored otherwise.}

  \item{conf.level}{confidence level of the returned
  confidence interval. Must be a single number between 0
  and 1. Only used when testing the null that a single
  proportion equals a given value, or that two proportions
  are equal; ignored otherwise.}

  \item{success}{level of variable to be considered
  success.  All other levels are considered failure.}

  \item{data.name}{name for data.  If missing, this is
  inferred from variable names.}

  \item{data}{a data frame (if missing, \code{n} may be a
  data frame)}

  \item{\dots}{additional arguments (often ignored)}
}
\value{
  an \code{htest} object
}
\description{
  The mosaic \code{prop.test} provides wrapper functions
  around the function of the same name in \pkg{stats}.
  These wrappers provide an extended interface (including
  formulas). \code{prop.test} performs an approximate test
  of a simple null hypothesis about the probability of
  success in a Bernoulli or multinomial experiment from
  summarized data or from raw data.
}
\details{
  This is a wrapper around \code{\link{prop.test}} to
  simplify its use when the raw data are available, in
  which case an extended syntax for \code{prop.test} is
  provided.
}
\examples{
# Several ways to get a confidence interval for the proportion of Old Faithful
# eruptions lasting more than 3 minutes.
prop.test( faithful$eruptions > 3 )
prop.test(97,272)
prop.test(c(97,272-97))
faithful$long <- faithful$eruptions > 3
prop.test( faithful$long )
prop.test( ~long , faithful )
prop.test( homeless ~ sex, data=HELPrct )
prop.test( ~ homeless | sex, data=HELPrct )
prop.test( ~ homeless, groups= sex, data=HELPrct )
}
\seealso{
  \code{\link[mosaic]{binom.test}},
  \code{\link[stats]{prop.test}}
}
\keyword{stats}

