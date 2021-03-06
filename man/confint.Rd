\name{confint.numeric}
\alias{confint.data.frame}
\alias{confint.do.data.frame}
\alias{confint.numeric}
\title{Confidence interval methods for output of resampling}
\usage{
  \method{confint}{numeric} (object, parm, level = 0.95,
    ..., method = "stderr",
    margin.of.error = "stderr" \%in\% method == "stderr")

  \method{confint}{do.data.frame} (object, parm,
    level = 0.95, ..., method = "stderr",
    margin.of.error = "stderr" \%in\% method)

  \method{confint}{data.frame} (object, parm, level = 0.95,
    ...)
}
\arguments{
  \item{object}{The data frame or numerical vector.}

  \item{parm}{not used -- for compatibility with other
  confint methods}

  \item{level}{confidence level (default 0.95)}

  \item{\dots}{additional arguments (currently ignored)}

  \item{method}{either "stderr" (default) or "quantile".
  ("se" and "percentile" are allowed as aliases) or a
  vector containing both.}

  \item{margin.of.error}{if true, report intervals as a
  center and margin of error.}
}
\value{
  When applied to a data frame, returns a data frame giving
  the confidence interval for each variable in the data
  frame using \code{t.test} or \code{binom.test}, unless
  the data frame was produced using \code{do}, in which
  case it is assumed that each variable contains resampled
  statistics that serve as an estimated sampling
  distribution from which a confidence interval can be
  computed using either a central proportion of this
  distribution or using the standard error as estimated by
  the standard deviation of the estimated sampling
  distribution.  When applied to a numerical vector,
  returns a vector.
}
\description{
  Methods for \code{confint} to compute confidence
  intervals on numerical vectors and numerical components
  of data frames.
}
\examples{
s <- do(500)*mean( age ~ sex, data=resample(HELPrct) )
confint(s)
confint(s, method="quantile")
confint(s, margin.of.error=TRUE)
confint(s, margin.of.error=TRUE, level=0.99 )
s2 <- do(500)*mean( resample(1:10) )
confint(s2)
}

