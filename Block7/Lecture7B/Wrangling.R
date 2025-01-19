df = airquality
head(df)

df$date <- ISOdate(1973, df$Month, df$Day)

df$date

plot(df$date, df$Temp, type="l")
plot(df$date, df$Temp, type="o")

# Important: Use color blind friendly color palletes (for Accessibility)
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)


## THERE IS A MISSING PART HERE (LOOK AT LECTURE PPT)

# Labelling points



colours<-brewer.pal(n = 12, name = "Paired")
colours<-colours[c(2,6)]
plot(df$Wind, df$Temp, pch=19, col=colours[df$season],xlab='Average wind in mph',ylab='Maximum daily temperature in Fahrenheit',main='Temperature vs Wind in New York')

legend('topright', legend=c('post June','May or June'), col= colours, pch = 19)

# Matrix Scatterplot
pairs(df[1:4],col=colours[df$season],main='Matrix scatter plot of the air quality dataset',oma=c(3,3,3,15))
par(xpd = TRUE)
legend('bottomright', legend=c('post June','May or June'), col= colours,pch = 1)

subset_data <- df$Temp[df$season == 1]
hist(subset_data, breaks = 20, xlim = c(55, max(df$Temp)))

# Kernel Density Plot
d1 <- density(df$Temp[df$season == 1])
d2 <- density(df$Temp[df$season == 2])

plot(d1, col = "red", lwd = 2, main = "Kernel Density Plot of Temperature", xlab = "Temperature", ylab = "Density")
lines(d2, col = "blue", lwd = 2)
legend("topright", legend = c("Season 1", "Season 2"), col = c("red", "blue"), lwd = 2)




