\name{intcox}
\alias{intcox}
\alias{intcox.fit}
\alias{intcox.breslow}
\alias{intcox.derivs}
\alias{intcox.hazard0}
\alias{intcox.hazard0.beg}
\alias{intcox.pavaC}
\title{ Cox proportional hazards model for interval censored data }
\description{
  Intcox fits the Cox proportional hazards model for interval censored data by the Iterative Convex Minorant Algorithm (ICM)
}
\usage{
intcox(formula = formula(data), data = parent.frame(), subset, na.action, x = FALSE, y = TRUE, epsilon = 1e-04, itermax = 10000, no.warnings = FALSE)
}
\arguments{
  \item{formula}{ a formula object, with the response on the left of a \code{~} operator, and the terms on the right. 
                 The response must be a survival object of type \code{"interval2"} as returned by the \code{Surv} function. }
  \item{data}{ a data.frame in which to interpret the variables named in the \code{formula}, or in the \code{subset} argument.  }
  \item{subset}{ expression saying that only a subset of the rows of the data should be used in the fit. }
  \item{na.action}{ a missing-data filter function, applied to the model.frame, after any subset argument has been used. Default is \code{options()$na.action}. }
  \item{x}{ Return the design matrix in the model object? }
  \item{y}{ Return the response in the model object? }
  \item{epsilon}{ convergence treshold. Iteration will continue until the relative change in the log-likelihood is less then epsilon. Default is .0001. }
  \item{itermax}{ maximum number of iteration }
  \item{no.warnings}{logical value indicating how to handle warnings. If \code{TRUE}, warnings will be displayed. Default is \code{FALSE}. }
}
\details{
  With this package the Cox proportional hazards model can be applied for interval censored data. It tries to maximise the 
  log-likelihood by a simultanious improvement of the coefficients and the cumulative hazard function in the gradient 
  direction weighted by the main diagonal elements of the negative Hessian matrix. 
}
\value{
  an object of class \code{"coxph"}. See \code{\link[survival]{coxph.object}} for details. Not all features are realised. 
  Additionally there are given 
  \item{lambda0 }{ estimated baseline hazard }
  \item{time.point }{corresponding time points for the steps}
  \item{likeli.vec }{vector of the estimated loglik of each step}
  \item{termination}{indicator for the reason of termination, \cr
  1 - algorithm converged\cr
  2 - no improvement of likelihood possible, the iteration number is shown\cr
  3 - algorithm did not converge - maximum number of iteration reached\cr
  4 - inside precondition(s) are not fulfilled at this iteration}
}
\references{ Wei Pan, (1999), Extending the Iterative Convex Minorant Algorithm to the Cox Model for Interval-Censored Data, 
        Journal of Computational & Graphical Statistics, vol. 8, pp. 109-120 }
\author{ Ch. Heiss, V. Henschel, U. Mansmann }

\seealso{ \code{\link[survival]{coxph}}, \code{\link[survival]{Surv}} }
\examples{
data(intcox.example)
intcox(Surv(left,right,type="interval2")~x.1+x.2+x.3+x.4,data=intcox.example)
}
\keyword{ survival }
