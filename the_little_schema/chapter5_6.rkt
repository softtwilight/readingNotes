#lang sicp
(define (rember* a l)
  (cond ((null? l) '())
        ((pair? (car l))
         (cons (rember* a (car l)) (rember* a (cdr l))))
        ((eq? a (car l))
         (rember* a (cdr l)))
        (else (cons (car l)
                    (rember* a (cdr l))))))

;; simplify only after the function is correct


;; chapter 6
(eq? (quote a) 'a)
(number? 2)
(define (numbered? x)
  (cond ((number? x) #t)
        ((null? (cdr x)) (number? (car x)))
        (else
         (let ((op (car (cdr x))))
           (if (or (eq? op '+)
                   (eq? op '*)
                   (eq? op '^))
               (and (numbered? (car x))
                    (numbered? (cddr x)))
               #f
               )))))
(numbered? 5)
(numbered? (list 1 '* 2))