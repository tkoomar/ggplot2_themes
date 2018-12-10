source("../theme_merbivore.R")

require(dplyr)
require(cowplot)

plot_a <- ggplot(filter(diamonds, cut != "Fair"), 
       aes(x = carat, group = cut, fill = cut)
) + 
  labs(tag = "A",
       title = "theme_merb()",
       subtitle = "@TanerKoomar"
  ) +
  geom_density(color = NA) + 
  facet_wrap(~ cut) + 
  theme_merb() + 
  scale_fill_manual(values = colors_merb)

plot_b <- diamonds %>% 
  head(50) %>%
  ggplot(aes(x = depth, y = table, color = color)) + 
  #stat_smooth(se = FALSE) + 
  geom_point(pch= 8, size = 5) +
  labs(tag = "B",
       title = "theme_merb()",
       subtitle = "@TannerKoomar"
  ) +
  theme_merb() +
  scale_color_manual(values = grDevices::colorRampPalette(colors_merb_seq)(7))


plot_c <- diamonds %>% 
  group_by(cut, clarity) %>%
  summarize(price = median(price)) %>% 
  ggplot(aes(x = cut, y = clarity, fill = price)) + 
  geom_raster() + 
  labs(tag = "C",
       title = "theme_merb",
       subtitle = "@TannerKoomar"
  )  + 
  theme_merb() + 
  scale_fill_gradientn(colors = colors_merb_seq)


plot_ab <- plot_grid(plotlist = list(plot_a, plot_b), nrow = 2)

plot_compound <- plot_grid(plotlist = list(plot_ab, plot_c), nrow = 1, rel_widths = c(1.5,1)) 

png("theme_merbivore.png", width = 1000, height = 800)
plot_compound
dev.off()
