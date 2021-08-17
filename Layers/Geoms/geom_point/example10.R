p <- ggplot(mtcars, aes(mpg, wt, shape = factor(cyl)))
p <-    
 p +
  geom_point(aes(colour = factor(cyl)), size = 4) +
  geom_point(colour = "grey90", size = 1.5)
