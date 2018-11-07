source("../theme_cc.R")

require(dplyr)
require(cowplot)

plot_a <- ggplot(filter(diamonds, cut != "Fair"), 
                 aes(x = carat, group = cut, fill = cut)
                 ) + 
  scale_fill_brewer(palette = "Spectral") + 
  labs(tag = "A",
       title = "theme_cc()",
       subtitle = "@TannerKoomar"
  ) +
  geom_density(color = NA, alpha = 0.75) + 
  facet_wrap(~ cut) + 
  theme_cc()

plot_b <- diamonds %>% 
  head(50) %>%
  ggplot(aes(x = depth, y = table, color = color)) + 
  scale_color_brewer(palette = "Spectral") + 
  geom_point(pch = 18, size = 8) +
  labs(tag = "B",
       title = "theme_cc()",
       subtitle = "@TannerKoomar"
  ) +
  theme_cc()


plot_c <- diamonds %>% 
  group_by(cut, clarity) %>%
  summarize(price = median(price)) %>% 
  ggplot(aes(x = cut, y = clarity, fill = price)) + 
  geom_raster() + 
  scale_fill_distiller(palette = "Spectral") + 
  labs(tag = "C",
       title = "theme_cc()",
       subtitle = "@TannerKoomar"
  ) + 
  theme_cc() + 
  theme(legend.position = 'bottom',
        legend.text = element_text(angle = 30, hjust = 1),
        axis.text.x.bottom = element_text(angle = 30, hjust = 1))

plot_ab <- plot_grid(plotlist = list(plot_a, plot_b), nrow = 2)

plot_compound <- plot_grid(plotlist = list(plot_ab, plot_c), nrow = 1, rel_widths = c(1.5,1)) 

png("theme_cc.png", width = 1000, height = 800)
plot_compound
dev.off()
