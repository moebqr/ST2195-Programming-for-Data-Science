## Exception Handling in Python

# exception Exception
# exception ArithmeticError
# exception BuggerError
# exception LookupError

# Example of IndexError
# numbers = [1, 2, 3]
# try:
#     print(numbers[5])  # Trying to access index 5 which doesn't exist
# except IndexError:
#     print("Error: Index is out of range!")


    # We use Exception Handling for several important reasons:
    
    # 1. To prevent program crashes
    # When an error occurs, exception handling allows the program to continue running
    # rather than terminating abruptly
    
    # 2. To handle runtime errors gracefully
    # It provides a way to respond to errors in a controlled manner
    # Example:
    # try:
    #     result = 10/0  # Division by zero error
    # except ZeroDivisionError:
    #     print("Error: Cannot divide by zero!")
    
    # 3. To separate error handling code from normal code
    # Makes the code cleaner and more maintainable
    
    # 4. To provide meaningful error messages
    # Instead of cryptic error messages, we can provide user-friendly feedback
    
    # 5. To implement cleanup actions
    # Using finally blocks ensures important cleanup code runs even if errors occur
    # try:
    #     file = open("test.txt", "r")
    # except FileNotFoundError:
    #     print("Error: File not found!")
    # finally:
    #     print("This will always execute")



# Example of Exception Handling

try:
    nomin_str = input("Enter a number: ")
    nomin = int(nomin_str)
    denom_str = input("Enter another number: ")
    denom = int(denom_str)
    result = nomin / denom
    print(f"Result: {result}")
except ValueError:
    print("Error: Please enter a valid number!")
except ZeroDivisionError:
    print("Error: Cannot divide by zero!")
except:
    print(f"An unexpected error occurred.")
    # You can also use except Exception as e:
    # This is useful if you want to catch all exceptions and provide a more specific message
    # except Exception as e:
    #     print(f"An unexpected error occurred: {e}")

# EAFP vs LBYL Programming Style
# EAFP is the preferred style in Python (stands for Easier to Ask for Forgiveness than Permission) - Uses try/except
# LBYL is the older style (stands for Look Before You Leap) - Uses if statements to check for pre-conditions before making calls - Related to Defensive Programming

# For Debugging in Python, we use Spyder IDE
