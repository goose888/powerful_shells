# R plot using basic functions to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3/Bassil_NHL")

# User inputs
gpp_fname = "GPP_Fig6_at.csv"
le_fname = "LE_Fig6_at.csv"
sh_fname = "SH_Fig6_at.csv"
#plot_path = ""

# Read in data frame
gpp = read.csv(gpp_fname)
le = read.csv(le_fname)
sh = read.csv(sh_fname)

# Plot figures: Bar Chart
# Open PDF file
#par(pch=17, col="black") # plotting symbol and color 
pdf(file="test.pdf", width=17, height=12)
par(mfrow=c(3,1), omi=c(0.5,1,0.5,1), mar=c(0,8,6,8)) # all plots on one page 

# Subplot 1
gppdata = cbind(gpp$BorealDeciduous, gpp$BorealEvergreen, gpp$Tundra, gpp$Grass)
barplot(gppdata, main="", col=c("black", "gray50", "white"), 
        cex.lab=2.5, cex.axis=2.5, cex.names=1.9, cex.main=3, cex.sub=3, yaxt='n', las=1, beside=TRUE, ylim=c(0,1500))
box()
axis(2,at=seq(0,2000,by=500),cex.axis=3, las=1)
axis(2,at=seq(0,2000,by=500),labels=FALSE,tcl=-0.25)
mtext(expression('GPP (gC'~m^{-2}~~yr^{-1}~')'), side=2, at=0.8, outer=TRUE, line=-1.5, cex=2.5)
#mtext("Deciduous", at=c(0.18), side=1, outer=TRUE, line=-1.5, cex=3)
#mtext("Evergreen", at=c(0.38), side=1, outer=TRUE, line=-1.5, cex=3)
firsttag <- expression('ISAM'[BC])
secondtag <- expression('ISAM'[DYN])
legend("top", legend = c(firsttag, secondtag, "Flux tower"), fill = c("black", "gray50", "white"), cex = 3.5, bty = "n", horiz=TRUE)

# Subplot 2
par(mar=c(3,8,3,8))
ledata = cbind(le$BorealDeciduous, le$BorealEvergreen, le$Tundra, le$Grass)
barplot(ledata, main="", col=c("black", "gray50", "white"), 
        cex.lab=2.5, cex.axis=2.5, cex.names=1.9, cex.main=3, cex.sub=3, yaxt='n', las=1, beside=TRUE, ylim=c(0,30))
box()
axis(2,at=seq(0,40,by=10),cex.axis=3, las=1)
axis(2,at=seq(0,40,by=10),labels=FALSE,tcl=-0.25)
mtext(expression('LH (W'~m^{-2}~')'), side=2, at=0.5, outer=TRUE, line=-1.5, cex=2.5)
#mtext("Deciduous", at=c(0.18), side=1, outer=TRUE, line=-1.5, cex=3)
#mtext("Evergreen", at=c(0.38), side=1, outer=TRUE, line=-1.5, cex=3)
#legend("top", legend = c(firsttag, secondtag, "Measured"), fill = c("black", "gray50", "white"), cex = 2.5)

# Subplot 3
par(mar=c(6,8,0,8))
shdata = cbind(sh$BorealDeciduous, sh$BorealEvergreen, sh$Tundra, sh$Grass)
barplot(shdata, main="",
        col=c("black", "gray50", "white"), cex.names=0, cex.main=3, cex.sub=3, yaxt='n', las=1, beside=TRUE, ylim=c(0,70))
box()
axis(2,at=seq(0,100,by=20), cex.axis=3, las=1)
axis(2,at=seq(0,100,by=20), labels=FALSE, tcl=-0.25)
mtext(expression('SH (W'~m^{-2}~')'), side=2, at=0.2, outer=TRUE, line=-1.5, cex=2.5)
mtext("Boreal Deciduous", at=c(0.18), side=1, outer=TRUE, line=-3.5, cex=2.2)
mtext("Boreal Evergreen", at=c(0.4), side=1, outer=TRUE, line=-3.5, cex=2.2)
mtext("Tundra", at=c(0.6), side=1, outer=TRUE, line=-3.5, cex=2.2)
mtext("Grassland", at=c(0.81), side=1, outer=TRUE, line=-3.5, cex=2.2)
#legend("top", legend = c(firsttag, secondtag, "Measured"), fill = c("black", "gray50", "white"), cex = 2.5)
dev.off()

