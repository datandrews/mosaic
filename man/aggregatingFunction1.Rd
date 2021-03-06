\name{aggregatingFunction1}
\alias{aggregatingFunction1}
\title{1-ary Aggregating functions}
\usage{
  aggregatingFunction1(fun, input.multiple = FALSE,
    output.multiple = FALSE, envir = parent.frame())
}
\arguments{
  \item{fun}{a function that takes a numeric vector and
  computes a summary statistic, returning a numeric vector
  of length 1.}

  \item{output.multiple}{a boolean indicating whether
  \code{..fun..} returns multiple values}

  \item{input.multiple}{a boolean indicating whether
  \code{..fun..} can accept 2 vectors (e.g., \code{var})}

  \item{envir}{an environment in which evaluation takes
  place.}
}
\value{
  a function that generalizes \code{fun} to handle a
  formula/data frame interface.
}
\description{
  \code{aggregatinFuntion1} creates statistical summaries
  of one numerical vector that are formula aware.
}
\examples{
foo <- aggregatingFunction1( base::mean )
foo( ~length, data=KidsFeet )
base::mean(KidsFeet$length)
foo( length ~ sex, data=KidsFeet )
}

