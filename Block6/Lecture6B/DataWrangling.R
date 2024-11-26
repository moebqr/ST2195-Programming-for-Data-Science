# The apply() family of functions in R provides efficient ways to perform operations on data structures:
# - apply(): Applies a function over margins of an array/matrix
# - lapply(): Applies a function to each element of a list/vector, returns a list
# - sapply(): Similar to lapply() but simplifies the output when possible
# - tapply(): Applies a function to subsets of a vector grouped by factors
# - mapply(): Multivariate version that applies function to multiple lists/vectors in parallel
# These functions avoid explicit loops and often provide more readable and efficient code

?apply

# Create a simple matrix
my_matrix <- matrix(c(1:20), nrow=5)
my_matrix

# Sum
apply(X = my_matrix, MARGIN = 1, FUN = sum) # Finds the sum of each row
apply(X = my_matrix, MARGIN = 2, FUN = sum) # Finds the sum of each column

# Mean
apply(X = my_matrix, MARGIN = 1, FUN = mean) # Finds the mean of each row
apply(my_matrix, 1, mean) # Alternative way 

# Square root
apply(my_matrix, 1, sqrt) # Finds the square root of each row
apply(my_matrix, 2, sqrt) # Finds the square root of each column

# Summary
apply(my_matrix, 1, summary) # Finds the summary of each row
apply(my_matrix, 2, summary) # Finds the summary of each column

min(my_matrix[,3]) # Finds the minimum value of the third column


### lapply()

First_name <- c("John", "Jane", "Tim", "Michael", "Emma")
Last_name <- c("Doe", "Smith", "Williams", "Taylor", "Wilson")

# Create a list from the names
Name_list <- list(First_name, Last_name)
Name_list

# Convert to lower case
Names_lower <- lapply(X = Name_list, FUN = tolower)
Names_lower

str(Names_lower)
