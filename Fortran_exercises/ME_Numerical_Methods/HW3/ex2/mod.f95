module procedures
implicit none
contains

!----------------------------
! Function to solve:
!----------------------------

real(kind=8) function g (x)
   real(kind=8), intent (in) :: x

   g = 8.0d0 - 4.5d0*(x-sin(x))
end function g

!----------------------------
! Bisection routine:
!----------------------------

subroutine BisectionRoot (Fun, a, b, ToolMax, Xs)

   real(kind=8), intent(in) :: ToolMax
   real(kind=8), intent(inout) :: a, b
   real(kind=8), intent(out) :: Xs
   interface
      real(kind=8) function Fun(x)
         real(kind=8), intent (in) :: x
      end function
   end interface
   real(kind=8) :: n, ConvergenceTest
   integer :: i

   ! Determine n; check if a and b are positioned properly:

   n = nint( (log10(b-a) - log10(ToolMax)) / log10(2.0d0) )
   write(*,'(A6F7.3)') " n >= ", n

   if (Fun(a)*Fun(b) > 0) then
      write(*,*) "f(a) and f(b) are not on opposite sides of the root. Cannot apply the bisection method "
      stop
   end if

   !Solve the function:
   
   write(*,'(6A15)') "   iteration:  ", "       a       ", &
      "        b        ", "(xNS) Solution", "      f(xNS)    ", "   Tolerance   "
   
   i = 0
   ConvergenceTest = 10
   do while (ConvergenceTest > ToolMax)
      
      i = i + 1
      if (i > n + 10) then
         write(*,*) "convergence could not be reached in the number of intervals)"
         stop
      end if
      
      Xs = (a+b)/2.0d0
      if (Fun(a)*Fun(Xs) < -0.00000000001) then
         b = Xs
      else if (Fun(a)*Fun(Xs) > 0.00000000001) then
         a = Xs
      else
         ConvergenceTest = abs(Fun(Xs))
         write(*,'(A6,I2,A7,5F15.11)') " ", i, " ", a, b, Xs, Fun(Xs), ConvergenceTest
         write(*,*) "convergence reached"
         exit
      end if
      
      ConvergenceTest = abs(Fun(Xs))
      write(*,'(A6,I2,A7,5F15.11)') " ", i, " ", a, b, Xs, Fun(Xs), ConvergenceTest

   end do

end subroutine BisectionRoot

end module procedures
