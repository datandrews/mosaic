\name{aggregatingFunction2}
\alias{aggregatingFunction2}
\title{2-ary Aggregating functions}
\usage{
  aggregatingFunction2(fun)
}
\arguments{
  \item{fun}{a function that takes two numeric vectors and
  computes a summary statistic, returning a numeric vector
  of length 1.}
}
\value{
  a function that generalizes \code{fun} to handle a
  formula/data frame interface.
}
\description{
  \code{aggregatinFuntion2} creates statistical summaries
  of two numerical vectors that are formula aware.
}
\examples{
foo <- aggregatingFunction2( stats::cor)
foo( length ~ width, data=KidsFeet )
stats::cor( KidsFeet$length, KidsFeet$width )
}

