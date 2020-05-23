program ab
implicit none

integer, parameter :: dp = SELECTED_REAL_KIND(15)
integer :: n, lwork, lda, i, j, info
real(dp), dimension(3,3) :: inert
real(dp), dimension(3) :: w
character :: jobz, uplo
real(dp), allocatable, dimension(:,:) :: work


n = 3

inert(1,1) = 4
inert(1,2) = 5
    inert(2,1) = inert(1,2)
inert(1,3) = 8
    inert(3,1) = inert(1,3)
inert(2,2) = 1
inert(2,3) = 6
    inert(3,2) = inert(2,3)
inert(3,3) = 9

do i = 1, n
    do j = 1, n
        write(*,*) 'inert', i, j, inert(i,j)
    end do
end do

lda = 3
jobz = 'V'
uplo = 'L'
lwork = 102

allocate (work(1,102))

call DSYEV(jobz, uplo, n, inert, lda, w, work, lwork, info)

write(*,*) 'lwork', work(1,1) 
write(*,*) 'info', info

write(*,*) 'eigenvalues', w

do i = 1, 3
    do j = 1, 3
        write(*,*) 'eigenvec', 'i', i, 'j', j, inert(i,j)
    end do
end do

end program ab
