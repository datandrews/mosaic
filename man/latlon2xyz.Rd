\name{xyz2latlon}
\alias{latlon2xyz}
\alias{xyz2latlon}
\title{Convert back and forth between latitude/longitude and XYZ-space}
\usage{
  xyz2latlon(x, y, z)

  latlon2xyz(latitude, longitude)
}
\arguments{
  \item{x,y,z}{numeric vectors}

  \item{latitude,longitude}{vectors of latitude and
  longitude values}
}
\value{
  a matrix each row of which describes the latitudes and
  longitudes

  a matrix each row of which contains the x, y, and z
  coordinates of a point on a unit sphere
}
\description{
  Convert back and forth between latitude/longitude and
  XYZ-space
}
\examples{
xyz2latlon(1, 1, 1)     # point may be on sphere of any radius
xyz2latlon(0, 0, 0)     # this produces a NaN for latitude
latlon2xyz(45, 45)
}
\seealso{
  \code{\link{deg2rad}}, \code{\link{googleMap}}, and
  \code{\link{rgeo}}.
}

