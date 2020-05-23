program pointer_simple
implicit none

integer, pointer :: p
integer, target :: t
logical :: assoc

allocate(p)
p => t
p = 1
write(*,*) p
write(*,*) t
assoc = associated(p,t)
write(*,*) assoc
nullify (p)
assoc = associated(p,t)
write(*,*) assoc
!deallocate(p)

end program pointer_simple
