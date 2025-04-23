#' Split a data.table into equal-sized chunks
#'
#' This function splits a `data.table` into approximately equal-sized parts,
#' based on a specified number of desired chunks. It adds a temporary grouping
#' variable to assign rows to chunks and returns a list of `data.table` objects
#' (without the grouping variable).
#'
#' @param dt A `data.table` to be split.
#' @param n An integer indicating into how many chunks the `data.table` should be split.
#'
#' @return A list of `data.table` objects. Each element of the list is a subset
#'   of the original `data.table`, with approximately `nrow(dt)/n` rows.
#'
#' @examples
#' library(data.table)
#' dt <- data.table(id = 1:465, value = rnorm(465))
#' chunks <- split_dt(dt, 5)
#'
#' # Apply a function to each chunk with purrr
#' # purrr::map(chunks, some_function)
#' @import data.table
#' @importFrom data.table :=
#' @export
splitBatch <- function(dt) {
  dt[, groupId := cut(.I, breaks = 31, labels = FALSE)]
  splitList <- split(dt[, -"groupId"], dt$groupId)
  return(splitList)
}
