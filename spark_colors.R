#### define color palletes ####
spark_colors <- c(
  'yellow' = '#ffe627',
  'gold' = '#ffc716',
  'orange' = '#ff6c36', 
  'red' = '#f83347', 
  'purple' = '#af51dc', 
  'blue' = '#006ddf', 
  'cyan' = '#19bee7',
  'teal' = '#1abfac',
  'yellow_l' = '#FFF6D0',
  'gold_l' = '#FFEBCE',
  'orange_l' = '#FFD0C8', 
  'red_l' = '#FFC3C6', 
  'purple_l' = '#E6C2FF', 
  'blue_l' = '#B8CAFE', 
  'cyan_l' = '#BBE9FF',
  'teal_l' = '#BAFFF3',
  'yellow_d' = '#332D01',
  'gold_d' = '#352700',
  'orange_d' = '#401200', 
  'red_d' = '#450006', 
  'purple_d' = '#350048', 
  'blue_d' = '#00193F', 
  'cyan_d' = '#002833',
  'teal_d' = '#012924'
) 

spark_logo_colors <- c(
  'orange1' = '#ff621e',
  'orange2' = '#ff7427',
  'gold' = '#ffa522',
  'yellow1' = '#ffca1d',
  'yellow2' = '#ffd41f'
)

#' Function to extract spark colors as hex codes
#'
#' @param ... Character names of spark_colors 
#'
spark_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (spark_colors)
  
  spark_colors[cols]
}

#' Function to extract spark logo colors as hex codes
#'
#' @param ... Character names of spark_colors 
#'
spark_logo <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (spark_logo_colors)
  
  spark_logo_colors[cols]
}

spark_palettes <- list(
  `logo`  = spark_logo('yellow2', 'orange2'),
  
  `cool`  = spark_cols('teal', 'cyan', 'blue', 'purple'),
  
  `hot`   = spark_cols('red', 'orange', 'gold', 'yellow'),
  
  `rainbow` = spark_cols('red', 'orange', 'gold', 'yellow', 'teal', 'cyan', 'blue', 'purple'),
  
  `royal` = spark_cols('red', 'gold', 'teal', 'purple'),
  
  `main` = spark_cols('gold', 'teal', 'cyan', 'blue', 'purple', 'orange', 'red'), 
  
  `RdYlBu` = spark_cols('red', 'gold', 'blue'), 
  
  `BuBlYl` = c(spark_cols('blue'), 'grey05', spark_cols('yellow')),
  
  `BuWhYl` = c(spark_cols('blue'), 'grey90', spark_cols('yellow')),
  
  `orange` = spark_cols('orange_l', 'orange'),
  `blue` = spark_cols('blue_l', 'blue'),
  `red` = spark_cols('red_l', 'red'),
  `purple` = spark_cols('purple_l', 'purple'),
  `teal` = spark_cols('teal_l', 'teal'),
  `cyan` = spark_cols('cyan_d', 'cyan'),
  `yellow` = spark_cols('yellow_d', 'yellow'),
  `gold` = spark_cols('gold_d', 'gold')
)

#' Return function to interpolate a spark color palette
#'
#' @param palette Character name of palette in spark_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param omit Character vector of colors to omit from the palette
#' @param ... Additional arguments to pass to colorRampPalette()
#'
spark_pal <- function(palette = "logo", reverse = FALSE, omit = "", ...) {
  keep <- !(names(spark_palettes[[palette]]) %in% omit)
  pal <- spark_palettes[[palette]][keep]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}

#' Color scale constructor for spark colors
#'
#' @param palette Character name of palette in spark_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param omit Character vector of colors to omit from the palette
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_spark <- function(palette = "main", discrete = TRUE, reverse = FALSE, omit = "", ...) {
  pal <- spark_pal(palette = palette, reverse = reverse, omit = omit)
  
  if (discrete) {
    discrete_scale("colour", paste0("spark_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for spark colors
#'
#' @param palette Character name of palette in spark_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param omit Character vector of colors to omit from the palette
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_spark <- function(palette = "main", discrete = TRUE, reverse = FALSE,  omit = "", ...) {
  pal <- spark_pal(palette = palette, reverse = reverse, omit = omit)
  
  if (discrete) {
    discrete_scale("fill", paste0("spark_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
