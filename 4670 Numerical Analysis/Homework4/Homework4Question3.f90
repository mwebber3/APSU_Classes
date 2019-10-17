! Mikayla Webber 
! 4670 Numerical Analysis
! Homework Four Due 11/6/17

module secret 

integer :: fcounter

end module secret 

!-----------------------------------------------------------------------------------------------------

program WebberHomework4Question3
use secret
implicit none



stop
end program WebberHomework4Question3

!-----------------------------------------------------------------------------------------------------

implicit none
	
	double precision :: a,b,ci,d,f,simp2d
	integer :: m,n
	external f
	
	a = 0.0d0
	b = 2.0d0
	ci = 0.0d0
	d = 1.0d0
	simp2d = 0.0d0
	
	m = 20
	n = 20
	
	call CompSimpson2d(a,b,ci,d,m,n,f,simp2d)
	
	print*,"simpson 2d = ",simp2d
	
	stop
	end
	
	double precision function f(x,y)
	implicit none
	
	double precision :: x,y
	
	f = x*y**2.0d0
	
	return
	end

