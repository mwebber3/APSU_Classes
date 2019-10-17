! Mikayla Webber
! 4670 Numerical Analysis
! Homework IVP Due 12.6.17

! Solve problem 19 of section 5.4 using at least two numerical schemes. RK4 need not be one of them.

program euler
  implicit none
  integer :: neq, nsteps, i
  double precision, allocatable, dimension(:,:) :: archive
  double precision :: tin, tout, dt, a, b, x, y, xactual, yactual
  double precision, allocatable, dimension(:) :: yin, yout, t, f1, f2, u

  neq = 1
  a = 0.0d0
  b = 0.2d0
  nsteps = 20
  dt = (b - a) / dble(nsteps)
  allocate(yin(neq), yout(neq), t(0:nsteps), u(neq), f1(neq), f2(neq), archive(neq,0:nsteps))

  do i = 0, nsteps
    t(i) = a + dble(i) * dt
  end do

  archive(:,0) = 1.0d0
  yin = archive(:,0)

  do i = 0, nsteps - 1
    tin = t(i)
    tout = t(i + 1)
    yin = archive(:,i)
    call computef(neq, tin, yin, f1)
    yout = yin + (tout - tin) * (f1 + f2) / 2.0d0
    archive(:,i+1) = yout
  end do

  print*, 'creating "out1"'
  open(unit=8, file='out1', status='replace')
  do i = 0, nsteps
    write(8,*) t(i), archive(1,i)
  end do

  close(8)

  print*, 'writing pcerror'
  open(unit=8, file='pcerror', status='replace')
  do i = 0, nsteps
    x = t(i)
    y = archive(1,i)
    xactual = cos(t(i))
    yactual = sin(t(i))
    write(8,*) i, sqrt((x-xactual)**2 + (y-yactual)**2)
  end do

  deallocate(yin, yout, archive, t, f1, f2)

  stop
end program euler

!--------------------------------------------------------------

subroutine computef(neq, t, y, f)
  implicit none
  integer :: neq
  double precision :: f(neq)
  double precision, intent(in) :: t, y(neq)

  f(1) = exp(y(1))

  return
end
