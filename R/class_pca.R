# #### CLASS DEF ####
#
# pca <- new_class("pca",
#                  properties = list(
#                    data = class_list,
#                    scaled = new_property(class_logical,
#                                          default = FALSE),
#                    X = new_property(
#                      class = class_numeric,
#                      getter = function(self) {
#                        self@data %>%
#                          as.matrix %>%
#                          unname %>%
#                          scale(scale = self@scaled)
#                      }
#                    ),
#                    cols = new_property(
#                      class = class_character,
#                      getter = function(self) {
#                        colnames(self@data)
#                      }
#                    ),
#                    svd = new_property(
#                      class = class_list,
#                      getter = function(self) svd(self@X))
#                  )
# )
#
# #### SDEV ####
#
# sdev <- new_generic("sdev",
#                     "x")
#
# method(sdev, pca) <- function(x) {
#   x@svd$d / sqrt(nrow(x@X) - 1)
# }
#
# #### SCORES ####
#
# scores <- new_generic("scores",
#                       "x",
#                       function(x, ..., standardize = TRUE)
#                         R7_dispatch())
# method(scores, pca) <- function(x, ..., standardize = TRUE) {
#   if (standardize) {
#     return(sqrt(nrow(x@X)-1) * x@svd$u)
#   }
#   return(x@svd$u %*% diag(x@svd$d))
# }
#
# #### AXES ####
#
# axes <- new_generic("axes",
#                     "x")
# method(axes, pca) <- function(x) {
#   x@svd$v
# }
#
# #### LOADINGS ####
#
# loadings <- new_generic("loadings",
#                         "x")
# method(loadings, pca) <- function(x) {
#   return((x@svd$v %*% diag(x@svd$d))/sqrt(nrow(x@X) - 1))
# }
