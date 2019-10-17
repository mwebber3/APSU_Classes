! Mikayla Webber
! 4670 Numerical Analysis
! Homework G Due 12.1.17

! in the orbit problem we have initial x velocity zero and initial y velocity one. experiment with changing the initial y velocity to other values. discuess your results. reading about kepler's laws may be informative. Provide some graphs of interesting orbits.

program WebberHomeworkGQuestion3
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

   archive (:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.3d0 /)

   yin = archive(:,0)

   do i = 0, (nsteps - 1)
     tin = t(i)
	   tout = t(i + 1)
	   yin = archive(:,i)
	   call computef(neq, tin, yin, f1)
     u = (yin + (tout - tin) * f1)
     call computef(neq, tout, u, f2)
     yout = yin + (tout - tin) * (f1 + f2) / 2.0d0 ! euler
	   archive(:,i+1) = yout
   end do

   print*,'Creating "out0" '
   open(unit=8,file='q3out2', status='replace')
   do i = 0, nsteps
     write(8,*) archive(1,i), archive(2,i)
   end do

   close(8)

   print*,'writing eulererror'
   open(unit=8, file='eulererror', status='replace')

   do i = 0, nsteps
	    x = archive(1,i)
	    y = archive(2,i)
	    xactual = cos(t(i))
	    yactual = sin(t(i))
	    write(8,*) i, sqrt((x - xactual) ** 2 + (y - yactual) ** 2)
    end do

    close(8)

    deallocate(yin, yout, archive, t, f1, f2)

    stop
end program WebberHomeworkGQuestion3

!----------------------------------------------------------------------

subroutine computef(neq, t, y, f)
  implicit none
  integer :: neq
  double precision :: d, f(neq)
  double precision, intent(in) :: y(neq), t
  ! This subroutine computes the RHS of the differential equation:
  !  dy
  !  -- = f(t, y)
  !  dt
  ! where y is the array of unknowns, indexed from one to neq and f is the array of right sides.

  !y(0) = 0
  d = ((y(1) ** 2.0d0 + y(2) ** 2.0d0) ** 1.5d0)

  f(1) = y(3)
  f(2) = y(4)
  f(3) = (-y(1) / d)
  f(4) = (-y(2) / d)

  return
end
