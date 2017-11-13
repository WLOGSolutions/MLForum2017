#' @export
save_model <- function(model, session_work) {
  h2o.saveModel(model,
                path = session_work,
                force =TRUE)
}
