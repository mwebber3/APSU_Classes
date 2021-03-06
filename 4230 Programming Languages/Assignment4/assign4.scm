;;mwebber
;;CSCI 4230 Assignment 4
;;Due October 12th, 2017

;;1. Write a function called letterGrade that takes a number between 0 and 100 and returns
;;a string containing the corresponding letter grade where 90 and above is an A, 80-89 is a
;;B, and so on. Use a cond expression to implement this. If the number is out of range,
;;return the string "Error: out of range".

(define letterGrade
  (lambda (n)
    (cond
      ((and(>= n 90) (<= n 100) (display "A")))
      ((and(>= n 80) (<= n 89) (display "B")))
      ((and(>= n 70) (<= n 79) (display "C")))
      ((and(>= n 60) (<= n 69) (display "D")))
      ((and(>= n 0) (<= n 59) (display "F")))
      ((< n 0) (display "Error: out of range."))
      ((> n 100) (display "Error: out of range.")))))

;;2. Write a function called countdown that takes a positive integer and used a do expression
;;to display a sequence of numbers counting down to 1, each on its own line, then displaying
;;the string "Blastoff!".

(define
  (countdown n)
  (do ((i n (- i 1)))
    ((< i 1) (display "Blastoff!"))
    (display i)
    (newline)))   

;;3. Write a recursive function called eval-poly that takes a list of numbers representing
;;the coeﬃcients of a polynomial and a value for x and evaluates the polynomial for the
;;given value of x. The list of coeﬃcients should start with the term of lowest degree and
;;end with the term of highest degree. If any term of intermediate degree is missing from
;;the polynomial it should have a coeﬃcient of zero. For example, the polynomial
;;x3 + 4x2 + 2 would be represented by the list ’(2 0 4 1).

(define eval-poly
  (lambda (list x)
    (if (null? list) 0
        (+ (car list)(* x (eval-poly (cdr list) x))))))

;;4. Write a tail-recursive version of the previous problem called eval-poly-tail. It
;;should call a helper function called eval-poly-tail-helper that uses tail recursion to
;;keep a running sum of the terms evaluated so far. You might want to use the expt function
;;to take a number to a power.

(define eval-poly-tail
  (lambda (list x)
    (eval-poly-tail-helper list x 0)))

(define eval-poly-tail-helper
  (lambda (list x exponent)
    (if (null? list) 0
        (if (= exponent 0)
            (+ (car list) (eval-poly-tail-helper (cdr list) x (+ exponent 1)))
            (+ (* (car list) (expt x exponent)) (eval-poly-tail-helper (cdr list) x (+ exponent 1)))))))

;;5. Write a recursive function called split that takes a list and returns a list containing
;;two lists, each of which has roughly half the items in the original list. The easiest way
;;to do this is to alternate items between the two lists, so that (split ’(1 2 3 4 5)) would
;;return ’((1 3 5) (2 4)). I recommend using two base cases: one for an empty list and the
;;other for a list containing one item.

(define split
  (lambda (n)
    (if (null? n)
        '()
        (list (firstHalf n) (secondHalf n)))))

(define firstHalf
  (lambda (n)
    (cond
     ((null? n) '())
     ((null? (cdr n)) n)
      (else (cons (car n)
                  (firstHalf (cdr (cdr n))))))))

(define secondHalf
  (lambda (n)
    (cond ((null? n) '())
          ((null? (cdr n)) '())
          (else (cons (car (cdr n))
                      (secondHalf (cdr (cdr n))))))))

;;6. Write a recursive function called merge that takes two sorted lists of numbers and
;;merges them together into one sorted list containing all of the number in both lists
;;including duplicates.

(define (merge xlist ylist)
  (cond
    ((null? xlist) ylist)
    ((null? ylist) xlist)
    ((< (car xlist) (car ylist))
     (cons (car xlist) (merge (cdr xlist) ylist)))
    ((cons (car ylist) (merge xlist (cdr ylist))))))

;;7. Write a recursive function called mergesort that sorts a list by doing the following:
;;(a) use split to split the list into two roughly equal-sized partitions.
;;(b) recursively sort both partitions.
;;(c) use merge to merge the sorted partitions together.
;;Once again you will need two base cases, one for the empty list and the other for a single
;;element list.

(define mergesort
  (lambda (n)
    (if (null? n) '()
        (if (null? (cdr n)) n
            (merge (mergesort (car (split n))) (mergesort (cadr (split n))))))))
