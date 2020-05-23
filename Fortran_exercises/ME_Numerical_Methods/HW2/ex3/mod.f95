module routines
implicit none
contains

function cross (A, B)
   real(kind=8), dimension(3), intent(in) :: A, B
   real(kind=8), dimension(3) :: cross
   integer :: i

   cross(1) = A(2)*B(3) - A(3)*B(2)
   cross(2) = A(3)*B(1) - A(1)*B(3)
   cross(3) = A(1)*B(2) - A(2)*B(1)

end function cross

end module routines
