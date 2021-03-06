\name{sp2df}
\alias{sp2df}
\title{Map Utilities}
\usage{
  sp2df(map, ...)
}
\arguments{
  \item{map}{a map object of class
  \code{SpatialPolygonsDataFrame}}

  \item{...}{other arguments, currently ignored}
}
\description{
  Some utilities for working with map data
}
\examples{
\dontrun{
if(require(maptools)) {
  data(wrld_simpl)
  worldmap <- sp2df(wrld_simpl)
}

if ( require(ggplot2) && require(maptools) && require(plyr) ) {
  data(wrld_simpl)
  World <- sp2df(wrld_simpl)
  World2 <- merge(World, Countries, by.x="NAME", by.y="maptools", all.y=FALSE)
  Mdata <- merge(Alcohol, World2, by.x="country", by.y="gapminder", all.y=FALSE)
  Mdata <- Mdata[order(Mdata$order),]
  qplot( x=long, y=lat, fill=ntiles(alcohol,5),
         data=subset(Mdata, year==2008), group = group,
                     geom="polygon")
}
}
}

