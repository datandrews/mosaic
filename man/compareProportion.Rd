\name{compareProportion}
\alias{compareProportion}
\title{Compare proportions between 2 groups}
\usage{
  compareProportion(formula, data = NULL, ...)
}
\arguments{
  \item{formula}{a formula}

  \item{data}{a data frame in which \code{x} is evaluated
  if \code{x} is a formula.}

  \item{\dots}{other arguments}
}
\value{
  the difference in proportions between the second and
  first group
}
\description{
  A function to facilitate 2 group permutation tests for a
  categorical outcome variable
}
\examples{
data(HELPrct)
# calculate the observed difference
mean(homeless=="housed" ~ sex, data=HELPrct)
obs <- compareProportion(homeless=="housed" ~ sex, data=HELPrct); obs
# calculate the permutation distribution
nulldist <- do(100) * compareProportion(homeless=="housed" ~ shuffle(sex), data=HELPrct)
histogram(~ result, groups=(result >= obs), nulldist,
  xlab="difference in proportions")
}
\seealso{
  \code{\link{do}}, \code{\link{compareMean}} and
  \code{\link{shuffle}}
}
\keyword{iteration}
\keyword{stats}

