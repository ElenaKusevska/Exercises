module funcs
implicit none
contains

real(kind=8) function g(x)
   real(kind=8) x

   g = 1 / (4*(log10( (0.0004/3.7) + (2.51/((10**5)*sqrt(x)))))**2)
end function g

end module funcs
