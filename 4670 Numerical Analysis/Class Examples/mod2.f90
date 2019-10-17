implicit none
real :: x, xold, f, fprime, top, bot, tol
integer :: m, counter, interationlimit

m = 5
x = 1.5
xold = 23.3
tol = 1.0e-11
interationlimit = 1000

print*, 'Start of program'

do while (abs(xold - x) > tol)
  xold = x
  top = f(x)
  bot = fprime(x)

  if (abs(top) < tol) then
    print*, 'The function value is less than ', tol
    print*, 'I declare victory! x = ', x
    print*
  end if
end do

stop
end
