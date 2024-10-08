# R plot using basic functions to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3")

# User inputs
tundra_fname = "Tundra_Fig3_at.csv"
grass_fname = "Grass_Fig3_at.csv"
bever_fname = "Bever_Fig3_at.csv"
bdecid_fname = "Bdecid_Fig3_at.csv"
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
par(mfrow=c(2,2), omi=c(0,0.5,1,0), mar=c(2,8,6,3)) # all plots on one page 
plot(tundra$dynamic.uptake, tundra$depth, xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(0,0.02), ylim=rev(c(0,30)), pch=1, cex = 0.5, xaxt='n', yaxt='n')
# Move axis to top and left
axis(3,at=seq(0,0.02,by=0.005),cex.axis=3)
axis(3,at=seq(0,0.02,by=0.005),labels=FALSE,tcl=-0.25)
axis(2,at=seq(30,0,by=-10),cex.axis=3, las=1)
axis(2,at=seq(30,0,by=-10),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
# Smoothing Spline
#dyn = smooth.spline(tundra$dynamic.uptake, tundra$depth, spar=0.35)
#lines(dyn, lwd = 3, xaxt='n', yaxt='n')
lines(tundra$dynamic.uptake, tundra$depth, lwd = 3, xaxt='n', yaxt='n')
lines(tundra$static.uptake, tundra$depth, lwd = 3, xaxt='n', yaxt='n', col="gray50")
legend(0.009, 20, legend = c("Dynamic root", "Static root"), cex=2.5, lty=1, col=c("black","gray50"), lwd=3, bty = "n")#, lty = 1:7,
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext("Soil Depth (cm)", side=2, outer=TRUE, line=-2, cex=3)
mtext("Water uptake (mm/day)", side=3, outer=TRUE,line=-1,cex=3)
#text(0.0027, 1.6, "(a) Tundra", cex = 2.5)
text(0.001, 4, "(a)", cex = 2.5)
## subplot two
par(mar=c(2,3,6,8))
plot(grass$dynamic.uptake, grass$depth, xlab = "", ylab = "", 
      xlim=c(0,0.2), ylim=rev(c(0,90)), pch=1, cex = 0.5, xaxt='n', yaxt='n')
axis(3,at=seq(0,0.2,by=0.05), cex.axis=3)
axis(3,at=seq(0,0.2,by=0.05),labels=FALSE,tcl=0.15)
axis(2,at=seq(90,0,by=-30),cex.axis=3, las=1)
axis(2,at=seq(90,0,by=-30),labels=FALSE,tcl=0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(grass$dynamic.uptake, grass$depth, lwd = 3, xaxt='n', yaxt='n')
lines(grass$static.uptake, grass$depth, lwd = 3, xaxt='n', yaxt='n', col="gray50")
#text(0.03, 5, "(b) Grass", cex = 2.5)
text(0.01, 12, "(b)", cex = 2.5)
## subplot three
par(mar=c(6,8,2,3))
plot(bdecid$dynamic.uptake, bdecid$depth, xlab = "", ylab = "", 
      xlim=c(0,0.4), ylim=rev(c(0,150)), pch=1, cex = 0.5, xaxt='n', yaxt='n')
axis(3,at=seq(0,0.4,by=0.1), cex.axis=3)
axis(3,at=seq(0,0.4,by=0.1),labels=FALSE,tcl=0.15)
axis(2,at=seq(150,0,by=-50), cex.axis=3, las=1)
axis(2,at=seq(150,0,by=-50),labels=FALSE,tcl=0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(bdecid$dynamic.uptake, bdecid$depth, lwd = 3, xaxt='n', yaxt='n')
lines(bdecid$static.uptake, bdecid$depth, lwd = 3, xaxt='n', yaxt='n', col="gray50")
#text(0.117, 10, "(c) Boreal Deciduous", cex = 2.5)
text(0.02, 23, "(c)", cex = 2.5)
# subplot four
par(mar=c(6,3,2,8))
plot(bever$dynamic.uptake, bever$depth, xlab = "", ylab = "", 
      xlim=c(0,1.0), ylim=rev(c(0,90)), pch=1, cex = 0.5, xaxt='n', yaxt='n')
axis(3,at=seq(0,1.0,by=0.25), cex.axis=3)
axis(3,at=seq(0,1.0,by=0.25),labels=FALSE,tcl=0.15)
axis(2,at=seq(90,0,by=-30), cex.axis=3, las=1)
axis(2,at=seq(90,0,by=-30),labels=FALSE,tcl=0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(bever$dynamic.uptake, bever$depth, lwd = 3, xaxt='n', yaxt='n')
lines(bever$static.uptake, bever$depth, lwd = 3, xaxt='n', yaxt='n', col="gray50")
#text(0.28, 6, "(d) Boreal Evergreen", cex = 2.5)
text(0.05, 16, "(d)", cex = 2.5)
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
