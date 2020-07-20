#!/usr/bin/python

import random
import numpy

#random.seed(0)
#numpy.random.seed(0)

def Bernoulli(a, p):
    for i in range (0, p, 1):
        a[i] = random.random()
        print ('{0:.4f}'.format(a[i]))
        if a[i] > 0.5:
            a[i] = 1.0
        elif a[i] <= 0.5:
            a[i] = -1.0
        print ('{0:.4f}'.format(a[i]))
    
    return a

def Bernoulli_numpy1 (a, p):
    for i in range (0, p, 1):
        print ('{0:.4f}'.format(a[i]))
        if a[i] > 0.5:
            a[i] = 1.0
        elif a[i] <= 0.5:
            a[i] = -1.0
        print ('{0:.4f}'.format(a[i]))

    return a

def Bernoulli_numpy2 (a, p):
    for i in range (0, p, 1):
        a[i] = random.random()
        print ('{0:.4f}'.format(a[i]))
        if a[i] > 0.5:
            a[i] = 1.0
        elif a[i] <= 0.5:
            a[i] = -1.0
        print ('{0:.4f}'.format(a[i]))

    return a
    


b = [0.0]*10
b = Bernoulli(b, 10)
print (b)

c = numpy.empty(10, dtype=numpy.float64)
c = Bernoulli_numpy2(c, 10)
print(c)

d = numpy.random.random(10)
d = Bernoulli_numpy1(d,10)
print (d)
