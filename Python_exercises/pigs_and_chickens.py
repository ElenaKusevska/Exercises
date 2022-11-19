#!/usr/bin/python

# In a farm that has just pigs and chickens, there are 20 heads and 56
# legs. How many pigs, and how many chickens are there?
# I think this problem is from the mit introduction to computational thinking
# course

# Function to solve the problem - brute force solution
# - enumerate and check:
def solve(heads, legs):
    x = 0
    solution_found = False
    for x in range(0,heads+1):
        pigs = x
        chickens = heads - x
        if 4*pigs+2*chickens == legs:
            solution_found = True
            print ('pigs', pigs, 'chickens', chickens)
            return pigs, chickens

    if not solution_found:
        print ('there is no possible solution to this system')
        return None, None

# Applying this function

h = 20
l = 56

solution = solve(h,l) # solution is an array
print ('after solving - pigs - 1:', solution[0])
print ('after solving - chickens - 1:', solution[1])

# Or, another way to apply it:

n_pigs, n_chickens = solve(h,l) # solution is two separate variables
print ('after solving - pigs - 2:', n_pigs)
print ('after solving - chickens - 2:', n_chickens)
