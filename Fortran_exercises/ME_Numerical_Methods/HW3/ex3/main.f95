program test_func_ptrs
    use procedures
    implicit none

real(kind=8) a, b, ToolMax, Xs

a = -8.0d0
b = 8.0d0
ToolMax = 0.001
call BisectionRoot(g, a, b, ToolMax, Xs)

write(*,*) Xs

end program test_func_ptrs
