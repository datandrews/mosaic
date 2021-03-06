\docType{data}
\name{SAT}
\alias{SAT}
\title{State by State SAT data}
\format{A data frame with 50 observations on the following variables.
  \itemize{
    \item{\code{state}} {a factor with names of each state}
    \item{\code{expend}} {expenditure per pupil in average daily attendance in
 public elementary and secondary schools, 1994-95 (in thousands of US dollars)}
    \item{\code{ratio}} {average pupil/teacher ratio in public elementary and secondary
schools, Fall 1994}
    \item{\code{salary}} {estimated average annual salary of teachers in public elementary
and secondary schools, 1994-95 (in thousands of US dollars)}
    \item{\code{frac}} {percentage of all eligible students taking the SAT, 1994-95}
    \item{\code{verbal}} {average verbal SAT score, 1994-95}
    \item{\code{math}} {average math SAT score, 1994-95}
    \item{\code{sat}} {average total SAT score, 1994-95}
  }}
\source{
  http://www.amstat.org/publications/jse/secure/v7n2/datasets.guber.cfm
}
\description{
  SAT data assembled for a statistics education journal
  article on the link between SAT scores and measures of
  educational expenditures
}
\examples{
data(SAT)
xyplot(sat ~ expend, SAT)
xyplot(sat ~ expend, SAT,
	panel=function(x,y){grid.text(abbreviate(SAT$state, 3), x, y, default.units='native')})
}
\references{
  Deborah Lynn Guber, "Getting what you pay for: the debate
  over equity in public school expenditures" (1999),
  \emph{Journal of Statistics Education} 7(2).
}
\keyword{datasets}

