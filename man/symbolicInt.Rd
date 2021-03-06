\name{symbolicInt}
\alias{.affine.exp}
\alias{.intArith}
\alias{.intMath}
\alias{.intTrig}
\alias{symbolicAntiD}
\alias{symbolicInt}
\title{Find the symbolic integral of a formula}
\usage{
  symbolicInt(form, ...)

  symbolicAntiD(form, ...)

  .intArith(form, ...)

  .intMath(form, ...)

  .intTrig(form, num, den, .x.)

  .affine.exp(tree, .x.)
}
\arguments{
  \item{form}{an object of type formula to be integrated.
  Rhs of formula indicates which variable to integrate with
  respect to.  Must only have one variable.}

  \item{\ldots}{extra parameters}

  \item{num}{numerator}

  \item{den}{denominator}

  \item{.x.}{the variable name}

  \item{tree}{the expression to be analyzed}
}
\value{
  symbolicInt returns a function whose body is the symbolic
  antiderivative of the formula.  If this method does not
  recognize the formula, it will return an error.

  a formula implementing giving symbolic anti-derivative.
  If the formula isn't found by the algorithm, an error is
  thrown.

  An expression with the integral, or throws an error if
  unsuccessful.

  An expression with the integral, or throws an error if
  unsuccessful.

  An expression with the integral, or throws an error if
  unsuccessful.

  A list with values of a and b satisfying a*.x.+b = tree.
  If the expression is not affine, returns an empty list.
}
\description{
  Find the symbolic integral of a formula

  Use recursion to find a symbolic antiderivative

  Attempts symbolic integration of some
  mathematical/arithmetical forms

  Attempts symbolic integration of some mathematical forms

  Attempts symbolic integration of some mathematical forms
  using trigonometric substitution

  Takes a call and returns its affine coefficients.
}
\details{
  This symbolic integrator recognizes simple polynomials
  and functions such as \code{sin}, \code{cos}, \code{tan},
  \code{sinh}, \code{cosh}, \code{tanh}, \code{sqrt}, and
  \code{exp}.

  It will not perform more complicated substitutions or
  integration by parts.
}

