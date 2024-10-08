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
setwd("/net/san-a1-ib/data/keeling/a/sshu3/Bassil_NHL/")

# User inputs
gpp_bdecid_fname = "GPP_Fig7_bdecid_at.csv"
gpp_tundra_fname = "GPP_Fig7_tundra_at.csv"
gpp_grass_fname  = "GPP_Fig7_grass_at.csv"
gpp_bever_fname  = "GPP_Fig7_bever_at.csv"
le_bdecid_fname  = "LE_Fig7_bdecid_at.csv"
le_tundra_fname  = "LE_Fig7_tundra_at.csv"
le_grass_fname   = "LE_Fig7_grass_at.csv"
le_bever_fname   = "LE_Fig7_bever_at.csv"
sh_bdecid_fname  = "SH_Fig7_bdecid_at.csv"
sh_tundra_fname  = "SH_Fig7_tundra_at.csv"
sh_grass_fname   = "SH_Fig7_grass_at.csv"
sh_bever_fname   = "SH_Fig7_bever_at.csv"
#plot_path = ""

# Read in data frame
gpp_bdecid = read.csv(gpp_bdecid_fname)
gpp_tundra = read.csv(gpp_tundra_fname)
gpp_grass  = read.csv(gpp_grass_fname)
gpp_bever  = read.csv(gpp_bever_fname)
le_bdecid  = read.csv(le_bdecid_fname)
le_tundra  = read.csv(le_tundra_fname)
le_grass   = read.csv(le_grass_fname)
le_bever   = read.csv(le_bever_fname)
sh_bdecid  = read.csv(sh_bdecid_fname)
sh_tundra  = read.csv(sh_tundra_fname)
sh_grass   = read.csv(sh_grass_fname)
sh_bever   = read.csv(sh_bever_fname)

# Plot figures: 4x3 curve charts
# Open PDF file
pdf(file="test.pdf", width=20, height=12)
par(mfrow=c(3,4), omi=c(1.2,1.5,1.5,0.5), mar=c(1,1,1,1)) # all plots on one page 

