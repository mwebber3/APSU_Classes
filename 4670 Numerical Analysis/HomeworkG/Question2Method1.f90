! Mikayla Webber
! 4670 Numerical Analysis
! Homework G Due 12.1.17

! use at least three numerical methods to solve:
! dy/dt = te^(3t) - 2y
! y(0) = 0
! for 0 <= t <= 2
! for each method obtain at least 100 data points on your approximation and produce a graph for each method.

program WebberHomeworkGQuestion2Method1
  implicit none

  integer :: i, neq, nsteps
  double precision :: a, b, dt, tin, tout
  double precision, allocatable, dimension(:, :) :: archive
  double precision, allocatable, dimension(:) :: t, u, f1, yin, yout

  neq = 1
  a = 0.0d0
  b = 2.0d0
  nsteps = 1000 ! at least 100

  allocate(yin(neq), yout(neq), t(0:nsteps), u(neq), f1(neq), archive(neq,0:nsteps))

  dt = ((b - a) / dble(nsteps))

  do i = 0, nsteps
    t(i) = (a + dble(i) * dt)
  end do

  archive (:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /) ! initial state vector
  yin = archive(:,0)

  do i = 0, (nsteps - 1)
    tin = t(i)
    tout = t(i + 1)
    yin = archive(:,i)
    call computef(neq, tin, yin, f1)
    yout = (yin + (tout - tin) * f1)
    archive(:,i+1) = yout
  end do

  print*, 'Creating "out5.2.1"'
  open(unit=8, file='out5.2.1', status='replace')

  do i = 0, nsteps
    write(8,*) t(i), archive(1,i)
  end do

  close(8)
  deallocate(yin, yout, t, u, f1, archive)

  stop
end program WebberHomeworkGQuestion2Method1

!-----------------------------------------------------------------------

subroutine computef(neq, t, y, f)
  implicit none
  integer :: neq
  double precision :: f(neq)
  double precision, intent(in) :: t, y(neq)
  ! This subroutine computes the RHS of the differential equation:
  !  dy
  !  -- = f(t, y)
  !  dt
  ! where y is the array of unknowns, indexed from one to neq and f is the array of right sides.

  !y(0) = 0
  f(1) = (t * dexp(3.0d0 * t) - 2.0d0 * y(1))

  return
end
