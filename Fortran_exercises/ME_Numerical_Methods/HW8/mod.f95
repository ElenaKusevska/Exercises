module procedures
implicit none
contains

!----------------------------
! Functions to solve:
!----------------------------

real(kind=8) function  f1(x)
   real(kind=8), intent (in) :: x

   f1 = (cos(x))**3
end function f1

real(kind=8) function f2(x)
   real(kind=8), intent(in) :: x

   f2 = 1/(1+9.0d0*x*x)
end function f2

!----------------------------
! Integration routine:
!----------------------------

subroutine I_Simpsons38 (Fun, a, b, I_new)

   real(kind=8), intent(in) :: a, b
   real(kind=8), intent(out) :: I_new
   interface
      real(kind=8) function Fun(z)
         real(kind=8), intent (in) :: z
      end function
   end interface
   real(kind=8), allocatable, dimension(:) :: x, fx
   real(kind=8) :: error, I_old, h
   integer :: n, i, j, counts

   write(*,*)
   write(*,*) 'iteration       integral              error'
   write(*,*) '---------------------------------------------'

   !--------------------------------
   ! The first step:
   !--------------------------------

   n = 3 ! number of intervals 
   h = (b-a)/n ! length of interval

   ! Determine the values of xi and f(xi) for every interval:
   allocate (x(n+1), fx(n+1))
   x(1) = a
   do i = 2, n+1
      x(i) = x(i-1) + h
      fx(i) = Fun(x(i))
   end do

   ! Determine the integral:
   I_old = fx(1) + fx(n+1)
   do i = 2, n-1, 3
      I_old = I_old + 3.0d0*(fx(i) + fx(i+1))
   end do
   do i = 4, n-2, 3
      I_old = I_old + 2.0d0*fx(i)
   end do
   I_old = I_old*((3.0d0*h)/8.0d0)
   deallocate (x, fx)

   !--------------------------------
   ! All the other steps:
   !--------------------------------

   counts = 0
   error = 1
   do while ((counts .le. 20) .and. (error .ge. 0.001))   
      n = 2*n ! number of intervals 
      h = (a-b)/n ! length of interval

      ! Determine the values of xi and f(xi) for every interval:
      allocate (x(n+1), fx(n+1))
      x(1) = a
      do i = 2, n+1
         x(i) = x(i-1) + h
         fx(i) = Fun(x(i))
      end do

      ! Determine the integral:
      I_new = fx(1) + fx(n+1)
      do i = 2, n-1, 3
         I_new = I_new + 3.0d0*(fx(i) + fx(i+1))
      end do
      do i = 4, n-2, 3
         I_new = I_new + 2.0d0*fx(i)
      end do
      I_new = I_new*((3.0d0*h)/8.0d0)

      ! Convergence criteria:
      error = dabs((I_new-I_old)/I_old)
      I_old = I_new
      write(*,'(I5,2F20.5)') counts, I_new, error
      counts = counts + 1
      deallocate (x, fx)
   end do

end subroutine I_Simpsons38

end module procedures
