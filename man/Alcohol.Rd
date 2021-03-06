\docType{data}
\name{Alcohol}
\alias{Alcohol}
\title{Alcohol Consumption per Capita}
\format{A data frame with 411 observations on the following variables.
  \itemize{
    \item{\code{country}} {country name}
    \item{\code{year}} {year}
    \item{\code{alcohol}} {per capita alcohol consumption}
  }}
\source{
  Gapminder (http://www.gapminder.org/)
}
\description{
  These data provide per capita alcohol consumption values
  for many countries in 2005 and 2008.  There are also a
  few countries for which there are data in other years.
}
\examples{
data(Alcohol)
# There are only a few observations in years other than 2005 and 2008
subset(Alcohol, ! year \%in\% c(2005,2008))
}
\references{
  http://www.fvgreenway.org/pdfs/Northampton-Bikepath-Volume-Counts%20_05_LTA.pdf
}
\keyword{datasets}

