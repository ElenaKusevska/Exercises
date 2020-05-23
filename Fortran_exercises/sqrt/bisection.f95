program bisection_method
implicit none

real(kind=8) :: A, B, eps, root, maximum, minimum
integer :: iters

write(*,*) 'number?'
read(*,*) A

B = abs(A) !in case it's a negative number
if (B .ge. 1) then
   maximum = B
else if (B .lt. 1) then
   maximum = 1
end if
minimum = 0.0

eps = 0.00000000000001
iters = 0
do while (abs(B-root*root) .ge. eps)
   root = minimum + (maximum - minimum)/2.0d0
   iters = iters + 1
   write(*,*) iters, root, abs(B-root*root)
   if (root*root .gt. B) then
      maximum = root
   else if (root*root .lt. B) then
      minimum = root
   end if
end do

write(*,*) 'number of iterations:', iters
if (A .ge. 0.0d0)  then
   write(*,*) root
else
   write(*,*) root, 'i' ! because the result is imaginary for a negative A
end if

end program bisection_method
