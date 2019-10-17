implicit none
double precision :: xdata(0:2), ydata(0:2), top, bot, a(0:2)
double precision :: factor
integer :: i, j, k, n

n = 2 		! interpolate at n + 1 data points

xdata = (/ 5.0d0, 7.0d0, 10.0d0 /)
ydata = (/ 3.0d0, 1.0d0, 4.0d0 /)

a(0) = ydata(0)

do i = 1,n

	bot = (xdata(i) - xdata(0))
	do j = 1, (i - 1)
		bot = bot*(xdata(i) - xdata(j))
	end do

	top = ydata(i) - a(0)
	do j = 1, (i - 1)
		factor = xdata(i) - xdata(0)
		do k = 1, (j - 1)
			factor = factor* (xdata(i)-xdata(k))
		end do

		top = top - factor*a(j)
	end do

	a(i) = top/bot
end do

print*,'Coefficients of interpolating polynomial in Newtons Divided-Difference '
do i =0,n
	print*,a(i)
end do

stop
end
