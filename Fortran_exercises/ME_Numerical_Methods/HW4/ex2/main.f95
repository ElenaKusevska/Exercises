program secant
use funcs
implicit none

real(kind=8) :: x1, x2, x3, Er, true_x
real(kind=8) :: TrueError, TrueRelativeError, Tolerance
integer :: i, itermax

itermax = 10 
true_x = 1.232244855100926

x1 = 1.0
x2 = 1.5
x3 = 0.0

write(*,'(A7,F12.7,A10,F12.7)') "  x1:  ", x1, "  f(x1):  ", f(x1)
write(*,'(A7,F12.7,A10,F12.7)') "  x2:  ", x2, "  f(x2):  ", f(x2)
write(*,*)
write(*,*) "iteration    x       f(x)      Err"

i = 1
Er = 1
do while (Er > 0.0001)
   ! determine the new x and the error:
   x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2))
   Er = dabs( (x3-x2) / x2)
   write(*,'(A2,I2,A2,3F12.7)') "  ", i, "  ", x3, f(x3), Er

   ! check if the maximum number of iterations has been exceeded:
   i = i+1 
   if (i > itermax) then
      write(*,*) "The maximum number of iterations has been exceeded."
      exit
   end if

   x1 = x2
   x2 = x3
end do
write(*,*)

TrueError = true_x - x3
write(*,*) "TrueError:", TrueError

TrueRelativeError = dabs( (true_x-x3) / true_x )*100
write(*,*) "TrueRelativeError:", TrueRelativeError

Tolerance = dabs(f(x3))
write(*,*) "Tolerance:", Tolerance

end program secant
