implicit none
double complex:: x,xold,f,fprime,top,bot

x = (1.0d0, 3.0d0)
xold = 2.0d0*x

do while (abs(x-xold) > 1.0d-11)
	xold = x
	top = f(x)
	bot = fprime(x)
	x = x-top/bot
	print*,"x= ", x
	print*,top
	print*,
end do

print*,"End of program"
stop
end

double complex function f(x)
  implicit none
  double complex :: x

  f = exp(x) + 2.0d0

  return
end

double complex function fprime(x)
  implicit none
  double complex :: x

  fprime = exp(x)

  return
end
