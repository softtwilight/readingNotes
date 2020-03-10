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