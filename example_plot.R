source("blank_theme.R")

require(dplyr)

plot_a <- ggplot(filter(diamonds, cut != "Fair"), 
       aes(x = carat, group = cut, fill = cut)
) + 
  labs(tag = "A",
       title = "Title",
       subtitle = "Subtitle"
  ) +
  geom_density(color = NA) + 
  facet_wrap(~ cut) + 
  new_theme()

plot_b <- diamonds %>% 
  head(50) %>%
  ggplot(aes(x = depth, y = table, color = color)) + 
  #stat_smooth(se = FALSE) + 
  geom_point(pch= 8, size = 5) +
  labs(tag = "B",
       title = "Title",
       subtitle = "Subtitle"
  ) +
  new_theme()


plot_c <- diamonds %>% 
  group_by(cut, clarity) %>%
  summarize(price = median(price)) %>% 
  ggplot(aes(x = cut, y = clarity, fill = price)) + 
  geom_raster() + 
  new_theme() + 
  labs(tag = "C",
       title = "Title",
       subtitle = "Subtitle"
  )


