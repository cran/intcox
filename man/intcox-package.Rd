\name{intcox-package}
\alias{intcox-package}
\docType{package}
\title{ Iterated Convex Minorant Algorithm for interval censored event data }
\description{ Implementation of ICM-Algorithm by Wei Pan, J. Comp. & Gr. Stat. 78: 109-120, 1999
    Algorithm for the Cox proportional hazard model for interval censored data }
\details{
\tabular{ll}{
Package: \tab intcox\cr
Type: \tab Package\cr
Version: \tab 0.9.3\cr
Date: \tab 2013-02-18\cr
License: \tab GPL-2\cr
}
}
\author{
Volkmar Henschel, Christiane Heiss, Ulrich Mansmann \email{mansmann@ibe.med.uni-muenchen.de}
Maintainer: Volkmar Henschel\email{vhenschel@gmx.de}
}
\references{ Wei Pan, (1999), Extending the Iterative Convex Minorant Algorithm to the Cox Model for Interval-Censored Data,
        Journal of Computational & Graphical Statistics, vol. 8, pp. 109-120 }
\keyword{ survival }
\seealso{ \code{\link[survival]{coxph}}, \code{\link[survival]{Surv}} }
\examples{
data(intcox.example)
intcox(Surv(left,right,type="interval2")~x.1+x.2+x.3+x.4,data=intcox.example)
}
