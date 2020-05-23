program multiplication
use routines
implicit none

real(kind=8), dimension(3) :: U, V, W

!exercise 3 - a:
   write(*,*) "exercise 3 - a:"
   V = (/1, 2, 3/)
   write(*,'(A8,5F8.3)') "V: ", V
   U = (/3, 2, 1/)
   write(*,'(A8,5F8.3)') "U: ", U
   W = cross(V, U)
   write(*,'(A8,5F8.3)') "W: ", W
   write(*,*)

!exercise 3 - b:
   write(*,*) "exercise 3 - b:"
   V = (/-2, 1, -3/)
   write(*,'(A8,5F8.3)') "V: ", V
   U = (/1, 1, 1/)
   write(*,'(A8,5F8.3)') "U: ", U
   W = cross(V, U)   
   write(*,'(A8,5F8.3)') "W: ", W

end program multiplication
