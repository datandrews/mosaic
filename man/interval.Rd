\name{interval}
\alias{confint.htest}
\alias{interval}
\alias{pval}
\alias{pval.htest}
\alias{stat}
\alias{stat.htest}
\title{Extract summary statistics}
\usage{
  interval(object, parm, level = 0.95, ...)

  \method{confint}{htest} (object, parm, level, ...)

  pval(x, ...)

  \method{pval}{htest} (x, digits = 4, verbose = FALSE,
    ...)

  stat(x, ...)

  \method{stat}{htest} (x, ...)
}
\arguments{
  \item{x}{An object of class \code{htest}.}

  \item{\dots}{Additional arguments.}

  \item{object}{a fitted model object or an htest object.}

  \item{parm}{a specification of which parameters are to be
  given confidence intervals, either a vector of numbers or
  a vector of names. If missing, all parameters are
  considered.}

  \item{level}{the confidence level required.}

  \item{verbose}{a logical}

  \item{digits}{number of digits to display in verbose
  output}
}
\value{
  the extracted p-value, confidence interval, or test
  statistic
}
\description{
  Extract confidence intervals, test statistics or p-values
  from an \code{htest} object.
}
\examples{
confint(t.test(rnorm(100)))
pval(t.test(rnorm(100)))
stat(t.test(rnorm(100)))
confint(var.test(rnorm(10,sd=1), rnorm(20, sd=2)))
pval(var.test(rnorm(10,sd=1), rnorm(20, sd=2)))

data(HELPrct)
stat(t.test (age ~ shuffle(sex), HELPrct))
# Compare to test statistic computed with permuted values of sex.
do(10) * stat(t.test (age ~ shuffle(sex), HELPrct))
}
\keyword{inference}
\keyword{stats}

