\name{intcox.example}
\alias{intcox.example}
\docType{data}
\title{Example set for interval censored data with four covariates}
\description{
  Weibull distributed survival times with four covariates interval censored by a fixed grid
}
\usage{data(intcox.example)}
\format{
  A data frame with 200 observations on the following 6 variables.
  \describe{
    \item{left}{left interval ends}
    \item{right}{right interval ends}
    \item{x.1}{binary covariate}
    \item{x.2}{binary covariate}
    \item{x.3}{uniformly on \code{[-1,1]} distributed covariate}
    \item{x.4}{standard normally distributed covariate}
  }
}
\details{
The example dataset consists of 200 Weibull distributed random variables with \code{shape=0.75},
while \code{scale} is derived from \eqn{(1/\lambda)^(1/shape)} with \eqn{\lambda = \exp{\beta_0+\beta'X}}
where \eqn{\beta = {0.5,-0.5,0.5,0.5}'} and design matrix \code{X} which is formed by the four covariates.

Furthermore, an interval was generated where the left interval end is zero
and the right interval end is defined by maximum value (\code{T.max}) of the which is got by
the 0.9-quantile of a Weibull r.v. with \code{shape=0.75} and \code{scale=median(scale)}.

If the value of event time \code{>=T.max} then the event time is right censored (\code{left=T.max} and \code{right=NA}).
Otherwise the interval \code{[0,T.max]} was randomly divided into subintervals (\code{grid=10}) in order to determine
the corresponding interval ends for each event time which is not right censored.

The generating code is given below.
}
\examples{
\dontrun{
sim.weibull.intcox.rfc <-function (N=200,beta.0=0.1,beta.cov=c(0.5,-0.5,0.5,0.5),
  alpha=0.75,p.cov=c(0.5,0.75),grid=10)
{																		
  x.design<-cbind(rbinom(N,1,p.cov[1]),rbinom(N,1,p.cov[2]),runif(N,-1,1),rnorm(N,0,1))
  colnames(x.design)<-paste("x.",1:4,sep="")
  lambda<-exp(beta.0+x.design\%*\%matrix(beta.cov,ncol=1))
  scale<-(1/lambda)^(1/alpha)
  t.true<-rweibull(N,alpha,scale)
  T.max<-max(qweibull(0.9,alpha,median(scale)))
  t.left<-NULL
  t.right<-NULL
  for (i in 1:N) {
      tt<-unique(c(0,sort(runif(grid,0,T.max)),T.max))
      if (t.true[i]>=T.max) {
          x.left<-T.max
          x.right<-NA
      } else {
          x.left<-max(tt[t.true[i]>tt])
          x.right<-min(tt[t.true[i]<tt])
      }
      t.left<-c(t.left,x.left)
      t.right<-c(t.right,x.right)
  }
  return(data.frame(ID=1:N,left=t.left,right=t.right,x.design))
}
}

data(intcox.example)
}
\keyword{datasets}
