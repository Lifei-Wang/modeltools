# ROCR_utils.R

# Get AUC value
# performance(pred, "auc")@y.values[[1]]
#' Retrieve AUC from the performance function
#'
#' @export
#' @param pred a ROCR prediction object
#' return numeric AUC value
ROCR_get_AUC <- function(pred){
   ROCR::performance(pred, "auc")@y.values[[1]]
}