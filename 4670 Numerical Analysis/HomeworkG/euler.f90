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
