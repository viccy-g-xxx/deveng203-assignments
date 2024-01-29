library(stats)

# For this assignment, the study design was not super clear.
# However, it seems like there is a comparison between two groups with an expected MDE
# So given all this context + class, we have to assume asymptotic normality + 2 sample test

# set global constants
bl_mean = 3000
bl_sd = 500
mde = 100
alph = 0.05 
pow = 0.8
p_treat = 0.5

# function to calculate minimum sample size 
min_samp_comp <- function(bl_sd, mde, pow, alph, p_treat) {
  min_n <- (1/(p_treat*(1-p_treat)))*(bl_sd^2)*
    (qnorm(1-alph / 2) + qnorm(pow))^2 / ((mde)^2)
  
  return(ceiling(min_n))
}

# solution to assignment 1
sample_size = min_samp_comp(bl_sd, mde, pow, alph, p_treat)
n_treat = ceiling(p_treat*sample_size)

sprintf("With treatment propensity %s and MDE %s, 
        the sample size is %s and size of treated group %s", p_treat, mde, sample_size, n_treat)
print(n_treat)
