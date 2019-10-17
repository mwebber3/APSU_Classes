! Mikayla Webber 
! 4670 Numerical Analysis
! Homework Three Due 10/18/17

module secret 

integer :: fcounter

end module secret 



program WebberHomework3Question1
use secret
implicit none

integer :: i
integer :: n
double precision, allocatable, dimension(:) :: a
double precision, allocatable, dimension(:) :: xdata
double precision, allocatable, dimension(:) :: ydata

n = 10

open(unit=8, file='readTable.txt', status='old')
open(unit=9, file='resultTable.txt', status='replace')

read(8,*)	n
write(9,*) 	n

allocate(xdata(0:n), ydata(0:n), a(0:n))

do i = 0, n
	read(8,*) xdata(i), ydata(i)
	write(9,*) xdata(i), ydata(i)
	fcounter = (fcounter + 1)
end do

print*,'This program was ran this many times: ', fcounter

print*, 'Newtons Divided Difference Coefficients: '

call divdiff(n, xdata, ydata, a)

do i = 0, n
	print*, a(i)
end do

deallocate(xdata, ydata, a)

close(8)
close(9)

stop
end program WebberHomework3Question1



subroutine divdiff(n, xdata, ydata, a)

integer :: i
integer :: j
integer :: n
double precision :: a(0:n)
double precision :: xdata(0:n)
double precision :: ydata(0:n)
double precision, allocatable, dimension(:,:) :: T

allocate (T(0:n,0:n))

do i = 0, n
	T(i,0) = ydata(i)
end do

a(0) = ydata(0)

do i = 1, n
	do j = 1, n
		T(i,j) = ((T(i,(j - 1)) - T((i - 1),(j - 1))) / (xdata(i) - xdata(i - j)))
		if (i == j) then
			a(i) = T(i,j)
		end if
	end do
end do

deallocate(T)

end subroutine divdiff
