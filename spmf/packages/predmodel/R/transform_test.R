#' @export
transform_test <- function(test_file) {
  h2o.importFile(path = test_file,
                 destination_frame = "test_dt",
                 parse = TRUE,
                 header = TRUE,
                 sep = ";")
}
