implicit none
real :: x, xold, f, fprime

x = 1.5
xold = 23.3

do while (abs(xold - x) > 1.0e-11)
  xold = x
  x = x - f(x) / fprime(x)
  print*, x, f(x), abs(x - xold)
end do

stop
end

real function f(x)
  implicit none
  real :: x

  f = x**2 - 3.0

  return
end

real function fprime(x)
  implicit none
  real :: x

  fprime = 2.0 * x

  return
end
