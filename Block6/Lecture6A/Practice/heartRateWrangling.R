# Read the data in the CSV and assign it to a Data Frame
heart_rates <- read.csv("heart_rates.csv")

# Convert the time column to a POSIXct object (instead of character) - standard that reads as a double
heart_rates$time <- as.POSIXct(heart_rates$time)

# Tells you the structure of the data
str(heart_rates)

# Tells you the summary of the data
summary(heart_rates)

# Tells you the number of rows and columns
dim(heart_rates)

# Tells you if there are any NA values in the data (we sum to get total)
sum(is.na(heart_rates))

# Plot the data on a Graph
plot(heart_rates, xlab="Time", ylab="Heart Rate")
# All you need is to use plot(heart_rates)

# Removing implausible observations
trim <- function(x, min_hr, max_hr) {
    within(heart_rates, {
        heart_rate[heart_rate < min_hr] <- NA
        heart_rate[heart_rate > max_hr] <- NA
    })
}


# Plot the data on a Graph
hr <- trim(heart_rates, 70, 200)

plot(hr, xlab="Time", ylab="Heart Rate")

# Not required - Save the plot to a PNG file
dev.copy(png, "heart_rate_plot.png")
dev.off()

summary(hr)
