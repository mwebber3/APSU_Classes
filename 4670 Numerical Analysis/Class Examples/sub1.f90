implicit none
integer :: i
print*,'enter an integer'
read*,i

if (mod(i,2) == 0) then
	call even(i)
else
	call odd(i)
end if
stop
end

subroutine even(i)
implicit none
integer :: i, j
print*, 'i= ', i, ' is even'
j = (i/2)
if (mod(j,2) == 0) then
	print*, 'and i/2 is odd'
end if 
return 
end 

subroutine odd(i)
implicit none
integer :: i
print*,'i = ', i, ' is odd'
return
end