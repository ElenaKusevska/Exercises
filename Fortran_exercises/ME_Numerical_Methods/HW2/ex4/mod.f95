module calculates
implicit none
contains

real(kind=8) function determinant(A)
   real(kind=8), dimension(3,3), intent(in) :: A

   determinant = A(1,1)*(A(2,2)*A(3,3)-A(2,3)*A(3,2)) - A(1,2)*(A(2,1)*A(3,3)-A(2,3)*A(3,1))&
      + A(1,3)*(A(2,1)*A(3,2)-A(2,2)*A(3,1))
end function determinant

subroutine writes (A)
   real(kind=8), dimension(3,3), intent(in) :: A
   integer :: i, j

   do i = 1, 3
      write(*,'(20F8.3)') (A(i,j), j = 1, 3)
   end do
   write(*,*)
end subroutine writes

end module calculates
