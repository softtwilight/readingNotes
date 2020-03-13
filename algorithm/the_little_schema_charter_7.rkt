#lang sicp
;; chapter 7
(define (member? a lat)
  (cond ((null? lat) #f)
        ((eq? a (car lat)) #t)
        (else (member? a (cdr lat)))))

(define (set? lat)
  (cond
    ((null? lat) #t)
    ((member? (car lat) (cdr lat)) #f)
    (else (set? (cdr lat)))))
(set? (list 'a))
(set? (list 'a '() 'd 'a))


(define (set*? lat)
  (cond ((null? lat) #t)
        ((not (pair? lat))
         (member? (car lat) (cdr lat)

(set? (list 'a 3 (list 'a 'b 'a) 3))