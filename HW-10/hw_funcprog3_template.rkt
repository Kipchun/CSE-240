;;;
; CSE240 Functional Programming 3 Homework
; Write logic gates and recreate an n-bit-adder circuit.
;
; Completion time: 12 Hours
;
; @authors Kipchun (AJH), Chen, Acuna
; @version 11/30/2024
;;;


;Q1
; enter your code here:
(define (AND-gate a b)
  (if (and (= a 1) (= b 1)) 1 0))

(define (OR-gate a b)
  (if (or (= a 1) (= b 1)) 1 0))

(define (NOT-gate a)
  (if (= a 1) 0 1))

; Test cases
(display "AND-Gate Output\n")
(AND-gate 0 0)
(AND-gate 0 1)
(AND-gate 1 0)
(AND-gate 1 1)
; Expected outputs
;0
;0
;0
;1
; Test cases
(display "OR-Gate Output\n")
(OR-gate 0 0)
(OR-gate 0 1)
(OR-gate 1 0)
(OR-gate 1 1)
; Expected outputs
;0
;1
;1
;1
; Test cases
(display "NOT-Gate Output\n")
(NOT-gate 0)
(NOT-gate 1)
; Expected outputs
;1
;0

; Q2
; enter your code here:
(define (XOR-gate a b)
  (OR-gate (AND-gate (NOT-gate a) b) (AND-gate a (NOT-gate b))))

; Test cases
(display "XOR-Gate Output\n")
(XOR-gate 0 0)
(XOR-gate 0 1)
(XOR-gate 1 0)
(XOR-gate 1 1)
; Expected outputs
;0
;1
;1
;0

;Q3.1
; enter your code here:
(define (half-adder a b c)
  (XOR-gate a (XOR-gate b c)))


;Q3.2
; enter your code here:
(define (carry-out a b c)
  (OR-gate (AND-gate b c) (AND-gate (XOR-gate b a) (XOR-gate c a))))

;Q3.3
; enter your code here:
(define (full-adder a b c)
  (let ((sum (half-adder a b c))
        (carry (carry-out a b c)))
    (cons carry sum)))

; Test cases
(Display "half-adder Output\n")
(half-adder 0 0 0) 	
(half-adder 0 0 1) 	
(half-adder 0 1 0) 	
(half-adder 0 1 1)	
(half-adder 1 0 0) 	
(half-adder 1 0 1)	
(half-adder 1 1 0) 	
(half-adder 1 1 1)

; Expected outputs
;0
;1
;1
;0
;1
;0
;0
;1


; Test cases
(Display "fullAdder Output\n")
(full-adder 0 0 0) 	
(full-adder 0 0 1) 	
(full-adder 0 1 0) 	
(full-adder 0 1 1)	
(full-adder 1 0 0) 	
(full-adder 1 0 1)	
(full-adder 1 1 0) 	
(full-adder 1 1 1)

; Expected outputs
;(0 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(1 . 0)
;(1 . 1)


;Q4.1
; enter your code here:
(define (tail lst)
  (if (null? (cdr lst))
      (car lst)
      (tail (cdr lst))))

;Q4.2
(define (rmtail lst)
  (if (null? (cdr lst))
      '()
      (cons (car lst) (rmtail (cdr lst)))))

;Q4.3
; Step 1 size-n problem: Lines of code
; ----> Consists of two bit numbers A and B as well as a carry.

;(define (recursive-add A B c)
;  (if (null? A)
;      (if (= c 1) (list 1) '())
;      (let* ((sum (+ (car A) (car B) c))
;             (new-c (if (>= sum 2) 1 0))
;             (bit (if (= sum 3) 1 (if (= sum 2) 0 sum))))
;        (cons bit (recursive-add (cdr A) (cdr B) new-c)))))


; Step 2 Stopping condition: Lines of code
; ----> Checks if both A and B are empty, if so, it returns a value depending on the carry.

;  (if (null? A)
;      (if (= c 1) (list 1) '())

; Step 3 size-m problem: Lines of code
; ----> A recursive call to add the remaining bits for A and B with the new carry value

; (recursive-add (cdr A) (cdr B) new-c)


; Step 4: Lines of code
; ----> Adds the A and B along with the carry, then determine the new carry based on the sum if it is 2 or greater. Then the carry will be 1 or 0.
; Then we determine the current bit for the the result, if the sum is 3, the bit will be one, if 2 then it will be 0, otherwise it is just the sum.
; Finally, we combine the current bit with the recursive call's result and call recusive add with the A B, and updated carry.
; (let* ((sum (+ (car A) (car B) c))
;             (new-c (if (>= sum 2) 1 0))
;             (bit (if (= sum 3) 1 (if (= sum 2) 0 sum))))
;        (cons bit (recursive-add (cdr A) (cdr B) new-c)))


;Q4.4
; enter your code here:

(define (recursive-add A B c)
  (if (null? A)
      (if (= c 1) (list 1) '())
      (let* ((sum (+ (car A) (car B) c))
             (new-c (if (>= sum 2) 1 0))
             (bit (if (= sum 3) 1 (if (= sum 2) 0 sum))))
        (cons bit (recursive-add (cdr A) (cdr B) new-c)))))

(define (n-bit-adder A B n)
  (let* ((result (recursive-add (reverse A) (reverse B) 0))
         (result-length (length result))
         (carry (if (> result-length n) 1 0))
         (sum (if (> result-length n)
                  (take (cdr (reverse result)) n)
                  (take (reverse result) n))))
    (list carry sum)))

(define (take lst n)
  (if (or (null? lst) (= n 0))
      '()
      (cons (car lst) (take (cdr lst) (- n 1)))))

;Test cases
(define x1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )	
(define x2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )	
(define x3 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) )	
(define x4 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0) )
(define x5 '(1 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1) )	
(define x6 '(1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0) )


(display "n-bit-adder Output\n")
(n-bit-adder  x1 x2 32)
(n-bit-adder  x3 x4 32)
(n-bit-adder  x5 x6 32)
(n-bit-adder  x2 x3 32)
(n-bit-adder  x4 x5 32)
(n-bit-adder  x1 x6 32)
; Expected outputs
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(1 (1 0 1 1 1 0 0 0 1 1 1 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 1))
;(1 (0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0))
;(1 (1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
;(0 (1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0))


;Q5 boilerplate (implementations for reduce and filter)
(define reduce
	  (lambda (op base x) ;passing by name
		(if (null? x)
			base
			(op (car x) (reduce op base (cdr x))))))

(define filter (lambda (pred a-list)
	(if (null? a-list)
	    '()
	    (if	(pred (car a-list))
			(cons (car a-list) (filter pred (cdr a-list)))
			(filter pred (cdr a-list)))))) 





;Q5.1
; enter your code here:
(define (number-length lst)
  (apply + (map (lambda (x) 1) lst)))

;Q5.2
; enter your code here:
(define (count-zeros lst)
  (apply + (map (lambda (x) (if (= x 0) 1 0)) lst)))

;Q5.3
; enter your code here:
(define (binary->string lst)
  (apply string-append (map (lambda (x) (number->string x)) lst)))

