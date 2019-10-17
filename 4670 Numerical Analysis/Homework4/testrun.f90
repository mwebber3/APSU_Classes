! 4670 Numerical Analysis
! Homework Four Due 11/6/17

module secret 

integer :: fcounter

end module secret 

!-----------------------------------------------------------------------------------------------------

program WebberHomework4Question1
use secret
implicit none

double precision :: a, b, f, h, n
double precision :: actual!, t, trapezoid
double precision :: simpson, s
integer :: i!, n

a = 1.0d0
b = 2.0d0
n = 2.0d0
actual = log(2.0d0)

print*, "Newton and Composite Simpson Method"

do i = 1, 25
	h = (b - a) / dble(n)
print*, h
	s = simpson(n, a, b, f)
print*, s
	!write(*,* ) n, s, abs(actual - s), abs(actual - s) / h**4.0d0
	print*, n, s, abs(actual - s), abs(actual - s) / h**4.0d0
	n = n * 2.0d0
print*, n
end do

stop
end program WebberHomework4Question1

!-----------------------------------------------------------------------------------------------------

double precision function fprime(x)
implicit none
double precision :: f, pi, x

f = exp(1.0d0)
pi = (4.0d0 * ATAN(1.0d0))						! most accurate for pi

fprime = (1.0d0 / SQRT(2.0d0 * pi)) * (f**(-x**2.0d0) / 2.0d0)

return 
end

!-----------------------------------------------------------------------------------------------------

double precision function simpson(n, a, b, fprime)
implicit none

integer :: i!, n
double precision :: a, b, fv, h, n, fprime
double precision :: se, so

h = (b - a) / dble(n)

simpson = 0.0d0
se = 0.0d0
so = 0.0d0

do i = 1, n - 1
	fv = fprime(a + dble(i) * h)
	if (mod(i, 2) == 0) then
		se = se + fv
	else
		so = so + fv
	end if
end do

simpson = (h / 3.0d0 * (fprime(a) + fprime(b) + 2.0d0 * se + 4.0d0 * so))

return 
end

!-----------------------------------------------------------------------------------------------------

double precision function trapezoid(n, a, b, fprime)
implicit none

integer :: i, n
double precision :: a, b, fprime, h, xuse

h = (b - a) / dble(n)

trapezoid = 0.0d0

do i = 1, n - 1
	xuse = a + dble(i) * h
	trapezoid = fprime + fprime(xuse)
end do

trapezoid = h / 2.0d0 * (2.0d0 * trapezoid + fprime(a) + fprime(b))

return 
end
