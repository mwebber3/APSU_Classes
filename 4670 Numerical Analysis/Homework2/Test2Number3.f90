! mwebber
! 4670 Numerical Analysis 
! Homework Two Redo


module secret 

end module secret 


program WebberHomework2Question3
use secret							! uses secret module
implicit none

double complex :: f
double complex :: p
double complex :: old
double complex :: prime
double complex :: tolerance 

p = (0, 1)
old = (p*2.0d0)
tolerance = 1.0d0-10

do while ((abs(p - old) /= tolerance))
	old = p
	p = (p + 1)
	p = (f(old) - (old - f(old)) / prime(old))
	print*, "probability = ", p
end do

stop
end program WebberHomework2Question3



double complex function f(p)				! function for probability
implicit none

double complex :: p

f = ((p + 1) / 2)* & (p / (1 - p + p**2)**21)

return 
end



double complex function firstP(p)
implicit none

double complex :: p

firstP = 1 - 1/2 p / & 1 - p + p**21

return
end



double complex function secondP(p)
implicit none

double complex :: p

secondP = 21(1 + p) / 2* & (p / (1 - p + p**2))**20

return 
end



double complex function thirdP(p)
implicit none

double complex :: p

thirdP = (1 - p**2) / & (1 - p + p**2)**2

return
end



double complex function prime(p)
implicit none

double complex :: p
double complex :: firstP
double complex :: secondP
double complex :: thirdP

prime = (firstP(p) - secondP(p) * thirdP(p))

return 
end
