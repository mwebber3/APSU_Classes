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
