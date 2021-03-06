#' Do Things Repeatedly
#' 
#' \code{do()} provides a natural syntax for repetition tuned to assist 
#' with replication and resampling methods.
#'
#' @param n  number of times to repeat 
#'
#' @param cull  function for culling output of objects being repeated.  If NULL,
#'   a default culling function is used.  The default culling function is 
#'   currently aware of objects of types
#'   \code{lme},
#'   \code{lm},
#'   \code{htest},
#'   \code{table},
#'   \code{cointoss}, and 
#'   \code{matrix}.
#'   
#' @param mode  target mode for value returned
#' 
#' @return \code{do} returns an object of class \code{repeater} which is only useful in
#' the context of the operator \code{*}.  See the examples.
#' @author Daniel Kaplan (\email{kaplan@@macalaster.edu})
#' and Randall Pruim (\email{rpruim@@calvin.edu})
#'
#' @seealso \code{\link{replicate}}
#' 
#' @export
#' @examples
#' do(3) * rnorm(1)
#' do(3) * "hello"
#' do(3) * lm(shuffle(height) ~ sex + mother, Galton)
#' do(3) * summary(lm(shuffle(height) ~ sex + mother, Galton))
#' do(3) * 1:4
#' do(3) * mean(rnorm(25))
#' do(3) * c(mean = mean(rnorm(25)))
#' do(3) * tally( ~sex|treat, data=resample(HELPrct))
#' 
#' @keywords iteration 
#' 

do <- function(n=1L, cull=NULL, mode=NULL) {
	new( 'repeater', n=n, cull=cull, mode=mode )
}

#' @rdname mosaic-internal
#' @keywords internal
#' @details
#' \code{.make.data.frame} converts things to a data frame
#' @param x object to be converted
#' @return a data frame

.make.data.frame <- function( x ) {
	if (is.data.frame(x)) return(x)
	if (is.vector(x)) {
		nn <- names(x)
		result <- as.data.frame( matrix(x, nrow=1) )
		if (! is.null(nn) ) names(result) <- nn
		return(result)
	}
	return(as.data.frame(x))
	}

#' @rdname mosaic-internal
#' @keywords internal
#' @details
#' \code{.clean_names} removes unwanted characters from character vector
#' @param x a character vector
#' @return a character vector
 
.clean_names <- function(x) {
	x <- gsub('\\(Intercept\\)','Intercept', x)
	x <- gsub('resample\\(','', x)
	x <- gsub('sample\\(','', x)
	x <- gsub('shuffle\\(','', x)
	x <- gsub('\\(','.', x)
	x <- gsub('-','.', x)
	x <- gsub(':','.', x)
	x <- gsub('\\)','', x)
	return(x)
}

#' Repeater objects
#'
#' Repeater objects can be used with the \code{*} operator to repeat
#' things multiple time using a different syntax and different output
#' format from that used by, for example, \code{\link{replicate}}.
#'
#' @rdname repeater-class
#' @name repeater-class
#' @exportClass repeater
#' @seealso \code{\link{do}}
#' @section Slots:
#' \describe{
#'   \item{\code{n}:}{Object of class \code{"numeric"} indicating how many times to repeat something.}
#'   \item{\code{cull}:}{Object of class \code{"function"} that culls the ouput from each repetition.}
#'   \item{\code{mode}:}{Object of class \code{"character"} indicating the output mode (NULL or 'data.frame' or 'list').}
#' }

setClass('repeater', 
	representation = representation(n='numeric', cull='ANY', mode='ANY'),
	prototype = prototype(n=1, cull=NULL, mode=NULL)
)


# old version
if(FALSE) {
.merge_data_frames <- function(a, b) {
  a <- .make.data.frame(a)
  b <- .make.data.frame(b)
  if (nrow(b) < 1) return (a) 
  if (nrow(a) < 1) return (b) 

	a$mosaic_merge_id <- paste('A',1:nrow(a))
	b$mosaic_merge_id <- paste('B',1:nrow(b))
	result <- merge(a,b,all=TRUE)
	w <- which(names(result) == 'mosaic_merge_id')
	result <- result[, -w]
	return(result)
}
}


