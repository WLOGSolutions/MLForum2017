#' @export
export_score <- function(score_dt, score_session_id, export_path) {
  score_dt <- as.data.table(score_dt)
  score_dt[, score_session_id := score_session_id]

  fwrite(x = score_dt,
         file = file.path(export_path, "score.csv"),
         sep = ";",
         append = TRUE)
}
