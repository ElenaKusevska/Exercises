program square_root
implicit none

real(kind=8) :: A, root, temp_root, int1, int2, dec1, dec2, n_decimal
integer :: i, j, N, integer_part

write(*,*) 'number?'
read(*,*) A

!-------------------------------------------
! For the integer part of the square root:
!-------------------------------------------

N = nint(A) ! just because we need an integer for the do loop below
do i = 0, N 
   int1 = dble(i)
   int2 = int1 + 1.0d0
   if (int2*int2 .gt. A) then
      if (int1*int1 .le. A) then
         root = int1 !at this point we have the integer part of the root
         exit
      end if
   end if
end do

!------------------------------------------
! For the decimal part of the square root:
!------------------------------------------

n_decimal = 1.0d0
do j = 1, 16 !level of precision
   n_decimal = n_decimal/10.0 !moving to the right by one decimal place
   write(*,'(A5I4)') 'j', j
   do i = 0, 9 !the digit at the j-th decimal place can have values
                  ! from 0 to 9
      dec1 = root + dble(i)*n_decimal
      dec2 = root + dble(i + 1)*n_decimal
      write(*,'(I3)', advance='no') i
      write(*,*) dec1, dec2
      if (dec2*dec2 .gt. A) then
         if(dec1*dec1 .le. A) then
            root = dec1 ! and now we have the square root with precision j
            exit
         end if
      end if
   end do
   write(*,*)
end do

write(*,*) root

end program square_root
