% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/twosamppower_func.R
\name{min_samp_comp}
\alias{min_samp_comp}
\title{min_samp_comp
Given distribution parameters and MDE, compute sample size}
\usage{
min_samp_comp(bl_mean, bl_sd, mde, pow, alph, p_treat)
}
\arguments{
\item{bl_mean}{mean of baseline}

\item{bl_sd}{SD of baseline}

\item{mde}{minimum detectable effect}

\item{pow}{power}

\item{alph}{significance}

\item{p_treat}{probability of treatment}
}
\value{
minimum sample size
}
\description{
min_samp_comp
Given distribution parameters and MDE, compute sample size
}
\examples{
# example code
n <- min_samp_comp(0, 1, 0.2, 0.8, 0.05, 0.5);
}
