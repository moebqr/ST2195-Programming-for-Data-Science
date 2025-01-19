# Load the airquality dataset
df = airquality

# Create a color palette using RColorBrewer
library(RColorBrewer)
colors <- brewer.pal(5, "Set2")  # Get 5 colorblind-friendly colors for 5 months

# Create boxplot
boxplot(Temp ~ Month, data = df,
        col = colors,
        main = "Temperature Distribution by Month",
        xlab = "Month",
        ylab = "Temperature (°F)",
        names = c("May", "Jun", "Jul", "Aug", "Sep"))

# Add legend
legend("topright", 
       legend = c("May", "Jun", "Jul", "Aug", "Sep"),
       fill = colors,
       title = "Months")

## Violin Plot
install.packages("vioplot")
library(vioplot)
vioplot(Temp ~ Month, data = df, col = colors, names = c("May", "Jun", "Jul", "Aug", "Sep"))


## Bar Plots
# Create temperature categories
temp_breaks <- seq(50, 100, by = 10)
temp_categories <- cut(df$Temp, breaks = temp_breaks, labels = c("51-60", "61-70", "71-80", "81-90", "91-100"), include.lowest = TRUE)

# Calculate frequencies
temp_counts <- table(temp_categories)

# Create bar plot
barplot(height = temp_counts,
        col = colors,
        main = "Temperature Distribution by Categories",
        xlab = "Temperature Range (°F)",
        ylab = "Frequency",
        ylim = c(0, max(temp_counts) * 1.2))  # Add some space for potential labels

# Add legend
legend("topright",
       legend = names(temp_counts),
       fill = colors[1:length(temp_counts)],
       title = "Temperature Ranges")

# Stacked Bar Plot
# Create a matrix of temperature categories by month
temp_by_month <- table(df$Month, temp_categories)

# Create stacked bar plot
barplot(temp_by_month,
        col = colors,
        main = "Temperature Distribution by Month",
        xlab = "Month",
        ylab = "Count",
        names.arg = c("May", "Jun", "Jul", "Aug", "Sep"),
        legend.text = names(temp_counts),
        args.legend = list(x = "topright", title = "Temperature Ranges"))

