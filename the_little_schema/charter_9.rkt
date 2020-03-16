#lang sicp

(define (pick n lat)
  (cond ((= 1 n) (car lat))
        (else (pick (- n 1)
                    (cdr lat)))))

(define (looking a lat)
  (define (keep-looking x y z)
    (cond ((eq? y x) #t)
          ((not (number? y)) #f)
          (else (keep-looking x (pick y lat) lat))))
  
    (keep-looking a (pick 1 lat) lat))

(looking 'a (list 6 2 4 'a 7 3))

(define shift
  (lambda (pair)
    (cons (car (car pair))
          (cons (cdar (car pair))
                (cdr pair)))))

;; 图灵停机问题？
;; eternity nerver return, so if the last-try willl stop, it then run eternity
;; it can't stop!! otherwise, if the last-try willn't stop, the (will-stop? last-try)
;; return, so is the method last-try return, which means it will stop.
;; Oh WTF!
(define last-try
  (lambda (x)
    (and (will-stop? last-try)
         (eternity x))))

;; 这是唯一一个我们能描述却不能定义的问题。

;; define 的含义。