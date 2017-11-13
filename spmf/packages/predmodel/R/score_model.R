#' @export
score_model <- function(test_dt, model_path) {
  model <- h2o.loadModel(model_path)
  pred_dt <- h2o.predict(model, test_dt)
  pred_dt
}
