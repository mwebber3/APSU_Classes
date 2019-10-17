! Mikayla Webber
! 4670 Numerical Analysis
! Homework IVP Due 12.6.17

program predictorcorrector
  implicit none
  integer :: i, neq, nsteps
  double precision , allocatable, dimension(:) :: yin, yout, t, u, f
  double precision , allocatable, dimension(: , :) :: archive
  double precision :: dt, a, b, x, y, xactual, yactual
  double precision , allocatable, dimension(:) :: fi, fim1, fim2, fim3, fim4, fip1

  neq = 1
  nsteps = 100

  allocate( yin(neq), yout(neq), u(neq), t(0:nsteps), f(neq), archive(neq, 0:nsteps))
  allocate(fi(neq), fim1(neq), fim2(neq), fim3(neq), fim4(neq), fip1(neq))

  a = 1.0d0
  b = 2.0d0
  dt = (b-a) / dble(nsteps)

  do i = 0, nsteps
      t(i) = a + dble(i)*dt
  end do

  archive(:,0) = (/ 1.0d0, 0.0d0, 0.0d0, 1.0d0 /)
  call abinitializer(neq, nsteps, t, archive)

  do i = 4, nsteps - 1
    call computef(neq, t(i), archive(:,i), fi)
    call computef(neq, t(i-1), archive(:,i-1), fim1)
    call computef(neq, t(i-2), archive(:,i-2), fim2)
    call computef(neq, t(i-3), archive(:,i-3), fim3)
    call computef(neq, t(i-4), archive(:,i-4), fim4)
    u = archive(:, i) + dt / 720.0d0 * (1901.0d0 * fi -2774.0d0*fim1 + 2616.0d0* fim2 - 1274.0d0*fim3 + 251.0d0 * fim4)
    call computef(neq, t(i+1), u, fip1)
    archive(:, i+1) = archive(:,i) + dt / 720.0d0 * (251.0d0 * fip1 + 646.0d0*fi - 264.0d0*fim1 + 106.0d0*fim2 - 19.0d0 * fim3)
   end do

   print*, 'writing "aopc"'
   open(unit=8, file ='aopc', status='replace')

   do i = 0, nsteps
     write(8,*) t(i), archive(1,i)
   end do

   close(8)

   print*, 'writing "aopcerror"'
   open(unit = 8, file = 'aopcerror', status = 'replace')

   do i = 0, nsteps
     x = archive(1, i)
     y = archive(2, i)
     xactual = cos(t(i))
     yactual = t(i) / ( 1 + log(t(i)))
     write(8,*) i, SQRT((x - xactual)**2 + (y - yactual)**2)
   end do

   deallocate(yin, yout, u, archive, t, f)
   deallocate(fi, fim1, fim2, fim3, fim4, fip1)

   stop
 end program predictorcorrector

!--------------------------------------------------------------------------------

subroutine abinitializer(neq, nsteps, t, archive)
  implicit none
  integer :: nsteps
  integer, intent(in) :: neq
  double precision, intent(in) :: t(0:nsteps)
  double precision :: yout(neq), tin, tout, yin(neq), archive(neq, 0:nsteps)

  tin = t(0)
  yin = archive(:,0)
  tout = t(1)
  call extrapolate(neq, tin, tout, yin, yout)
  archive(:,1) = yout

  tin = t(1)
  yin = archive(:,1)
  tout = t(2)
  call extrapolate(neq, tin, tout, yin, yout)
  archive(:,2) = yout

  tin = t(2)
  yin = archive(:,2)
  tout = t(3)
  call extrapolate(neq, tin, tout, yin, yout)
  archive(:,3) = yout

  tin = t(3)
  yin = archive(:,3)
  tout = t(4)
  call extrapolate(neq, tin, tout, yin, yout)
  archive(:,4) = yout

  return
end

!-------------------------------------------------------------------------------

subroutine extrapolate(neq, tin, tout, yin, yout)
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
    call euler(neq, tin, tout, nsteps, yin, yout)
    table(i,0,:) = yout
    nsteps = nsteps * 2
  end do

  do k = 1, nrich
    bot = 2.0d0**k - 1.0d0
    do i = k, nrich
      table(i,k,:) = table(i,k-1,:) + (table(i,k-1,:) - table(i-1,k-1,:)) / bot
    end do
  end do

  yout = table(nrich,nrich,:)

  return
end

!-------------------------------------------------------------

subroutine euler(neq, tin, tout, nsteps, yin, yout)
  implicit none
  integer :: i
  integer, intent(in) :: neq, nsteps
  double precision, intent(in) :: tin, tout, yin(neq)
  double precision :: dt, f(neq), yout(neq)

  yout = yin
  dt = ((tout - tin) / dble(nsteps))

  do i = 0, nsteps - 1
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

  f(1) = (((1 + y(1)) / t) - (y(1) / t)**2)

  return
end
