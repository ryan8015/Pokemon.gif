install.packages("ggplot2")
library(ggplot2)
library(gganimate)
library(dplyr)
library(gapminder)
library(ggthemes)
library(gifski)
pokemon <- read.csv("Pokemon.csv")
pokemon$Type.I <- as.factor(pokemon$Type.I)
pokemon

graph3 = pokemon %>%
  ggplot(aes(x=Type.I,y=Atk,fill=Type.I)) +
  geom_boxplot() + 
  theme_fivethirtyeight() +
  labs(title="Pokemon Atk - sorted by Type", y="Attack")

graph3.animation = graph3 +
  transition_states(Type.I, wrap = FALSE) +
  shadow_mark(alpha = 0.5) + 
  enter_grow() + 
  exit_fade() +
  ease_aes('back-out')

animate(graph3.animation, height = 500, width = 800, fps = 60, duration = 5, end_pause = 30, res = 100)
anim_save("Pokemon_Type.gif")
