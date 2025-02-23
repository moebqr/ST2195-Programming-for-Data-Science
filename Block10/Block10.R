circle <- function(radius) {
  shape <- list(radius = radius)
  class(shape) <- "circle"
  shape
}
#' @export
area.circle <- function(object) {
  pi * object$radius^2
}


install.packages('usethis')
library('usethis')

create_package("~/Repositories/areacalc/")


library("fs")
dir_tree("~/Repositories/")

usethis::use_r("circle")

usethis::use_r("square")

dir_tree("~/Repositories/")
