recover_data.rq <- emmeans:::recover_data.lm

emm_basis.rq <- function(object, trms, xlev, grid, se = NULL, ...){
  m <- model.frame(trms, grid, na.action = na.pass, xlev = xlev)
  X <- model.matrix(trms, m, contrasts.arg = object$contrasts)
  bhat <- object$coefficients
  Xmat <- model.matrix(trms, data = object$model)
  V = summary(object, se = se, covariance = TRUE)$cov
  nbasis = matrix(NA)
  dfargs = list(df = nrow(Xmat) - ncol(Xmat))
  dffun = function(k, dfargs) dfargs$df
  list(X = X,
       bhat = bhat,
       nbasis = nbasis,
       V = V,
       dffun = dffun,
       dfargs = dfargs)
}
