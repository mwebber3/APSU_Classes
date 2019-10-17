implicit none
double precision :: g, x, xold
integer :: counter

counter = 0
x = 4.0
xold = 123.3      ! nonsense value

do while (xold /= x)
  xold = x
  x = g(x)
  counter = counter + 1
  print*, counter, x, abs(x - xold)
end do
stop
end

real function g(x)
  implicit none
  real :: x

  g = 2.0*x/3.0 + 10.0/(3.0*x)

  return
end 
