\name{fetchGoogle}
\alias{fetchGoogle}
\title{Fetch data from a web service}
\usage{
  fetchGoogle(URL, key = NULL)
}
\arguments{
  \item{URL}{the URL to retrieve a CSV file from the
  service}

  \item{key}{for convenience, just the "key" part of the
  Google link}
}
\description{
  Read a data set generated from a web service such as
  Google Docs.
}
\details{
  Web services such as Google Docs allow you to store
  spreadsheets "in the cloud".  By setting permissions in
  the service, you can arrange to make the data set public,
  so that anyone with an appropriate URL can access the
  data. Reading such data into R can be done simply if the
  service supports exporting the data in a CSV format via
  URL link.  For instance, Google Spreadsheets can be set
  up to publish a spreadsheet via a URL. Unfortunately, the
  \code{read.csv()} function, although able to read URLs
  pointing to a file, cannot handle the protocol needed to
  talk to services such as Google Docs.
  \code{fetchGoogle()} allows you to do this.
  \code{fetchGoogle()} derives its functionality from the
  RCurl package, which must be installed for the function
  to work.  RCurl will be loaded automatically if it is
  installed. Generating the URL from the web service will,
  of course, depend on how that service is set up.  For
  Google Spreadsheets, you, the owner of a spreadsheet, can
  (1) open the spreadsheet in a browser (2) select the
  File/Publish to the Web menu item (3) in the resulting
  dialog box, press "Start publishing" (4) under "Get a
  link to the published data", select CSV format (5) copy
  the \code{https://docs.google.com/spreadsheet/pub?...}
  link and post it where your users can get to it.
}
\note{
  The URL must instruct the service to generate a CSV file.
  The URLs from Google Docs are very long and contain
  random-looking sequences.  You may want to post the URL
  on a web page whence it can be cut and paste as part of
  the command. The \code{key=} argument is provided as a
  convenience so that a shorter character string can be
  used to refer to a Google document.  Use \code{URL}
  rather than \code{key} if you are using a non-Google
  service or if the Google interface changes.
  \code{fetchData()} expects the spreadsheet to be in a
  straightforward rectangular spreadsheet format.
}
\examples{
\dontrun{s = fetchGoogle(key="0Am13enSalO74dEVzMGJSMU5TbTc2eWlWakppQlpjcGc")}
}
\author{
  Daniel Kaplan (\email{kaplan@macalester.edu})
}

