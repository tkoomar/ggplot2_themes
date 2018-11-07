source("../theme_black.R")

require(dplyr)
require(cowplot)
require(wesanderson)

plot_a <- ggplot(filter(diamonds, cut != "Fair"), 
                 aes(x = carat, group = cut, fill = cut)
                 ) + 
  scale_fill_manual(values = wes_palette("Darjeeling1", 7, "continuous")) + 
  labs(tag = "A",
       title = "theme_black()",
       subtitle = "@TannerKoomar"
  ) +
  geom_density(color = NA, alpha = 0.75) + 
  facet_wrap(~ cut) + 
  theme_black()

plot_b <- diamonds %>% 
  head(50) %>%
  ggplot(aes(x = depth, y = table, color = color)) + 
  scale_color_manual(values = wes_palette("Darjeeling1", 7, "continuous")) + 
  geom_point(pch = 18, size = 5) +
  labs(tag = "B",
       title = "theme_black()",
       subtitle = "@TannerKoomar"
  ) +
  theme_black()


plot_c <- diamonds %>% 
  group_by(cut, clarity) %>%
  summarize(price = median(price)) %>% 
  ggplot(aes(x = cut, y = clarity, fill = price)) + 
  geom_raster() + 
  scale_fill_gradientn(colors = wes_palettes$Darjeeling1[c(5,2,3,1)]) + 
  labs(tag = "C",
       title = "theme_black()",
       subtitle = "@TannerKoomar"
  ) + 
  theme_black() + 
  theme(legend.position = 'bottom',
        axis.text.x.bottom = element_text(angle = 30, hjust = 1))

plot_ab <- plot_grid(plotlist = list(plot_a, plot_b), nrow = 2)

plot_compound <- plot_grid(plotlist = list(plot_ab, plot_c), nrow = 1, rel_widths = c(1.5,1)) 

png("theme_black.png", width = 1000, height = 800)
plot_compound
dev.off()
