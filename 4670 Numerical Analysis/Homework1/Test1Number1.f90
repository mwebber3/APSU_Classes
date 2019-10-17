! 4670 Numberical Analysis Homework One
! Determine the largest integer that your system can represent and report the results.
! There should be no variables of type real and no numbers with decimal points.

implicit none
integer i, big
big = 1

do i = 1, 50
     big = big * 2
     print*, big
end do

stop
end
