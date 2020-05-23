program integrals
use procedures
implicit none

real(kind=8) :: a, b, I
real(kind=8), parameter :: pi = 3.141592653589793

   b = (3.0d0*pi)/2.0d0
   a = pi/2.0d0
   call I_Simpsons38(f1, a, b, I)
   write(*,'(A12,F9.5)') 'integral:   ', I

   b = 1.2d0
   a = -1.2d0
   call I_Simpsons38(f2, a, b, I)
   write(*,'(A12,F9.5)') 'integral:   ', I

end program integrals
