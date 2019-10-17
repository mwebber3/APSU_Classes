! 4670 Numerical Analysis 
! Homework Two Redo

! From Notes on Bisection Method:
! f needs to be continuous 
! 1. Start with a, b so that f(a), f(b) have opposite signs
! 2. Find the middle M = (a+b)/2 and calculate f(M)
! 3. If f(a) and f(M) have opposite signs 
! set b = M
! else set a = M
! end if
! Loop back to #2

module secret 

end module secret 


program WebberHomework2Question1
use secret							! uses secret module
implicit none

real :: a
real :: b
real :: f
real :: m
real :: mid
real :: tolerance

integer :: i 
integer :: findSign 						! I didn't realize "sign" was a
								! reserved word
a = -10.0d0
b = 10.0d0
tolerance = 1.0d0-10

do i = 1, 10
	m = mid(a, b)						! find the middle and calculate f(M)
	
	if (m < tolerance) then 				! if m is less than tolerance then
		print*, "Middle = ", m				! prints the middle
		stop
	else if (f(m) == 0) then				! else if f(m) equals zero then
		print*, "Middle = ", m				! prints the middle
		stop
	else 							! if neither case is true 
		print*, "f(a, b) = (", a, ",", b, ") and m = ", m
	end if
	
	if ((findSign(f(a)) * findSign(f(m))) < 0) then		! if f(a) && f(M) have opposite signs
		b = m						! it sets b to M
	else 
		a = b						! else it sets a to b
	end if 
end do

stop
end program WebberHomework2Question1



real function f(x)						! main function for the problem
implicit none

real :: x

f = ((x**3)-30)							! equation for f = x^3 - 30

return 
end



real function mid(a,b)						! function to find midpoint
implicit none

real :: a
real :: b

mid = ((a + (b - a)) / 2)					! midpoint formula

return
end



integer function findSign(x)					! function to determine if negative
implicit none							! or positive

real :: x

if (x < 0) then 						! if less than zero sign is -1
	findSign = -1
else if (x == 0) then						! else if x is zero sign is 0
	findSign = 0
else								! if x is greater than zero sign is 1
	findSign = 1
end if

return
end