#' @rdname mosaic-internal
#' @keywords internal
#' @details \code{.merge_data_frames} is a wrapper around merge
#'
#' @param a a data frame
#' @param b a data frame
#'
#' @return a data frame 

.merge_data_frames = function(a,b) {
  a <- .make.data.frame(a)
  b <- .make.data.frame(b)
  if (nrow(b) < 1) return (a) 
  if (nrow(a) < 1) return (b) 
  missing.from.b = setdiff(names(a),names(b))
  missing.from.a = setdiff(names(b),names(a))
  for (var in missing.from.b) b[[var]] = NA
  for (var in missing.from.a) a[[var]] = NA
  rbind(a,b)
}


#' @rdname mosaic-internal
#' @keywords internal
#' @details 
#' \code{.squash_names} squashes names of a data frame into a single string
#'
#' @param object an object
#' @param sep a character
#'
#' @return a character vector

.squash_names <- function(object,sep=":") {
	if ( ncol(object) < 1 ) {return(rep("",nrow(object)))}

	result <- object[,1]
	if ( ncol(object) < 2 ) {return(as.character(result))}

	for (c in 2:ncol(object)) {
		result <- paste(result, as.character(object[,c]), sep=sep)
	}
	return(result)
		
}

#' @rdname mosaic-internal
#' @keywords internal
#' @details
#' \code{.cull_for_do} handles objects like models to do the right thing for \code{do}
# 
#' @return an object reflecting some of the information contained in \code{object}

.cull_for_do = function(object) {
  if (inherits(object, "aov")) {
    object <- anova(object)
  }
  if (inherits(object, "anova")) {
    res <- as.data.frame(object)
    res <- cbind (data.frame(source=row.names(res)), res)
    names(res)[names(res) == "Df"] <- "df"
    names(res)[names(res) == "Sum Sq"] <- "SS"
    names(res)[names(res) == "Mean Sq"] <- "MS"
    names(res)[names(res) == "F value"] <- "F"
    names(res)[names(res) == "Pr(>F)"] <- "pval"
    names(res)[names(res) == "Sum of Sq"] <- "diff.SS"
    names(res)[names(res) == "Res.Df"] <- "res.df"
    return(res)
    return( data.frame(
      SSTotal= sum(object$`Sum Sq`),
      SSModel= object$`Sum Sq`[1],
      SSError= object$`Sum Sq`[2],
      MSTotal= sum(object$`Sum Sq`),
      MSModel= object$`Mean Sq`[1],
      MSError= object$`Mean Sq`[2],
      F=object$`F value`[1],
      dfModel=object$Df[1],
      dfError=object$Df[2],
      dfTotal=sum(object$Df)
    ) )
  }
  if (any(class(object)=='table')){
    result <- data.frame(object)
    res <- result[[ncol(result)]]
    nms <- as.character(result[[1]])
    if (ncol(result) > 2) {
      for (k in 2:(ncol(result)-1)) {
        nms <- paste(nms, result[[k]],sep=".")
      }
    }
    names(res) <- nms
    return(res)
  }
	if (any(class(object)=='aggregated.stat')) {
		result <- object
		res <- as.vector(result[, "S"])  # ncol(result)]
		names(res) <- paste( attr(object,'stat.name'), 
						.squash_names(object[,1:(ncol(object)-3),drop=FALSE]), sep=".")
		return(res)
	} #
	if (any(class(object)=='lme')){ # for mixed effects models
		result <- object
		names(result) <- .clean_names(names(result))
		return( object$coef$fixed )
	}
	if (inherits(object,c('lm','groupwiseModel')) ) {
		sobject <- summary(object)
		result <-  c( coef(object), sigma=sobject$sigma, r.squared = sobject$r.squared ) 
		names(result) <- .clean_names(names(result))
		return(result)
	}
	if (any(class(object)=='htest') ) {
		result <-  data.frame( 
					  statistic = object$statistic, 
		              parameter = object$parameter,
					  p.value = object$p.value,
					  conf.level = attr(object$conf.int,"conf.level"),
					  lower = object$conf.int[1],
					  upper = object$conf.int[2],
					  method = object$method,
					  alternative = object$alternative,
					  data = object$data.name
					  )
		if ( ! is.null( names(object$statistic) ) ) names(result)[1] <- names(object$statistic)
		return(result)
	}
	if (any(class(object)=='table') ) {
		nm <- names(object)
		result <-  as.vector(object)
		names(result) <- nm
		return(result)
	}
	if (any(class(object)=='cointoss')) {
		return( c(n=attr(object,'n'), 
				heads=sum(attr(object,'sequence')=='H'),
				tails=sum(attr(object,'sequence')=='T'),
        prop=sum(attr(object,'sequence')=="H") / attr(object,'n')
				) )
	}
	if (is.matrix(object) && ncol(object) == 1) {
		nn <- rownames(object)
		object <- as.vector(object)
		if (is.null(nn)) {
			names(object) <- paste('v',1:length(object),sep="")
		} else {
			names(object) <- nn
		}
		return(object)
	}
	return(object) }

