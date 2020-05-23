module funcs
implicit none
contains

real(kind=8) function f(x)
   real(kind=8) x

   f = 5*x*x*x + 2*x*x + 120
end function f

real(kind=8) function df_dx(x)
   real(kind=8) x

   df_dx = 15*x*x + 4*x
end function df_dx

end module funcs
