% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mvGOV.R
\docType{package}
\name{mvGoF}
\alias{mvGoF}
\alias{mvGoF-package}
\title{mvGoF: A package for computating several multivariate EDF goodness of fit statistics.}
\description{
Multivariate versions of the popular EDF statistics by \emph{Cramr-von Mises}, \emph{Anderson-Darling} and \emph{Kolmogorov-Smirnov} are supported.
}
\section{List of public functions}{

\itemize{
 \item{"\code{\link{AD.stat}}"}{ Anderson-Darling}
 \item{"\code{\link{CvM.stat}}"}{ Cramr-von Mises}
 \item{"\code{\link{biKS.stat}}"}{ bivariate Kolmogorov-Smirnov}
 \item{"\code{\link{rosenblatt.norm}}"}{ Rosenblatt's transformation for normally distributed data}
}
}
\examples{
# Evaluate percentiles of the distribution by Monte-Carlo simulation
# sampling from independent uniforms 0-1 for F_0 specified completely by H_0
n <- 10 # e.g. sample size 10
set.seed(14072016)
sims <- stat.MC(n,100,biKS.stat) # 100 MC simulations (usually larger)
# now quantiles can be estimated
quantile(sims)
# critival value for sample size 48 and alpha=0.05
KS.cval(48,0.05)

# for the Lilliefors statistic:
n <- 10 # e.g. sample size 10
set.seed(14072016)
sims <- stat.MC(n,100,biKS.stat) # 100 MC simulations (usually larger)

#evaluate empirical power of statistics
#set parameters of true distribution
(mu0 <- rep(0,2))
(Sigma0 <- diag(0.5,2,2)+matrix(0.5,2,2))
#set parameters for alternative distribution
nMC <- 1000 # number of MC simulations
n <- 15 # sample size
eps <- 0.4 #c(0.1,0.2,0.4)
mu <- c(3,3) #mu <- c(3,-1)
tmp.KS.n15.sims <- rep(NA, nMC)
tmp.AD.n15.sims <- rep(NA, nMC)
tmp.CvM.n15.sims <- rep(NA, nMC)
set.seed(15072016)
for (i in 1:nMC) {
  rbts <- rosenblatt.norm( ((1-eps)*MASS::mvrnorm(n, mu0, Sigma0) + eps*MASS::mvrnorm(n, mu, Sigma0))  ,mu0,Sigma0)
  tmp.KS.n15.sims[i] <- biKS.stat( rbts  )
  tmp.AD.n15.sims[i] <- AD.stat( rbts  )
  tmp.CvM.n15.sims[i] <- CvM.stat( rbts  )
}
#length(t1.KS.n15.sims[t1.KS.n15.sims>KS.cval(15,0.05)])/length(t1.KS.n15.sims)
#length(t2.KS.n15.sims[t2.KS.n15.sims>KS.cval(15,0.05)])/length(t2.KS.n15.sims)
#length(t3.KS.n15.sims[t3.KS.n15.sims>KS.cval(15,0.05)])/length(t3.KS.n15.sims)
#t1: mu <- c(3,3), eps <- 0.1
#t2: mu <- c(3,3), eps <- 0.2
#t3: mu <- c(3,3), eps <- 0.4

}

