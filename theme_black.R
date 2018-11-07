## A black theme
require(ggplot2)
require(showtext) ## for google fonts
font_add_google("Raleway")
showtext_auto()

theme_black <- function (base_size = 12, 
                       base_family = "Raleway", 
                       base_line_size = base_size/18, 
                       base_rect_size = base_size/18) {
  half_line <- base_size/2
  theme(
    line = element_line(colour = "white", 
                        size = base_line_size, 
                        linetype = 1, 
                        lineend = "round"), 
    rect = element_rect(fill = "white",
                        colour = "black",
                        size = base_rect_size,
                        linetype = 1), 
    text = element_text(family = base_family,
                        face = "plain",
                        colour = "white",
                        size = base_size,
                        lineheight = 0.9,
                        hjust = 0.5,
                        vjust = 0.5,
                        angle = 0,
                        margin = margin(),
                        debug = FALSE), 
#### axis ####
    axis.line = element_blank(), 
    axis.line.x = NULL, 
    axis.line.y = NULL, 
    axis.text = element_text(
      size = rel(1),
      colour = "white"), 
    axis.text.x = element_text(
      margin = margin(t = 0.5 * half_line/2), 
      vjust = 1), 
    axis.text.x.top = element_text(
      margin = margin(b = 0.5 * half_line/2), 
      vjust = 0), 
    axis.text.y = element_text(
      margin = margin(r = 0.5 * half_line/2), 
      hjust = 1), 
    axis.text.y.right = element_text(margin = margin(l = 0.5 * half_line/2), 
                                     hjust = 0), 
    axis.ticks = element_line(colour = "white", size = base_line_size/2),
    axis.ticks.length = unit(base_size, "pt"), 
    axis.title.x = element_text(
      margin = margin(t = half_line),
      vjust = 1), 
    axis.title.x.top = element_text(
      margin = margin(b = half_line),
      vjust = 0), 
    axis.title.y = element_text(
      angle = 90, 
      margin = margin(r = half_line), 
      vjust = 1), 
    axis.title.y.right = element_text(
      angle = -90,
      margin = margin(l = half_line), vjust = 0),
#### legend ####
    legend.background = element_rect(colour = NA, fill = NA),
    legend.spacing = unit(half_line, "pt"), 
    legend.spacing.x = NULL, 
    legend.spacing.y = NULL, 
    legend.margin = margin(half_line, 2*base_size, half_line, half_line),
    legend.key = element_rect(fill = NA,
                              colour = NA), 
    legend.key.size = unit(1, "lines"),
    legend.key.height = NULL, 
    legend.key.width = unit(2, "lines"), 
    legend.text = element_text(size = rel(0.9)),
    legend.text.align = NULL, 
    legend.title = element_text(hjust = 0, vjust = 1),
    legend.title.align = NULL, 
    legend.position = "right", 
    legend.direction = NULL, 
    legend.justification = "center",
    legend.box = NULL, 
    legend.box.margin = margin(0, 0, 0, 0, "cm"), 
    legend.box.background = element_blank(), 
    legend.box.spacing = unit(2 * half_line, "pt"),
#### strip ####
    strip.background = element_rect(
      fill = "grey5", 
      colour = NA), 
    strip.text = element_text(
      colour = "white",
      size = rel(0.8), 
      margin = margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 0.8 * half_line)
      ),
    strip.text.x = NULL, 
    strip.text.y = element_text(angle = -90),
    strip.placement = "inside", strip.placement.x = NULL,
    strip.placement.y = NULL, 
    strip.switch.pad.grid = unit(half_line/2, "pt"), 
    strip.switch.pad.wrap = unit(half_line/2, "pt"), 
#### panel ####
  panel.background = element_rect(fill = NA, colour = NA), 
  panel.border = element_blank(), 
  panel.grid = element_line(colour = "white", size = rel(0.15), linetype = 1), 
  panel.grid.minor = element_line(size = rel(1), linetype = 2), 
  panel.spacing = unit(half_line, "pt"), 
  panel.spacing.x = NULL, 
  panel.spacing.y = NULL,
  panel.ontop = FALSE, 
#### plot ####    
    plot.background = element_rect(colour = "black", fill = "black"),
    plot.title = element_text(
      size = rel(1.2), 
      hjust = 0.5,
      vjust = 1, 
      margin = margin(b = half_line)), 
    plot.subtitle = element_text(
      hjust = 0.5,
      vjust = 1, 
      margin = margin(b = half_line)), 
    plot.caption = element_text(
      size = rel(0.6),
      hjust = 0, 
      vjust = 1, 
      margin = margin(t = half_line)), 
    plot.tag = element_text(
      size = rel(1.4), 
      hjust = 0.5,
      vjust = 0.5), 
    plot.tag.position = "topleft", 
    plot.margin = margin(half_line, half_line, half_line, half_line), 
    complete = TRUE)
}

