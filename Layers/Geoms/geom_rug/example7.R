p <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point()
p <-   
 p +
  geom_rug(outside = TRUE) +
  coord_cartesian(clip = "off")
