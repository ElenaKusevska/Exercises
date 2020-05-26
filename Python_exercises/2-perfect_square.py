#!/bin/python

#---------------------------------------------------
#Program to determine the root of a perfect square
#---------------------------------------------------

x = 36
i = 0
#-----------------------
if x < 0:
    print ('x < 0')
elif  x >= 0:
    while i*i < x:
        i = i + 1
#----------------------
if i*i != x:
    print ('not a perfect square') 
else: print (i)
