subroutine computef(neq, t, y, f)
  implicit none
  integer :: neq
  double precision :: f(neq), d
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
