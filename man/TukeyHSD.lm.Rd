\name{TukeyHSD.lm}
\alias{TukeyHSD.formula}
\alias{TukeyHSD.lm}
\title{Additional interfaces to TukeyHSD}
\usage{
  \method{TukeyHSD}{lm} (x, which, ordered = FALSE,
    conf.level = 0.95, ...)

  \method{TukeyHSD}{formula} (x, which, ordered = FALSE,
    conf.level = 0.95, data = parent.frame(), ...)
}
\arguments{
  \item{x}{an object, for example of class \code{lm} or
  \code{formula}}

  \item{data}{a data frame.  NB: This does not come second
  in the argument list.}

  \item{which,ordered,conf.level,\dots}{just as in
  \code{\link{TukeyHSD}} from the \code{base} package}
}
\description{
  \code{\link{TukeyHSD}} requires use of \code{\link{aov}}.
  Since this is a hinderence for beginners, wrappers have
  been provided to remove this need.
}
\examples{
## These should all give the same results
model <- lm(age ~ substance, data=HELPrct)
TukeyHSD(model)
TukeyHSD( age ~ substance, data=HELPrct)
TukeyHSD(aov(age ~ substance, data=HELPrct))
}

