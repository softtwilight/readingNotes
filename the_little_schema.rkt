#lang sicp
(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))
(define (lat? x)
  (if (null? x)
      #t
      (if (atom? (car x))
          (lat? (cdr x))
          #f)))
(lat? '())  ;; -> #t
(lat? (list 'a 'b))  ;; -> #t
(lat? (list 'a 'b '()))  ;; -> #f

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f )
      (else (or ( eq? ( car lat) a)
                (member? a ( cdr lat)))))))

(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat)
                  (rember a (cdr lat)))))))

(rember 'hee (list 'a 'b 'hee 'c 'hee))
(rember 'a '())

(define (first l)
  (cond ((null? l) '())
        (else (cons
               (if (pair? (car l))
                   (car (car l))
                   '())
                    (first (cdr l))))))

(first (list (list 'a) (list 'c 'b) '()))

(define (insertR new old lat)
  (cond ((null? lat) '())
        ((eq? old (car lat))
         (cons old (cons new (cdr lat))))
        (else (cons (car lat) (insertR new old (cdr lat))))))
(insertR 'e 'd (list 'b 'c 'd 'f))
(insertR 'e 'a (list 'b 'c 'd 'f))

(define (multirember a lat)
  (cond ((null? lat) '())
        ((eq? a (car lat)) (multirember a (cdr lat)))
        (else (cons (car lat) (multirember a (cdr lat))))))

;; Always change at least one argument while recurring. It must be changed to be
;; closer to termination. the changing argument must be tested in the termination condition.

(define (add1 n) (+ n 1))
(define (sub1 n) (- n 1))
(define (add n m)
  (cond ((= n 0) m)
        (else (add (sub1 n)
                   (add1 m)))))
(add 6 7)
(define (sub n m)
  (cond ((= m 0) n)
        (else (sub (sub1 n)
                   (sub1 m)))))
(sub 15 7)