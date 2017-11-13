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


library(h2o)
library(magrittr)
library(predmodel)

work_path <- file.path(script_path, "../work")
export_path <- file.path(script_path, "../export")

# required
train_session_id <- args$get(name =  "train_session_id", required = FALSE, default = "201711122000")
score_session_id <- args$get(name =  "score_session_id", required = FALSE, default = "201711131000")

loginfo("--> train session id:%s", train_session_id)
loginfo("--> score session id:%s", score_session_id)

score_session_export <- export_path
train_session_work <- file.path(work_path, train_session_id)
score_session_work <- file.path(work_path, score_session_id)

h2o.init(max_mem_size = "4g",
         nthreads = 2)

logdebug("---> H2O started")


test_file <- file.path(score_session_work, "test.csv")
model_file <- file.path(train_session_work,
                        sprintf("gbm_%s", train_session_id))

stopifnot(file.exists(test_file))
stopifnot(file.exists(model_file))

test_dt <- test_file %>%
  transform_test()

score_model(test_dt = test_dt,
            model_path = model_file) %>%
  export_score(export_path = export_path,
               score_session_id = score_session_id)




