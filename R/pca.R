pca <- function(..., center = T, scale = F) {
  x <- scale(cbind(...),
             center = center,
             scale = scale)

  cen <- attr(x, "scaled:center")
  sc <- attr(x, "scaled:scale")

  if (any(sc == 0)) {
    stop("cannot rescale a constant/zero column to unit variance")
  }

  s <- svd(x)

  list(
    scores = s$u %*% diag(s$d),
    sdev = s$d / sqrt(nrow(x) - 1),
    SVD = list(
      U = s$u,
      D = s$d,
      V = s$v),
    center = if (is.null(cen)) FALSE else cen,
    scale = if (is.null(sc)) FALSE else sc
  )
}
