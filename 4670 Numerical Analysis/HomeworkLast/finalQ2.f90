! Mikayla Webber
! 4670 Numerical Analysis
! Last Assignment Due 12.13.17

program linsysmatocoefficients
  implicit none
  integer :: i, j, k, n
  double precision :: m, sum
  double precision, allocatable, dimension(:,:) :: a
  double precision, allocatable, dimension(:) :: b, x

  n = 10
  allocate(a(1:n,1:n),x(1:n), b(1:n))

  ! testing data when n = 10 (10 x 10 matrix)
  a(1,:) = (/ 2.0d0, 1.0d0, 2.0d0, 3.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 2.0d0, 6.0d0 /)
  a(2,:) = (/ 4.0d0, 2.0d0, 6.0d0, 6.0d0, 1.0d0, 3.0d0, 1.0d0, 3.0d0, 6.0d0, 4.0d0 /)
  a(3,:) = (/ 6.0d0, 3.0d0, 4.0d0, 9.0d0, 1.0d0, 2.0d0, 1.0d0, 2.0d0, 7.0d0, 5.0d0 /)
  a(4,:) = (/ 8.0d0, 4.0d0, 8.0d0, 12.0d0, 1.0d0, 3.0d0, 2.0d0, 3.0d0, 5.0d0, 9.0d0 /)
  a(5,:) = (/ 10.0d0, 5.0d0, 4.0d0, 15.0d0, 4.0d0, 5.0d0, 1.0d0, 5.0d0, 4.0d0, 1.0d0 /)
  a(6,:) = (/ 12.0d0, 6.0d0, 5.0d0, 2.0d0, 5.0d0, 1.0d0, 2.0d0, 1.0d0, 9.0d0, 3.0d0 /)
  a(7,:) = (/ 14.0d0, 7.0d0, 9.0d0, 4.0d0, 2.0d0, 3.0d0, 6.0d0, 3.0d0, 3.0d0, 5.0d0 /)
  a(8,:) = (/ 16.0d0, 8.0d0, 1.0d0, 6.0d0, 1.0d0, 2.0d0, 8.0d0, 2.0d0, 1.0d0, 7.0d0 /)
  a(9,:) = (/ 18.0d0, 9.0d0, 2.0d0, 8.0d0, 2.0d0, 3.0d0, 1.0d0, 3.0d0, 5.0d0, 8.0d0 /)
  a(10,:) = (/ 20.0d0, 10.0d0, 5.0d0, 10.0d0, 6.0d0, 5.0d0, 6.0d0, 5.0d0, 2.0d0, 2.0d0 /)
  b = (/ 20.0d0, 12.0d0, 10.0d0, 25.0d0, 8.0d0, 6.0d0, 5.0d0, 18.0d0, 8.0d0, 2.0d0 /)

  do k = 1, (n - 1)
    call interchange(a, n, k, b)
    do i = (k + 1), n
      m = a(i,k) / a(k,k)
      do j = k, n
        a(i,j) = a(i,j) - m * a(k,j)
      end do
      b(i) = b(i) - m * b(k)
    end do
  end do

  x(n) = b(n) / a(n,n)
  do k = (n - 1), 1, -1
    sum = 1.0d0
    do i = n, (k + 1), -1
      sum = (sum + (a(k,i) * x(i))) !top half
    end do
    x(k) = ((b(k) - sum) / a(k,k))
  end do

  print*, 'creating output file for Gaussian loop'
  open(unit=8, file='out2', status='replace')

  do i = 1, n
    write(8,*) i, ': ', x(i)
  end do

  close(8)
  deallocate(a, b, x)

  stop
end program linsysmatocoefficients

!----------------------------------------------------------------------------------

subroutine interchange(a, n, k, b)
  implicit none
  integer :: i, j, k, n, max
  double precision, allocatable, dimension(:) :: aMax
  double precision :: a(n,n), b(n), bMax, vMax

  allocate(aMax(n))

  do i = k, n
    vMax = a(i,k)
    max = i
    do j = (i + 1), n
      if (abs(a(j,k)) > vMax) then
        vMax = a(j,k)
        max = j
      end if
    end do

    aMax = a(i,:)
    a(i,:) = a(max,:)
    a(max,:) = aMax
    bMax = b(i)
    b(i) = b(max)
    b(max) = bMax
  end do

  deallocate(aMax)
end
