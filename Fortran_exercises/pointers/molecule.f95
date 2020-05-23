program molecule

real, pointer, dimension(:) :: xyz
real, allocatable, dimension(:,:) :: molecule
integer :: n

write(*,*) 'how many atoms?'
read(*,*) n

allocate(molecule(n,3))




end program molecule
