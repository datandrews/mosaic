\name{dfapply}
\alias{dfapply}
\title{apply-type function for data frames}
\usage{
  dfapply(data, FUN, select = is.numeric, ...)
}
\arguments{
  \item{data}{data frame}

  \item{FUN}{a function to apply to (some) variables in the
  data frame}

  \item{select}{function used to select variables to which
  \code{FUN} is applied.  See examples.}

  \item{\dots}{arguments passed along to \code{FUN}}
}
\description{
  An \code{apply}-type function for data frames.
}
\examples{
dfapply(iris, favstats)
dfapply(HELPrct, table, select=is.factor)
}
\seealso{
  \code{\link{apply}}, \code{\link{sapply}},
  \code{\link{tapply}}, \code{\link{lapply}}
}

