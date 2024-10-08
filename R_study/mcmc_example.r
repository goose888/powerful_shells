# Example form MCMC page
library(mcmc)

# log unnormalized posterior (log likelihood plus log prior) density
lupost <- function(beta, x, y) {
   eta <- as.numeric(x %*% beta)
   logp <- ifelse(eta < 0, eta - log1p(exp(eta)), - log1p(exp(- eta)))
   logq <- ifelse(eta < 0, - log1p(exp(eta)), - eta - log1p(exp(- eta)))
   logl <- sum(logp[y == 1]) + sum(logq[y == 0])
   return(logl - sum(beta^2) / 8)
}
# Normal glm
data(logit)
out <- glm(y ~ x1 + x2 + x3 + x4, data = logit, family = binomial(), x = TRUE)
# summary(out)

x <- out$x
y <- out$y

# Now get posterior
set.seed(42) # to get reproducible results
beta.init <- as.numeric(coefficients(out))
out <- metrop(lupost, beta.init, 1e3, x = x, y = y)
names(out)
out$accept

# Test of the acceptance
out <- metrop(out, scale = 0.1, x = x, y = y)
out$accept
out <- metrop(out, scale = 0.3, x = x, y = y)
out$accept
out <- metrop(out, scale = 0.5, x = x, y = y)
out$accept
out <- metrop(out, scale = 0.4, x = x, y = y)
out$accept

# Batch run using MH-MCMC
out <- metrop(out, nbatch = 1e4, x = x, y = y)
out$accept
out$time

# Time series plot
plot(ts(out$batch))
# Auto correlation plot to determine batch length
acf(out$batch)

out <- metrop(out, nbatch = 1e2, blen = 100, outfun = function(z, ...) c(z, z^2), x = x, y = y)
out$accept
# Means of the batch means
# first 5 are the Monte Carlo estimates of the posterior means
# second 5 are the Monte Carlo estimates of the posterior ordinary second moments
foo <- apply(out$batch, 2, mean)
mu <- foo[1:5]
# E(X^2) - E(X)^2
sigmasq <- foo[6:10] - mu^2
mu
# Monte Carlo standard errors (MCSE)
mu.mcse <- apply(out$batch[ , 1:5], 2, sd) / sqrt(out$nbatch)
mu.mcse
# MCSE for the posterior variance
u <- out$batch[ , 1:5]
v <- out$batch[ , 6:10]
ubar <- apply(u, 2, mean)
vbar <- apply(v, 2, mean)
deltau <- sweep(u, 2, ubar)
deltav <- sweep(v, 2, vbar)
foo <- sweep(deltau, 2, ubar, "*")
sigmasq.mcse <- sqrt(apply((deltav - 2 * foo)^2, 2, mean) / out$nbatch)
sigmasq.mcse
