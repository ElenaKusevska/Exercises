# Simple example of OOP in Python - solving a quadratic equation
# (obviously overkill for solving a quadratic equation)

import math

class quadratic:

    # __init__ method defines what happens when we want to create 
    # our first quadratic equation.
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def discriminant_test(self):
        self.discriminant = self.b*self.b - 4.0*self.a*self.c
        if self.discriminant > 0:
            self.roots = "two real roots"
        elif self.discriminant == 0:
            self.roots = "one real root"
        else:
            self.roots = "two imaginary roots"

    def solve(self):
        self.discriminant_test()
        if self.discriminant > 0:
            self.solved = True
            self.x1 = (-self.b + math.sqrt(self.discriminant))/(2.0*self.a)
            self.x2 = (-self.b - math.sqrt(self.discriminant))/(2.0*self.a)
        else:
            self.solved = False


def main():

    f1 = quadratic(a=5.0, b=-6.0, c=1.0)

    f1.solve()
    if f1.solved:
        print(f1.x1, f1.x2)
    else:
        print("no solution")

if __name__ == "__main__":
    main()