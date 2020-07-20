source(here::here("theme_episli.R"))

require(dplyr)
require(cowplot)

plot_a <- ggplot(filter(diamonds, cut != "Fair"), 
                 aes(x = carat, group = cut, fill = cut)
) + 
  scale_fill_brewer(palette = "Spectral") + 
  labs(tag = "A",
       title = "theme_episli()",
       subtitle = "@TannerKoomar"
  ) +
  geom_density(color = NA, alpha = 0.75) + 
  facet_wrap(~ cut) + 
  theme_episli()

plot_b <- diamonds %>% 
  head(50) %>%
  ggplot(aes(x = depth, y = table, color = color)) + 
  scale_color_brewer(palette = "Spectral") + 
  geom_point(pch = 18, size = 8) +
  labs(tag = "B",
       title = "theme_episli()",
       subtitle = "@TannerKoomar"
  ) +
  theme_episli()


plot_c <- diamonds %>% 
  group_by(cut, clarity) %>%
  summarize(price = median(price)) %>% 
  ggplot(aes(x = cut, y = clarity, fill = price)) + 
  geom_tile() + 
  scale_fill_distiller(palette = "Spectral") + 
  labs(tag = "C",
       title = "theme_episli()",
       subtitle = "@TannerKoomar"
  ) + 
  theme_episli() + 
  theme(legend.position = 'bottom',
        legend.text = element_text(angle = 30, hjust = 1),
        axis.text.x.bottom = element_text(angle = 30, hjust = 1))

plot_ab <- plot_grid(plotlist = list(plot_a, plot_b), nrow = 2)

plot_compound <- plot_grid(plotlist = list(plot_ab, plot_c), nrow = 1, rel_widths = c(1.5,1)) 

ggsave(filename = here::here("examples/theme_episli.png"),
       plot = plot_compound, 
       width = 10, height = 8)

plot_a + theme_episli()
ggsave(filename = 'test.png', plot =plot_a + theme_episli(base_size = 35) )
