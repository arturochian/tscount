\name{summary.tsglm}
\alias{summary.tsglm}
\alias{print.summary.tsglm}
\title{
Summarising Fits of Count Time Series following Generalised Linear Models
}
\description{
\code{summary} method for class \code{"tsglm"}.
}
\usage{
\method{summary}{tsglm}(object, B, parallel=FALSE, ...)
}
\arguments{
  \item{object}{
an object of class \code{"tsglm"}. Usually the result of a call to \code{\link{tsglm}}.
}
  \item{B}{
controls the computation of standard errors. Is passed to \code{\link[=se.tsglm]{se}}.
  }
  \item{parallel}{
controls the computation of standard errors. Is passed to \code{\link[=se.tsglm]{se}}.
}
  \item{...}{
further arguments are currently ignored. Only for compatibility with generic function.
}
}
\details{
Computes and returns a list of summary statistics of the fitted model given in argument \code{object}.
}
\value{
A named list with the following elements:

  \item{call}{see \code{\link{tsglm}}.}
 
  \item{link}{see \code{\link{tsglm}}.}
  
  \item{distr}{see \code{\link{tsglm}}.}
 
  \item{residuals}{see \code{\link{tsglm}}.}
 
  \item{coefficients}{data frame with estimated parameters and their standard errors (based on a normal approximation or a parametric bootstrap, see \code{\link[=se.tsglm]{se}}).}
  
  \item{number.coef}{number of coefficients.}
 
  \item{se.type}{type of standard errors, see \code{\link{se.tsglm}}.}
  
  \item{se.bootstrapsamples}{number of bootstrap samples used for estimation of the standard errors, see \code{\link{se.tsglm}}. Is omitted if the standard errors are not obtained by a bootstrap procedure.}
  
  \item{logLik}{value of the maximised log-likelihood function.}
 
  \item{AIC}{Akaike's information criterion (AIC).}
 
  \item{BIC}{Bayesian information criterion (BIC).}  
 
  \item{pearson.resid}{Pearson residuals, see \code{\link{residuals.tsglm}}.}
}

\author{
Tobias Liboschik and Philipp Probst
}

\seealso{
S3 method \code{\link{print}}.

\code{\link{tsglm}} for fitting a GLM for time series of counts.
}
\examples{
###Road casualties in Great Britain (see help("Seatbelts"))
timeseries <- Seatbelts[, "VanKilled"]
regressors <- cbind(PetrolPrice=Seatbelts[, c("PetrolPrice")],
                    linearTrend=seq(along=timeseries)/12)
#Logarithmic link function with Poisson distribution:                    
seatbeltsfit <- tsglm(ts=timeseries, link="log",
  model=list(past_obs=c(1, 12)), xreg=regressors, distr="pois")
summary(seatbeltsfit)
}

\keyword{Model assessment}
\keyword{Inference}
