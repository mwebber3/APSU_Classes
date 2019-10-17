! 4670 Numerical Analysis
! Last Assignment Due 12.13.17

program linsysmatocoefficients
  implicit none
  integer :: i, j, k, n
  double precision :: m, sum
  double precision, allocatable, dimension(:,:) :: a
  double precision, allocatable, dimension(:) :: b, x

  n = 5
  allocate(a(1:n,1:n),x(1:n), b(1:n))

  ! testing data when n = 5 (5 x 5 matrix)
  a(1,:) = (/ 5.0d0, 4.0d0, 6.0d0, 8.0d0, 1.0d0 /)
  a(2,:) = (/ 0.0d0, 3.0d0, 2.0d0, 3.0d0, 5.0d0 /)
  a(3,:) = (/ 0.0d0, 0.0d0, -7.0d0, 1.0d0, 9.0d0 /)
  a(4,:) = (/ 0.0d0, 0.0d0, 2.0d0, 1.0d0, 2.0d0 /)
  a(5,:) = (/ 0.0d0, 0.0d0, 0.0d0, 4.0d0, 5.0d0 /)
  b = (/ 7.0d0, -1.0d0, 1.0d0, 5.0d0, 4.0d0 /)

  do k = 1, (n - 1)
    do i = (k + 1), n
      m = a(i,k) / a(k,k)
      do j = k, n
        a(i,j) = a(i,j) - m * a(k,j)
      end do
      b(i) = b(i) - m * b(k)
    end do
  end do

  x(n) = b(n) / a(n,n)
  do i = (n - 1), 1, -1
    sum = 0.0d0
    do j = n, (i + 1), -1
      sum = (sum + (a(i,j) * x(j))) !top half
    end do
    x(i) = ((b(i) - sum) / a(i,i))
  end do

  print*, 'creating output file for Gaussian loop'
  open(unit=8, file='out1', status='replace')

  do i = 1, n
    write(8,*) i, ': ', x(i)
  end do

  close(8)
  deallocate(a, b, x)

  stop
end program linsysmatocoefficients
