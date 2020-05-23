program linkedlist
implicit none

!Program to determine a linked list of the type:
!n1 -> n2 -> ... -> nk

type :: reals
   real :: r
   type (reals), pointer :: link_to_next

   ! This type is: i and ->

end type reals

type (reals), pointer :: previous_number, current_number
real :: k
character(len=1) :: done

nullify (previous_number)
nullify (current_number)

do
   read*, k
   allocate (current_number) ! create new link
   current_number%r = k
   current_number%link_to_next => previous_number ! point to previous link
   previous_number => current_number ! make this the previous link for the
   !                                   next iteration
   write(*,*) 'done? [Y/N]'
   read(*,*) done
   if (done == 'Y') then
      exit
   end if
end do

! print the contents of the list
current_number => previous_number ! point to beginning of the list
do
   if (.not. associated (current_number)) then ! end of list reached
      exit
   end if
   print*, current_number%r
   current_number => current_number%link_to_next ! go the next link in the list
end do

end program linkedlist
