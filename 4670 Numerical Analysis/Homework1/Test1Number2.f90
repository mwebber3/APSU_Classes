! Mikayla Webber
! 4670 Numberical Analysis Homework One
! Determine the smallest possible real variable value.

implicit none
real::small
integer::i
small = 1

do i = 1, 150
     small = small / 2
     print*, small
end do

stop
end