#' @export
transform_training <- function(train_file) {
  dt <- h2o.importFile(path = train_file,
                 destination_frame = "train_dt",
                 parse = TRUE,
                 header = TRUE,
                 sep = ";")
  dt$resp <- as.factor(dt$resp)
  dt <- h2o.assign(data=dt, key = "train_dt")

  return(dt)
}
