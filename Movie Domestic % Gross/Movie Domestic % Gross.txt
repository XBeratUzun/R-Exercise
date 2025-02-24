library(ggplot2)

mov <- read.csv("Movie Domestic % Gross.csv")

# Filter #1 for the data frame
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

# Filter #2
filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universial", "Sony", "Paramount Pictures")

mov2 <- mov[filt & filt2,]

# Prepare the plot's data and aes layers
p <- ggplot(data=mov2, aes(x=Genre, y=Gross..US))

# Add Geometries
q <- p +
  geom_jitter(aes(size=Budget...mil., color=Studio)) +
  geom_boxplot(alpha=0.7, outlier.color=NA)

# Non Data Ink
q <- q +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

# Theme
q <- q +
  theme(
    axis.title.x = element_text(color="Blue", size=30),
    axis.title.y = element_text(color="Blue", size=30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    
    plot.title = element_text(size = 40),
    
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 20),
    
    text = element_text(family = "Comic Sans MS")
  )

# Final touch
q$labels$size <- "Budget $M"
