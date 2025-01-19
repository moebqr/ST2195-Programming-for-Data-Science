# Load mtcars dataset (built into R)
data <- as.matrix(mtcars)

# Create a correlation matrix
colblues <- colorRampPalette(brewer.pal(8, "Blues"))(25)

# Create a heatmap
heatmap(data,
        main = "Correlation Heatmap of mtcars Dataset",
        Colv = NA,
        Rowv = NA,
        scale = "column",
        xlab = "variable",
        col = colblues,
        margins = c(8, 8),  # Adjust margins for variable names
        cexRow = 0.8,      # Adjust row label size
        cexCol = 0.8)      # Adjust column label size

# Add legend
legend_colors <- colorRampPalette(c("blue", "white", "red"))(50)
legend("bottomright", 
       legend = c("-1", "0", "1"),
       fill = c(legend_colors[1], legend_colors[25], legend_colors[50]),
       title = "Correlation",
       cex = 0.8)

# You can save the plot as a png file
#1. Use png() to open a png file
png("heatmap.png", width = 800, height = 600)
#2. Add the plot code here
    # Heatmap()
#3. Use dev.off() to close the png file
dev.off()
