\name{columns}
\alias{columns}
\alias{rows}
\title{return a vector of row or column indices}
\usage{
  columns(x, default = c())

  rows(x, default = c())
}
\arguments{
  \item{x}{an object that may or may not have any rows or
  columns}

  \item{default}{what to return if there are no rows or
  columns}
}
\value{
  if \code{x} has rows or columns, a vector of indices,
  else \code{default}
}
\description{
  return a vector of row or column indices
}
\examples{
dim(HELPrct)
columns(HELPrct)
rows(HELPrct)
columns(NULL)
columns("this doesn't have columns")
}

