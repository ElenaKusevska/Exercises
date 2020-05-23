program power
use procedures
implicit none

real(kind=8), allocatable, dimension(:,:) :: a
real(kind=8), allocatable, dimension(:) :: x
real(kind=8) :: some_number, eigenval
integer :: n, i, j, io

write(*,*)

! Determine dimensions of a:
open (unit=2, file='a.txt', status='old', action='read')
n = 0
do
   read(2,*,iostat=io) some_number
   if (io /= 0) exit 
      n = n + 1
end do
write(*,*) "number of equations and variables: ", n
write(*,*)
allocate(a(n,n), x(n))

! Assign the elements of a:
rewind(2)
do i = 1, n
   read(2,*) (a(i,j), j = 1,n)
end do
close(2)

write(*,*) "The matrix a:"
call writes2d(a)
write(*,*)

! Assign the elements of x:
x(1) = 1.0d0
x(2) = 1.0d0
x(3) = 1.0d0

eigenval = MaxEig(A)

end program power
