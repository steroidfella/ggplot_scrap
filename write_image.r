library(plotly)
library(reticulate)
import("plotly")

DIR = "/Users/jackparmer/Desktop/gg_thumbs/"

write_image <- function(image_folder, image_name, sub_dir) {
  gg = ggplotly()
  gg <- hide_colorbar(gg)
  gg <- hide_legend(gg)
  x <- list(title = '', showticklabels = F)
  y <- list(title = '', showticklabels = F)
  m <- list(t=0, b=0, r=0, l=0, pad=0)
  fig <- gg %>% layout(xaxis=x, yaxis=y, margin=m)
  
  if (sub_dir == "") {
    image_path = paste(DIR, 'images/', image_folder, '/', image_name, '.png', sep="")
  }
  else {
    image_path = paste(DIR, 'images/', image_folder, '/', sub_dir, '/', image_name, '.png', sep="")
  }
  print('IMAGE PATH:')
  print(image_path)
  save_image(fig, image_path, width=160, height=160) 
}

create_thumbnail <- function(base_dir, example, sub_dir) {
  if (sub_dir == "") {
    r_code = paste(DIR, base_dir, "/", example, "/", "example1.R", sep="")
  } else {
    r_code = paste(DIR, base_dir, "/", sub_dir, "/", example, "/", "example1.R", sep="")
  }
  print(r_code)
  source(r_code)
  write_image(base_dir, example, sub_dir)
}

# PLOT BASICS

create_thumbnail("Plot\ basics", "ggplot", "")
create_thumbnail("Plot\ basics", "aes", "")
create_thumbnail("Plot\ basics", "gg-add", "")
create_thumbnail("Plot\ basics", "qplot", "")

# Layers > Geoms

create_thumbnail("Layers", "geom_abline", "Geoms")
create_thumbnail("Layers", "geom_bar", "Geoms")
create_thumbnail("Layers", "geom_bin_2d", "Geoms")
create_thumbnail("Layers", "geom_contour", "Geoms")

# Layers > Stats

create_thumbnail("Layers", "stat_ellipse", "Stats")
create_thumbnail("Layers", "stat_ecdf", "Stats")
create_thumbnail("Layers", "stat_sf_coordinates", "Stats")
create_thumbnail("Layers", "stat_summary_2d", "Stats")

# Aesthetics

create_thumbnail("Aesthetics", "aes_colour_fill_alpha", "")
create_thumbnail("Aesthetics", "aes_group_order", "")
create_thumbnail("Aesthetics","aes_linetype_size_shape", "")
create_thumbnail("Aesthetics", "aes_position", "")