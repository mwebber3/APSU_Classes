! mwebber
! 4670 Numerical Analysis
! Homework IVP Due 12.6.17

program extrapall
  implicit none
  integer :: i, neq, nsteps
  double precision, allocatable, dimension(:,:) :: archive
  double precision, allocatable, dimension(:) :: f, t, u, yin, yout
  double precision :: tin, tout, dt, a, b, x, y, xactual, yactual, pi
  double precision, allocatable, dimension(:) :: fi, fim1, fim2, fim3, fim4, fip1

  neq = 2
  nsteps = 1000
  pi = acos(-1.0d0)

  allocate(yin(neq), yout(neq), u(neq), t(0:nsteps), f(neq), archive(neq,0:nsteps))
  allocate(fi(neq), fim1(neq), fim2(neq), fim3(neq), fim4(neq), fip1(neq))

  a = 0.0d0
  b = (24.0d0 * pi)
  dt = (b - a) / dble(nsteps)

  print*, 'starting loop'
  do i = 0, nsteps
    t(i) = a + dble(i) * dt
  end do

  archive(:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /)

  do i = 0, (nsteps - 1)
    tin = t(i)
    tout = t(i + 1)
    yin = archive(:,i)
    call extrapolate(neq, tin, tout, yin, yout)
    archive(:,i+1) = yout
  end do

  print*, 'writing "out4"'
  open(unit=8, file='out4', status='replace')

  do i = 0, nsteps
    write(8,*) 1.0d0 / archive(1,i) * cos(t(i)), 1.0d0 / archive(1,i) * sin(t(i))
  end do

  close(8)

  print*, 'writing "main4error"'
  open(unit=8, file='main4error', status='replace')

  do i = 0, nsteps
    x = archive(1,i)
    y = archive(2,i)
    xactual = cos(t(i))
    yactual = t(i) / (1 + log(t(i)))
    write(8,*) i, sqrt((x - xactual)**2 + (y - yactual)**2)
  end do

  close(8)

  deallocate(yin, yout, u, archive, t, f, fi, fim1, fim2, fim3, fim4, fip1)

  stop
end program extrapall

!--------------------------------------------------------------

subroutine extrapolate(neq, tin,tout, yin, yout)
  implicit none
  integer, intent(in) :: neq
  integer :: i, k, nrich, nsteps
  double precision :: yout(neq), bot
  double precision, intent(in) :: tin, tout, yin(neq)
  double precision, allocatable, dimension(:,:,:) :: table

  nrich = 10
  nsteps = 1
  allocate(table(0:nrich,0:nrich,neq))

  do i = 0, nrich
    call euler(neq, tin,tout, nsteps, yin, yout)
    table(i,0,:) = yout
    nsteps = (nsteps * 2)
  end do

  do k = 1, nrich
    bot = (2.0d0**k - 1.0d0)
    do i = k, nrich
      table(i,k,:) = table(i,k-1,:) + (table(i,k-1,:) - table(i-1,k-1,:)) / bot
    end do
  end do

  yout = table(nrich,nrich,:)

  return
end

!--------------------------------------------------------------

subroutine euler(neq, tin, tout, nsteps, yin, yout)
  implicit none
  integer :: i
  integer, intent(in) :: neq, nsteps
  double precision, intent(in) :: tin, tout, yin(neq)
  double precision :: dt, f(neq), yout(neq)

  yout = yin
  dt = ((tout - tin) / dble(nsteps))

  do i = 0, (nsteps - 1)
    call computef(neq, tin + dble(i) * dt, yout, f)
    yout = (yout + dt * f)
  end do

  return
end

!-------------------------------------------------------------

subroutine computef(neq, t, y, f)
  implicit none
  integer :: neq
  double precision :: f(neq)
  double precision, intent(in) :: t, y(neq)

  f(1) = y(2)
  f(2) = -y(1) + 1.0d0

  return
end
