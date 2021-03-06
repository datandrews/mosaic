\name{expandFun}
\alias{expandFun}
\title{Expand the left-hand side of a formula}
\usage{
  expandFun(formula, ...)
}
\arguments{
  \item{formula}{A mathematical expression (see examples
  and \code{\link{plotFun}})}

  \item{\ldots}{additional parameters}
}
\value{
  A list with the new expanded formula and the combined
  formals
}
\description{
  Expands the contents of functions used in a formula.
}
\examples{
f=makeFun(x^2~x)
expandFun(f(z)~z) #Returns z^2~z
}

