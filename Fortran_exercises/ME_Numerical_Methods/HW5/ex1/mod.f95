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

   write(*,'(20F8.3)') (A(i), i = 1, n)
   write(*,*)
end subroutine writes1d

subroutine Gauss_Elimination (A, n, M)
   real(kind=8), allocatable, dimension(:,:), intent(inout) :: A
   integer, intent(in) :: n !dimension
   real(kind=8), allocatable, dimension(:,:), intent(out) :: M
   real(kind=8) :: temp1, temp2
   integer :: i, j, k

   ! Initialize M:
   allocate (M(n,n))
   do i = 1, n
      do j = 1, n
         M(i,j) = 0.0
         if (i == j) then
            M(i,j) = 1
         end if
      end do
   end do
   
   ! Perform the Gauss Elimination:
   do k = 1, n-1 ! pivot row

      ! If the pivot element is very small:
      if (dabs(A(k,k)) .le. 0.01) then
         write(*,*)
         write(*,*)"--------------------------------------"
         write(*,*) "pivot element too small..."
         do i = k, n !look at the remaining rows
            if (dabs(A(k,i)) .gt. 0.01) then !if one of these rows has
                                             ! has A(k,i) > 0.01
               write(*,*) "swtching rows", i, "and", k
               write(*,*) "--------------------------------------"
               write(*,*)
               do j = 1, n !switch the i-th and the k-th row
                  temp1 = A(k,j)
                  temp2 = A(i,j)
                  A(k,j) = temp2
                  A(i,j) = temp1
               end do
            end if
         end do
      end if
       
      do i = 1, n-k ! now modify the n-k rows for this pivot
         M(i+k,k) = A(i+k,k)/A(k,k) ! find the multiplier for row i+k
         
         write(*,*) "--------------------------------------"
         write(*,'(A6,I3,A6,I3,A7,I1,A1,I1,A3,F7.3)') " Step:", k, "  Row:", i+k, "     m(", i+k,",", k, "): ", m(i+k,k)
         write(*,*) "--------------------------------------"
         
         do j = k, n ! for every column, j,  in row i+k
            A(i+k,j) = A(i+k,j) - M(i+k,k)*A(k,j) ! change the value of the matrix
                                                ! element A(i+k,j)
         end do
         call writes2d(A)
      end do
   end do

   write(*,*) '--------------------------------'
   write(*,*) '[L]: '
   write(*,*) '--------------------------------'
   call writes2d(M)
   write(*,*)
   write(*,*) '--------------------------------'
   write(*,*) '[U]: '
   write(*,*) '--------------------------------'
   call writes2d(a)

end subroutine Gauss_Elimination

subroutine Forward_Substitution(L,b,n,Y)
   real(kind=8), allocatable, dimension(:,:), intent(inout) :: L
   real(kind=8), allocatable, dimension(:), intent(in) :: b
   integer, intent(in) :: n !dimension
   real(kind=8), allocatable, dimension(:), intent(out) :: Y 
   integer :: i, j
   
   allocate( Y(n) )
   do i = 1, n
      Y(i) = b(i)
      do j = 1, i-1
         Y(i) = Y(i) - L(i,j)*Y(j)
      end do
      Y(i) = Y(i)/L(i,i)
   end do
end subroutine Forward_Substitution

subroutine Back_Substitution(U,b,n,X)
   real(kind=8), allocatable, dimension(:,:), intent(inout) :: U
   real(kind=8), allocatable, dimension(:), intent(in) :: b
   integer, intent(in) :: n !dimension
   real(kind=8), allocatable, dimension(:), intent(out) :: X
   integer :: i, j

   
   allocate( X(n) )
   do i = n, 1, -1
      X(i) = b(i)
      do j = i+1, n
         X(i) = X(i) - U(i,j)*X(j)
      end do
      X(i) = X(i)/U(i,i)
   end do

end subroutine Back_Substitution

end module procedures
