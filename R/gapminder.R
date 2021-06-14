library(gapminder)
library(gganimate)

p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  ylim(20, 90) +
  geom_point(alpha = 0.6) +
  scale_size("population", limits = range(gapminder$pop)) +
  scale_x_log10(limits = range(gapminder$gdpPercap)) +
  labs(title = 'Year: {frame_time}',
       x = 'GDP per capita',
       y = 'life expectancy') +
  theme_classic() +
  transition_time(year) +
  ease_aes()

tmp <- tempdir()

anim <- animate(p,
                dev = "png",
                renderer = av_renderer(),
                width = 1280,
                height = 960,
                pointsize = 10,
                res = 204)
anim_save("videos/gapminder.mp4", anim)
