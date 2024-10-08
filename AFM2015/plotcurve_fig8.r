# R plot using basic functions to generate plots
# Author: Shijie Shu

# Define reset function here
reset <- function() {
    par(mfrow=c(1, 1), oma=rep(0, 4), mar=rep(0, 4), new=TRUE)
    plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
    }


# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3/Bassil_NHL")

# User inputs
gpp_bdecid_fname = "GPP_Fig8_bdecid_at.csv"
gpp_bever_fname  = "GPP_Fig8_bever_at.csv"
le_bdecid_fname  = "LE_Fig8_bdecid_at.csv"
le_bever_fname   = "LE_Fig8_bever_at.csv"
sh_bdecid_fname  = "SH_Fig8_bdecid_at.csv"
sh_bever_fname   = "SH_Fig8_bever_at.csv"
#plot_path = ""

# Read in data frame
gpp_bdecid = read.csv(gpp_bdecid_fname)
gpp_bever  = read.csv(gpp_bever_fname)
le_bdecid  = read.csv(le_bdecid_fname)
le_bever   = read.csv(le_bever_fname)
sh_bdecid  = read.csv(sh_bdecid_fname)
sh_bever   = read.csv(sh_bever_fname)

# Plot figures: 4x3 curve charts
# Open PDF file
pdf(file="test.pdf", width=16, height=16)
par(mfrow=c(3,2), omi=c(1,1.5,1.5,0.5), mar=c(1.5,1.5,1.5,1.5)) # all plots on one page 

## subplot one
# Set margin
plot(gpp_bdecid$DOY, gpp_bdecid$Measured, type="n", xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(100,300), ylim=c(0,15), xaxt='n', yaxt='n')
# Move axis to top and left
axis(2,at=seq(0,15,by=5),cex.axis=4, las=1)
axis(2,at=seq(0,15,by=5),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_bdecid$DOY, gpp_bdecid$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(gpp_bdecid$DOY, gpp_bdecid$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
#legend(181, 5.8, legend = c("   Measured"), pch=17, cex=3, bty = "n")#, lty = 1:7,
#legend(168, 5.1, legend = c("Modeled", "MODIS"), cex=3, lty=1, col=c("black","gray50"), lwd=3, bty = "n")#, lty = 1:7,
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext(expression('GPP (gC'~m^{-2}~~d^{-1}~')'), at=c(0.85), side=2, outer=TRUE, line=5, cex=3)
mtext("Day of Year", side=1, outer=TRUE,line=6,cex=3)
mtext("Boreal Deciduous", at=c(0.25), side=3, outer=TRUE, line=0.5, cex=2.6)
text(110, 14, "(a)", cex = 3.5)
## subplot two
par(mar=c(1.5,1.5,1.5,1.5))
plot(gpp_bever$DOY, gpp_bever$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,300), ylim=c(0,15), xaxt='n', yaxt='n')
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_bever$DOY, gpp_bever$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(gpp_bever$DOY, gpp_bever$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext("Boreal Evergreen", at=c(0.75), side=3, outer=TRUE, line=0.5, cex=2.6)
text(110, 14, "(b)", cex = 3.5)
# subplot three
par(mar=c(1.5,1.5,1.5,1.5))
plot(le_bdecid$DOY, le_bdecid$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,300), ylim=c(0,100), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
axis(2,at=seq(0,100,by=50), cex.axis=4, las=1)
axis(2,at=seq(0,100,by=50), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_bdecid$DOY, le_bdecid$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(le_bdecid$DOY, le_bdecid$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext(expression('LH (W'~m^{-2}~')'), at=c(0.5), side=2, outer=TRUE, line=5, cex=3)
text(110, 92, "(c)", cex = 3.5)
# subplot four
par(mar=c(1.5,1.5,1.5,1.5))
plot(le_bever$DOY, le_bever$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,300), ylim=c(0,100), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_bever$DOY, le_bever$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(le_bever$DOY, le_bever$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 92, "(d)", cex = 3.5)
# subplot five
par(mar=c(1.5,1.5,1.5,1.5))
plot(sh_bdecid$DOY, sh_bdecid$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,300), ylim=c(-50,150), xaxt='n', yaxt='n')
axis(1,at=seq(100,300,by=50), lwd=0, cex.axis=4, pos=-70)
axis(1,at=seq(100,300,by=50),labels=FALSE,tcl=-0.5)
axis(2,at=seq(-50,150,by=50), cex.axis=4, las=1)
axis(2,at=seq(-50,150,by=50), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_bdecid$DOY, sh_bdecid$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(sh_bdecid$DOY, sh_bdecid$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext(expression('SH (W'~m^{-2}~')'), at=c(0.18), side=2, outer=TRUE, line=5, cex=3)
text(110, 135, "(e)", cex = 3.5)
# subplot six
par(mar=c(1.5,1.5,1.5,1.5))
plot(sh_bever$DOY, sh_bever$Measured, type = "n", xlab = "", ylab = "", 
      xlim=c(100,300), ylim=c(-50,150), xaxt='n', yaxt='n')
axis(1,at=seq(100,300,by=50), lwd=0, cex.axis=4, pos=-70)
axis(1,at=seq(100,300,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_bever$DOY, sh_bever$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(sh_bever$DOY, sh_bever$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 135, "(f)", cex = 3.5)

reset()
# Put legend outside the plot
secondtag <- expression('ISAM'[DYN])
legend("top", legend = c(secondtag, "Flux tower"), col = c("red", "black"), cex = 2.5, lwd = 3, xpd=NA, bty = "n", horiz=TRUE)#, lty = 1:7,
dev.off()

