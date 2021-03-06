\name{plotPoints}
\alias{plotPoints}
\title{Scatter plot of points}
\usage{
  plotPoints(x, data = parent.frame(), add = FALSE,
    panelfun = panel.xyplot, plotfun = xyplot, ...)
}
\arguments{
  \item{x}{A formula specifying y ~ x or z ~ x&y}

  \item{data}{Data frame containing the variables to be
  plotted.  If not specified, the variables will be looked
  up in the local environment}

  \item{add}{If \code{TRUE}, overlay the scatter plot on
  the current plot.}

  \item{panelfun}{Lattice panel function to be used for
  adding.  Set only if you want something other than a
  scatter plot.  Mainly, this is intended to add new
  functionality through other functions.}

  \item{plotfun}{Lattice function to be used for initial
  plot creation. Set only if you want something other than
  a scatter plot. Mainly, this is intended to add new
  functionality through other functions.}

  \item{\dots}{additional arguments}
}
\value{
  A lattice graphics object (if \code{add=FALSE})
}
\description{
  Make or add a scatter plot in a manner coordinated with
  \code{plotFun}.
}
\examples{
plotPoints( width ~ length, data=KidsFeet, groups=sex, pch=20)
f <- makeFun( lm( width ~ poly(length,2) * sex, data=KidsFeet))
plotFun( f(length=length,sex="G")~length, add=TRUE, col="pink")
plotFun( f(length=length,sex="B")~length, add=TRUE)
}
\seealso{
  \code{\link{plotFun}}
}

