\docType{data}
\name{SwimRecords}
\alias{SwimRecords}
\title{100 m Swimming World Records}
\format{A data frame with 62 observations of the following variables.
  \itemize{
      \item \code{time} time (in seconds) of the world record
      \item \code{year} Year in which the record was set
      \item \code{sex} a factor with levels \code{M} and \code{F}
  }}
\description{
  World records for men and women over time from 1905
  through 2004.
}
\examples{
data(SwimRecords)
xyplot(time~year, data=SwimRecords, groups=sex)
}
\keyword{datasets}

