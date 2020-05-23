program multiplication
use routines
implicit none

real(kind=8), allocatable, dimension(:,:) :: A, B, C, D
integer :: n, m, p, q, c1, c2, d1, d2, i, j

!-------------------------------------------------
! Assign the dimentsions; allocate the matrices:
!-------------------------------------------------

!From the exercise:
   n = 2
   m = 4
   p = 3
   q = 4

!To test the program:
   c1 = 2
   c2 = 3
   d1 = 3
   d2 = 4

allocate (A(n,m), B(p,q), C(c1,c2), D(d1, d2))

!---------------------------------------
! Assign values to the matrix elements: 
!---------------------------------------

!From the exercise:
   A = reshape ( (/13, 7, 4, 8, 3, 16, 2, 6/), (/n,m/) )
   call writes(A)
   write(*,*) "dimensions of A: ", size(A,1), size(A,2)

   B = reshape ( (/21, 13, 12, 7, 21, 14, 3, 12, 21, 2, 23, 11/), (/p,q/) )
   call writes(B)
   write(*,*) "dimensions of B: ", size(B,1), size(B,2)

!To test the program:
   do i = 1, c1
      do j = 1, c2
         C(i,j) = i + j
      end do
   end do 
   call writes(C)
   write(*,*) "dimensions of C: ", size(C,1), size(C,2)

   do i = 1, d1
      do j = 1, d2
         D(i,j) = i - j
      end do
   end do
   call writes(D)
   write(*,*) "dimensions of D: ", size(D,1), size(D,2)

!Perform the multiplication:
   write(*,*)
   write(*,*) "Multiplying A and B from the exercise..."
   call MatrixMult(A, B)
   write(*,*)
   write(*,*) "Multiplying matrices C and D to test the program..."
   call MatrixMult(C, D)

deallocate (A, B, C, D)

end program multiplication
