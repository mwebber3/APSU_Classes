! Mikayla Webber
! 4670 Numerical Analysis
! Homework IVP Due 12.6.17

program testeuler
  implicit none
  integer :: i, neq, nsteps
  double precision, allocatable, dimension(:,:) :: archive
  double precision :: tin, tout, dt, a, b, x, y, xactual, yactual
  double precision, allocatable, dimension(:) :: yin, yout, t, f1, f2, u

  neq = 1
  nsteps = 50
  allocate(yin(neq), yout(neq), t(0:nsteps), u(neq), f1(neq), f2(neq), archive(neq, 0:nsteps))

  a = 1.0d0
  b = 2.0d0
  archive(:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /)
  dt = (b - a) / dble(nsteps)

  do i = 0, nsteps
    t(i) = (a + dble(i) * dt)
  end do

  archive(:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /)
  yin = archive(:,0)

  do i = 0, (nsteps - 1)
    tin = t(i)
    tout = t(i + 1)
    yin = archive(:,i)
    call computef(neq, tin, yin, f1)
    yout = (yin + (tout - tin) * (f1 + f2) / 2.0d0)
    archive(:,i+1) = yout
  end do

  print*, 'creating "out1"'
  open(unit=8, file='q1out1', status='replace')

  do i = 0, nsteps
    write(8,*) t(i), archive(1,i)
  end do

  close(8)

  print*, 'writing pcerror'
  open(unit=8, file='pcerror', status='replace')

  do i = 0, nsteps
    x = archive(1,i)
    y = archive(2,i)
    xactual = cos(t(i))
    yactual = t(i) / (1 + log(t(i)))
    write(8,*) i, sqrt((x - xactual)**2 + (y - yactual)**2)
  end do

  deallocate(yin, yout, archive, t, f1, f2)
  stop
end program testeuler

!--------------------------------------------------------------

subroutine computef(neq, t, y, f)
  implicit none
  integer :: neq
  double precision :: f(neq)
  double precision, intent(in) :: t, y(neq)

  f(1) = (((1 + y(1)) / t) - (y(1) / t)**2)

  return
end
