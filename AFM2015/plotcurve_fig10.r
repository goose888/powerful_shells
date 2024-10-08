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
gpp_bdecid_fname = "GPP_Fig10_bdecid.csv"
gpp_tundra_fname = "GPP_Fig10_tundra.csv"
gpp_grass_fname  = "GPP_Fig10_grass.csv"
gpp_bever_fname  = "GPP_Fig10_bever.csv"
le_bdecid_fname  = "LE_Fig10_bdecid.csv"
le_tundra_fname  = "LE_Fig10_tundra.csv"
le_grass_fname   = "LE_Fig10_grass.csv"
le_bever_fname   = "LE_Fig10_bever.csv"
sh_bdecid_fname  = "SH_Fig10_bdecid.csv"
sh_tundra_fname  = "SH_Fig10_tundra.csv"
sh_grass_fname   = "SH_Fig10_grass.csv"
sh_bever_fname   = "SH_Fig10_bever.csv"
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
par(mfrow=c(3,4), omi=c(1,1.5,1.5,0.5), mar=c(1,1,1,1)) # all plots on one page 

## subplot one
# Set margin
plot(gpp_tundra$Month, gpp_tundra$MTE, xlab="", ylab="", #xlab = "Cumulative root fraction", ylab = "Soil depth (cm)", 
      xlim=c(1,12), ylim=c(0,4), pch=1, cex=4, xaxt='n', yaxt='n')
