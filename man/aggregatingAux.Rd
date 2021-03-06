\name{maggregate}
\alias{maggregate}
\title{Aggregate for mosaic}
\usage{
  maggregate(formula, data = parent.frame(), FUN, subset,
    overall = mosaic.par.get("aggregate.overall"),
    method = c("default", "ddply"), drop = FALSE,
    multiple = FALSE, groups = NULL,
    .name = deparse(substitute(FUN)), ...)
}
\arguments{
  \item{formula}{a formula.  Left side provides variable to
  be summarized.  Right side and condition describe
  subsets.  If the left side is empty, right side and
  condition are shifted over as a convenience.}

  \item{data}{a data frame}

  \item{FUN}{a function to apply to each subset}

  \item{subset}{a logical indicating a subset of
  \code{data} to be processed.}

  \item{drop}{a logical indicating whether unused levels
  should be dropped.}

  \item{method}{used for aggregation.  Choosing
  \code{"ddply"} requires that \pkg{plry} is installed.}

  \item{overall}{currently unused}

  \item{.name}{a name used for the resulting object}

  \item{groups}{grouping variable that will be folded into
  the formula (if there is room for it). This offers some
  additional flexibility in how formulas can be specified.}

  \item{multiple}{a logical indicating whether FUN returns
  multiple values}

  \item{\dots}{additional arguments passed to \code{FUN}}
}
\value{
  a vector
}
\description{
  Compute function on subsets of a variable in a data
  frame.
}
\examples{
maggregate( cesd ~ sex, HELPrct, FUN=mean )
# using groups instead
maggregate( ~ cesd, groups = sex, HELPrct, FUN=sd )
# the next four all do the same thing
maggregate( cesd ~ sex & homeless, HELPrct, FUN=mean )
maggregate( cesd ~ sex | homeless, HELPrct, FUN=sd )
maggregate( ~ cesd | sex , groups= homeless, HELPrct, FUN=sd )
maggregate( cesd ~ sex, groups = homeless, HELPrct, FUN=sd )
# this is unusual, but also works.
maggregate( cesd ~ NULL , groups = sex, HELPrct, FUN=sd )
}

