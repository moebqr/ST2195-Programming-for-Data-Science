# In Python, write a script that only prints the even numbers from 1 to 10 except 10 i.e prints (2, 4 ,6 and 8). The catch is, you must use both continue and break in your code.

for i in range(1, 11):
    if i % 2 != 0:  
        continue
    if i == 10:    
        break
    print(i)
