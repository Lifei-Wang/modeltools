# maxent_utils.R


#' Read MaxEnt results from a text file
#'
#'
#' @export
#' @param filename the fully qualified filename to read
#' @return a matrix of results as per MaxEnt@results
maxent_read_results <- function(filename){
   stopifnot(file.exists(filename[1]))
   t(as.matrix(read.csv(filename[1], stringsAsFactors = FALSE)))
}

#' Retrieve the names of the input variables of a maxent model
#'
#' @export
#' @param object a MaxEnt model
#' @return characater vector of variable names
#'  
maxent_get_varnames <- function(object){
   stopifnot(inherits(object, 'MaxEnt'))
   colnames(object@presence)
}

#' Retrieve the results of a MaxEnt model by name
#'
#' @export
#' @param object a MaxEnt model
#' @param name the result name
#' @return numeric, matrix or vector depending upon what is requested
maxent_get_results <- function(object, name){
   stopifnot(inherits(object, 'MaxEnt'))
   nm <- tolower(name[1])
   if (nm == 'contribution'){
      vn <- maxent_get_varnames(object)
      x <- object@results[paste0(vn,".contribution"),]
   } else if (nm == 'importance'){
      vn <- maxent_get_varnames(object)
      x <- object@results[paste0(vn,".permutation.importance"),]
   } else if(nm == 'auc'){
      x <- object@results['Training.AUC',]
   } else{
      x <- object@results[name,]
   }
   x
}

