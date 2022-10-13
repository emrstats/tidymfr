#### CLASS DEF ####
svd_res <- new_class("svd_res",
                 properties = list(
                   X = class_numeric,
                   U = class_numeric,
                   d = class_numeric,
                   V = class_numeric
                 ))

#### CALC_SVD ####
calc_svd <- new_generic("calc_svd",
                        "x")
method(calc_svd, svd_res) <- function(x) {
  tmp <- svd(x@X)
  x@d <- tmp$d
  x@U <- tmp$u
  x@V <- tmp$v
  return(x)
}
