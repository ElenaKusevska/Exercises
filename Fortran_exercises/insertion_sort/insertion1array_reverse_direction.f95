program insertion
implicit none

!-----------------------------------------------------------------
! This programme sorts a series of values in increasing order,
! using insertion sort, implemented with one working array
!
! It works like this:
! unsorted: A = [5, 3, 4, 1, 2, 6]
! sorting:
! pass 1: B = [5, 3, 4, 1, 2, 6]
! pass 2: B = [2, 5, 3, 4, 1, 6]
! pass 3: B = [1, 2, 5, 3, 4, 6]
! pass 4: B = [1, 2, 4, 5, 3, 6]
! pass 5: B = [1, 2, 3, 4, 5, 6]
!------------------------------------------------------

real(kind=8), allocatable, dimension(:) :: A
real :: temp
integer :: i, j, k, n, element, sorted_sum
logical :: sorted

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

element=n !initialize array element
sorted_sum = 0 !initialize test for testing if the array is sorted
i = 0 !initialize counter
do while (sorted_sum .lt. n)
   i = i + 1
   write (1,*) 'pass:', i, 'array_position', element
   sorted = .false. !initalize test for array element
   do j = 1, element-1 
      write(1,*) '   j', j
      if (A(j) .ge. A(element)) then
         write(1,*) 'found it'
         temp = A(element)
         do k = element-1, j, -1 !from the last value different from 0, to 
!                                   the first one greater than i
            A(k+1) = A(k) !move every element by one
            write(1,*) '      k', k
         end do
         A(j) = temp
         sorted = .true.
         exit
      end if
   end do
   write(1,'(I4,10F7.3)') i, A
   write(1,*) 
   write(*,'(I4,10F7.3)') i, A
   if (.not. sorted) element = element - 1
   sorted_sum = 1.0 !Because we will actually make n-1 comparisons
   do k = 1, n-1 ! Checking to see if the array has been sorted:
      if (A(k) .lt. A(k+1)) then
         sorted_sum = sorted_sum + 1
      end if
   end do
end do

end program insertion
