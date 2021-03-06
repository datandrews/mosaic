\name{fitSpline}
\alias{fitSpline}
\title{Fit splines to data}
\usage{
  fitSpline(formula, data = parent.frame(), df = NULL,
    knots = NULL, degree = 3,
    type = c("natural", "linear", "cubic", "polynomial"),
    ...)
}
\arguments{
  \item{formula}{a formula.  Only one quantity is allowed
  on the left-hand side, the output quantity}

  \item{data}{a data frame in which \code{formula} is
  evaluated.}

  \item{type}{type of splines to use; one of
  \code{"linear"}, \code{"cubic"}, \code{"natural"} (cubic
  with linear tails, the default), or \code{"polynomial"}.}

  \item{degree}{parameter for splines when \code{type} is
  \code{"polynomial"}. 1 is locally linear, 2 is locally
  quadratic, etc.}

  \item{df}{degrees of freedom (used to determine how many
  knots should be used)}

  \item{knots}{a vector of knots}

  \item{\dots}{additional arguments passed to spline basis
  functions (\code{\link{ns}} and \code{\link{bs}}).}
}
\value{
  a function of the explanatory variable
}
\description{
  These functions create mathematical functions from data,
  using splines.
}
\examples{
f <- fitSpline( weight ~ height, data=women, df=5 )
xyplot( weight ~ height, data=women )
plotFun(f(height) ~ height, add=TRUE)

g <- fitSpline( height ~ weight, Heightweight, type='natural', df=5 )
h <- fitSpline( height ~ weight, Heightweight, type='linear', df=5 )
xyplot( height ~ weight, Heightweight, col='gray70', pch=16)
plotFun(g, add=TRUE, col='navy')
plotFun(h, add=TRUE, col='red')
}
\seealso{
  \code{\link{bs}} and \code{\link{ns}} for the bases used
  to generate the splines.
}

