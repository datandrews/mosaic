\name{freqpolygon}
\alias{freqpolygon}
\alias{panel.freqpolygon}
\title{Frequency Polygons}
\usage{
  freqpolygon(x, ..., panel = panel.freqpolygon)

  panel.freqpolygon(x, plot.points = "jitter", ref = FALSE,
    groups = NULL, weights = NULL,
    jitter.amount = 0.01 * diff(current.panel.limits()$ylim),
    type = "density", breaks = NULL,
    nint = 1.5 * log2(length(x) + 1), center = NULL,
    width = NULL,
    gcol = trellis.par.get("reference.line")$col,
    glwd = trellis.par.get("reference.line")$lwd, h, v,
    ..., identifier = "density")
}
\arguments{
  \item{x}{a formula or a numeric vector}

  \item{\dots}{additional arguments passed on to
  \code{\link{histogram}} and \code{panel}.}

  \item{panel}{a panel function}

  \item{plot.points}{one of \code{TRUE}, \code{FALSE},
  \code{"jitter"}, or \code{"rug"} indicating how points
  are to be displayed}

  \item{gcol}{color of guidelines}

  \item{glwd}{width of guidelines}

  \item{groups,weights,jitter.amount,identifier}{as in
  \code{\link{densityplot}} or \code{\link{histogram}}}

  \item{type}{one of \code{'density'}, \code{'percent'}, or
  \code{'count'}}

  \item{breaks}{a vector of breaks for the frequency
  polygon bins}

  \item{nint}{an approximate number of bins for the
  frequency polygon}

  \item{center}{center of one of the bins}

  \item{width}{width of the bins}

  \item{h,v}{a vector of values for additional horizontal
  and vertical lines}

  \item{ref}{a logical indicating whether a horizontal
  reference line should be added (roughly equivalent to
  \code{h=0})}
}
\value{
  a trellis object
}
\description{
  Frequency polygons are an alternative to histograms that
  make it simpler to overlay multiple distributions.
}
\details{
  These functions are still under development.  Future
  improvements may be forthcoming.
}
\examples{
freqpolygon(~age | substance, HELPrct, v=35, fit='normal')
freqpolygon(~age, HELPrct, labels=TRUE, type='count')
freqpolygon(~age, HELPrct, groups=cut(age, seq(10,80,by=10)))
freqpolygon(~age, HELPrct, groups=sex, stripes='horizontal')
freqpolygon(~racegrp, HELPrct, groups=substance,auto.key=TRUE)
## comparison of histogram and frequency polygon
histogram(~eruptions, faithful, type='density', width=.5)
ladd( panel.freqpolygon(faithful$eruptions, width=.5 ))
}

