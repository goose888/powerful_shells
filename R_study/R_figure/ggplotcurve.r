# R plot calling GGplot to generate plots
# Author: Shijie Shu

# Load Library
library(ggplot2)

# Change current directory
setwd("/data/keeling/a/sshu3/R_figure/sample_data")

# User inputs
tundra_fname = "Tundra_Fig2_at.csv"
grass_fname = "Grass_Fig2_at.csv"
bever_fname = "Bever_Fig2_at.csv"
bdecid_fname = "Bdecid_Fig2_at.csv"

# Read in data frame
tundra = read.csv(tundra_fname)
grass = read.csv(grass_fname)
bever = read.csv(bever_fname)
bdecid = read.csv(bdecid_fname)

# Setup ggplot with data frame
#p1 <- ggplot(data=tundra, aes(x=Cumulative.root.fraction(class=Measured), y=Soil.depth) #, color=class))
p1 <- ggplot(data=tundra, aes(x=Measured, y=depth)) + geom_point(size=3, shape=c(17)) +
      geom_line(aes(x=Static, y=depth.2), color="#999999") + geom_line(aes(x=Dynamic, y=depth.1)) + theme_bw() +
      scale_y_continuous(limits=c(0, 100)) +
      scale_y_reverse() + labs(x = "Cumulative root fraction", y = "Soil depth (cm)") +
      theme(axis.text.x = element_text(size=15,angle=0,face="plain"),
      axis.text.y = element_text(size=15,angle=0,face="plain"),  
      axis.title.x = element_text(size=15,angle=0,face="plain"),
      axis.title.y = element_text(size=15,angle=90,face="plain")) + 
      scale_color_discrete(name ="")

# Add layers
#P1 = p1+geom_line(aes(x=Cumulative.root.fraction, y=Soil.depth, group=class, subset = class %in% c("Measured")))+
#       scale_y_reverse() + theme(axis.text.x = element_text(colour="grey20",size=15,angle=0,face="plain"),
#       axis.text.y = element_text(colour="grey20",size=15,angle=0,face="plain"),  
#       axis.title.x = element_text(colour="grey20",size=20,angle=0,face="plain"),
#       axis.title.y = element_text(colour="grey20",size=20,angle=90,face="plain")) + 
#       scale_color_discrete(name ="")
multiplot(p1, p2, p3, p4, cols=2)
