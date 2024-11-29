# Block 4: Programming Concepts

### What is Computer Programming?
Computer programming is the process of writing instructions that a computer can follow to perform particular tasks.

### Steps for Writing a Program
1. Requirements Collection
2. Plan the steps that the program should take to fulfill its purpose with an algorithm (Solution Design).
AND THEN?

### Algorithms
An algorithm is a sequence of steps that will return a result and terminate after a finite number of steps.
- Typically, the aim is to produce algorithms that are fast and reliable, and require predictable time and resources to run.


## Good Practice in Programming
1. Avoid Spaghetti Code.
    - Poorly planned and not well structured programs.
    - Best Practice: Plan the code with pseudocode before writing the actual code.
2. Structured Programming (Modular Programming)
    - Breaking down the problem into smaller, more manageable parts.
    - Each part having a single, well-defined task.
    - Easier to understand, test, and maintain.
3. Document Programs Using Comments
    - Comments explain what the code does and why
    - Should be clear and concise
    - Helps other programmers (and yourself) understand the code
    - Write self-explanatory code and don't write verbose comments.

## Error Handling and Exception Management in R

### try() Function
- Used for basic error handling
- Allows the program to continue running even if an error occurs
- Example: 
  ```r
  safe_log <- function(x) {
      result <- try(log(x))
      print("Function done")
      return(result)
  }
  print(safe_log(10))  # Works fine
  print(safe_log(-5))  # Handles error
  ```

### tryCatch() Function
- More advanced error and warning handling
- Allows separate handling for errors and warnings
- Example:
  ```r
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
  print(check_even(4))       # Even number
  print(check_even(3.7))     # Non-integer (warning)
  print(check_even("text"))  # Non-numeric (error)
  ```

### Key Concepts
1. Error Handling: Prevents program crashes due to unexpected inputs or situations
2. Warning Handling: Allows the program to continue while notifying about potential issues
3. Graceful Degradation: Provides meaningful feedback or alternative results when errors occur
4. Function Robustness: Makes functions more reliable by anticipating and handling potential issues

### Applications
- `sapply()`: Demonstrates how to apply error-handling functions to multiple inputs
  ```r
  x <- sapply(1:10, check_even)
  print(x)
  ```
- Logical indexing: Shows how to use logical operations and indexing for data manipulation
  ```r
  y <- c(1:10)
  x[(x>8) | (x<3)]
  ```

These error handling techniques are crucial for creating robust and reliable R programs, especially when dealing with user inputs or unpredictable data sources.
