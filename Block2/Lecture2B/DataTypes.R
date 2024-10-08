# Data Types in R:

## - Logical
a <- TRUE       # Where '<-' is the assignment operator
b <- FALSE      # Important to note: This works because R is a dynamically typed language (as opposed to a staticly typed language like Java)

## Logical Operations
### & Operator (AND)
a&b
### | Operator (OR)
a|b
b|b
a|a
### ! Operator (NOT)
!a
!b

# - Character (Can be thought of as String)
str1 <- "Data"
str2 <- "Structures"
str <- cat(str1, str2, '\n')    # Must use \n for new line when using cat()
strPaste <- paste(str1, str2)   # Automatically puts a new line with every concatenated string [using Paste()]
print(strPaste)                 # Must use \\ if you want to have '\' show up inside a string

# - Numeric & Integer 
x <- 2.5                # This is a numeric
z <- as.integer(5)      # This is an integer (type casting with as.)
y <- 5L                 # This is an integer (L stands for Long Integer)


# Find more about your data using these function:
# typeof()                # What is it?
# class()                 # What is it?
# storage.mode()          # What is it?
# length()                # How long is it?
# attributes()            # Does it have any metadata?

# Basic Arithmetics

# - Addition: +

# - Subtraction: -

# - Multiplication: *

# - Division: /
print(5/3)
print(as.integer(5)/as.integer(3))
print(as.integer(5/3))

# - Exponential: ^ or **

# - Modulo: %%
year <- 1985
print((year%%4 == 0) & (year%%100!=0))


# Coerce 
as.character("FALSE")       # Prints as "FALSE"
as.character("1.234")       # Prints as "1.234"
as.integer(1.123)           # Prints as 1
as.logical(4)               # Prints as TRUE
as.logical(0)               # Prints as FASLE
as.numeric(5L)              # Prints as 5
carsList <- as.list(mtcars)
print(carsList)

# Test
is.character(3)             # Prints: FALSE
is.character("hello")       # Prints: TRUE
is.numeric(3)               # Prints: TRUE
is.complex(43.3)            # Prints: FALSE
is.complex(43.3i + 3)       # Prints: TRUE 


# NA and NaN

## NA (not available): Undefined
## NaN (not available number): Doesn't exist in the domain of real numbers

is.na(NA)                   # Prints: TRUE
is.nan(NA)                  # Prints: FALSE
is.na(NaN)                  # Prints: TRUE
is.nan(NaN)                 # Prints: TRUE
