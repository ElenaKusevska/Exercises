program derivative
implicit none

real(kind=8) x1, x2, fx1, fx2, df, error, analytical_derivative

x1 = 0.1
x2 = 0.4

write(*,*) "x1: ", x1, "x2: ", x2

fx1 = 3*(x1**3) + x1**2 - x1
fx2 = 3*(x2**3) + x2**2 - x2

write(*,*) "fx1: ", fx1, "fx2: ", fx2

df = (fx2 - fx1)/(x2 - x1)
analytical_derivative = 9*x1*x1 + 2*x1 - 1

write(*,*) "df: ", df
write(*,*) "analytical: ", analytical_derivative

error = analytical_derivative - df

write(*,*) "error: ", error

end program derivative
