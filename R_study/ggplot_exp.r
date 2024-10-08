library(ggplot2)
library(cowplot)
library(ggthemes)
library(viridis)
p <-  ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl)))+geom_point() + theme_economist() # Theme from the Economist
q <-  ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl)))+geom_point() + facet_grid(drv ~ .) + theme_economist()
#plot_grid(p, q,labels= c('A', 'B'), label_size = 12,label_colour = ("blue"))
plot_grid(p, q,labels= c('A', 'B'), label_size = 12,label_colour = ("blue"),  align = "v",ncol = 1)

#p2 <-  ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl)))+geom_point() + 
#      theme_economist(base_family = "myfonts")
#q2 <-  ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl)))+geom_point() + 
#      facet_grid(drv ~ .) + theme_economist(base_family = "myfonts")
#r <-  ggplot(mpg, aes(x = cty) )+geom_bar(fill = "skyblue")+ theme_economist()
#bottom_row <- plot_grid(p2, q2,labels= c('A', 'B'), label_size = 12,label_colour = ("blue"),  align = "h")
#plot_grid(r, bottom_row, labels = c('A', ''), ncol = 1, rel_heights = c(1, 1.2),label_colour = ("blue"))

#ggdraw() +
#  draw_plot(p + theme(legend.justification = "bottom"), 0, 0, 1, 1) +
#  draw_plot(r + scale_color_viridis(discrete = TRUE) + 
#              theme(legend.justification = "top"), 0.5, 0.1, 0.5, 0.4) +
#  draw_plot_label(c("A", "B"), c(0, 0.55), c(1, 0.5), size = 15)

#ggdraw(r) + 
#  draw_plot_label("A", size = 14) + 
#  draw_label("This is a condidential figure!", angle = 45, size = 60, alpha = .2)

