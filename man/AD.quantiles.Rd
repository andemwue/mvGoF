% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mvGOV.R
\name{AD.quantiles}
\alias{AD.quantiles}
\title{Quantiles of the Anderson-Darling test}
\usage{
AD.quantiles(alphas = c(0.25, 0.2, 0.15, 0.1, 0.05, 0.025, 0.01, 0.005,
  0.0025, 0.001))
}
\arguments{
\item{alphas}{Alpha levels for which the quantiles should be returned.}
}
\description{
\code{KS.quantiles} returns quantiles for the Anderson-Darling test.
}
\examples{
x <- matrix(rnorm(50), nrow=25, ncol=2)
}
\seealso{
\code{\link[copula]{rtrafo}} for Rosenblatt's transformation on elliptical and Archimedean copulas.
}

