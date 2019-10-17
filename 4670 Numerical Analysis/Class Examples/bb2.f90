implicit none

real :: a, b, m, f
integer :: counter

a = 1.0
b = 2.0
counter = 0

do while ((b - a) > 1.0e-11)
  m = (a + b) / 2.0
  if (f(a) * f(m) < 0.0) then
    b = m
  else
    a = m
  end if

  print*, 'Counter: ', counter
  print*, 'M: ', m
  print*, 'b - a: ', b-a
end do

stop
end

real function f(x)
  implicit none
  real :: x

  f = x**5 - 5.0 * x**4 + 10 * x**2 + 5 * x - 1

  return
end
