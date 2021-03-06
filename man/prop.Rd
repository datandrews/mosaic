\name{prop}
\alias{count}
\alias{perc}
\alias{prop}
\title{Compute proportions, percents, or counts for a single level}
\usage{
  prop(x, data = parent.frame(), ..., level = NULL,
    long.names = TRUE, sep = ".", format = "proportion")

  count(x, data = parent.frame(), ..., format = "count")

  perc(x, data = parent.frame(), ..., format = "percent")
}
\arguments{
  \item{x}{an R object, usually a formula}

  \item{data}{a data frame in which \code{x} is to be
  evaluated}

  \item{\dots}{arguments passed through to
  \code{\link{tally}}}

  \item{level}{the level for which counts, proportions or
  percents are calculated}

  \item{long.names}{a logical indicating whether long names
  should be when there is a conditioning variable}

  \item{sep}{a character used to separate portions of long
  names}

  \item{format}{one of \code{proportion}, \code{percent},
  or \code{count}, possibly abbrevaited}
}
\description{
  Compute proportions, percents, or counts for a single
  level
}
\examples{
prop( ~sex, data=HELPrct)
prop( ~sex, data=HELPrct, level='male')
count( ~sex | substance, data=HELPrct)
prop( ~sex | substance, data=HELPrct)
perc( ~sex | substance, data=HELPrct)
}

