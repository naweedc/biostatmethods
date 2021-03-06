#' Data from Methods in Biostatistics in R
#'
#' @param ... character files to retrieve.  See examples
#'
#' @return A character vector of the filename.
#' @export
#' @importFrom utils browseURL
#'
#' @examples
#' biostat_data("bmi_age.txt")
#' biostat_data("FLAIR.nii.gz")
#' ff = system.file("extdata", "shhs1.txt", package = "biostatmethods")
#' if (file.exists(ff)) {
#'    file.remove(ff)
#' }
#' testthat::expect_error(biostat_data("shhs1.txt"))
#' token = nsrr::nsrr_token()
#' if (!is.null(token)) {
#'    if (biostat_download_shhs()) {
#'       biostat_data("shhs1.txt")
#'    }
#' }
biostat_data = function(...) {
  args = list(...)
  args = unlist(args)
  args = tolower(args)
  if (grepl("shhs", args)) {
    res = system.file(
      "extdata",
      ...,
      package = "biostatmethods")
    if (res == "") {
      # if (interactive()) {
      #   utils::browseURL("https://sleepdata.org/datasets/shhs")
      # }
      msg = c("Title:  Methods in Biostatistics with R", "\n",
              paste0("\tSpecific Purpose: Requesting access to the ",
                     "SHHS dataset to complete the exercises in the ",
                     "' Methods in Biostatistics with R'",
                     " textbook, and I understand that I cannot share ",
                     "the data with others or make the data available ",
                     "via any other means per the terms of the ",
                     "NSRR Data Access and Use Agreement.",
                     "\nTo open the website, run\n",
                     'utils::browseURL("https://sleepdata.org/datasets/shhs")'
              ))
      msg = paste0(msg)
      stop(msg)
    }
  }
  res = system.file(
    "extdata",
    ...,
    package = "biostatmethods")
  if (res == "") {
    res = system.file(
      "extdata",
      "NIfTI",
      ...,
      package = "biostatmethods")
  }
  return(res)
}
