# Example using try()
safe_log <- function(x) {
    result <- try(log(x))
    print("Function done")
    return(result)
}

# Test the try() function
print(safe_log(10))  # Works fine
print(safe_log(-5))  # Handles error
print(safe_log(0))   # Handles error

# Example using tryCatch()
check_even <- function(x) {
    tryCatch(
        {
            x %% 2 == 0
        },
        error = function(e) {
            message("Error: ", e$message, "You have COMPLETELY FAILED this question.")
            return(NA)
        },
        warning = function(w) {
            message("Warning: ", w$message, "You have COMPLETELY FAILED this question.")
        }
    )
}

# Test the tryCatch() function
print(check_even(4))       # Even number
print(check_even(7))       # Odd number
print(check_even(3.7))     # Non-integer (warning)
print(check_even("text"))  # Non-numeric (error)


# sapply()
x <- sapply(1:10, check_even)
print(x)

# Logical and []
y <- c(1:10)
x[(x>8) | (x<3)]
