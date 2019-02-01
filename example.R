
# Coding the Wikipedia example on control variates
# by Cory Lanker, 2/1/2019

set.seed(2019)
val = matrix(NA, 100000, 3)
for (i in 1:nrow(val)){
  s = runif(1500)
  f = 1/(1+s)
  g = 1+s
  v = -1*cov(f, s)/var(g)
  fs = f + v*(g - 1.5)
  val[i, ] = c(mean(f), mean(fs), v)
}

mv = apply(val, 2, mean)
sv = apply(val, 2, sd)

pdf('control_variates_example.pdf')
par(mfrow=c(3,1))
hist(val[, 1], 50, xlab='estimate for E[1/(1+U)]',
     main='Using Monte Carlo sampling of U',
     xlim=c(0.678, 0.708))
text(0.68, 4000, paste('Mean ', round(mv[1], 5)))
text(0.68, 3000, paste('S.D.  ', round(sv[1], 5)))
hist(val[, 2], 50, xlab='estimate for E[1/(1+U)]',
     main='Using (1+U)-corrected Monte Carlo sampling of U',
     xlim=c(0.678, 0.708))
text(0.68, 4000, paste('Mean ', round(mv[2], 5)))
text(0.68, 3000, paste('S.D.  ', round(sv[2], 5)))
hist(val[, 3], 50, xlab='estimate for c',
     main='Histogram of c estimates used to compute m-star')
dev.off()
