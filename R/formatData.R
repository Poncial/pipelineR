' Format Yahoo data into long format
#'
#' This function takes a list of data frames or tibbles (assumed to be in
#' `yahooDt`), and pivots each element from wide to long format. All columns
#' except the first two are gathered into a key column named `metric` and a
#' value column named `value`.
#'
#' @return A list of tibbles or data frames, each in long format with columns:
#'   * the original first two columns,
#'   * `metric` (formerly column names from the wide data),
#'   * `value` (corresponding cell values).
#'
#' @details
#' It relies on `purrr::map()` to iterate over the list, and
#' `tidyr::pivot_longer()` to reshape each table. If your input object is
#' named differently, you should assign it to `yahooDt` before calling this
#' function, or modify the function signature accordingly.
#'
#' @importFrom purrr map
#' @importFrom tidyr pivot_longer
#' @export
formatData <- function(){
  yahooDt <- purrr::map(
    yahooDt,
    ~tidyr::pivot_longer(
      .x,
      cols = names(.x)[-c(1,2)],
      names_to = "metric",
      values_to = "value"
    )
  )
  return(yahooDt)
}
