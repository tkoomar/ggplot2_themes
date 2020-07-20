## A theme for the EpiSLI WGS paper

## Margins and such have been roughly optimized to be run with a base_size = 35 for export at 300dpi

require(ggplot2)
require(dplyr)



theme_episli <- function (base_size = 11, 
                          base_family = "",
                          base_line_size = base_size/24, 
                          base_rect_size = base_size/24) {
  half_line <- base_size/2
  theme_classic(base_size = base_size,
                base_family = base_family, 
                base_line_size = base_line_size, 
                base_rect_size = base_rect_size) %+replace%
    theme(
      strip.background = element_rect(fill = "grey95", colour = NA, size = 0), 
      panel.spacing = unit(base_size/10, "pt"), 
      legend.margin = margin(l = -half_line/2),
      legend.text = element_text(size = rel(0.8), margin = margin(l = -half_line/2)),
      legend.box.margin = margin(l = -half_line/2),
      legend.key =  element_blank(), 
      legend.text.align = 0,
      legend.background = element_rect(colour = NA, fill = NA, size = 0),
      legend.box.background = element_blank(),
      plot.margin = margin(half_line/20, half_line/20, half_line/20, half_line/20), 
      axis.text.x = element_text(margin = margin(t = 0.15 * half_line/2), vjust = 1), 
      axis.text.x.top = element_text(margin = margin(b = 0.15 * half_line/2), vjust = 0), 
      axis.text.y = element_text(margin = margin(r = 0.15 * half_line/2), hjust = 1),
      axis.text.y.right = element_text(margin = margin(l = 0.15 * half_line/2), hjust = 0),
      axis.line = element_line(colour = "black", size = rel(0.65)), 
      axis.ticks = element_line(colour = "black", size = rel(0.65))
    ) + 
    theme(
      legend.title = element_text(size = rel(1), 
                                  margin = margin(t =-half_line/2, b = -half_line/2)),
      plot.title = element_text(margin = margin(b = half_line/4)),
      plot.subtitle = element_text(margin = margin(b = half_line/4)), 
      strip.text = element_text(size = rel(0.9), 
                                margin = margin(t = base_size/10, b = base_size/10)), 
      axis.title = element_text(margin = margin(-1)), 
      axis.ticks.length = unit(half_line/3, "pt")
    )
} 

