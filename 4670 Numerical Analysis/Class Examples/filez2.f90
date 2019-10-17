implicit none
integer :: i,j
double precision :: s,c

open(unit=8,file='cosnumbers',status='old')
open(unit=9,file='sinnumbers',status='new')

do i = 1,10
	read(8,*)	j,c
	read(9,*)	j,s
	write(*,*)	c**2 + s**2
end do 

close(8)
close(9)
stop 
end