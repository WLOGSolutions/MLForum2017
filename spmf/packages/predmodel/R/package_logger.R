#----------------------------------------------------------------------------
# predmodel
#
# Package logger setup
#----------------------------------------------------------------------------

.logger_name <- "predmodel"
.pkg_logger <- logging::getLogger(.logger_name)
.pkg_logger$setLevel("FINEST")

pkg_loginfo <- function(msg, ...) { logging::loginfo(msg, ..., logger = .pkg_logger) }
pkg_logdebug <- function(msg, ...) { logging::logdebug(msg, ..., logger = .pkg_logger) }
pkg_logerror <- function(msg, ...) { logging::logerror(msg, ..., logger = .pkg_logger) }
pkg_logwarn <- function(msg, ...) { logging::logwarn(msg, ..., logger = .pkg_logger) }
pkg_logfinest <- function(msg, ...) { logging::logfinest(msg, ..., logger = .pkg_logger) }

#'
#' Retrieves predmodel logger.
#' 
#' @return logger object
#' 
#' @export
#' 
predmodel_getLogger <- function() {
  .pkg_logger
}
