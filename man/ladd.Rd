\name{ladd}
\alias{ladd}
\title{Add to Lattice Plots}
\usage{
  ladd(x, col, row, highlight = FALSE, verbose = FALSE)
}
\arguments{
  \item{x}{callable graphical element to be added to a
  panel or panels in a lattice plot}

  \item{col,row}{identifies desired panel(s) in multi-panel
  plots.  If missing, all columns or rows are used.}

  \item{verbose}{a logical indicating whether to display
  some information about modified panels.}

  \item{highlight}{a logical indicating whether to
  highlight panels as they are being modified.}
}
\description{
  Simplified lattice plotting by adding additional elements
  to existing plots.
}
\details{
  \code{ladd} is simply a wrapper around
  \code{\link{trellis.focus}} and
  \code{\link{trellis.unfocus}}.
}
\examples{
p <- xyplot(rnorm(100) ~rnorm(100))
print(p)
ladd(panel.abline(a=0,b=1))
ladd(panel.abline(h=0,col='blue'))
ladd(grid.text('Hello'))
ladd(grid.text(x=.95,y=.05,'text here',just=c('right','bottom')))
q <- xyplot(rnorm(100) ~rnorm(100)|factor(rbinom(100,4,.5)))
q <- update(q, layout=c(3,2))
print(q)
ladd(panel.abline(a=0,b=1))
ladd(panel.abline(h=0,col='blue'))
ladd( grid.text("(2,1)",gp=gpar(cex=3,alpha=.5)), 2, 1)
print(q)
ladd( grid.text(paste(current.column(), current.row(),sep=','), gp=gpar(cex=3,alpha=.5)) )
histogram( ~eruptions, data=faithful)
ladd(panel.densityplot(faithful$eruptions))
}
\author{
  Randall Pruim (\email{rpruim@calvin.edu})
}
\keyword{graphics}

