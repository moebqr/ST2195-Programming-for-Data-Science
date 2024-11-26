# In R, write a script that only prints the even numbers from 1 to 10 except 10 i.e prints (2, 4 ,6 and 8). The catch is, you must use both next and break in your code.
# Question Author [Hussain Ebrahim]

for (i in 1:10) {
    if (i %% 2 != 0) {
        next
    }
    if (i == 10) {
        break
    }
    print(i)
}