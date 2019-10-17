implicit none
real :: a, b, m, f

a = 1.0
b = 2.0

do while (b - a > 1.0e-11)
  m = (a + b) / 2.0
  if (f(a) * f(m) < 0.0) then
    b = m
  else
    a = m
  end if
  print*, 'Current m: ', m
  print*, 'Current (b - a): ', b-a
end do
stop
end

real function f(x)
  implicit none
  real :: x

  f = x**2 - 3.0

  return
end
