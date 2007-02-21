\name{intcox-package}
\alias{intcox-package}
\docType{package}
\title{
Iterated Convex Minorant Algorithm for interval censored event data
}
\description{
Implementation of ICM-Algorithm by Wei Pan, 
Algorithm for the Cox proportional hazard model for interval censored data
}
\details{
\tabular{ll}{
Package: \tab intcox\cr
Type: \tab Package\cr
Version: \tab 0.9.1\cr
Date: \tab 2007-02-21\cr
License: \tab GPL Version 2 or newer\cr
}
  With this package the Cox proportional hazards model can be applied for interval censored data. It tries to maximise the 
  log-likelihood by a simultanious improvement of the coefficients and the cumulative hazard function in the gradient 
  direction weighted by the main diagonal elements of the negative Hessian matrix. 
}
\author{
Volkmar Henschel, Christiane Heiss, Ulrich Mansmann

Maintainer: Volkmar Henschel<henschel@ibe.med.uni-muenchen.de>
}
\references{ Wei Pan, (1999), Extending the Iterative Convex Minorant Algorithm to the Cox Model for Interval-Censored Data, 
        Journal of Computational & Graphical Statistics, vol. 8, pp. 109-120 
}
\keyword{ package }
\keyword{ survival }
\seealso{ \code{\link[survival]{coxph}}, \code{\link[survival]{Surv}} }
\examples{
data(intcox.example)
intcox(Surv(left,right,type="interval2")~x.1+x.2+x.3+x.4,data=intcox.example)
}
