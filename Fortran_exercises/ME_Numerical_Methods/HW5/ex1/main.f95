program LU
use procedures
implicit none

real(kind=8), allocatable, dimension(:,:) :: a, m, b_test, x_test, a_test
real(kind=8), allocatable, dimension(:) :: b, x, y
real(kind=8) :: some_number
integer :: n, i, j, io

write(*,*)

! Determine dimensions of a and b;
open (unit=2, file='a.txt', status='old', action='read')
n = 0
do
   read(2,*,iostat=io) some_number
   if (io /= 0) exit 
      n = n + 1
end do
write(*,*) "number of equations and variables: ", n
write(*,*)
allocate(a(n,n), b(n), b_test(n,1), x_test(n,1), a_test(n,n))

! Assign the elements of a and b:
rewind(2)
do i = 1, n
   read(2,*) (a(i,j), j = 1,n)
end do
close(2)

open (unit=3, file='b.txt', status='old', action='read')
read(3,*) (b(j), j = 1,n)
close(3)

write(*,*) "the matrix a:"
call writes2d(a)
write(*,*) "the matrix b:"
call writes1d(b)

! Save the elements of a:
do i = 1, n
   do j = 1, n
      a_test(i,j) = a(i,j)
   end do
end do

! Perform the Gauss Elimination:
call Gauss_Elimination(a, n, m)

! Perform Forward and Back Substitution:
call Forward_Substitution(m, b, n, y)
write(*,*) 
write(*,*) "-----------------------------------"
write(*,*) "[L][Y] = [b]: "
write(*,*) "-----------------------------------"
call writes1d(y)
call Back_Substitution(a, y, n, x)
write(*,*)
write(*,*) "-----------------------------------"
write(*,*) "[U][X] = [b]: "
write(*,*) "-----------------------------------"
call writes1d(x)

! Test the result:
do i = 1, n
   x_test(i,1) = x(i)
end do
b_test = matmul(a_test,x_test)
write(*,*)
write(*,*) "-----------------------------------"
write(*,*) "[a][x] = "
call writes2d (b_test)
call writes1d(b)
write(*,*) "-----------------------------------"

end program LU
