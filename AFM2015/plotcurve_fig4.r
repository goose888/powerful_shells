# R plot using basic functions to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3/Bassil_NHL")

# User inputs
tundra_fname = "Tundra_Fig4_at.csv"
bever_fname = "Bever_Fig4_at.csv"
bdecid_fname = "Bdecid_Fig4_at.csv"
#plot_path = ""

# Read in data frame
tundra = read.csv(tundra_fname)
bever = read.csv(bever_fname)
bdecid = read.csv(bdecid_fname)

#pdf(file="test.pdf", width=12, height=16)
## Plot figures
## Create layout
#par(fig=c(0,16,0,12), # Figure region in the device display region (x1,x2,y1,y2)
#    omi=c(0.3,1.9,1.9,0.3), # global margins in inches (bottom, left, top, right)
#    mai=c(0.0,0.0,0.0,0.0)) # subplot margins in inches (bottom, left, top, right)
#layout(matrix(1:3, 1, 3, byrow = TRUE))


# Open PDF file
pdf(file="test.pdf", width=12, height=16)
## subplot one
# Set margin
par(mfrow=c(3,1), omi=c(2,0.2,2,0), mar=c(0,8,4,8)) # all plots on one page 
plot(tundra$DOY, tundra$LAI, xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(0,365), ylim=c(0,6), pch=17, cex = 4, xaxt='n', yaxt='n')
# Move axis to top and left
axis(2,at=seq(0,6,by=2),cex.axis=3.5, las=1)
axis(2,at=seq(0,6,by=2),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
# Smoothing Spline
#dyn = smooth.spline(tundra$dynamic.uptake, tundra$depth, spar=0.35)
#lines(dyn, lwd = 3, xaxt='n', yaxt='n')
lines(tundra$DOY.1, tundra$Model, lwd = 4, xaxt='n', yaxt='n')
lines(tundra$DOY.1, tundra$MODIS, lwd = 4, xaxt='n', yaxt='n', col="gray50")
firsttag <- expression('ISAM'[DYN])
legend(181, 5.85, legend = c("   Measured"), pch=17, cex=3, bty = "n")#, lty = 1:7,
legend(168, 5.1, legend = c(firsttag, "MODIS"), cex=3, lty=1, col=c("black","gray50"), lwd=3, bty = "n")#, lty = 1:7,
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext(expression("LAI ("~m^2/m^2~")"), side=2, outer=TRUE, line=-4.3, cex=2.6)
mtext("Day of Year", side=1, outer=TRUE,line=2.5,cex=2.6)
text(30, 5.5, "(a) Tundra", cex = 3)
## subplot two
par(mar=c(2,8,2,8))
plot(bdecid$DOY, bdecid$LAI, xlab = "", ylab = "", 
      xlim=c(0,365), ylim=c(0,6), pch=17, cex = 4, xaxt='n', yaxt='n')
axis(2,at=seq(0,6,by=2), cex.axis=3.5, las=1)
axis(2,at=seq(0,6,by=2),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(bdecid$DOY.1, bdecid$Model, lwd = 4, xaxt='n', yaxt='n')
lines(bdecid$DOY.1, bdecid$MODIS, lwd = 4, xaxt='n', yaxt='n', col="gray50")
text(63, 5.5, "(b) Boreal Deciduous", cex = 3)
# subplot three
par(mar=c(4,8,0,8))
plot(bever$DOY, bever$LAI, xlab = "", ylab = "", 
      xlim=c(0,365), ylim=c(0,6), pch=17, cex = 4, xaxt='n', yaxt='n')
axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3.5, pos=-0.6)
axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
axis(2,at=seq(0,6,by=2), cex.axis=3.5, las=1)
axis(2,at=seq(0,6,by=2), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(bever$DOY.1, bever$Model, lwd = 4, xaxt='n', yaxt='n')
lines(bever$DOY.1, bever$MODIS, lwd = 4, xaxt='n', yaxt='n', col="gray50")
text(63, 5.5, "(c) Boreal Evergreen", cex = 3)
dev.off()
