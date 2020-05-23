module calculates
implicit none
contains

! factorial:

integer function fact(n)
   integer, intent(in) :: n
   integer :: i

   fact = 1
   do i = 2, n
      fact = fact * i
!      write(*,*) "                             i ", i, "fact(n)", fact
   end do
   write(*,*) "n ", n, "fact(n)", fact
end function fact

!rounding

real(kind=8) function rounded(a)
   real(kind=8), intent(in) :: a

   rounded = dble(nint(a*(10**5)))/(10**5)
   write(*,*) "                                     rounded ", a,  rounded
end function rounded

!taylor series:

subroutine taylor (x, n, exp_x)
   real(kind=8), intent(in) :: x
   integer, intent(in) :: n
   integer :: i
   real(kind=8), intent(out) :: exp_x
   real(kind=8) :: test

   exp_x = 1

   do i = 1, n-1
      exp_x = rounded(exp_x) + rounded(rounded(x**i)/rounded(dble(fact(i))))
      test = rounded(rounded(x**i)/rounded(dble(fact(i))))
      write (*,*) "term ", i+1, "exp(-2) ", test, "result ", exp_x
   end do
   exp_x = rounded(exp_x)
end subroutine taylor

end module calculates
