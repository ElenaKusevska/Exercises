module funcs
implicit none
contains

real(kind=8) function f(x)
   real(kind=8) x

   f = 2*sin(sinh(1/(sin(x)))**(-6))*(1/sin(x)) - 0.5
end function f

end module funcs
