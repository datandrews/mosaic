\name{Broyden}
\alias{Broyden}
\title{Multi-Dimensional Root Finding}
\usage{
  Broyden(system, vars, x = 0,
    tol = .Machine$double.eps^0.4, maxiters = 10000)
}
\arguments{
  \item{system}{A list of functions}

  \item{vars}{A character string list of variables that
  appear in the functions}

  \item{x}{A starting vector}

  \item{tol}{The tolerance for the function specifying how
  precise it will be}

  \item{maxiters}{maximum number of iterations.}
}
\description{
  Implementation of Broyden's root finding function to
  numerically compute the root of a system of nonlinear
  equations
}

