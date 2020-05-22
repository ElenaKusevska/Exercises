program tests
implicit none

integer, dimension(3) :: array1, array2

array1 = (/ 1, 2, 3 /)
array2 = array1
array1(1) = 4

write(*,*) array1
write(*,*) array2

end program tests
