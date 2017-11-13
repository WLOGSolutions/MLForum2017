#' @export
import_test_data <- function(import_path, work_path) {
  pkg_loginfo("Importing from %s into %s",
              import_path,
              work_path)

  n <- 1000
  dt <- data.table(feature1 = rnorm(n), feature2 = rnorm(n))
  fwrite(x = dt,
         file = file.path(work_path, "test.csv"),
         sep = ";")
}
