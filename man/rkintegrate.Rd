\name{rkintegrate}
\alias{rkintegrate}
\title{A simple Runge-Kutte integrator}
\usage{
  rkintegrate(fun, x0, tstart = 0, tend = 1, dt = NULL)
}
\arguments{
  \item{fun}{the dynamical function with arguments
  \code{state} (a vector) and \code{t}.}

  \item{x0}{the initial condition, a vector with one
  element for each state variable}

  \item{tstart}{starting time}

  \item{tend}{ending time for integration}

  \item{dt}{step size for integration}
}
\value{
  a list containing \code{x}, a matrix of the state with
  one row for each time step and a vector \code{t}
  containing the times of those steps.
}
\description{
  Integrates ordinary differential equations using a
  Runge-Kutta method
}
\details{
  This is mainly for internal use by integrateODE.
}
\author{
  Daniel Kaplan (\email{kaplan@macalester.edu})
}

