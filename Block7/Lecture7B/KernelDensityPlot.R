# Load the airquality dataset
df = airquality

# Create density objects for the two seasons
d1 <- density(df$Temp[df$Month >= 7])  # Post June (Season 1)
d2 <- density(df$Temp[df$Month <= 6])  # May-June (Season 2)

# Create the kernel density plot
plot(d1, col = "red", lwd = 2, 
     main = "Kernel Density Plot of Temperature by Season",
     xlab = "Temperature (°F)", 
     ylab = "Density")
lines(d2, col = "blue", lwd = 2)

# Add legend
legend("topright", 
       legend = c("Post June", "May-June"),
       col = c("red", "blue"), 
       lwd = 2)