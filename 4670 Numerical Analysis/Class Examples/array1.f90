implicit none

integer, allocatable, dimension(:) :: x,y,z
allocate(x(3),y(3),z(3))
x = (/ 4, 1, 7 /)
y = (/ 1, 2, 3 /)
print*, x(2), y(1)
print*, 'x = ', x
print*, 'y = ', y
z = 4*x+2*y             ! vector times constant is built into fortran
print*, '4x + 2y= ', z

stop
end
