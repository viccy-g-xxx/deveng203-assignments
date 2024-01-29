library(stats)

min_samp_comp <- function(bl_sd, mde, pow, alph, p_treat) {

  min_n <- (1/(p_treat*(1-p_treat)))*(bl_sd^2)*
    (qnorm(1-alph / 2) + qnorm(pow))^2 / ((mde)^2)
  
  return(ceiling(min_n))
}