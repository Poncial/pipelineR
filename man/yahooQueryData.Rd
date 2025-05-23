% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/yahooQueryData.R
\name{yahooQueryData}
\alias{yahooQueryData}
\title{Retrieve stock split data from Yahoo Finance for a list of tickers}
\usage{
yahooQueryData()
}
\arguments{
\item{splitList}{A list of character vectors, each containing stock ticker symbols.}
}
\value{
A list of tibbles, each with the result of \code{tq_get()} for one group of tickers.
}
\description{
This function takes a list of character vectors (e.g. split ticker groups),
and retrieves stock split data using \code{tidyquant::tq_get()} from Yahoo Finance,
starting from one week before the current date.
}
