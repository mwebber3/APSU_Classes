real :: x,dx,a,b
integer :: i
x = 1.0
dx = 1.0
do i = 1, 30
     a = (x + dx)**2 + 5*(x+dx) + 1
     b = x**2 + 5 * x + 1
     print*, (a-b)/dx
     dx = dx/2
end do
stop 
end