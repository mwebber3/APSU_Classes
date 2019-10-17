subroutine report(n, t, w, true)
  implicit none
  integer :: i
  integer, intent(in) :: n
  double precision, intent(in) :: t(0:n), w(0:n), true(0:n)

  print*,n
  print*,'Writing files adamsb2, true, ab2error'

  open(unit=10, file='adamsb2', status='replace')
  open(unit=11, file='true', status='replace')
  open(unit=12, file='ab2error', status='replace')

  do i = 0, n
    write(10,*) t(i), w(i)
    write(11,*) t(i), true(i)
    write(12,*) t(i), abs(w(i) - true(i))
  end do

  close(10)
  close(11)
  close(12)

  return
end
