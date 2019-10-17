! Mikayla Webber
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


program WebberHomework2Question2
use secret							! uses secret module
implicit none

double precision :: a
double precision :: b
double precision :: f
double precision :: m
double precision :: mid
double precision :: tolerance

integer :: i 
integer :: findSign 						! I didn't realize "sign" was a
								! reserved word
a = -5.0d0
b = 5.0d0
tolerance = 1.0d0-10

do i = 1, 100
	m = mid(a, b)						! find the middle and calculate f(M)
	
	if (((b - a) / 2) < tolerance) then 			! if m is less than tolerance then
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
		a = m						! else it sets a to b
	end if 
end do

stop
end program WebberHomework2Question2



double precision function f(x)					! main function for the problem
implicit none

double precision :: x

f = ((-32.17d0 / (2.0d0 * x ** 2.0d0)) * ((dsinh(x) - dsin(x)) - 1.7d0))

return 
end



double precision function mid(a,b)				! function to find midpoint
implicit none

double precision :: a
double precision :: b

mid = ((a + (b - a)) / 2.0d0)					! midpoint formula

return
end



double precision function findSign(x)				! function to determine if negative
implicit none							! or positive

double precision :: x

if (x < 0.0d0) then 						! if less than zero sign is -1
	findSign = -1.0d0
else if (x == 0.0d0) then					! else if x is zero sign is 0
	findSign = 0.0d0
else								! if x is greater than zero sign is 1
	findSign = 1.0d0
end if

return
end