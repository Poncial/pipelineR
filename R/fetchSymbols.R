

fetchSymbols <- function(){
  con <- connect_db()
  query <- 'SELECT DISTINCT symbol FROM sp500.info'
  data <- DBI::dbGetQuery(con, query) |>
    data.table::as.data.table()
  DBI::dbDisconnect(con)
  return(data)
}



