# ggplot2 is a powerful and popular R package for creating elegant data visualizations
# It implements the "Grammar of Graphics" - a systematic approach to building plots
# layer by layer, making it flexible and consistent for creating complex graphics

# Install and load ggplot2 if not already installed
install.packages("ggplot2")
library(ggplot2)

# The Basic Components of a ggplot2 Plot:
# 1. Data: The dataset you want to visualize
# 2. Geometries (geom): The actual visual elements (points, lines, bars, etc.)
# 3. Aesthetics (aes): Mapping of variables to visual properties (x, y, color, size, etc.)
# 4. Facets: Creating multiple plots based on categorical variables
# 5. Themes: Visual customization of non-data elements


my_hist <- ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

my_hist

 
