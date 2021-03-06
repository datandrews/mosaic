\name{evalSubFormula}
\alias{evalSubFormula}
\title{Evaluate a part of a formula}
\usage{
  evalSubFormula(x, data = parent.frame(),
    ops = c("+", "&"))
}
\arguments{
  \item{x}{an object appearing as a subformula (typically a
  call)}

  \item{data}{a data fram or environment in which things
  are evaluated}

  \item{ops}{a vector of operators that are not evaluated
  as operators but instead used to further split \code{x}}
}
\value{
  a data frame containing the terms of the evaluated
  subformula
}
\description{
  Evaluate a part of a formula
}
\examples{
data(CPS85)
cps <- CPS85[1:6,]
cps
evalSubFormula( rhs( ~ married & sector), data=cps )
}

