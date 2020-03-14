#lang sicp

(define (rember-f test?)
  (lambda (a l)
    (cond ((null? l) '())
          ((test? (car l) a)
           ((rember-f test?) a (cdr l)))
          (else (cons (car l)
                      ((rember-f test?) a (cdr l)))))))

((rember-f eq?) 'a (list 'a 'v 'b 'a 'd))

;;
(define (insert-g combine)
  (lambda (test?)
    (lambda (new old l)
      (cond ((null? l) '())
            ((test? old (car l))
             (combine new old (cdr l)))
            (else (cons (car l)
                        (((insert-g combine) test?) new old (cdr l))))))))

;; abstract common patterns with a new function.

;; 用function递归，amazing
;; 将lat 中元素分为两个部分， 等于a的在list2， 不等于的在list1
;; return the value of (col list1 list2)
;; 这里eq？也可以作为参数，col比如是length，或者判断list2是否为null
;; 就等于member？函数了

(define (multirember a lat col)
  (cond ((null? lat)
         (col '() '()))
        ((eq? (car lat) a)
         (multirember a
                      (cdr lat)
                      (lambda (newlat seen)
                        (col newlat
                             (cons (car lat) seen)))))
        (else
         (multirember a
                      (cdr lat)
                      (lambda (newlat seen)
                        (col (cons (car lat) newlat)
                             seen))))))

(define multiinsertLR
  (lambda (new oldL oldR lat col)
    (cond
      ((null? lat) (col '() 0 0))
      ((eq? (car lat) oldL)
       (multiinsertLR new oldL oldR
                      (cdr lat)
                      (lambda (newlat L R)
                        (col (cons new
                                   (cons oldL newlat))
                             (+ L 1)
                             R))))
      ((eq? (car lat) oldR)
       (multiinsertLR new oldL oldR
                      (cdr lat)
                      (lambda (newlat L R)
                        (col (cons oldR
                                    (cons new newlat))
                              L
                              (+ R 1)))))
      (else
              (multiinsertLR new oldL oldR
                      (cdr lat)
                      (lambda (newlat L R)
                        (col (cons (car lat) newlat)
                              L
                              R)))))))
(even? 2)


;; 可以同时收集多个数据
;; 这里还可以进一步抽象，将‘（） 1 0 作为默认值参数
;; 将cons， * + 作为combiner也作为参数传进来
;; 将even？也作为参数传进来
;; 就能是一个非常抽象的函数 能收集3个关于集合的各种数据
;; 参数个数也能抽象吗，一个list？
(define evens-only-col
  (lambda (l col)
    (cond ((null? l)
           (col '() 1 0))
          ((not (pair? (car l)))
           (cond ((even? (car l))
                  (evens-only-col (cdr l)
                                  (lambda (newl p s)
                                    (col (cons (car l) newl)
                                         (* p (car l))
                                         s))))
                 (else
                  (evens-only-col (cdr l)
                                  (lambda (newl p s)
                                    (col newl
                                         p
                                         (+ s (car l))))))))
          (else
           (evens-only-col (car l)
                           (lambda (newl p s)
                             (evens-only-col (cdr l)
                                             (lambda (x y z)
                                               (col
                                                (cons newl x)
                                                (* p y)
                                                (+ s z))))))))))

(evens-only-col (list (list 9 1 2 8) 3 10 (list (list 9 9) 7 6) 2)
                (lambda (x y z)
                  (display x)
                  (newline)
                  (display y)
                  (newline)
                  (display z)))
                           

