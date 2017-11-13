# Detect proper script_path (you cannot use args yet as they are build with tools in set_env.r)
script_path <- (function() {
  args <- commandArgs(trailingOnly = FALSE)
  script_path <- dirname(sub("--file=", "", args[grep("--file=", args)]))
  if (!length(script_path)) { return(".") }
  return(normalizePath(script_path))
})()

# Setting .libPaths() to point to libs folder
source(file.path(script_path, "set_env.R"), chdir = T)

config <- load_config()
args <- args_parser()

library(predmodel)
library(magrittr)

work_path <- file.path(script_path, "../work")
# required
session_id <- args$get(name =  "session_id", required = FALSE, default = "201711122000")
loginfo("--> Session id:%s", session_id)
session_work <- file.path(work_path, session_id)

h2o::h2o.init(max_mem_size = "4g",
         nthreads = 2)

logdebug("---> H2O started")

train_file <- file.path(session_work, "training.csv")

stopifnot(file.exists(train_file))

train_file %>%
  transform_training() %>%
  estimate_model(session_id) %>%
  save_model(session_work)
