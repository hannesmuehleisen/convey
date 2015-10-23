% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/svyfgt.R
\name{svyfgt}
\alias{svyfgt}
\alias{svyfgt.DBIsvydesign}
\alias{svyfgt.survey.design}
\alias{svyfgt.svyrep.design}
\title{FGT measure of poverty}
\usage{
svyfgt(formula, design, ...)

\method{svyfgt}{survey.design}(formula, design, t = NULL, alpha,
  na.rm = FALSE, ...)

\method{svyfgt}{svyrep.design}(formula, design, t = NULL, alpha,
  na.rm = FALSE, ...)

\method{svyfgt}{DBIsvydesign}(formula, design, ...)
}
\arguments{
\item{formula}{a formula specifying the income variable}

\item{design}{a design object of class \code{survey.design} or class \code{svyrep.design} of the library survey}

\item{t}{poverty threshold. If NULL uses the \code{arpt}}

\item{alpha}{If 0 estimates the headcount ratio and if 1 the poverty gap index}

\item{na.rm}{Should cases with missing values be dropped?}
}
\value{
Object of class "\code{cvystat}", which are vectors with a "\code{var}" attribute giving the variance and a "\code{statistic}" attribute giving the name of the statistic.
}
\description{
Estimate the FGT measure for the cases: \code{alpha=0} headcount ratio and \code{alpha=1} poverty gap index.
}
\details{
you must run the \code{convey_prep} function on your survey design object immediately after creating it with the \code{svydesign} or \code{svrepdesign} function.
}
\examples{
library(survey)
library(vardpoor)
data(eusilc)

# linearized design
des_eusilc <- svydesign( ids = ~rb030 , strata = ~db040 ,  weights = ~rb050 , data = eusilc )
des_eusilc <- convey_prep( des_eusilc )

svyarpr( ~eqIncome , design = des_eusilc )

# replicate-weighted design
des_eusilc_rep <- survey:::as.svrepdesign( des_eusilc , type = "bootstrap" )
des_eusilc_rep <- convey_prep( des_eusilc_rep )

# headcount ratio, poverty threshold fixed
svyfgt(~eqIncome, des_eusilc, t=10000, alpha=0)
# poverty gap index, poverty threshold fixed
svyfgt(~eqIncome, des_eusilc, t=10000, alpha=1)
# headcount ratio, poverty threshold equal to arpt
svyfgt(~eqIncome, des_eusilc,  t=NULL, alpha=0)
# poverty gap index, poverty threshold equal to arpt
svyfgt(~eqIncome, des_eusilc,  t=NULL, alpha=1 )
}
\author{
Djalma Pessoa and Anthony Damico
}
\references{
Guillaume Osier (2009). Variance estimation for complex indicators
of poverty and inequality. \emph{Journal of the European Survey Research
Association}, Vol.3, No.3, pp. 167-195,
ISSN 1864-3361, URL \url{http://ojs.ub.uni-konstanz.de/srm/article/view/369}.
Jean-Claude Deville (1999). Variance estimation for complex statistics and estimators:
linearization and residual techniques. Survey Methodology, 25, 193-203,
URL \url{http://www5.statcan.gc.ca/bsolc/olc-cel/olc-cel?lang=eng&catno=12-001-X19990024882}.
}
\seealso{
\code{\link{arpt}}
}
\keyword{survey}
