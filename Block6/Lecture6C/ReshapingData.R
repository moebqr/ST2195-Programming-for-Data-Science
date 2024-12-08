# TO OTHER MAINTAINERS:
# Feel free to turn this into an RMD file.
# Also, I recomend including this code (concepts) in your notes.

?reshape()

set.seed(728904582)

dat1 <- data.frame(
    name = rep(c("firstName", "secondName"), each = 4),
    numbers = rep(1:4, 2),
    value = rnorm(8)
)

dat1

reshape(dat1, idvar="name", timevar = "numbers", direction = "wide")

dat2 <- reshape(dat1, idvar="name", timevar = "numbers", direction = "wide")

dat2

dat3 <- reshape(dat2, idvar="name", timevar = "numbers", direction = "long")

dat3

# Run this in your console: install.packages("reshape2")

library(reshape2)

?melt()

?cast()

# We will use the airquality dataset

airquality

head(airquality) # Use this to get a sense of the data

# We will turn this into long format using melt
airquality_long <- melt(airquality)

airquality_long

head(airquality_long)

head(melt(airquality, id.vars = c("Month", "Day")))

airquality_long2 <- melt(airquality, id.vars = c("Month", "Day"), variable.name = "climate_var", value.name = "climate_value")

airquality_long2

# dcast()

dcast(airquality_long, Month + Day ~ variable)

# The tilde (~) is used to separate the left and right sides of the formula.
airquality_wide <- dcast(airquality_long2, formula = Month + Day ~ climate_var, value.var = "climate_value")

airquality_wide
head(airquality_wide)


install.packages("tidyr")

library(tidyr)

?stack()
?unstack()

# PlantGrowth Dataset (built-in dataset)
PlantGrowth
head(PlantGrowth)

stack(PlantGrowth)

unstack(PlantGrowth)

PlantGrowth$group <- as.character(PlantGrowth$group)

stack(PlantGrowth)

unstack(PlantGrowth)



### Discuss Subsetting -- Must include in the notes.