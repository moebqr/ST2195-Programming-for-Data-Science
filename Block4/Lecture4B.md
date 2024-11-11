# Control Structures

## If else
### Vectorized if
```R
x <- 1:10
ifelse(x %% 5 == 0, "XXX", as.character(x))
```

```R
x <- 1:10
ifelse(x %% 2 == 0, "even", "odd")
```

## Iterations
```R
x <- 1:10
for (i in x) {
    if (i %% 2 == 0) {
        print("Even")
    } else {
        print("Odd")
    }
}
```

```python
x <- 1:10
for i in x:
    if i %% 2 == 0:
        print(f"{x} is even")
    else:
        print(f"{x} is odd")
```

#### Break
Break stops the loop.
```R
x <- 1:10
for (i in x) {
    if (i %% 2 == 0) {
        break
    }
}
```

## Function

```R
power_function <- function(x, y) {
    result <- x^y
    print(paste(x, "raised to the power of", y, "is", result))
    return(result)
}

# Example usage
power_function(2, 3)
```
