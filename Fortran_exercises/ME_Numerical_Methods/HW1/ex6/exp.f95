program calc
use calculates
implicit none

real(kind=8) :: x, fx, error, true
integer:: n

x = -2.0d0
n = 8
call taylor (x,n,fx)

write(*,*) "done: ", fx

true = 0.135335283236613
true = rounded(true)

error = rounded((true - fx) / true)
error = dabs(error)

write(*,*) "error: ", error



end program calc
