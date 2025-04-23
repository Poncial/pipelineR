#' Retrieve stock split data from Yahoo Finance for a list of tickers
#'
#' This function takes a list of character vectors (e.g. split ticker groups),
#' and retrieves stock split data using `tidyquant::tq_get()` from Yahoo Finance,
#' starting from one week before the current date.
#'
#' @param splitList A list of character vectors, each containing stock ticker symbols.
#'
#' @return A list of tibbles, each with the result of `tq_get()` for one group of tickers.
#'
#' @export
yahooQueryData <- function(){
  fromDate <- lubridate::now() - lubridate::days(7)
  yahooDt <- purrr::map(
    splitList,
    ~tidyquant::tq_get(
      .x,
      get = "stock.prices",
      from = fromDate
    )
  )
  return(yahooDt)
}
