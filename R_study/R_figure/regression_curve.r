# R plot using basic functions to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3/Bassil_NHL")

# User inputs
gpp_fname = "GPP_Fig9_at.csv"
le_fname  = "LE_Fig9_at.csv"
sh_fname  = "SH_Fig9_at.csv"
#plot_path = ""

# Read in data frame
gpp = read.csv(gpp_fname)
le  = read.csv(le_fname)
sh  = read.csv(sh_fname)

# Plot figures: 4x3 curve charts
# Open PDF file
pdf(file="test.pdf", width=21, height=7)
par(mfrow=c(1,3), omi=c(1,1.2,0.5,0.5), mar=c(2,8,0,2)) # all plots on one page 

## subplot one
# Set margin
plot(gpp$FluxGPP, gpp$GPPBC, xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(0,1600), ylim=c(0,1600), pch=2, cex=4, col='gray50', xaxt='n', yaxt='n')
# Move axis to top and left
axis(1,at=seq(0,1600,by=400),lwd=0, cex.axis=3.5, pos=-120)
axis(1,at=seq(0,1600,by=400),labels=FALSE,tcl=-0.25)
axis(2,at=seq(0,1600,by=400),cex.axis=3.5, las=1)
axis(2,at=seq(0,1600,by=400),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
points(gpp$FluxGPP, gpp$GPPDYN, pch = 8, cex=4, xaxt='n', yaxt='n')
bcline <- lm(gpp$GPPBC~gpp$FluxGPP)
abline(bcline, col='gray50', lwd=4)
dynline <- lm(gpp$GPPDYN~gpp$FluxGPP)
abline(dynline, col='black', lwd=4)
#lines(c(1,1), c(1000,1000), lty=2, col="gray70")
#legend(181, 5.8, legend = c("   Measured"), pch=17, cex=3, bty = "n")#, lty = 1:7,
#legend(168, 5.1, legend = c("Modeled", "MODIS"), cex=3, lty=1, col=c("black","gray50"), lwd=3, bty = "n")#, lty = 1:7,
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext(expression('Modeled GPP (gC'~m^{-2}~~yr^{-1}~')'), at=c(0.5), side=2, outer=TRUE, line=0, cex=2.5)
mtext(expression('Flux tower GPP (gC'~m^{-2}~~yr^{-1}~')'), at=c(0.19), side=1, outer=TRUE, line=5, cex=2.5)
text(1200, 1400, expression(~R^2~'= 0.86'), cex = 3, col="black")
text(1300, 600, expression(~R^2~'= 0.66'), cex = 3, col="gray50")
## subplot two
par(mar=c(2,8,0,2))
plot(le$FluxLE, le$LEBC, xlab = "", ylab = "", 
      xlim=c(15,35), ylim=c(15,35), pch=2, cex=4, xaxt='n', yaxt='n')
axis(1,at=seq(15,35,by=5), lwd=0, cex.axis=3.5, pos=13.6)
axis(1,at=seq(15,35,by=5),labels=FALSE,tcl=-0.25)
axis(2,at=seq(15,35,by=5), cex.axis=3.5, las=1)
axis(2,at=seq(15,35,by=5),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
points(le$FluxLE, le$LEDYN, pch = 8, cex=4, xaxt='n', yaxt='n')
bcline <- lm(le$LEBC~le$FluxLE)
abline(bcline, col='gray50', lwd=4)
dynline <- lm(le$LEDYN~le$FluxLE)
abline(dynline, col='black', lwd=4)
mtext(expression('Modeled LH (W'~m^{-2}~')'), at=c(0.5), side=2, outer=TRUE, line=-51.7, cex=2.5)
mtext(expression('Flux tower LH (W'~m^{-2}~')'), at=c(0.53), side=1, outer=TRUE, line=5, cex=2.5)
text(32, 25, expression(~R^2~'= 0.51'), cex = 3, col="black")
text(30, 32, expression(~R^2~'= 0.37'), cex = 3, col="gray50")
# subplot three
par(mar=c(2,8,0,2))
plot(sh$FluxSH, sh$SHBC, xlab = "", ylab = "", 
      xlim=c(15,45), ylim=c(15,45), pch=2, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
axis(1,at=seq(15,45,by=5), lwd=0, cex.axis=3.5, pos=12.9)
axis(1,at=seq(15,45,by=5),labels=FALSE,tcl=-0.25)
axis(2,at=seq(15,45,by=5), cex.axis=3.5, las=1)
axis(2,at=seq(15,45,by=5), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
points(sh$FluxSH, sh$SHDYN, pch = 8, cex=4, xaxt='n', yaxt='n')
bcline <- lm(sh$SHBC~sh$FluxSH)
abline(bcline, col='gray50', lwd=4)
dynline <- lm(sh$SHDYN~sh$FluxSH)
abline(dynline, col='black', lwd=4)
mtext(expression('Modeled SH (W'~m^{-2}~')'), at=c(0.5), side=2, outer=TRUE, line=-100.3, cex=2.5)
mtext(expression('Flux tower SH (W'~m^{-2}~')'), at=c(0.855), side=1, outer=TRUE, line=5, cex=2.5)
text(41, 33, expression(~R^2~'= 0.28'), cex = 3, col="black")
text(30, 42, expression(~R^2~'= 0.25'), cex = 3, col="gray50")
dev.off()

