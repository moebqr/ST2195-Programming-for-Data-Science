## Object-Oriented Programming in R
# S3 Example ---------------------------------------------------------------
# Creating a basic Car class using S3
car <- function(make, model, year) {
    obj <- list(make = make, model = model, year = year)
    class(obj) <- "Car"
    return(obj)
}

# Method for Car class
print.Car <- function(x, ...) {
    cat("Car:", x$make, x$model, "(" , x$year, ")\n")
}

# Creating ElectricCar that inherits from Car
electricCar <- function(make, model, year, batteryCapacity) {
    obj <- car(make, model, year)
    obj$batteryCapacity <- batteryCapacity
    class(obj) <- c("ElectricCar", "Car")
    return(obj)
}

# Method for ElectricCar
print.ElectricCar <- function(x, ...) {
    cat("Electric Car:", x$make, x$model, "(", x$year, ") - Battery:", x$batteryCapacity, "kWh\n")
}

# S4 Example ---------------------------------------------------------------
# Define Car class
setClass("CarS4",
         slots = list(
             make = "character",
             model = "character",
             year = "numeric"
         ))

# Define ElectricCar class that inherits from Car
setClass("ElectricCarS4",
         slots = list(
             batteryCapacity = "numeric"
         ),
         contains = "CarS4")

# Define methods
setMethod("show", "CarS4",
          function(object) {
              cat("Car:", object@make, object@model, "(", object@year, ")\n")
          })

setMethod("show", "ElectricCarS4",
          function(object) {
              cat("Electric Car:", object@make, object@model, "(", object@year,
                  ") - Battery:", object@batteryCapacity, "kWh\n")
          })

# R6 Example --------------------------------------------------------------
library(R6)

# Define Car class
CarR6 <- R6Class("CarR6",
                 public = list(
                     make = NULL,
                     model = NULL,
                     year = NULL,
                     
                     initialize = function(make, model, year) {
                         self$make <- make
                         self$model <- model
                         self$year <- year
                     },
                     
                     print = function() {
                         cat("Car:", self$make, self$model, "(", self$year, ")\n")
                     }
                 ))

# Define ElectricCar class that inherits from Car
ElectricCarR6 <- R6Class("ElectricCarR6",
                         inherit = CarR6,
                         public = list(
                             batteryCapacity = NULL,
                             
                             initialize = function(make, model, year, batteryCapacity) {
                                 super$initialize(make, model, year)
                                 self$batteryCapacity <- batteryCapacity
                             },
                             
                             print = function() {
                                 cat("Electric Car:", self$make, self$model, "(",
                                     self$year, ") - Battery:", self$batteryCapacity, "kWh\n")
                             }
                         ))

# Example Usage -----------------------------------------------------------
# S3
myCar <- car("Toyota", "Camry", 2020)
myElectricCar <- electricCar("Tesla", "Model 3", 2021, 75)
print(myCar)
print(myElectricCar)

# S4
myCar_S4 <- new("CarS4", make="Toyota", model="Camry", year=2020)
myElectricCar_S4 <- new("ElectricCarS4", make="Tesla", model="Model 3", 
                        year=2021, batteryCapacity=75)
show(myCar_S4)
show(myElectricCar_S4)

# R6
myCar_R6 <- CarR6$new("Toyota", "Camry", 2020)
myElectricCar_R6 <- ElectricCarR6$new("Tesla", "Model 3", 2021, 75)
myCar_R6$print()
myElectricCar_R6$print()
