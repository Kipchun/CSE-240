;;;
; CSE240 Functional Programming 1 Homework
; This assignment involves pracicing various expressions and procedures in Scheme.
; 
; For the first assignment, we are providing the default header so you can see how it
; looks in Scheme. For future assignments, you will need to add it yourself.
;
; Completion time: 4 hours
;
; @author Kipchun (AJH)
; @version 11/17/2024
;;;

; Q1
(newline)
(display "Q1. Equation Conversion")
(newline)

; 1.1: 9 - 2 + 5
(define result-1_1 (+ (- 9 2) 5))
(display result-1_1)
(newline)

; 1.2: 5 * (6 + 12 + 5) - 25
(define result-1_2 (- (* 5 (+ 6 12 5)) 25))
(display result-1_2)
(newline)

; 1.3: 7 * ((5 - (1 * 3)) + (2 * 4))
(define result-1_3 (* 7 (+ (- 5 (* 1 3)) (* 2 4))))
(display result-1_3)
(newline)

; 1.4: 3 * (4 + (((6 * 6) + (6 * 6)) / (10 + 2)))
(define result-1_4 (* 3 (+ 4 (/ (+ (* 6 6) (* 6 6)) (+ 10 2)))))
(display result-1_4)
(newline)

; 1.5: ((((((4 + 6) * (6 + 4)) / 2) / 2) - 5) / 2) + ((((4 * 5) + (5 * 4)) / 2) + (4 * 5))
(define result-1_5 (+ (/ (- (/ (/ (* (+ 4 6) (+ 6 4)) 2) 2) 5) 2) (+ (/ (+ (* 4 5) (* 5 4)) 2) (* 4 5))))
(display result-1_5)
(newline)


; Q2
(newline)
(display "Q2. Add Function")
(newline)

(define (add x y) (+ x y))

(display (add 20 30))
(newline)

; Q3
(newline)
(display "Q3. Square Function")
(newline)

(define (square-helper n current-odd)
  (if (= n 0)
      0
      (add current-odd (square-helper (- n 1) (+ current-odd 2)))))

(define (square n) (square-helper (abs n) 1))

(display (square 5))
(newline)
(display (square -7))
(newline)
 
; Q4
(newline)
(display "Q4. Read Squares")
(newline)

(define (read-for-square)
  (square (read)))

(display (read-for-square))
(newline)

; Q5
(newline)
(display "Q5. Difference of Squares Equation")
(newline)

(define (diff-squares) (let*
                           ((val1 (read-for-square))
                            (val2 (read-for-square)))
                         (abs (- val1 val2))))

(display (diff-squares))
(newline)

; Q6
(newline)
(display "Q6. Sum-Odds Sequence")
(newline)

(define (sum-odds max) (if (<= max 0)
                           0
                           (if (odd? max)
                               (+ max (sum-odds (- max 2)))
                               (sum-odds (- max 1)))))
(display (sum-odds 10))
(newline)

; Q7
(newline)
(display "Q7. Fibonacci Sequence")
(newline)

; Defines the fib sequence
(define (fib a)
  (if (= a 0)
      0
      (if (= a 1)
          1
          (+ (fib (- a 1)) (fib (- a 2))))))

(display (fib 9))
(newline)
(display (fib 5))
(newline)
(display (fib 0))
(newline)
(display (fib 1))

