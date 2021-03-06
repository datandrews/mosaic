\docType{data}
\name{Births78}
\alias{Births78}
\title{US Births in 1978}
\format{A data frame with 365 observations on the following variables.
  \itemize{
    \item{\code{date}} {date in 1978}
    \item{\code{births}} {number of US births}
    \item{\code{dayofyear}} {sequential number of days from 1 to 365}
  }}
\description{
  A day by day record of the number of births in the United
  States in 1978.
}
\examples{
data(Births78)
xyplot(births ~ dayofyear, Births78)
xyplot(births ~ dayofyear, Births78, groups=dayofyear\%\%7)
}
\keyword{datasets}

