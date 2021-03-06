\name{fitModel}
\alias{coef.nlsfunction}
\alias{fitModel}
\alias{model}
\alias{model.nlsfunction}
\alias{summary.nlsfunction}
\title{Fit a nonlinear least squares model}
\usage{
  fitModel(formula, data = parent.frame(), start = list(),
    ...)

  model(object, ...)

  \method{model}{nlsfunction} (object, ...)

  \method{summary}{nlsfunction} (object, ...)

  \method{coef}{nlsfunction} (object, ...)
}
\arguments{
  \item{formula}{formula specifying the model}

  \item{data}{dataframe containing the data to be used}

  \item{start}{passed as \code{start} to \code{\link{nls}}.
  If and empty list, a simple starting point is used (thus
  avoiding the usual warning message).}

  \item{\dots}{additional arguments passed to
  \code{\link{nls}}}

  \item{object}{an R object (typically a the result of
  fitModel)}
}
\value{
  a function
}
\description{
  Allows you to specify a formula with parameters, along
  with starting guesses for the parameters.  Refines those
  guesses to find the least-squares fit.
}
\details{
  Fits a nonlinear least squares model to data.  In
  contrast to linear models, all the parameters (including
  linear ones) need to be named in the formula.  The
  function returned simply contains the formula together
  with pre-assigned arguments setting the parameter value.
  Variables used in the fitting (as opposed to parameters)
  are unassigned arguments to the returned function.
}
\note{
  This doesn't work with categorical explanatory variables.
}
\examples{
f <- fitModel(temp ~ A+B*exp(-k*time), data=CoolingWater, start=list(A=50,B=50,k=1/20))
f(time=50)
coef(f)
summary(f)
model(f)
}
\seealso{
  \code{\link{linearModel}}, \code{\link{nls}}
}

