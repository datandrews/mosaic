\name{panel.plotFun}
\alias{panel.plotFun}
\title{Panel function for plotting functions}
\usage{
  panel.plotFun(object, ..., type = "l", npts = NULL,
    zlab = NULL, filled = TRUE, levels = NULL,
    nlevels = 10, surface = FALSE,
    col.regions = topo.colors, alpha = NULL)
}
\arguments{
  \item{object}{an object (e.g., a formula) describing a
  function}

  \item{npts}{an integer giving the number of points (in
  each dimension) to sample the function}

  \item{zlab}{label for z axis (when in surface-plot mode)}

  \item{filled}{fill with color between the contours
  (\code{TRUE} by default)}

  \item{levels}{levels at which to draw contours}

  \item{nlevels}{number of contours to draw (if
  \code{levels} not specified)}

  \item{surface}{a logical indicating whether to draw a
  surface plot rather than a contour plot}

  \item{col.regions}{a vector of colors or a function
  (\code{topo.colors} by default) for generating such}

  \item{type}{type of plot (\code{"l"} by default)}

  \item{alpha}{number from 0 (transparent) to 1 (opaque)
  for the fill colors}

  \item{\dots}{additional arguments, typically processed by
  \code{lattice} panel functions such as
  \code{\link[lattice]{panel.xyplot}} or
  \code{\link[lattice]{panel.levelplot}}.  Frequently used
  arguments include \describe{ \item{\code{lwd}}{line
  width} \item{\code{lty}}{line type} \item{\code{col}}{a
  color} }}
}
\description{
  Panel function for plotting functions
}
\examples{
x <- runif(30,0,2*pi)
d <- data.frame( x = x,  y = sin(x) + rnorm(30,sd=.2) )
xyplot( y ~ x, data=d )
ladd(panel.plotFun( sin(x) ~ x, col='red' ) )
xyplot( y ~ x | rbinom(30,1,.5), data=d )
ladd(panel.plotFun( sin(x) ~ x, col='red', lty=2 ) )    # plots sin(x) in each panel
}
\seealso{
  plotFun
}

