# Block 5 - Programming Concepts Summary

## 1. Aliasing in Python
- Variables in Python are references/aliases to objects in memory
- Multiple variables can point to the same object
- Modifying through one alias affects all aliases
- Example:
  ```python
  colors = ["red", "blue", "green"]
  colors_2 = colors  # Both variables point to same list
  colors_2[0] = "yellow"  # Changes both colors and colors_2
  ```
- Use `.copy()` for independent copies of mutable objects
- Immutable objects (int, float, str) create new objects on reassignment

## 2. Control Flow

### If-Else Statements
```python
if score >= 70:
    print("Distinction")
elif score >= 60:
    print("Merit")
else:
    print("Pass")
```

### Loops
- **For Loops**: Iterate over sequences
  - `range()` for numeric sequences
  - `continue` to skip iterations
  - `break` to exit loop
- **While Loops**: Repeat while condition is true
  - Commonly used for input validation

## 3. Exception Handling

### Python
- Used to handle runtime errors gracefully
- Basic syntax:
  ```python
  try:
      # Code that might raise exception
  except ExceptionType:
      # Handle specific exception
  except:
      # Handle any other exceptions
  finally:
      # Always executed
  ```
- Common exceptions:
  - ValueError
  - ZeroDivisionError
  - IndexError
- EAFP (Easier to Ask Forgiveness than Permission) preferred over LBYL

### R
- Uses condition handling system
- Main tools:
  - `try()`: Continue execution despite errors
  - `tryCatch()`: Specify handlers for different conditions
  - `withCallingHandlers()`: Local condition handling
- Example:
  ```r
  tryCatch(
      {
          result <- risky_function()
      },
      error = function(e) {
          message("Error:", e$message)
      }
  )
  ```

## 4. Object-Oriented Programming

### Classes and Objects
- Classes are blueprints for objects
- Objects have attributes (data) and methods (functions)
- Basic class structure:
  ```python
  class Point:
      def __init__(self, x=0, y=0):
          self.x = x
          self.y = y
      
      def distance_from_origin(self):
          return (self.x**2 + self.y**2)**0.5
  ```

### Key OOP Concepts

#### 1. Encapsulation
- Bundling data and methods together
- Private attributes with `__` prefix
- Example:
  ```python
  class BankAccount:
      def __init__(self, balance):
          self.__balance = balance  # Private
      
      def get_balance(self):
          return self.__balance
  ```

#### 2. Inheritance
- Create new classes based on existing ones
- Example:
  ```python
  class ElectricCar(Car):
      def __init__(self, make, model, year, battery):
          super().__init__(make, model, year)
          self.battery = battery
  ```

#### 3. Polymorphism
- Same interface for different object types
- Method overriding in inherited classes

## 5. OOP in R
Three main systems:

### 1. S3
- Simple, informal system
- Uses generic functions
- Example:
  ```r
  car <- function(make, model, year) {
      obj <- list(make = make, model = model, year = year)
      class(obj) <- "Car"
      return(obj)
  }
  ```

### 2. S4
- More formal and rigorous
- Explicit class definitions
- Example:
  ```r
  setClass("CarS4",
           slots = list(
               make = "character",
               model = "character",
               year = "numeric"
           ))
  ```

### 3. R6
- Reference class system
- More similar to OOP in other languages
- Uses `$` for method calls
- Example:
  ```r
  CarR6 <- R6Class("CarR6",
                   public = list(
                       make = NULL,
                       model = NULL,
                       initialize = function(make, model) {
                           self$make <- make
                           self$model <- model
                       }
                   ))
  ```

## Programming Paradigms
1. **Procedural**: Sequence of commands
2. **Functional**: Based on functions and immutability
3. **Object-Oriented**: Based on objects and interactions
