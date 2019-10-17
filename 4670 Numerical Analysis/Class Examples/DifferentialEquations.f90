! Mikayla Webber
! 4670 Numerical Analysis
! Homework

module secret

integer :: fcounter

end module secret

!-----------------------------------------------------------------------------------------------------

program WebberHomework
use secret
implicit none

real, allocatable :: y(:), t(:)
real :: yo, tmax, h, k1, k2, y1, f
integer :: ni, i

print*, 'Enter yo, tmax, ni'
read*, yo, tmax, ni
h = tmax/ni
print*, 'This gives stepsize h=', h
allocate(t(0:ni), y(0:ni))

t(0) = 0
t(1) = h
y(0) = 1
k1 = -16*h**3
y1 = y(0) + h/2 *(k1 + k2)
do i = 2, ni
  t(i) = i*h
  y(i) = y(i-1) + (h/2)*(3*f(t(i-1), y(i - 1))- f(t(i-2), y(i-2)))
end do

stop
end program WebberHomework

!-----------------------------------------------------------------------------------------------------
real function f(t,y)
  real :: t,y

  f = -16*t**3*y**2

  return
end
