! mwebber
! 4670 Numerical Analysis Homework One
! If p is positive and small, 1 + p may evaluate to 1. 
! Estimate a strategy for p where the behavior changes. 

implicit none
real::p
integer::i
p = 0.0

do i = 1, 50
     p = p + 1.0
     p = p / 2.0
     print*, p
end do

stop
end
