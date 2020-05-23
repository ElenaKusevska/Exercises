program LU
use procedures
implicit none

real(kind=8), allocatable, dimension(:,:) :: a, m, b_test, x_test, a_test
real(kind=8), allocatable, dimension(:) :: b, guess, x
real(kind=8) :: some_number, tolerance
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
allocate(a(n,n), b(n), guess(n), b_test(n,1), x_test(n,1))

! Assign the elements of a and b:
rewind(2)
do i = 1, n
   read(2,*) (a(i,j), j = 1,n)
end do
close(2)

open (unit=3, file='b.txt', status='old', action='read')
read(3,*) (b(j), j = 1,n)
close(3)

open (unit=4, file='guess.txt', status='old', action='read')
read(4,*) (guess(j), j = 1,n)
close(4)

write(*,*) "the matrix a:"
call writes2d(a)
write(*,*) "the matrix b:"
call writes1d(b)
write(*,*) "the initial guess:"
call writes1d(guess)


! Perform the Gauss-Siedel Procedure:
tolerance = 0.0001
call Gauss_Siedel (a, b, guess, n, tolerance, x)

! Test the result:
!do i = 1, n
!   x_test(i,1) = x(i)
!end do
!b_test = matmul(a,x_test)
!write(*,*)
!write(*,*) "-----------------------------------"
!write(*,*) "[a][x] = "
!call writes2d (b_test)
!call writes1d(b)
!write(*,*) "-----------------------------------"

end program LU