## subplot one
# Set margin
plot(gpp_tundra$DOY, gpp_tundra$Measured, type="n", xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(100,320), ylim=c(0,15), xaxt='n', yaxt='n')
# Move axis to top and left
axis(2,at=seq(0,15,by=5),cex.axis=4, las=1)
axis(2,at=seq(0,15,by=5),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_tundra$DOY, gpp_tundra$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(gpp_tundra$DOY, gpp_tundra$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(gpp_tundra$DOY, gpp_tundra$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext(expression('GPP (gC'~m^{-2}~~d^{-1}~')'), at=c(0.85), side=2, outer=TRUE, line=6.5, cex=2.6)
mtext("Day of Year", side=1, outer=TRUE,line=6,cex=2.6)
mtext("Tundra", at=c(0.12), side=3, outer=TRUE, line=0.5, cex=2.6)
text(110, 14, "(a)", cex = 3.5)
## subplot two
par(mar=c(1,1,1,1))
plot(gpp_grass$DOY, gpp_grass$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,15), xaxt='n', yaxt='n')
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_grass$DOY, gpp_grass$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(gpp_grass$DOY, gpp_grass$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(gpp_grass$DOY, gpp_grass$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext("Grass", at=c(0.38), side=3, outer=TRUE, line=0.5, cex=2.6)
text(110, 14, "(b)", cex = 3.5)
# subplot three
par(mar=c(1,1,1,1))
plot(gpp_bdecid$DOY, gpp_bdecid$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,15), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_bdecid$DOY, gpp_bdecid$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(gpp_bdecid$DOY, gpp_bdecid$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(gpp_bdecid$DOY, gpp_bdecid$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext("Boreal Deciduous", at=c(0.635), side=3, outer=TRUE, line=0.5, cex=2.6)
text(110, 14, "(c)", cex = 3.5)
# subplot four
par(mar=c(1,1,1,1))
plot(gpp_bever$DOY, gpp_bever$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,15), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_bever$DOY, gpp_bever$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(gpp_bever$DOY, gpp_bever$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(gpp_bever$DOY, gpp_bever$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext("Boreal Evergreen", at=c(0.88), side=3, outer=TRUE, line=0.5, cex=2.6)
text(110, 14, "(d)", cex = 3.5)
# subplot five
par(mar=c(1,1,1,1))
plot(le_tundra$DOY, le_tundra$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,130), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
axis(2,at=seq(0,120,by=50), cex.axis=4, las=1)
axis(2,at=seq(0,120,by=50), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_tundra$DOY, le_tundra$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(le_tundra$DOY, le_tundra$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(le_tundra$DOY, le_tundra$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext(expression('LH (W'~m^{-2}~')'), at=c(0.5), side=2, outer=TRUE, line=6.5, cex=2.6)
text(110, 120, "(e)", cex = 3.5)
# subplot six
par(mar=c(1,1,1,1))
plot(le_grass$DOY, le_grass$Measured, type = "n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,130), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_grass$DOY, le_grass$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(le_grass$DOY, le_grass$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(le_grass$DOY, le_grass$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 120, "(f)", cex = 3.5)
# subplot seven
par(mar=c(1,1,1,1))
plot(le_bdecid$DOY, le_bdecid$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,130), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_bdecid$DOY, le_bdecid$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(le_bdecid$DOY, le_bdecid$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(le_bdecid$DOY, le_bdecid$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 120, "(g)", cex = 3.5)
# subplot eight
par(mar=c(1,1,1,1))
plot(le_bever$DOY, le_bever$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,130), xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_bever$DOY, le_bever$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(le_bever$DOY, le_bever$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(le_bever$DOY, le_bever$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 120, "(h)", cex = 3.5)
# subplot nine
par(mar=c(1,1,1,1))
plot(sh_tundra$DOY, sh_tundra$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,220), xaxt='n', yaxt='n')
axis(1,at=seq(100,320,by=50), lwd=0, cex.axis=4, pos=-25)
axis(1,at=seq(100,320,by=50),labels=FALSE,tcl=-0.5)
axis(2,at=seq(0,220,by=50), cex.axis=4, las=1)
axis(2,at=seq(0,220,by=50), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_tundra$DOY, sh_tundra$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(sh_tundra$DOY, sh_tundra$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(sh_tundra$DOY, sh_tundra$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
mtext(expression('SH (W'~m^{-2}~')'), at=c(0.18), side=2, outer=TRUE, line=6.5, cex=2.6)
text(110, 205, "(i)", cex = 3.5)
# subplot ten
par(mar=c(1,1,1,1))
plot(sh_grass$DOY, sh_grass$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,220), xaxt='n', yaxt='n')
axis(1,at=seq(100,320,by=50), lwd=0, cex.axis=4, pos=-25)
axis(1,at=seq(100,320,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_grass$DOY, sh_grass$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(sh_grass$DOY, sh_grass$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(sh_grass$DOY, sh_grass$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 205, "(j)", cex = 3.5)
# subplot eleven
par(mar=c(1,1,1,1))
plot(sh_bdecid$DOY, sh_bdecid$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,220), xaxt='n', yaxt='n')
axis(1,at=seq(100,320,by=50), lwd=0, cex.axis=4, pos=-25)
axis(1,at=seq(100,320,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_bdecid$DOY, sh_bdecid$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(sh_bdecid$DOY, sh_bdecid$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(sh_bdecid$DOY, sh_bdecid$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 205, "(k)", cex = 3.5)
# subplot twelve
par(mar=c(1,1,1,1))
plot(sh_bever$DOY, sh_bever$Measured, type="n", xlab = "", ylab = "", 
      xlim=c(100,320), ylim=c(0,220), xaxt='n', yaxt='n')
axis(1,at=seq(100,320,by=50), lwd=0, cex.axis=4, pos=-25)
axis(1,at=seq(100,320,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_bever$DOY, sh_bever$Measured, lwd = 3, col="black", xaxt='n', yaxt='n')
lines(sh_bever$DOY, sh_bever$ISAMBC, lwd = 3, xaxt='n', yaxt='n', col="blue")
lines(sh_bever$DOY, sh_bever$ISAMDYN, lwd = 3, xaxt='n', yaxt='n', col="red")
text(110, 205, "(l)", cex = 3.5)

reset()
# Put legend outside the plot
firsttag <- expression('ISAM'[DYN])
secondtag <- expression('ISAM'[BC])
legend("top", legend = c(firsttag, secondtag, "Flux tower"), col = c("red", "blue", "black"), cex = 2.5, lwd = 3, xpd=NA, bty = "n", horiz=TRUE)#, lty = 1:7,
dev.off()

