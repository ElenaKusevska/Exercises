program main
use routines
implicit none

integer:: i
integer(kind=16) :: fnumber

do i = 0, 100
   call f_routine(i, fnumber)
   write(*,*) i, fnumber
end do

end program main
