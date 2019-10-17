! Mikayla Webber
! 4670 Numerical Analysis
! Homework G Due 12.1.17

! use at least three numerical methods to solve:
! dy/dt = te^(3t) - 2y
! y(0) = 0
! for 0 <= t <= 2
! for each method obtain at least 100 data points on your approximation and produce a graph for each method.

program aopc
  implicit none

  integer :: i, neq, nsteps
  double precision :: a, b, dt
  double precision, allocatable, dimension(:, :) :: archive
  double precision, allocatable, dimension(:) :: f, t, u, f1, fi, fim1, fim2, fim3, fim4, yin, yout

  neq = 1
  a = 0.0d0
  b = 2.0d0
  nsteps = 100

  allocate(yin(neq), yout(neq), u(neq), t(0:nsteps), f(neq), archive(neq,0:nsteps))
  allocate(fi(neq), fim1(neq), fim2(neq), fim3(neq), fim4(neq))

  dt = ((b - a) / dble(nsteps))

  do i = 0, nsteps
    t(i) = (a + dble(i) * dt)
  end do

  archive (:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /) ! initial state vector
  call abinitializer(neq, nsteps, t, archive)

  do i = 4, (nsteps - 1)
    call computef(neq, t(i), archive(:,i), fi)
    call computef(neq, t(i-1), archive(:,i-1), fim1)
    call computef(neq, t(i-2), archive(:,i-2), fim2)
    call computef(neq, t(i-3), archive(:,i-3), fim3)
    call computef(neq, t(i-4), archive(:,i-4), fim4)
    u = archive(:,i) + dt / 720.0d0 * (1901.0d0 * fi - 2774.0d0 * fim1 + 2616.0d0 * fim2 - 1274.0d0 * fim3 + 251.0d0 * fim4)
  end do

  print*, 'Creating "out5.2.3"'
  open(unit=8, file='out5.2.3', status='replace')

  do i = 0, nsteps
    write(8,*) t(i), archive(1,i)
  end do

  close(8)
  deallocate(yin, yout, u, f, t, f1, fi, fim1, fim2, fim3, fim4, archive)

  stop
end program aopc

!----------------------------------------------------------------------

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

!-----------------------------------------------------------------------

subroutine abinitializer(neq, nsteps, t, archive)
  implicit none
  integer :: i, nsteps
  integer, intent(in) :: neq
  double precision, intent(in) :: t(0:nsteps)
  double precision :: tin, tout, yin(neq), yout(neq), archive(neq,0:nsteps)

  do i = 0, neq
    tin = t(i)
    yin = archive(:,i)
    tout = t(i+1)
    call extrapolate(neq, tin, tout, yin, yout)
    archive(:,i+1) = yout
  end do

  return
end

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
