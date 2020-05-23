program newton
use funcs
implicit none

real(kind=8) :: Er, x_old, x_new
integer :: itermax, i

x_old = -3.0 ! starting value of x
itermax = 20

i = 1
Er = 1
write(*,*) "iteration    x       f(x)      Err"
do while (Er > 0.0001)
   ! determine the new x and the error:
   x_new = x_old - f(x_old)/df_dx(x_old)
   Er = dabs((x_new-x_old) / x_old)
   write(*,'(A2,I2,A2,3F12.7)') "  ", i, "  ", x_new, f(x_new), Er

   ! check if the maximum number of iterations has been exceeded:
   i = i+1 
   if (i > itermax) then
      write(*,*) "The maximum number of iterations has been exceeded."
      exit
   end if

   x_old = x_new
end do

end program newton
