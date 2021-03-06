\name{evalFormula}
\alias{evalFormula}
\title{Evaluate a formula}
\usage{
  evalFormula(formula, data = parent.frame(), subset,
    ops = c("+", "&"))
}
\arguments{
  \item{formula}{a formula (\code{ y ~ x | z}) to evaluate}

  \item{data}{a data frame or environment in which
  evaluation occurs}

  \item{ops}{a vector of operator symbols allowable to
  separate variables in rhs}

  \item{subset}{an optional vector describing a subset of
  the observations to be used. Currently only implemented
  when data is a data frame.}
}
\value{
  a list containing data frames corresponding to the left,
  right, and condition slots of \code{formula}
}
\description{
  Evaluate a formula
}
\examples{
data(CPS85)
cps <- CPS85[1:6,]
cps
evalFormula(wage ~ sex & married & age | sector & race, data=cps)
}

