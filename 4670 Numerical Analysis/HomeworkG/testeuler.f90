program testeuler
  implicit none

  integer :: neq, nsteps, i
  double precision, allocatable, dimension(:) :: yin, yout, t, f1, f2, u
  double precision, allocatable, dimension(:, :) :: archive
  double precision :: tin, tout, dt, a, b, x, y, xactual, yactual

  neq = 4
  nsteps = 10000
  allocate(yin(neq), yout(neq), t(0:nsteps), u(neq), f1(neq), f2(neq), archive(neq, 0:nsteps))

  a = 0.0d0
  b = 3.0d1

  dt = (b - a) / dble(nsteps)

  do i = 0, nsteps
	   t(i) = a + dble(i) * dt
   end do

   archive (:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /)

   yin = archive(:,0)

   do i = 0, (nsteps - 1)
     tin = t(i)
	   tout = t(i + 1)
	   yin = archive(:,i)
     call computef(neq, tin, yin, f1)
     u = (yin + (tout - tin) * f1)
	   call computef(neq, tin, yin, f2)
	   yout = (yin + (tout - tin) * (f1 + f2) / 2.0d0)
     ! call computef(neq, tin, yin, f1)
	   ! yout = yin + (tout - tin) * f1
	   archive(:, i + 1) = yout
   end do

   print*,'Creating "out0" '
   open(unit=8,file='out0', status='replace')
   do i = 0, nsteps
     write(8,*) archive(1,i), archive(2,i)
   end do

   close(8)

   print*,'Writing Eulererror'
   open(unit=8, file='Eulererror', status='replace')

   do i = 0, nsteps
	    x = archive(1,i)
	    y = archive(2,i)
	    xactual = cos(t(i))
	    yactual = sin(t(i))
	    write(8,*) i, sqrt((x-xactual) ** 2 + (y - yactual) ** 2)
    end do

    deallocate(yin, yout, t, u, f1, f2, archive)

    stop
end
