#'@export
estimate_model <- function(dt, session_id) {
  model <- h2o.gbm(x = colnames(dt),
                   y = "resp",
                   training_frame = dt,
                   model_id = sprintf("gbm_%s", session_id),
                   ntrees = 10,
                   learn_rate = 0.1)
}
