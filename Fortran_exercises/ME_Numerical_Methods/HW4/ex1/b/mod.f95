module funcs
implicit none
contains

real(kind=8) function f(x)
   real(kind=8) x

   f = 5*x*x*x + 2*x*x + 120
end function f

real(kind=8) function df_dx(x)
   real(kind=8) x

   df_dx = 15*x*x + 4*x
end function df_dx

subroutine check_NaN (x, label)
   real(kind=8), intent(in) :: x
   character(len=5), intent(in) :: label

   if (isnan(x)) then 
      write(*,'(A4,A5,A12)') "... ", label, " is a NaN ..."
      stop
   end if
end subroutine check_NaN

end module funcs
