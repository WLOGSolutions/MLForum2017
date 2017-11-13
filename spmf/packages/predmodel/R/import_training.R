  #' @export
  import_training_data <- function(import_path, work_path) {
    pkg_loginfo("Importing from %s into %s",
                import_path,
                work_path)

    n <- 10000
    dt <- data.table(feature1 = rnorm(n), feature2 = rnorm(n))
    m <- round(n*0.3)
    dt[, resp := c(rep(1, m), rep(0, n - m))]
    fwrite(x = dt,
           file = file.path(work_path, "training.csv"),
           sep = ";")
  }
