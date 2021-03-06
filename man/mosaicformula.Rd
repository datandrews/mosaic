\name{mosaic_formula}
\alias{mosaic_formula}
\alias{mosaic_formula_q}
\title{Convert formulas into standard shapes}
\usage{
  mosaic_formula(formula, groups = NULL,
    envir = parent.frame(), max.slots = 3)

  mosaic_formula_q(formula, groups = NULL,
    envir = parent.frame(), max.slots = 3)
}
\arguments{
  \item{formula}{a formula}

  \item{groups}{a name used for grouping}

  \item{max.slots}{an integer specifying the maximum number
  of slots for the resulting formula. An error results from
  trying to create a formula that is too complex.}

  \item{envir}{the environment in which the resulting
  formula may be evaluated. May also be \code{NULL}, a
  list, a data frame, or a pairlist.}
}
\description{
  These functions convert formauls into standard shapes,
  including by incorporating a groups argument.
}
\details{
  \code{mosaic_formula_q} uses nonstandard evaluation of
  \code{groups} that may be necessary for use within other
  functions.  \code{mosaic_formula} is a wrapper around
  \code{mosaic_formula_q} and quotes \code{groups} before
  passing it along.
}
\examples{
mosaic_formula( ~ x | z )
mosaic_formula( ~ x, groups=g )
mosaic_formula( y ~ x, groups=g )
# this is probably not what you want for interactive use.
mosaic_formula_q( y ~ x, groups=g )
# but it is for programming
foo <- function(x, groups=NULL) {
    mosaic_formula_q(x, groups=groups, envir=parent.frame())
}
foo( y ~ x , groups = g)
}

