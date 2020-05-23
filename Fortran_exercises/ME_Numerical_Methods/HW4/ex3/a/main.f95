program fpi
use funcs
implicit none

real(kind=8) :: x1, x2, Er
integer :: i, itermax

itermax = 100

x1 = 0.02

write(*,'(A7,F12.7,A10,F12.7)') "  x1:  ", x1, "  g(x1):  ", g(x1)
write(*,'(A7,F12.7,A10,F12.7)') "  x2:  ", x2, "  g(x2):  ", g(x2)
write(*,*)
write(*,*) "iteration    x       f(x)      Err"

i = 1
Er = 1
do while (Er > 0.0001)
   ! determine the new x and the error:
   x2 = g(x1)
   Er = dabs( (x2-x1) / x1)
   write(*,'(A2,I2,A2,3F12.7)') "  ", i, "  ", x2, g(x2), Er

   ! check if the maximum number of iterations has been exceeded:
   i = i+1 
   if (i > itermax) then
      write(*,*) "The maximum number of iterations has been exceeded."
      exit
   end if

   x1 = x2
end do
write(*,*)

end program fpi
