library('sem')

# Clear the data space
rm(list=ls())

# Add new cols for the Klein's data
Klein$P.lag <- with(Klein, c(NA, P[-length(P)]))
Klein$X.lag <- with(Klein, c(NA, X[-length(X)]))
Klein$A <- Klein$Year - 1931
head(Klein)

# 2 stages least squre estimation for 3 equations
eqn.1 <- tsls(C ~ P + P.lag + I(Wp + Wg), instruments= ~ G + T + Wg + A + P.lag + K.lag + X.lag, data=Klein)
# It was necessary to use the identity function I to protect the expression wp + wg in the first
# structural equation; as in a linear model, leaving an expression like this unprotected would cause
# the plus sign to be interpreted as specifying separate terms for the model, rather than as the sum
# of wp and wg, which is what is desired here.
eqn.2 <- tsls(I ~ P + P.lag + K.lag, instruments= ~ G + T + Wg + A + P.lag + K.lag + X.lag, data=Klein)
eqn.3 <- tsls(Wp ~ X + X.lag + A, instruments= ~ G + T + Wg + A + P.lag + K.lag + X.lag, data=Klein)
summary(eqn.1)
summary(eqn.2)
summary(eqn.3)
