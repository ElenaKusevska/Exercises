program insertion
implicit none

!-----------------------------------------------------------------
! This programme sorts a series of values in increasing order,
! using insertion sort, implemented with two working arrays.
!
! It works like this:
! unsorted: A = [5, 3, 4, 1, 2, 6]
! sorting:
! pass 1: B = [5, 0, 0, 0, 0, 0]
! pass 2: B = [3, 5, 0, 0, 0, 0]
! pass 3: B = [3, 4, 5, 0, 0, 0]
! pass 4: B = [1, 3, 4, 5, 0, 0]
! pass 5: B = [1, 2, 3, 4, 5, 0]
! pass 6: B = [1, 2, 3, 4, 5, 6]
!------------------------------------------------------

real(kind=8), allocatable, dimension(:) :: A, B
integer :: i, j, k, n
logical :: sorted

!------------------------------------------------------------
! Make some random array:
!------------------------------------------------------------

write(*,*) 'size od array?'
read(*,*) n
allocate (A(n), B(n))

call random_seed()
do i = 1, n
   call random_number(A(i))
   A(i) = (A(i) * 100.0)
   A(i) = real(nint(A(i)*1000)) / 1000.0 !rounding off to 3 decimal places
   B(i) = 0.0
end do

!------------------------------------------------------------
! Prepare output file:
!------------------------------------------------------------

open(unit=1, file='insert', status='replace', action='write')
write(1,*) 'here you can see the details of how the loops and conditionals'
write(1,*) 'really work'

write(1,*)
write(1,*) '(using two arrays)'
write(1,*)
write(1,'(A3,10F10.5)') ' A ', A
write(*,'(A3,10F10.5)') ' A ', A
write(1,*)

!------------------------------------------------------------
! The actual sorting:
!------------------------------------------------------------

do i = 1, n
   write (1,*) 'i', i
   sorted = .false.
   do j = 1, i-1 !Because B can only have elements up to i-1 diff. from 0
      write(1,*) '   j', j
      if (B(j) .ge. A(i)) then
         write(1,*) 'found it'
         do k = i-1, j, -1 !from the last value different from 0, to the 
!                       first one greater than i
            B(k+1) = B(k) !move every element by one
            write(1,*) '      k', k
         end do
         B(j) = A(i)
         sorted = .true.
         exit
      end if
   end do
   if (.not. sorted) B(i) = A(i)
   write(1,'(I4)')
   write(1,'(I4,A3,20F7.3)') i, ' B ', B
   write(*,'(I4,A3,20F7.3)') i, ' B ', B
end do

end program insertion
