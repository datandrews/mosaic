\name{fetchData}
\alias{fetchData}
\title{A Web and Library Data-Loading Facility}
\usage{
  fetchData(name = NULL, show.path = FALSE,
    add.to.path = NULL, drop.from.path = NULL,
    cache = FALSE, verbose = TRUE)
}
\arguments{
  \item{name}{a character string naming a data set.  This
  will often end in \code{.csv} for reading in a data set.
  If it ends in \code{.r} or \code{.R}, the file will be
  "sourced".}

  \item{show.path}{If \code{TRUE}, causes the current
  search path to be returned}

  \item{add.to.path}{Name of a web directory (ending in
  \code{/}), which should be pre-pended to the search
  path.}

  \item{drop.from.path}{Name of a web directory to be
  deleted from the path.}

  \item{cache}{If \code{TRUE}, indicates that a data set is
  to be pre-loaded into the cached library.  This allows,
  for instance, users to pre-load on-line data to be used
  when they are off-line.}

  \item{verbose}{a logical indicating whether additional
  status messages (e.g., indicating where the dataset was
  located) should be printed.}
}
\value{
  a data frame.
}
\description{
  \code{fetchData} provides a means for students and others
  to locate and load data sets and R commands provided by
  instructors. Data can be pre-loaded for off-line
  sessions, can be positioned on identified web sites, or
  loaded from packages. \code{fetchData} also will load
  local files using a complete path name (relative to the
  current working directory) or, if no name is given, via a
  dialog box.
}
\details{
  There are two major purposes for this function. One is to
  provide a consistent interface to reading data: a file
  name is given and a data frame is returned, which can be
  assigned to an object as the user desires.  This differs
  from the behavior of \code{data}, which doesn't return a
  value but instead creates an object without explicit
  assignment.

  The other purpose is to allow instructors or other group
  leaders to post data and R code on web sites that can be
  searched as naturally as if the data were on the users'
  own machines.  For instance, an instructor might want to
  post a new data set just before class, enabling her
  students to access it in class.

  To support this, \code{fetchData} allows new web sites to
  be added to the web search path.  Typically, the command
  to add a site would be in a script file that is provided
  to the student that could be run automatically at start
  up or \code{source}d over the web.  That is, an
  instructor might create a script file stored on a website
  and, using a web page, provide students with the text of
  the command to \code{source} it.

  Currently, https addresses are changed to http
}
\examples{
\dontrun{dome <- fetchData("Dome.csv")}
\dontrun{carbon <- fetchData("CO2")}
\dontrun{fetchData(show=TRUE)}
\dontrun{fetchData(add.to.path="http://www.macalester.edu/~kaplan/ISM/datasets/")}
\dontrun{fetchData(drop.from.path="http://www.macalester.edu/~kaplan/ISM/datasets/") }
\dontrun{dome <- fetchData("Dome.csv", cache=TRUE)}
}
\keyword{util}

