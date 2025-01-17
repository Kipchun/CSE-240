;;;
; CSE240 Functional Programming 2 Homework
; Learning how to use lists by creating different functions to push and pull values in the lists.
;
; Completion time: 6 hours
;
; @author Kipchun (AJH)
; @version 11/20/2024
;;;


; Q1
(define (sumEven lst)
  (if (null? lst)
      0
      (+ (if (even? (car lst))
             (car lst)
             0)
         (sumEven (cdr lst)))))

(display (sumEven '(1 3 -4 5 6 -7))) ; outputs 2
(newline)


((lambda (lst)
   (define (helper lst)
     (if (null? lst)
         0
         (let ((head (car lst))
               (tail (cdr lst)))
           (if (even? head)
               (+ head (helper tail))
               (helper tail)))))
   (helper lst)) 
 '(1 3 -4 5 6 -7)) ; outputs 2
(newline)

; Q2

(define (list-push-back lst new-list) (append lst new-list))
(display (list-push-back '(4 3 7 1 2 9) '(1 2))) ; outputs 4 3 7 1 2 9 1 2
(newline)

; Q3
(define (list-push-front lst new-list) (append new-list lst))
(display (list-push-front '(4 3 7 1 2 9) '(1 2))) ; outputs 1 2 4 3 7 1 2 9
(newline)
 
; Q4
(define (list-draw-front n lst)
  (cond ((or (= n 0) (null? lst)) '())
   ((> n 0) (cons (car lst)
            (list-draw-front (- n 1) (cdr lst))))))

(display (list-draw-front 3 '(4 3 7 1 2 9))) ; outputs 4 3 7
(newline)

; Q5
(define (list-draw-back n lst)
  (cond ((< n 0) '())
        ((> n (length lst)) lst)
        (else (let ((skip (- (length lst) n)))
                (if (= skip 0)
                    lst
                    (list-draw-back n (cdr lst)))))))

(display (list-draw-back 3 '(4 3 7 1 2 9))) ; outputs 1 2 9
(newline)

; Q6

(define (shuffle-helper l1 l2) ; Defines a helper function to perform the shuffle recursively
    (if (and (null? l1) (null? l2)) ; Checks if both lists are empty; if not, countinue
        '()
        (cons (car l1) ; Takes first element of the l1 and adds it to the result
              (cons (car l2) ; Takes first element of the l2 and adds it to the result
                    (shuffle-helper (cdr l1) (cdr l2)))))) ; Calls the helper function

(define (list-shuffle lst1 lst2) (shuffle-helper lst1 lst2)) ; Calls the helper function

(display (list-shuffle '(1 2) '(a b))) ; outputs 1 a 2 b
(newline)



