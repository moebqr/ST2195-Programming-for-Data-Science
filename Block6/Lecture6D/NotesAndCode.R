install.packages("tidyr")

library(tidyr)

dataframe <- data.frame(v1 = 1:5, v2 = 6:10, v3 = 11:15)

dataframe[1:3, ]

dataframe[-(1:3),]

dataframe[1:3, 1:2]


### dplyr

install.packages("dplyr")

library(dplyr)

## In R, functions inside packages are called verbs.

# dplyr verbs:
# mutate()
# select()
# filter()
# arrange()
# group_by()
# summarise()


# %>% (pipe operator) is used to chain functions together.
# It chains the output of one function to the input of the next function.


head(mtcars)

mtcars %>% head()

mtcars %>% head() %>% tail()

mtcars %>% head() %>% tail() %>% select(mpg, cyl)

mtcars %>% head() %>% select(mpg, cyl) # Same output as above

mtcars %>% head() %>% select(mpg, cyl) %>% filter(mpg > 20)

mtcars %>% head() %>% select(mpg, cyl) %>% filter(mpg > 20) %>% arrange(mpg)

mtcars2 <- mtcars %>% head() %>% select(mpg, cyl) %>% filter(mpg > 20) %>% arrange(mpg) %>% mutate(mpg2 = mpg * 2)

mtcars2

mtcars3 <- mtcars %>% head() %>% filter(mpg > 20) %>% mutate(kpg = mpg * 1.61) %>% select(kpg, cyl) %>% arrange(kpg)

mtcars3

mtcars4 <- mtcars %>% filter(mpg > 20) %>% mutate(kpg = mpg * 1.61) %>% select(kpg, cyl) %>% arrange(kpg) %>% group_by(cyl) %>% summarise(mean_kpg = mean(kpg))

mtcars4

mtcars %>% summarize(maximum_mpg = max(mpg), minimum_disp = min(disp))

# *_join() functions:
# left_join()
# right_join()
# inner_join()
# full_join()
# semi_join()
# anti_join()

band_members

band_instruments

### Make sure you understand the differnce between the different joins. Include in the notes.

band_members %>% inner_join(band_instruments, by = "name")

band_members %>% left_join(band_instruments, by = "name")

band_members %>% right_join(band_instruments, by = "name")

band_members %>% full_join(band_instruments, by = "name")

band_members %>% semi_join(band_instruments, by = "name")

band_members %>% anti_join(band_instruments, by = "name")

# Create tibbles with repeated names to demonstrate join behavior
employees <- tibble(
  name = c("John", "John", "Mary", "Steve"),
  department = c("Sales", "Marketing", "IT", "Sales")
)

roles <- tibble(
  name = c("John", "John", "Mary", "Mary"), 
  role = c("Manager", "Analyst", "Engineer", "Developer")
)

# Inner join with repeated names - will create all combinations
# Example of many-to-many relationship - each John and Mary will match with all their roles
employees %>% inner_join(roles, by = "name") # This will create 6 rows: 2 Johns x 2 roles + 1 Mary x 2 roles


right_join(band_members, band_instruments, by = "name")

