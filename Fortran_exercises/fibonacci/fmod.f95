module routines
implicit none
contains

subroutine f_routine(m, fnumber)
   integer, intent(in) :: m
   integer(kind=16), intent(out) :: fnumber
   integer(kind=16), dimension(2) :: last_two
   integer :: i

   last_two = (/ 1, 1 /)
   do i = 0, m
      if ((i .eq. 0) .or. (i .eq. 1)) then
         fnumber = 1
      else 
         fnumber = last_two(1) + last_two(2)
         if (mod(i,2) .eq. 0) then
            last_two(1) = fnumber
         else if (mod(i,2) .ne. 0) then
            last_two(2) = fnumber
         end if
      end if
   end do

end subroutine f_routine
   
end module routines
