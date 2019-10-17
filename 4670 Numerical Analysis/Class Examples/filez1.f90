implicit none
integer :: i 
open(unit=8,file=cosnumbers',status='replace')
open(unit=9,file=sinnumbers',status='replace')
do i=1,10
	write(8,*)	i,cos(dble(i))
	write(9,*)	i,sin(dble(i))
end do
close(8)
close(9)
stop
end
