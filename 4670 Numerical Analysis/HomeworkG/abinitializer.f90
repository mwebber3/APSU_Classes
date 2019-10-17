subroutine abinitializer(neq, nsteps, t, archive)
  implicit none
  integer, intent(in) :: neq
  integer :: i, k, nrich, nsteps
  double precision, intent(in) :: t(0:nsteps)
  double precision :: bot, tin, tout, yin(neq), yout(neq), archive(neq,0:steps)

  do i = 0, neq
    tin = t(i)
    yin = archive(:,i)
    tout = t(i+1)
    call extrapolate(neq, tin, tout, yin, yout)
    archive(:,i+1) = yout
  end do

  return
end
