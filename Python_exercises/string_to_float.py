# Program to print float given two integers, a and b
# The float has the form: a.b
# the integers are taken as input on the commandline

import sys

#------------------
# Input
#------------------

# take a and b as a single string on input:
input_a_and_b_string = input('Give two integers ')

# split input string into a list of strings:
a_and_b_list = input_a_and_b_string.split()

# Test input to make sure only two numbers were entered:
if (len(a_and_b_list) > 2):
    print('you gave too many integers. Should give two')
    sys.exit(0)
    
if (len(a_and_b_list) < 2):
    print('you gave too few integers. Should give two')
    sys.exit(0)

# Test input to make sure two numbers entered were integers
# and not floats:
for i in range (0,len(a_and_b_list)):
    if ('.' in a_and_b_list[i]):
        print('you entered a number that is not an integer')
        sys.exit(0)
        
print('a:', a_and_b_list[0], 'b:', a_and_b_list[1])

a = float(a_and_b_list[0])
b = float(a_and_b_list[1])

#----------------------------------
# Print float using powers of 10:
#----------------------------------

# now, let's find the divisor for b:
divisor = 10 ** len(a_and_b_list[1])
precision = len(a_and_b_list[1])

# And determine and print the float:
X = a + b/divisor
print('the float a.b is:', '{:.{prec}f}'.format(X, prec=precision))

#--------------------------------
# Print float using while loop:
#--------------------------------

# another way to find the divisor for b:
divisor = 10
precision = 1
while (b/divisor >= 1):
    divisor = divisor*10
    precision = precision + 1

# Determine and print the float:
X = a + b/divisor
print('the float a.b is:', '{:.{prec}f}'.format(X, prec=precision))

#-----------------------------------------------
# We can also print the float using strings:
#-----------------------------------------------

X_str = a_and_b_list[0] + '.' + a_and_b_list[1]
print('the float a.b is:', X_str)
