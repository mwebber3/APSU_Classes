subroutine f(t, y)
  implicit none
  double precision :: t, y

  f = cos(t) * exp(-t) - y

  return
end
