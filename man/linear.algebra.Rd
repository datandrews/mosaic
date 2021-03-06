\name{linear.algebra}
\alias{dot}
\alias{linear.algebra}
\alias{mat}
\alias{singvals}
\title{Functions for teaching linear algebra.}
\usage{
  mat(A, data = parent.frame())

  singvals(A, data = parent.frame())

  dot(u, v)
}
\arguments{
  \item{A}{a formula.  In \code{mat} and \code{singvals},
  only the right-hand side is used.}

  \item{u}{a numeric vector}

  \item{data}{a data frame from which to pull out numerical
  values for the variables in the formula}

  \item{\dots}{additional arguments (currently ignored)

  \code{mat} returns a model matrix

  To demonstrate singularity, use \code{singvals}.}

  \item{v}{a numeric vector}
}
\value{
  \code{mat} returns a matrix

  \code{singvals} gives singular values for each column in
  the model matrix

  \code{dot} returns the dot product of \code{u} and
  \code{v}
}
\description{
  These functions provide a formula based interface to the
  construction of matrices from data and for fitting.  You
  can use them both for numerical vectors and for functions
  of variables in data frames. These functions are intended
  to support teaching basic linear algebra with a
  particular connection to statistics.
}
\examples{
a <- c(1,0,0); b <- c(1,2,3); c <- c(4,5,6); x <- rnorm(3)
dot(b,c)   # dot product
# Formula interface
mat(~a+b)
mat(~a+b+1)
mat(~length+sex, data=KidsFeet)
singvals(~length*sex*width, data=KidsFeet)
}
\seealso{
  \code{\link{project}}

  \code{\link{linearModel}}, which returns a function.
}

