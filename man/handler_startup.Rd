% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/caret.R, R/handlers.R, R/lm.R, R/mlr3.R,
%   R/tidymodels.R, R/xgboost.R
\name{handler_startup.train}
\alias{handler_startup.train}
\alias{handler_predict.train}
\alias{handler_startup}
\alias{handler_startup.default}
\alias{handler_predict}
\alias{handler_predict.default}
\alias{handler_predict.lm}
\alias{handler_startup.Learner}
\alias{handler_predict.Learner}
\alias{handler_startup.workflow}
\alias{handler_predict.workflow}
\alias{handler_startup.xgb.Booster}
\alias{handler_predict.xgb.Booster}
\title{Model handler functions for API endpoint}
\usage{
\method{handler_startup}{train}(vetiver_model)

\method{handler_predict}{train}(vetiver_model, ...)

handler_startup(vetiver_model)

\method{handler_startup}{default}(vetiver_model)

handler_predict(vetiver_model, ...)

\method{handler_predict}{default}(vetiver_model, ...)

\method{handler_predict}{lm}(vetiver_model, ...)

\method{handler_startup}{Learner}(vetiver_model)

\method{handler_predict}{Learner}(vetiver_model, ...)

\method{handler_startup}{workflow}(vetiver_model)

\method{handler_predict}{workflow}(vetiver_model, ...)

\method{handler_startup}{xgb.Booster}(vetiver_model)

\method{handler_predict}{xgb.Booster}(vetiver_model, ...)
}
\arguments{
\item{vetiver_model}{A deployable \code{\link[=vetiver_model]{vetiver_model()}} object}

\item{...}{Other arguments passed to \code{predict()}, such as prediction \code{type}}
}
\value{
A \code{handler_startup} function should return invisibly, while a
\code{handler_predict} function should return a function with the signature
\verb{function(req)}. The request body (\code{req$body}) consists of the new data
at prediction time; this function should return predictions either as a
tibble or as a list coercable to a tibble via \code{\link[tibble:as_tibble]{tibble::as_tibble()}}.
}
\description{
These are developer-facing functions, useful for supporting new model types.
Each model supported by \code{vetiver_model()} uses two handler functions
in \code{\link[=vetiver_pr_predict]{vetiver_pr_predict()}}:
\itemize{
\item The \code{handler_startup} function executes when the API starts. Use this
function for tasks like loading packages. A model can use the default
method here, which is \code{NULL} (to do nothing at startup).
\item The \code{handler_predict} function executes at each API call. Use this
function for calling \code{predict()} and any other tasks that must be executed
at each API call.
}
}
\details{
These are two generics that use the class of \code{vetiver_model$model}
for dispatch.
}
\examples{

cars_lm <- lm(mpg ~ ., data = mtcars)
v <- vetiver_model(cars_lm, "cars_linear")
handler_startup(v)
handler_predict(v)

}
