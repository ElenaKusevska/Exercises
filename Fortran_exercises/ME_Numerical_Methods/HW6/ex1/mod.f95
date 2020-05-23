module procedures
implicit none
contains

subroutine writes2d (A)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   integer :: n, m, i, j

   n = size(A, 1)
   m = size(A, 2)

   do i = 1,n
      write(*,'(20F8.4)') (A(i,j), j = 1, m)
   end do
   write(*,*)
end subroutine writes2d

subroutine writes1d (A)
   real(kind=8), allocatable, dimension(:), intent(in) :: A
   integer :: n, i
   
   n = size(A)

   write(*,'(20F8.4)') (A(i), i = 1, n)
   write(*,*)
end subroutine writes1d

real(kind = 8) function MaxEig(A)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   real(kind=8), allocatable, dimension(:,:) :: Y, Y_old, Y_new
   real(kind=8) :: normalization_constant
   integer :: n, i, j

   !Initialize column vector:
   n = size(A,1)
   allocate (Y(n,1), Y_old(n,1))
   do i = 1, n
      Y(i,1) = 1.0d0
      Y_old(i,1) = 2.0d0 !initialize loop
   end do
   write(*,*) "initial vector:"
   call writes2d(Y)

   !perform calculation:
   i = 1
   do while (maxval(dabs(Y_old-Y)) .ge. 0.0001)
      do j = 1, n ! save old vector
         Y_old(j,1) = Y(j,1)
      end do
      Y = matmul(A,Y) !determine new vector
      MaxEig = maxval(Y)
      do j = 1, n
         Y(j,1) = Y(j,1)/MaxEig
      end do
      write(*,*) "iteration:", i
      write(*,'(A14,F10.6)') " tolerance:   ", maxval(dabs(Y_old-Y))
      write(*,'(A15,F8.4)') " eigenvalue:   ", MaxEig
      write(*,*) "eigenvector:"
      call writes2d(Y)
      i = i+1
   end do

   ! final normalization:
   normalization_constant = sqrt(Y(1,1)*Y(1,1) + Y(2,1)*Y(2,1) + Y(3,1)*Y(3,1))
   do i = 1, n
      Y(i,1) = Y(i,1)/normalization_constant
   end do
   write(*,*)
   write(*,'(A30)') " -----------------------------"
   write(*,'(A30)') "         final result         "
   write(*,'(A30)') " -----------------------------"
   write(*,*) "eigenvalue:", MaxEig
   write(*,*) "eigenvector, normalized to length 1 for comparison with matlab result:"
   call writes2d(Y)
   
   deallocate (Y, Y_old)
end function MaxEig

end module procedures
