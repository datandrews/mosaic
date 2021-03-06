\name{D}
\alias{antiD}
\alias{D}
\alias{makeAntiDfun}
\alias{numerical_integration}
\title{Derivative and Anti-derivative operators}
\usage{
  D(formula, ..., .hstep = NULL, add.h.control = FALSE)

  antiD(formula, ..., lower.bound = 0,
    force.numeric = FALSE)

  makeAntiDfun(.function, .wrt, from,
    .tol = .Machine$double.eps^0.25)

  numerical_integration(f, wrt, av, args, vi.from,
    ciName = "C", .tol)
}
\arguments{
  \item{formula}{A formula. The right side specifies the
  variable(s) with which to carry out the integration or
  differentiation.  On the left side should be an
  expression or a function that returns a numerical vector
  of the same length as its argument.  The expression can
  contain unbound variables.}

  \item{\dots}{Default values to be given to unbound
  variables in the expression \code{expr}. See examples.#'
  Note that in creating anti-derivative functions, default
  values of "from" and "to" can be assigned.  They are to
  be written with the name of the variable as a prefix,
  e.g. \code{y.from}.}

  \item{.hstep}{horizontal distance between points used for
  secant slope calculation in numerical derivatives.}

  \item{add.h.control}{logical indicating whether the
  returned derivative function should have an additional
  parameter for setting .hstep.  Meaningful only for
  numerical derivatives.}

  \item{lower.bound}{for numerical integration only, the
  lower bound used}

  \item{force.numeric}{If \code{TRUE}, a numerical integral
  is performed even when a symbolic integral is available.}

  \item{.function}{function to be integrated}

  \item{.wrt}{character string naming the variable of
  integration}

  \item{from}{default value for the lower bound of the
  integral region}

  \item{f}{a function}

  \item{wrt}{character string naming a variable: the var.
  of integration}

  \item{av}{a list of the arguments passed to the function
  calling this}

  \item{args}{default values (if any) for parameterss}

  \item{vi.from}{the the lower bound of the interval of
  integration}

  \item{ciName}{character string giving the name of the
  symbol for the constant of integration}

  \item{.tol}{Numerical tolerance.  See stats::integrate}
}
\value{
  For derivatives, the return value is a function of the
  variable(s) of differentiation, as well as any other
  symbols used in the expression.  Thus, \code{D(A*x^2 +
  B*y ~ x + y)} will compute the mixed partial with respect
  to x then y (that is, \eqn{\frac{d^2
  f}{dy\;dx}}{d2f/dydx}).  The returned value will be a
  function of x and y, as well as A and B.  In evaluating
  the returned function, it's best to use the named form of
  arguments, to ensure the order is correct.

  a function of the same arguments as the original
  expression with a constant of integration set to zero by
  default, named "C", "D", ... depending on the first such
  letter not otherwise in the argument list.
}
\description{
  Operators for computing derivatives and anti-derivatives
  as functions.
}
\details{
  \code{D} attempts to find a symbolic derivative for
  simple expressions, but will provide a function that is a
  numerical derivative if the attempt at symbolic
  differentiation is unsuccessful.  The symbolic derivative
  can be of any order (although the expression may become
  unmanageably complex).  The numerical derivative is
  limited to first or second-order partial derivatives
  (including mixed partials). \code{antiD} will attempt
  simple symbolic integration but if it fails it will
  return a numerically-based anti-derivative.

  \code{antiD} returns a function with the same arguments
  as the expression passed to it.  The returned function is
  the anti-derivative of the expression, e.g.,
  antiD(f(x)~x) -> F(x). To calculate the integral of f(x),
  use F(to) - F(from).
}
\note{
  \code{numerical_integration} is not intended for direct
  use.  It packages up the numerical anti-differentiation
  process so that the contents of functions produced by
  \code{antiD} look nicer to human readers.
}
\examples{
D(sin(t) ~ t)
D(A*sin(t) ~ t )
D(A*sin(2*pi*t/P) ~ t, A=2, P=10) # default values for parameters.
f <- D(A*x^3 ~ x + x, A=1) # 2nd order partial -- note, it's a function of x
f(x=2)
f(x=2,A=10) # override default value of parameter A
g <- D(f(x=t, A=1)^2 ~ t)  # note: it's a function of t
g(t=1)
gg <- D(f(x=t, A=B)^2 ~ t, B=10)  # note: it's a function of t and B
gg(t=1)
gg(t=1, B=100)
f <- makeFun(x^2~x)
D(f(cos(z))~z) #will look in user functions also
antiD( a*x^2 ~ x)
antiD( A/x~x )
F <- antiD( A*exp(-k*t^2 ) ~ t, A=1, k=0.1)
F(t=Inf)
one = makeFun(1~x&y)
by.x = antiD( one(x=x, y=y) ~x)
by.xy = antiD(by.x(x=sqrt(1-y^2), y=y)~y)
4*by.xy(y=1) #area of quarter circle
}

