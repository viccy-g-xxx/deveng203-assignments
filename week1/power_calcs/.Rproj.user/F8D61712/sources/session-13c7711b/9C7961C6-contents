# library(stats)

#' @title min_samp_comp
#' Given distribution parameters and MDE, compute sample size
#' @param bl_sd SD of baseline
#' @param mde minimum detectable effect 
#' @param pow power 
#' @param alph significance
#' @param p_treat probability of treatment
#' @return minimum sample size
#' @examples
#' # example code
#' n <- min_samp_comp(0, 1, 0.2, 0.8, 0.05, 0.5);
#' @import stats
#' @export
min_samp_comp <- function(bl_sd, mde, pow, alph, p_treat) {
  
  min_n <- (1/(p_treat*(1-p_treat)))*(bl_sd^2)*
    (qnorm(1-alph / 2) + qnorm(pow))^2 / ((mde)^2)
  
  return(ceiling(min_n))
}

