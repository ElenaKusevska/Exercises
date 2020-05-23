program insertion
implicit none

!-----------------------------------------------------------------
! This programme sorts a series of values in increasing order,
! using insertion sort, implemented with one working array
!
! It works like this:
! unsorted: A = [5, 3, 4, 1, 2, 6]
! sorting:
! pass 1: A = [3, 5, 4, 1, 2, 6]
! pass 2: A = [3, 4, 5, 1, 2, 6]
! pass 3: A = [1, 3, 4, 5, 2, 6]
! pass 4: A = [1, 2, 3, 4, 5, 6]
! pass 5: B = [1, 2, 3, 4, 5, 6]
!------------------------------------------------------

real(kind=8), allocatable, dimension(:) :: A
real :: temp
integer :: i, j, k, n

!------------------------------------------------------------
! Make some random array:
!------------------------------------------------------------

write(*,*) 'size od array?'
read(*,*) n
allocate (A(n))

call random_seed()
do i = 1, n
   call random_number(A(i))
   A(i) = (A(i) * 100.0)
   A(i) = real(nint(A(i)*1000)) / 1000.0 !rounding off to 3 decimal places
end do

!------------------------------------------------------------
! Prepare output file:
!------------------------------------------------------------

open(unit=1, file='insert', status='replace', action='write')
write(1,*) 'here you can see the details of how the loops and conditionals'
write(1,*) 'really work'

write(1,*)
write(1,*) '(using one array)'
write(1,*)
write(1,'(A3,10F7.3)') ' A ', A
write(*,'(A3,10F7.3)') ' A ', A
write(1,*)

!------------------------------------------------------------
! The actual sorting:
!------------------------------------------------------------

do i = 2, n
   write (1,*) 'i', i
   do j = 1, i-1 
      write(1,*) '   j', j
      if (A(j) .ge. A(i)) then
         write(1,*) 'found it'
         temp = A(i)
         do k = i-1, j, -1 !from the last value different from 0, to 
!                                   the first one greater than i
            A(k+1) = A(k) !move every element by one
            write(1,*) '      k', k
         end do
         A(j) = temp
         exit
      end if
   end do
   write(1,'(I4,10F7.3)') i, A
   write(1,*) 
   write(*,'(I4,10F7.3)') i, A
end do

end program insertion
