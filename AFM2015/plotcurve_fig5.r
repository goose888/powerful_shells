# R plot using basic functions to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/net/san-a1-ib/data/keeling/a/sshu3")

# User inputs
fname = "Fig5_at.csv"
#plot_path = ""

# Read in data frame
bdata = read.csv(fname)

# Plot figures: Bar Chart
# Open PDF file
#par(pch=17, col="black") # plotting symbol and color 
pdf(file="test.pdf", width=17, height=12)
par(omi=c(1,2,1,2))
bardata = cbind(bdata$BorealDeciduous, bdata$BorealEvergreen, bdata$Tundra, bdata$Grass)
barplot(bardata, main="", names.arg=c("Boreal Deciduous", "Boreal Evergreen", "Tundra", "Grassland"), 
        col=c("black", "gray50", "white"), cex.lab=2.5, cex.axis=2.5, cex.names=1.9, cex.main=3, cex.sub=3, yaxt='n', las=1, beside=TRUE)#, ylim=c(0,22000))
#axis(1,,by=50), lwd=0, cex.axis=3.5, pos=-0.6)
segments(0.2, 0, 20, 0, col = c("black"), lty = 1, lwd = 2)
#axis(1, labels=FALSE)
axis(2,at=seq(0,400,by=50),cex.axis=2.5, las=1)
axis(2,at=seq(0,400,by=50),labels=FALSE,tcl=-0.25)
mtext("Day of Year", side=2, outer=TRUE, line=2, cex=2.5)
#mtext("Deciduous", at=c(0.18), side=1, outer=TRUE, line=-1.5, cex=3)
#mtext("Evergreen", at=c(0.38), side=1, outer=TRUE, line=-1.5, cex=3)
firsttag <- expression('ISAM'[BC])
secondtag <- expression('ISAM'[DYN])
legend("top", legend = c(firsttag, secondtag, "Measured"), fill = c("black", "gray50", "white"), cex = 2.5)
dev.off()

