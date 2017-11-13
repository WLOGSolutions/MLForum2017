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

import_path <- file.path(script_path, "../import")
work_path <- file.path(script_path, "../work")

# required
session_id <- args$get(name =  "session_id", default = "201711122000", required = FALSE)

loginfo("--> Session id:%s", session_id)

session_work <- file.path(work_path, session_id)

if(!dir.exists(session_work)) {
  logdebug("Creating working directory")
  dir.create(session_work)
} else {
  logdebug("Working directory exists")
}

import_training_data(file.path(import_path, session_id),
                     session_work)

