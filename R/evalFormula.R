#' Evaluate a formula 
#' 
#' @param formula a formula (\code{ y ~ x | z}) to evaluate
#' @param data a data frame or environment in which evaluation occurs
#' @return a list containing data frames corresponding to the left, right, and condition
#' slots of \code{formula}
#' @param ops a vector of operator symbols allowable to separate variables in rhs
#'
#' @param subset an optional vector describing a subset of the observations to be used.  
#' Currently only implemented when data is a data frame.
#'
#' @export
#' @examples
#' data(CPS85)
#' cps <- CPS85[1:6,]
#' cps
#' evalFormula(wage ~ sex & married & age | sector & race, data=cps)

evalFormula <- function(formula, data=parent.frame(), subset, ops=c('+','&')) {
	# could make this an S4 object instead

	# core of subset() copied into here
    if (!missing(subset) && is.data.frame(data)) {
        e <- substitute(subset)
        r <- eval(e, data, parent.frame())
        if (!is.logical(r)) 
            stop("'subset' must evaluate to logical")
        r <- r & !is.na(r)
		index <- which( rep(r, out.length=nrow(data)) )
    	data <- data[r, , drop = FALSE]
    } else {
		index <- NA
	}

	result <- list(
				 left      = evalSubFormula(      lhs(formula), ops=ops, data), 
				 right     = evalSubFormula(      rhs(formula), ops=ops, data), 
				 condition = evalSubFormula(condition(formula), ops=ops, data),
				 index     = index 
				 ) 
	return(result)
}

# evalSubFormula and evalFormula could be made methods with a common generic

#' Evaluate a part of a formula
#'
#' @param x an object appearing as a subformula (typically a call)
#' @param data a data fram or environment in which things are evaluated
#' @param ops a vector of operators that are not evaluated as operators but
#'      instead used to further split \code{x}
#' @return a data frame containing the terms of the evaluated subformula
#' @export
#' @examples
#' data(CPS85)
#' cps <- CPS85[1:6,]
#' cps
#' evalSubFormula( rhs( ~ married & sector), data=cps )

evalSubFormula <- function(x, data=parent.frame(), ops=c('+','&') ){
  if (is.null(x)) return(NULL)
  if( is.name(x) || !(as.character(x[[1]]) %in% ops) ) {
    res <- data.frame(eval(x, envir=data))
    names(res) <- deparse(x)
    return( res )
  }
  else return(joinFrames( evalSubFormula(x[[2]],data), evalSubFormula(x[[3]],data)))
}

#' Join data frames
#'
#' @param left,right data frames
#' @param \dots data frames to be joined
#' @rdname joinFrames
#' @return a data frame containing columns from each of data frames being joined.
#' @export

joinFrames <- function(...) {
	dots <- list(...)
	if (length(dots) == 0) return(NULL)
	if (length(dots) == 1) return(dots[[1]])
	if (length(dots) == 2) return(joinTwoFrames(dots[[1]],dots[[2]]))
	first <- dots[[1]]; dots[[1]] <- NULL
	return( joinTwoFrames( first, do.call(joinFrames, dots)) )
} 

#' @rdname joinFrames
joinTwoFrames <- function(left, right){
    if( is.null(right)) return(left)
    if( is.null(left)) return(right)
    # this is to keep names like "cross(sex,hair)" intact
    result <-  data.frame(left, right)
    names(result) <- c((names(left)),(names(right)))
    return(result)
} 

