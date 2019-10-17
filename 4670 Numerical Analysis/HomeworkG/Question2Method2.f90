! Mikayla Webber
! 4670 Numerical Analysis
! Homework G Due 12.1.17

! use at least three numerical methods to solve:
! dy/dt = te^(3t) - 2y
! y(0) = 0
! for 0 <= t <= 2
! for each method obtain at least 100 data points on your approximation and produce a graph for each method.

program extrapall
  implicit none

  integer :: i, neq, nsteps
  double precision :: a, b, dt, tin, tout
  double precision, allocatable, dimension(:, :) :: archive
  double precision, allocatable, dimension(:) :: t, f1, yin, yout

  neq = 1
  a = 0.0d0
  b = 2.0d0
  nsteps = 1000

  allocate(yin(neq), yout(neq), t(0:nsteps), f1(neq), archive(neq,0:nsteps))

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
    call extrapolate(neq, tin, tout, yin, yout)
    archive(:,i+1) = yout
  end do

  print*, 'Creating "out5.2.2"'
  open(unit=8, file='out5.2.2', status='replace')

  do i = 0, nsteps
    write(8,*) t(i), archive(1,i)
  end do

  close(8)
  deallocate(yin, yout, t, f1, archive)

  stop
end program extrapall

!-----------------------------------------------------------------------

subroutine extrapolate(neq, tin, tout, yin, yout)
  implicit none

  integer, intent(in) :: neq
  integer :: i, k, nrich, nsteps
  double precision :: yout(neq), bot
  double precision, intent(in) :: tin, tout, yin(neq)
  double precision, allocatable, dimension(:, :, :) :: table

  nrich = 10
  nsteps = 1
  allocate(table(0:nrich, 0:nrich, neq))

  do i = 0, nrich
    call euler(neq, tin, tout, nsteps, yin, yout)
    table(i,0,:) = yout
    nsteps = (nsteps * 2)
  end do

  do k = 1, nrich
    bot = (2.0d0**k - 1.0d0)
    do i = k, nrich
      table(i,k,:) = (table(i,k-1,:) + (table(i,k-1,:) - table(i-1,k-1,:)) / bot)
    end do
  end do

  yout = table(nrich, nrich, :)
  return
end

!-----------------------------------------------------------------------

subroutine euler(neq, tin, tout, nsteps, yin, yout)
  implicit none

  integer :: i
  integer, intent(in) :: neq, nsteps
  double precision :: yout(neq), f(neq), dt
  double precision, intent(in) :: tin, tout, yin(neq)

  yout = yin
  dt = ((tout - tin)/dble(nsteps))

  do i = 0, (nsteps - 1)
    call computef(neq, (tin + dble(i) * dt), yout, f)
    yout = (yout + dt * f)
  end do

  return
end

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

  f(1) = (t * dexp(3.0d0 * t) - 2.0d0 * y(1))

  return
end
