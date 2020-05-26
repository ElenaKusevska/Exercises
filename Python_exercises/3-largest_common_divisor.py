#!/usr/bin/python

# input integers:
n1 = 24
n2 = 64

# procedure:
x = 0   # variable that holds the current value of the largest
                                            # common divisor
if n1 < n2:
    x = n1
elif n1 > n2: 
    x = n2
elif n1 == n2: 
    x = n1 # if they are the same, it's that value

while x >= 1:
    print(x)
    if n1 % x == 0: # if n1 is divisible by the current divisor
        print (n1, '/', x, '=',  n1 % x)
        if n2 % x  == 0: # and n2 is divisible by x
            print (n2, '/', x, '=',  n2 % x)
            break
    x = x - 1
    print (' ')

divisor = x
print (divisor)
