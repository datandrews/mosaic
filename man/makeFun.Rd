\name{makeFun}
\alias{makeFun}
\alias{makeFun,formula-method}
\alias{makeFun,glm-method}
\alias{makeFun,lm-method}
\alias{makeFun,nls-method}
\title{Create a function from a formula}
\arguments{
  \item{object}{an object from which to create a function.
  This should generally be specified without naming.}

  \item{\dots}{additional arguments in the form \code{var =
  val} that set default values for the inputs to the
  function.}

  \item{strict.declaration}{if \code{TRUE} (the default),
  an error is thrown if default values are given for
  variables not appearing in the \code{object} formula.}

  \item{use.environment}{if \code{TRUE}, then variables
  implicitly defined in the \code{object} formula can take
  default values from the environment at the time
  \code{makeFun} is called.  A warning message alerts the
  user to this situation, unless \code{suppress.warnings}
  is \code{TRUE}.}

  \item{suppress.warnings}{A logical indicating whether
  warnings should be suppressed.}

  \item{transform}{a function used to transform the
  response. This can be useful to invert a transformation
  used on the response when creating the model.}

  \item{type}{one of \code{'response'} (default) or
  \code{'link'} specifying scale to be used for value of
  function returned.}
}
\value{
  a function
}
\description{
  Provides an easy mechanism for creating simple
  "mathematical" functions via a formula interface.
}
\details{
  The definition of the function is given by the left side
  of a formula.  The right side lists at least one of the
  inputs to the function. The inputs to the function are
  all variables appearing on either the left or right sides
  of the formula.  Those appearing in the right side will
  occur in the order specified.  Those not appearing in the
  right side will appear in an unspecified order.
}
\examples{
f <- makeFun( sin(x^2 * b) ~ x & y & a); f
g <- makeFun( sin(x^2 * b) ~ x & y & a, a=2 ); g
h <- makeFun( a * sin(x^2 * b) ~ b & y, a=2, y=3); h
model <- lm( log(length) ~ log(width), data=KidsFeet)
f <- makeFun(model, transform=exp)
f(8.4)
head(KidsFeet,1)
model <- lm(wage ~ poly(exper,degree=2), data=CPS85)
fit <- makeFun(model)
xyplot(wage ~ exper, data=CPS85)
plotFun(fit(exper) ~ exper, add=TRUE)
model <- glm(wage ~ poly(exper,degree=2), data=CPS85, family=gaussian)
fit <- makeFun(model)
xyplot(wage ~ exper, data=CPS85)
plotFun(fit(exper) ~ exper, add=TRUE)
model <- nls( wage ~ A + B * exper + C * exper^2, data=CPS85, start=list(A=1,B=1,C=1) )
fit <- makeFun(model)
xyplot(wage ~ exper, data=CPS85)
plotFun(fit(exper) ~ exper, add=TRUE)
}

