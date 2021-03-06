\name{numD}
\alias{d2fdx2}
\alias{d2fdxdy}
\alias{dfdx}
\alias{numD}
\alias{numerical.first.partial}
\alias{numerical.mixed.partial}
\alias{numerical.second.partial}
\alias{setCorners}
\alias{setInterval}
\title{Numerical Derivatives}
\usage{
  numD(formula, ..., .hstep = NULL, add.h.control = FALSE)

  setInterval(C, wrt, h)

  setCorners(C, var1, var2, h)

  dfdx(.function, .wrt, .hstep)

  d2fdxdy(.function, .var1, .var2, .hstep)

  d2fdx2(.function, .wrt, .hstep)

  numerical.first.partial(f, wrt, h, av)

  numerical.second.partial(f, wrt, h, av)

  numerical.mixed.partial(f, var1, var2, h, av)
}
\arguments{
  \item{formula}{a mathematical expression (see examples
  and \code{\link{plotFun}})}

  \item{\dots}{additional parameters, typically default
  values for mathematical parameters}

  \item{.hstep}{numerical finite-difference step (default
  is 1e-6 or 1e-4 for first and second-order derivatives,
  respectively)}

  \item{add.h.control}{arranges the returned function to
  have a \code{.hstep} argument that cann be used to
  demonstrate convergence and error}

  \item{C}{list of arguments for evaluating the function at
  the "center" point}

  \item{wrt}{character string naming the variable with
  respect to which differentiation is to be done}

  \item{h}{the finite-difference step size}

  \item{var1}{character string naming the first variable
  with respect to which differentiation is to be done}

  \item{var2}{character string naming the second variable
  with respect to which differentiation is to be done}

  \item{.function}{function to be differentiated}

  \item{.wrt}{character string naming the variable with
  respect to which differentiation is to be done}

  \item{.step}{the finite-difference step size}

  \item{.var1}{character string naming the first variable
  with respect to which differentiation is to be done}

  \item{.var2}{character string naming the second variable
  with respect to which differentiation is to be done}

  \item{f}{function to differentiate}

  \item{av}{arguments to the function calling this}
}
\value{
  a function implementing the derivative as a
  finite-difference approximation
}
\description{
  Constructs the numerical derivatives of mathematical
  expressions
}
\details{
  Uses a simple finite-difference scheme to evaluate the
  derivative.  The function created will not contain a
  formula for the derivative.  Instead, the original
  function is stored at the time the derivative is
  constructed and that original function is re-evaluated at
  the finitely-spaced points of an interval.  If you
  redefine the original function, that won't affect any
  derivatives that were already defined from it. Numerical
  derivatives, particularly high-order ones, are unstable.
  The finite-difference parameter \code{.hstep} is set, by
  default, to give reasonable results for first- and
  second-order derivatives. It's tweaked a bit so that
  taking a second derivative by differentiating a first
  derivative will give reasonably accurate results.  But,
  if taking a second derivative, much better to do it in
  one step to preserve numerical accuracy.
}
\note{
  WARNING: In the expressions, do not use variable names
  beginning with a dot, particularly \code{.f} or \code{.h}

  Helper function for \code{numD} for unmixed partials

  Helper function for \code{numD} for mixed partials

  Helper function for \code{numD} for first-order derivs.

  Helper function for \code{numD} for second-order mixed
  partials

  Helper function for \code{numD} for second-order derivs

  Not for direct use. This just packages up the numerical
  differentiation process to make functions returned by
  \code{numD} and \code{D} easier to read.

  Not for direct use. This just packages up the numerical
  differentiation process to make functions returned by
  \code{numD} and \code{D} easier to read.
}
\section{Numerical partials}{
  These functions are not indended for direct use. They
  just package up the numerical differentiation process to
  make functions returned by \code{numD} and \code{D}
  easier to read.
}
\examples{
g = numD( a*x^2 + x*y ~ x, a=1)
g(x=2,y=10)
gg = numD( a*x^2 + x*y ~ x&x, a=1)
gg(x=2,y=10)
ggg = numD( a*x^2 + x*y ~ x&y, a=1)
ggg(x=2,y=10)
h = numD( g(x=x,y=y,a=a) ~ y, a=1)
h(x=2,y=10)
f = numD( sin(x)~x, add.h.control=TRUE)
plotFun( f(3,.hstep=h)~h, hlim=range(.00000001,.000001))
ladd( panel.abline(cos(3),0))
}
\author{
  Daniel Kaplan (\email{kaplan@macalester.edu})
}
\seealso{
  \code{\link{D}}, \code{\link{symbolicD}},
  \code{\link{makeFun}}, \code{\link{antiD}},
  \code{\link{plotFun}}
}