#' @rdname do
#' @aliases print,repeater-method
#' @usage
#' \S4method{print}{repeater}(x, ...) 
setMethod("print",
    signature(x = "repeater"),
    function (x, ...) 
    {
  		print(paste('This repeats a command',x@n,'times. Use with *.'))
  		return(invisible(x))
    }
)

#' @rdname do
#' @aliases *,repeater,ANY-method
#' @usage
#' \S4method{*}{repeater,ANY}(e1, e2) 

setMethod("*",
    signature(e1 = "repeater", e2="ANY"),
    function (e1, e2) 
    {
		fthing = substitute(e2)
		if ( ! is.function(e2) ) {
			e2 = function(){eval.parent(fthing, n=2) }   
		}
		n = e1@n

		cull = e1@cull
		if (is.null(cull)) {
			cull <- .cull_for_do
		}

		res1 = cull(e2())  # was (...)

		nm = names(res1)

		if (!is.null(e1@mode)) { 
			out.mode <- e1@mode 
		} else {
			out.mode <- 'list'

			if ( is.vector( res1) || is.data.frame(res1) ) {
				if (is.null(nm)) { 
					out.mode <- 'matrix' 
				} else {
					out.mode <- 'data.frame'
				}
			}
		}


		if ( out.mode == 'list' ) {
			result <- list()
			result[[1]] <- res1
			if (n < 2) return (res1) 
			for (k in 2:n) {
				result[[k]] <- cull(e2()) # was (...)
			}
			return(result)
		}

		if (out.mode == 'data.frame') {
			result <- .make.data.frame(res1)
      result$do.ind <- 1
      result$do.row <- 1:nrow(result)
			if (n>1) {
			  for (k in 2:n) {
			  	res2 <- .make.data.frame(cull(e2()))
          res2$do.ind <- k
          res2$do.row <- 1:nrow(res2)
				# print(res2)
				# result <- rbind( result, cull(e2()) ) 
				  result <- .merge_data_frames( result, res2)
			  }
			}
			# rownames(result) <- 1:nrow(result)
			# names(result) <- nm
      # mark result as having originated with do()
      if (all(result$do.row == 1)) { result[["do.row"]] <- NULL; result[["do.ind"]] <- NULL }
      
      class(result) <- c(paste('do', class(result)[1], sep="."), class(result))
			return(result)
		}

		result <- matrix(nrow=n,ncol=length(res1))
		result[1,] <- res1

		if (n > 1) {
			for (k in 2:n) {
				result[k,] <- cull(e2()) # was (...)
			}
		}

		if (dim(result)[2] == 1 & is.null(nm) ) result <- data.frame(result=result[,1]) 

    class(result) <- c(paste("do",class(result)[1], sep="."), class(result))
    return(result)
	}
)
