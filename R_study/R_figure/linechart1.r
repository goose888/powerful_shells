# R plot using basic functions to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3")

# User inputs
tundra_fname = "Tundra_Fig2_at.csv"
grass_fname = "Grass_Fig2_at.csv"
bever_fname = "Bever_Fig2_at.csv"
bdecid_fname = "Bdecid_Fig2_at.csv"
#plot_path = ""

# Read in data frame
tundra = read.csv(tundra_fname)
grass = read.csv(grass_fname)
bever = read.csv(bever_fname)
bdecid = read.csv(bdecid_fname)

# Plot figures
# Open PDF file
#par(pch=17, col="black") # plotting symbol and color 
pdf(file="test.pdf", width=17, height=10)
#for(i in 1:length(opts)){ 
#  heading = paste("type=",opts[i])
## subplot one
# Set margin
par(mfrow=c(2,2), omi=c(0,0.3,0,0), mar=c(0.6,8,8,0.6)+0.1) # all plots on one page 
plot(tundra$Measured, tundra$depth, xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(0.0,1.0), ylim=rev(c(0,100)), pch=17, cex= 4, xaxt='n', yaxt='n')
# Move axis to top and left
axis(3,at=seq(0.0,1.0,by=0.2),cex.axis=3)
axis(3,at=seq(0.0,1.0,by=0.2),labels=FALSE,tcl=-0.25)
axis(2,at=seq(100,0,by=-20),cex.axis=3, las=1)
axis(2,at=seq(100,0,by=-20),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(tundra$Dynamic, tundra$depth.1, lwd = 4, xaxt='n', yaxt='n')
lines(tundra$Static, tundra$depth.2, lwd = 4, xaxt='n', yaxt='n', col="gray50")
legend(0.118, 34, legend = c("   Measured"), cex=3, pch = 17, bty = "n")
legend(0.055, 50, legend = c("Modeled Dynamic", "Modeled Static"), cex=3, lty=1, col=c("black","gray50"), lwd=3, bty = "n")#, lty = 1:7,
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext("Soil Depth (cm)", side=2, outer=TRUE, line=-2, cex=3)
mtext("Cumulative root fraction", side=3, outer=TRUE,line=-3.7,cex=3)
text(0.03, 10, "(a)", cex = 3)
## subplot two
par(mar=c(0.6,0.6,8,8)+0.1)
plot(bdecid$Measured, bdecid$depth, xlab = "", ylab = "", 
      xlim=c(0.0,1.0), ylim=rev(c(0,100)), pch=17, cex = 4, xaxt='n', yaxt='n')
axis(3,at=seq(0.0,1.0,by=0.2), cex.axis=3)
axis(3,at=seq(0.0,1.0,by=0.2),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(bdecid$Dynamic, bdecid$depth.1, lwd = 4, xaxt='n', yaxt='n')
lines(bdecid$Static, bdecid$depth.2, lwd = 4, xaxt='n', yaxt='n', col="gray50")
text(0.03, 10, "(b)", cex = 3)
## subplot three
par(mar=c(8,8,0.6,0.6)+0.1)
plot(grass$Measured, grass$depth, xlab = "", ylab = "", 
      xlim=c(0.0,1.0), ylim=rev(c(0,100)), pch=17, cex = 4, xaxt='n', yaxt='n')
axis(2,at=seq(100,0,by=-20), cex.axis=3, las=1)
axis(2,at=seq(100,0,by=-20),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(grass$Dynamic, grass$depth.1, lwd = 4, xaxt='n', yaxt='n')
lines(grass$Static, grass$depth.2, lwd = 4, xaxt='n', yaxt='n', col="gray50")
text(0.03, 10, "(c)", cex = 3)
# subplot four
par(mar=c(8,0.6,0.6,8)+0.1)
plot(bever$Measured, bever$depth, xlab = "", ylab = "", 
      xlim=c(0.0,1.0), ylim=rev(c(0,100)), pch=17, cex = 4, cex.lab=1, cex.axis = 1, xaxt='n', yaxt='n')
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(bever$Dynamic, bever$depth.1, lwd = 4, xaxt='n', yaxt='n')
lines(bever$Static, bever$depth.2, lwd = 4, xaxt='n', yaxt='n', col="gray50")
# Add subplot labels
text(0.03, 10, "(d)", cex = 3)
#
#}

#pdf(file="test.pft"paste(plot_path, "/", plot_path, "_multi_", as.integer(beg_yr2+yr_avg-1), ".pdf", sep=""), width=17, height=10)
#par(mfrow=c(2,2),mar=c(-0.1,4,4,-0.1)+0.1,cex=1.3)
#plot(0,0,type='n',xlim=xrange,ylim=yrange,xaxt='n',yaxt='n',main=title,ylab=ylabel,cex.main=1.375)
#xlow <- ceiling(xrange[1]/10)*10
#axis(3,at=seq(xlow,xrange[2],by=10),labels=FALSE)
#axis(3,at=seq(xrange[1],xrange[2],by=5),labels=FALSE,tcl=-0.25)
#axis(2,at=seq(yrange[1],yrange[2],by=50))
#axis(2,at=seq(yrange[1],yrange[2],by=10),labels=FALSE,tcl=-0.25)
