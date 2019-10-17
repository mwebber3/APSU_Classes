;4230 Assignment 3
;Due September 29th

;1.Write a function called slope that takes two arguments, both pairs of numbers
;representing points, and calculates the slope of the line between those two points.
(define slope
  (lambda (x1 y1 x2 y2) (/(- y2 y1)(- x2 x1))))

;2.Write a predicate called square? that takes one argument, a number, and returns #t if
;that number is the square of two integers.
(define square?
  (lambda (x)
    (integer? (sqrt x))))

;3.Write a function called replace-first that takes two arguments, an item and a list, and
;returns a version of the list with its first element replaced by the item. If the list is
;empty (you can use the null? predicate to determine this) return the empty list.
(define replace-first
  (lambda (list x)
    (if (null? list)
        list
        (cons item(cdr list)))))

;4.Write a function called replace-first! that takes the same arguments as replace-first
;but modiﬁes the list itself using set-car!.
(define replace-first!
  (lambda (x list)
    (set-car! list x)
    display list))

;5.Write a recursive predicate called all-odd? that takes a list as an argument and returns
;#t if every number in a list is odd, and returns #f if any number in the list is even.
;If the list is empty, return #t.
(define all-odd?
  (lambda (list)
    (or (null? list)
        (and (odd? (car list))
             (all-odd? (cdr list))))))

;6.Write a recursive function called filter-odd that takes a list as an argument, and
;returns a list containing only the odd numbers in the original list. If the list is
;empty, return the empty list.
(define filter-odd
  (lambda (x)
    (if (null? x)
        x
        (if (odd? (car x))
            (cons (car x)
                 (filter-odd (cdr x)))
            (filter-odd (cdr x))))))

;7.Write a recursive function called product that takes a list of numbers as an argument
;and returns the result of multiplying them all together. If the list is empty, return 1.
(define product
  (lambda (x)
    (if (null? x)
        1
        (* (car x)(product(cdr x))))))
  
;8 Write a recursive function called smallest that takes a list of numbers as an argument
;and returns the smallest number in the list. The function does not need to work on the
;empty list.
(define (smallest list)
  (cond ((null?(cdr list))(car list))
        ((<(car list)(smallest(cdr list)))(car list))
        (else(smallest(cdr list)))))

;9.Write a recursive function called remove-first that takes a number and a list of numbers
;as arguments and returns a list consisting of the items in the original list with the ﬁrst
;occurence of the number removed. If the list is empty, return the empty list.
(define remove-first
  (lambda (item list)
    (if (null? list)
        lst
        (if (= item (car list))(cdr list)
            (cons (car list)(remove-first item(cdr list)))))))
    
;10.Write a recursive function called selection-sort that takes a list of numbers as an
;argument and uses smallest and remove-first to perform a selection sort on the list. If
;the list is empty, return the empty list.
(define selection-sort
  (lambda (x)
    (if (null? x)
        x
        (cons (smallest x)(selection-sort(remove-first(smallest x)x))))))
