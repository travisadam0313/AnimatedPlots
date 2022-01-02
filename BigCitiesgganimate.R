library(ggplot2)
library(readxl)
library(gganimate)
library(gifski)
library(av)
library(png)
#Data sourced from Zillow.com
setwd("~/Desktop/Programming/R/AnimatedPlots/Project2")
BigCities <- read_excel("BigCities.xls", sheet = "BigCities")
#An original GGPLOT Animation

theme_set(theme_bw())

p <- ggplot(
  BigCities,
  aes(Date, MedianPrice, group = City, color = factor(City))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Date", y = "Median Price") +
  theme(legend.position = "top") 
  


p <- p + transition_reveal(Date)
p

an<-animate(p, duration = 5, fps = 20, width = 500, height = 200, renderer = gifski_renderer())
an
anim_save("BigCities.gif", an)
