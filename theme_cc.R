## A theme with large fonts and other elements

require(ggplot2)
require(dplyr)
require(showtext) ## for google fonts
font_add_google("Poppins")
showtext_auto()

theme_cc <- function (base_size = 25, 
                       base_family = "Poppins", 
                       base_line_size = base_size/10, 
                       base_rect_size = base_size/15, 
                       accent = "honeydew") {
  half_line <- base_size/2
  theme(
    line = element_line(colour = paste0(accent, "3"), 
                        size = base_line_size, 
                        linetype = 1, 
                        lineend = "butt"), 
    rect = element_rect(fill = "white",
                        colour = "black",
                        size = base_rect_size,
                        linetype = 1), 
    text = element_text(family = base_family,
                        face = "plain",
                        colour = paste0(accent, "4"),
                        size = base_size,
                        lineheight = 0.8,
                        hjust = 0.5,
                        vjust = 0.5,
                        angle = 0,
                        margin = margin(),
                        debug = FALSE), 
    axis.line = element_blank(), 
    axis.line.x = NULL, 
    axis.line.y = NULL, 
    axis.text = element_text(
      size = rel(0.8)
      ), 
    axis.text.x = element_text(
      margin = margin(t = 0.8 * half_line/2), 
      vjust = 1), 
    axis.text.x.top = element_text(
      margin = margin(b = 0.8 * half_line/2), 
      vjust = 0), 
    axis.text.y = element_text(
      margin = margin(r = 0.8 * half_line/2), 
      hjust = 1), 
    axis.text.y.right = element_text(margin = margin(l = 0.8 * half_line/2), 
                                     hjust = 0), 
    axis.ticks = element_line(color = paste0(accent, "2"), size = rel(.5)),
    axis.ticks.length = unit(half_line, "pt"), 
    axis.title.x = element_text(
      margin = margin(t = half_line/2),
      vjust = 1), 
    axis.title.x.top = element_text(
      margin = margin(b = half_line/2),
      vjust = 0), 
    axis.title.y = element_text(
      angle = 90, 
      margin = margin(r = half_line/2), 
      vjust = 1), 
    axis.title.y.right = element_text(
      angle = -90,
      margin = margin(l = half_line/2), vjust = 0), 
    legend.background = element_rect(colour = NA, fill = NA),
    legend.spacing = unit(2 * half_line, "pt"), 
    legend.spacing.x = NULL, 
    legend.spacing.y = NULL, 
    legend.margin = margin(half_line, half_line, half_line, half_line),
    legend.key = element_rect(fill = NA,
                              colour = NA), 
    legend.key.size = unit(2, "lines"),
    legend.key.height = NULL, 
    legend.key.width = NULL, 
    legend.text = element_text(size = rel(0.8)),
    legend.text.align = NULL, 
    legend.title = element_text(hjust = 0),
    legend.title.align = NULL, 
    legend.position = "right", 
    legend.direction = NULL, 
    legend.justification = "center",
    legend.box = NULL, 
    legend.box.margin = margin(0, 0, 0, 0, "cm"), 
    legend.box.background = element_blank(), 
    legend.box.spacing = unit(3 * half_line, "pt"), 
    panel.background = element_rect(fill = "grey98", colour = NA), 
    panel.border = element_blank(), 
    panel.grid = element_line(colour = paste0(accent, "2"), size = rel(0.5)), 
    panel.grid.minor = element_line(size = rel(0.5), linetype = 3), 
    panel.spacing = unit(half_line, "pt"), 
    panel.spacing.x = NULL, 
    panel.spacing.y = NULL,
    panel.ontop = FALSE, 
    strip.background = element_rect(
      fill = NA, 
      colour = NA), 
    strip.text = element_text(
      colour = paste0(accent, "3"),
      size = rel(0.5), 
      margin = margin(0.5 * half_line, 0.5 * half_line, 0.5 * half_line, 0.5 * half_line)
      ),
    strip.text.x = NULL, 
    strip.text.y = element_text(angle = -90),
    strip.placement = "inside", strip.placement.x = NULL,
    strip.placement.y = NULL, 
    strip.switch.pad.grid = unit(half_line/4, "pt"), 
    strip.switch.pad.wrap = unit(half_line/4, "pt"), 
    plot.background = element_rect(colour = NA, fill = NA),
    plot.title = element_text(
      hjust = 0,
      vjust = 1, 
      margin = margin(b = half_line)), 
    plot.subtitle = element_text(
      size = rel(.8),
      hjust = 0,
      vjust = 1, 
      margin = margin(b = half_line)), 
    plot.caption = element_text(
      size = rel(0.8),
      hjust = 1, 
      vjust = 1, 
      margin = margin(t = half_line)), 
    plot.tag = element_text(
      hjust = 0.5,
      vjust = 0.5), 
    plot.tag.position = "topleft", 
    plot.margin = margin(half_line, half_line, half_line, half_line), 
    complete = TRUE)
}

