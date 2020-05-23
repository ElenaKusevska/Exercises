module routines
implicit none
contains

subroutine writes (A)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A
   integer :: n, m, i, j, k

   n = size(A, 1)
   m = size(A, 2)

   write(*,*) 
   do i = 1,n
         write(*,'(20F8.3)') (A(i,j), j = 1, m)
   end do
end subroutine writes

subroutine MatrixMult (A, B)
   real(kind=8), allocatable, dimension(:,:), intent(in) :: A, B
   real(kind=8), allocatable, dimension(:,:) :: M
   integer :: i, j, k, a1, a2, b1, b2

   a1 = size(A, 1)
   a2 = size(A, 2)
   b1 = size(B, 1)
   b2 = size(B, 2)

   if (a2 .ne. b1) then
      write(*,*) "The matrices cannot be multiplied since the number of rows in [b] is not equal to the number of columns in [a]."
   else if ( a2 .eq. b1) then
      allocate (M(a1,b2))

      do i = 1, a1
         do j = 1, b2
            M(i,j) = 0.0d0
            do k = 1, a2
               M(i,j) = M(i,j) + A(i,k)*B(k,j)
            end do
         end do
      end do

      call writes (M)

      deallocate (M)
   end if
end subroutine MatrixMult






end module routines
