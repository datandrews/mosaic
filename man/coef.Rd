\name{coef.function}
\alias{coef}
\alias{coef.function}
\title{Extract coefficients from a function}
\usage{
  \method{coef}{function} (object, ...)
}
\arguments{
  \item{object}{a function}

  \item{\dots}{ignored}
}
\description{
  \code{coef} will extract the coefficients attribute from
  a function. Functions created by applying
  \code{link{makeFun}} to a model produced by
  \code{\link{lm}}, \code{\link{glm}}, or \code{\link{nls}}
  store the model coefficients there to enable this
  extraction.
}
\examples{
model <- lm( width ~ length, data=KidsFeet)
f <- makeFun( model )
coef(f)
}