# Move axis to top and left
axis(2,at=seq(0,4,by=2),cex.axis=3.5, las=1)
axis(2,at=seq(0,4,by=2),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_tundra$Month, gpp_tundra$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(gpp_tundra$Month, gpp_tundra$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
#legend(181, 5.8, legend = c("   MTE"), pch=17, cex=3, bty = "n")#, lty = 1:7,
#legend(168, 5.1, legend = c("Modeled", "MODIS"), cex=3, lty=1, col=c("black","gray50"), lwd=3, bty = "n")#, lty = 1:7,
     #  pch = "*", ncol = 4, cex = 0.8)
# Put Label for X and Y axis
mtext(expression('GPP (GtC)'), at=c(0.85), side=2, outer=TRUE, line=4.5, cex=2.6)
mtext("Month", side=1, outer=TRUE,line=5,cex=2.6)
mtext("Tundra", at=c(0.12), side=3, outer=TRUE, line=0.5, cex=2.6)
text(2, 3.8, "(a)", cex = 3)
## subplot two
par(mar=c(1,1,1,1))
plot(gpp_grass$Month, gpp_grass$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,4), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1),labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_grass$Month, gpp_grass$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(gpp_grass$Month, gpp_grass$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
mtext("Grass", at=c(0.38), side=3, outer=TRUE, line=0.5, cex=2.6)
text(2, 3.8, "(b)", cex = 3)
# subplot three
par(mar=c(1,1,1,1))
plot(gpp_bdecid$Month, gpp_bdecid$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,4), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_bdecid$Month, gpp_bdecid$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(gpp_bdecid$Month, gpp_bdecid$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
mtext("Boreal Deciduous", at=c(0.63), side=3, outer=TRUE, line=0.5, cex=2.6)
text(2, 3.8, "(c)", cex = 3)
# subplot four
par(mar=c(1,1,1,1))
plot(gpp_bever$Month, gpp_bever$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,4), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(gpp_bever$Month, gpp_bever$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(gpp_bever$Month, gpp_bever$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
mtext("Boreal Evergreen", at=c(0.88), side=3, outer=TRUE, line=0.5, cex=2.6)
text(2, 3.8, "(d)", cex = 3)
# subplot five
par(mar=c(1,1,1,1))
plot(le_tundra$Month, le_tundra$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
axis(2,at=seq(0,100,by=50), cex.axis=3.5, las=1)
axis(2,at=seq(0,100,by=50), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_tundra$Month, le_tundra$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(le_tundra$Month, le_tundra$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
mtext(expression('LH (W'~m^{-2}~')'), at=c(0.5), side=2, outer=TRUE, line=4.5, cex=2.6)
text(2, 95, "(e)", cex = 3)
# subplot six
par(mar=c(1,1,1,1))
plot(le_grass$Month, le_grass$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_grass$Month, le_grass$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(le_grass$Month, le_grass$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
text(2, 95, "(f)", cex = 3)
# subplot seven
par(mar=c(1,1,1,1))
plot(le_bdecid$Month, le_bdecid$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_bdecid$Month, le_bdecid$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(le_bdecid$Month, le_bdecid$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
text(2, 95, "(g)", cex = 3)
# subplot eight
par(mar=c(1,1,1,1))
plot(le_bever$Month, le_bever$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
#axis(1,at=seq(0,365,by=50), lwd=0, cex.axis=3, pos=-0.5)
#axis(1,at=seq(0,365,by=50),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(le_bever$Month, le_bever$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(le_bever$Month, le_bever$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
text(2, 95, "(h)", cex = 3)
# subplot nine
par(mar=c(1,1,1,1))
plot(sh_tundra$Month, sh_tundra$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
axis(1,at=seq(0,12,by=2), lwd=0, cex.axis=3.5, pos=-10)
axis(1,at=seq(0,12,by=2),labels=FALSE,tcl=-0.5)
axis(2,at=seq(0,100,by=50), cex.axis=3.5, las=1)
axis(2,at=seq(0,100,by=50), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_tundra$Month, sh_tundra$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(sh_tundra$Month, sh_tundra$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
mtext(expression('SH (W'~m^{-2}~')'), at=c(0.18), side=2, outer=TRUE, line=4.5, cex=2.6)
text(2, 95, "(i)", cex = 3)
# subplot ten
par(mar=c(1,1,1,1))
plot(sh_grass$Month, sh_grass$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
axis(1,at=seq(0,12,by=2), lwd=0, cex.axis=3.5, pos=-10)
axis(1,at=seq(0,12,by=2),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_grass$Month, sh_grass$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(sh_grass$Month, sh_grass$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
text(2, 95, "(j)", cex = 3)
# subplot eleven
par(mar=c(1,1,1,1))
plot(sh_bdecid$Month, sh_bdecid$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
axis(1,at=seq(0,12,by=2), lwd=0, cex.axis=3.5, pos=-10)
axis(1,at=seq(0,12,by=2),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_bdecid$Month, sh_bdecid$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(sh_bdecid$Month, sh_bdecid$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
text(2, 95, "(k)", cex = 3)
# subplot twelve
par(mar=c(1,1,1,1))
plot(sh_bever$Month, sh_bever$MTE, xlab = "", ylab = "", 
      xlim=c(1,12), ylim=c(0,100), pch=1, cex=4, xaxt='n', yaxt='n')
axis(1,at=seq(0,12,by=2), lwd=0, cex.axis=3.5, pos=-10)
axis(1,at=seq(0,12,by=2),labels=FALSE,tcl=-0.5)
#axis(2,at=seq(0,6,by=1), cex.axis=3, las=1)
#axis(2,at=seq(0,6,by=1), labels=FALSE,tcl=-0.25)
grid(NULL, NULL, col = "lightgray", lty = "dotted", lwd = 3, equilogs = TRUE)
lines(sh_bever$Month, sh_bever$ISAMBC, lwd = 4, lty=2, xaxt='n', yaxt='n')
lines(sh_bever$Month, sh_bever$ISAMDYN, lwd = 4, lty=1, xaxt='n', yaxt='n')
text(2, 95, "(l)", cex = 3)

reset()
# Put legend outside the plot
firsttag <- expression('ISAM'[BC])
secondtag <- expression('ISAM'[DYN])
legend(0.2, 1.03, legend = c(secondtag, firsttag), lty = c(1, 2), cex = 2.5, lwd = 4, xpd=NA, bty = "n", horiz=TRUE)#, lty = 1:7,
legend(0.58, 1.03, legend = c("FLUXNET-MTE"), pch = c(1), cex = 2.5, xpd=NA, bty = "n", horiz=TRUE)#, lty = 1:7,

dev.off()

