program main
use calculates
implicit none

real(kind=8), dimension(3,3) :: A, A_work
real(kind=8), dimension(3) :: B, X, Y
real(kind=8) :: det_A, det_A_work, test, test2
integer :: i, j, k, l

! assign values:

A = reshape( (/2, 7, 2, 7, 3, 4, 3, 9, 6/) , (/3,3/))
write(*,*) "Matrix A:"
call writes(A)

B = (/10, 11, 6/)

Y = (/0.0495, 1.3465, 0.1584/)
write(*,'(A12,3F8.3)') "Vector B:", B
write(*,*)

det_A = determinant(A)

write(*,*) "det_A:", det_A
write(*,*)

! Find x:
 
do i = 1, 3
   write(*,*) "---------------------------------------------"
   write(*,'(A15,I5)') "iteration:", i
   write(*,*) "---------------------------------------------"
   ! make A and A_work equal:
   do k = 1, 3
      do l = 1, 3
         A_work(k,l) = A(k,l)
      end do
   end do
   write(*,*) "working array before column change"
   call writes(A_work)
   !substitute the ith column of b in A_work:
   do j = 1, 3
      A_work(j,i) = B(j)
   end do
   write(*,*) "working array after column change"
   call writes(A_work)
   det_A_work = determinant(A_work)
   write(*,*) "determinant of the working array:", det_A_work
   write(*,*)
   X(i) = det_A_work/det_A
   write(*,'(A5,I1,A3,F8.3)') "   X(",i,")   ", X(i)
   write(*,*)
end do

write(*,*) "---------------------------------------------"
write(*,'(A15)') "solution:"
write(*,*) "---------------------------------------------"
write(*,*)
write(*,'(A12,3F8.3)') "Vector X:", X
write(*,*)

! Check solution:

do i = 1, 3
   test = 0.0d0
   test2 = 0.0d0
   do j = 1, 3
      test = test + A(i,j)*X(j)
      test2 = test2 + A(i,j)*Y(j)
   end do
   write(*,'(A14,I1,A13,F6.3,A9,F6.3,A9,F6.3)') "check for row ", i, " =>   AX(i): ", test, "   B(i): ", B(i), "  AY(i): ", test2
end do

end program main
