module procedures
implicit none
contains

subroutine writes2d (A)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   integer :: n, m, i, j

   n = size(A, 1)
   m = size(A, 2)

   do i = 1,n
      write(*,'(20F8.3)') (A(i,j), j = 1, m)
   end do
   write(*,*)
end subroutine writes2d

subroutine writes1d (A)
   real(kind=8), allocatable, dimension(:), intent(in) :: A
   integer :: n, i
   
   n = size(A)

!   write(*,*) (A(i), i = 1, n)
   write(*,'(20F8.3)') (A(i), i = 1, n)
   write(*,*)
end subroutine writes1d

function inv(A) result(Ainv)
  real(kind=8), dimension(:,:), intent(in) :: A
  real(kind=8), dimension(size(A,1),size(A,2)) :: Ainv

  real(kind=8), dimension(size(A,1)) :: work  ! work array for LAPACK
  integer, dimension(size(A,1)) :: ipiv   ! pivot indices
  integer :: n, info

  ! Store A in Ainv to prevent it from being overwritten by LAPACK
  Ainv = A
  n = size(A,1)

  ! DGETRF computes a LU factorization of a general M-by-N matrix
  call DGETRF(n, n, Ainv, n, ipiv, info)

  if (info /= 0) then
     stop 'Matrix is numerically singular!'
  end if

  ! DGETRI computes the inverse of a matrix using the LU factorization
  ! computed by DGETRF.
  call DGETRI(n, Ainv, n, ipiv, work, n, info)

  if (info /= 0) then
     stop 'Matrix inversion failed!'
  end if

end function inv

real(kind=8) function matnorm_inf(A)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   real(kind=8), allocatable, dimension(:) :: rowsums
   integer :: n, i, j

   n = size(A,1)
   allocate(rowsums(n))

   do i = 1, n
      rowsums(i) = 0.0
      do j = 1, n
         rowsums(i) = rowsums(i) + dabs(A(i,j))
      end do
   end do

   matnorm_inf = maxval(rowsums)
   deallocate (rowsums)
end function matnorm_inf

real(kind=8) function matnorm_one(A)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   real(kind=8), allocatable, dimension(:) :: columnsums
   integer :: n, i, j

   n = size(A,1)
   allocate(columnsums(n))

   do i = 1, n
      columnsums(i) = 0.0
      do j = 1, n
         columnsums(i) = columnsums(i) + dabs(A(j,i))
      end do
   end do

   matnorm_one = maxval(columnsums)
   deallocate (columnsums)
end function matnorm_one

subroutine TrueRelativeError_infinity_norm (A, residual, X_new, TRE)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   real(kind=8), allocatable, dimension(:), intent(in) :: X_new, residual

   real(kind=8), allocatable, dimension(:,:) :: work_matrix, work_residual
   real(kind=8), intent(out) :: TRE

   allocate (work_matrix (size(A,1),size(A,2)), work_residual(size(residual),1))

   work_matrix = matmul(inv(A),work_residual)
   TRE = matnorm_inf(work_matrix)/maxval(X_new)

end subroutine TrueRelativeError_infinity_norm

subroutine TrueRelativeError_one_norm (A, residual, X_new, TRE)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   real(kind=8), allocatable, dimension(:), intent(in) :: X_new, residual

   real(kind=8), allocatable, dimension(:,:) :: work_matrix, work_residual
   real(kind=8), intent(out) :: TRE

   allocate (work_matrix (size(A,1),size(A,2)), work_residual(size(residual),1))

   work_matrix = matmul(inv(A),work_residual)
   TRE = matnorm_one(work_matrix)/sum(X_new)

end subroutine TrueRelativeError_one_norm

subroutine Gauss_Siedel (A, B, X_old, n, tolerance, X_new)
   real(kind=8), allocatable, dimension(:,:), intent(inout) :: A
   real(kind=8), allocatable, dimension(:), intent(in) :: B
   real(kind=8), allocatable, dimension(:), intent(inout) :: X_old
   integer, intent(in) :: n
   real(kind=8), intent(in) :: tolerance
   real(kind=8), allocatable, dimension(:), intent(out) :: X_new
   real(kind=8), allocatable, dimension(:) :: residual, residual_abs
   integer :: i, j, iters
   real(kind=8) TRE_inf, TRE_one

   allocate ( X_new(n), residual(n), residual_abs(n) )

   do i = 1, n
      residual_abs(i) = i !initialize
   end do

   open (unit=9, file='plot.dat', status='new', action='write')

   iters = 0
   do while (maxval(residual_abs) .ge. tolerance)
      ! Find [x]:
      do i = 1, n
         X_new(i) = B(i)
         do j = 1, i-1
            X_new(i) = X_new(i) - A(i,j)*X_new(j)
         end do
         do j = i+1, n
            X_new(i) = X_new(i) - A(i,j)*X_old(j)
         end do
         X_new(i) = X_new(i)/A(i,i)
      end do
      iters = iters + 1
      ! Determine the residual: 
      do i = 1, n
         residual(i) = B(i)
         do j = 1, n
            residual(i) = residual(i) - A(i,j)*X_new(j)
         end do
      end do
      do i = 1, n
         residual_abs(i) = dabs(residual(i))
      end do
      !Determine the true relative error:
      call TrueRelativeError_infinity_norm (A, residual, X_new, TRE_inf)
      call TrueRelativeError_one_norm (A, residual, X_new, TRE_one)
      ! Write the output:
      write(*,*)
      write(*,*) "---------------------------------------------"
      write(*,*) "iteration:", iters
      write(*,*) "---------------------------------------------"
      call writes1d(X_new)
      write(*,*)
      write(*,*) "residual:"
      call writes1d(residual)
      write(*,*) "TrueRelativeEror (infinity norm), rueRelativeEror (one norm)"
      write(*,*) TRE_inf, TRE_one
      write(*,*)
      write(9,*) iters, maxval(residual_abs)
      do i = 1, n
         X_old(i) = X_new(i)
      end do
   end do

   close(9)
end subroutine Gauss_Siedel

end module procedures
