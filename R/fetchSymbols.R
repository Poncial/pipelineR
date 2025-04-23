#' Extract a data.table object containing the symbols from to the ADEM PostgreSQL Database
#'
#' Extract the column 'symbols' from the adem db
#'
#' Environment variables expected:
#' - A data.table object named 'data'
#'
#' @return A data.table object
#' @export
#'
#' @examples
#' \dontrun{
#' symbolsDb <- fetchSymbols()
#' }
fetchSymbols <- function(){
  con <- connectDb()
  query <- 'SELECT DISTINCT symbol FROM sp500.info'
  data <- DBI::dbGetQuery(con, query) |>
    data.table::as.data.table()
  DBI::dbDisconnect(con)
  return(data)
}



