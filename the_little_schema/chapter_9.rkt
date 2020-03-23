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
;(define last-try
;  (lambda (x)
;    (and (will-stop? last-try)
;         (eternity x))))
(define (eternity x)
  (eternity x))

;; 这是唯一一个我们能描述却不能定义的问题。

;; define 的含义。
(define length
  (lambda (l)
    (cond ((null? l) 0)
    (else (+ 1 (length (cdr l)))))))

;; 不用define，我们怎么写length呢
;; 只能计算length = 0 的函数
((lambda (l)
  (cond ((null? l) 0)
        (else (+ 1
                 (eternity (cdr l))))))
 '()) ;; -> 0

;; 只能计算length = 1 的函数

(define length1 (lambda (l)
  (cond ((null? l) 0)
        (else
         (+ 1
            ((lambda (l)
               (cond
                 ((null? l) 0)
                 (else
                  (+ 1
                     (eternity (cdr l))))))
             (cdr l)))))))

(length1 (list 'a))

;; 这里懒得敲，实际上把length1 copy过来就行了
(define length2
  (lambda (l)
    (cond ((null? l) 0)
          (else
           (+ 1
              (length1 (cdr l)))))))
(length2 (list 'b 'c))

;; 我们把length = 0 函数apply eternity之前的部分抽象出来，将eternity作为函数参数，得到:
((lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+ 1 (length (cdr l)))))))
 eternity)

;; 我们用同样的方式改写length <= 1 的函数
((lambda (f)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+ 1 (f (cdr l)))))))
 ((lambda (length)
    (lambda (l)
      (cond
        ((null? l) 0)
        (else (+ 1 (length (cdr l)))))))
  eternity))

;; 同理length <= 2也一样
;; 这个方程以一个类似length函数为参数， 返回了一个类似lenght的函数
;; 我们把这个过程抽象出来 就叫它mk-length
;; 那么length <= 0 可以用如下表示：
((lambda (mk-length)
   (mk-length eternity))
 (lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+ 1 (length (cdr l))))))))

;; 改写length <= 1
((lambda (mk-length)
   (mk-length
    (mk-length eternity)))
 (lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+ 1 (length (cdr l))))))))
;; 改写length <= 2
((lambda (mk-length)
   (mk-length
    (mk-length
     (mk-length eternity))))
 (lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+ 1 (length (cdr l))))))))

;; 等等，我第一次读的时候就在这里没有理解，其实这个函数一点也不简单
;; 函数mk-length接受一个函数Fa，然后apply这个函数, 参数是Fb， 返回了一个函数Fc
;; 接受的Fa，是一个函数，接受一个Fd为参数， 返回一个函数Fe, 好像越说越绕了。
;; 给length 换个名字， 看能不能更绕一点
;; 只是看起来蹊跷一些吗，mk-length apply mk-length, 看起来一个函数在执行它本身
((lambda (mk-length)
   (mk-length
    (mk-length
     (mk-length eternity))))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+ 1 (mk-length (cdr l))))))))


;; 让我们试着把mk-length 改写为 同时作为函数和参数的情况
;; 也就是把eternity 换为mk-length
;; 脑子在炸掉的边缘了。我在这里想了差不多20分钟。
;; length <= 1可以改写为下
((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+
              1
              ((mk-length eternity)
               (cdr l))))))))

;; 把eternity 换为mk-length，why？？？,这个问题我也差不多要爆炸了。
;; (mk-length mk-length) 和 （mk-length eternity)是等价的，都是一个eternity不会停止的函数。
(((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+
              1
              ((mk-length mk-length)
               (cdr l)))))))) (list 'a)) ;; -> 1

;; 再把（mk-length mk-length)抽象为length
((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   ((lambda (length)
      (lambda (l)
        (cond
          ((null? l) 0)
          (else (+ 1 (length (cdr l)))))))
    (mk-length mk-length))))

((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (+
              1
              ((lambda (x)
                 ((mk-length mk-length) x))
               (cdr l))))))))

;; 再把length 抽象出来
((lambda (le)
   ((lambda (mk-length)
      (mk-length mk-length)) (lambda (mk-length)
                               (le (lambda (x)
                                     ((mk-length mk-length) x))))))
 (lambda (length) (lambda (l)
                    (cond
                      ((null? l) 0)
                      (else (add1 (length (cdr l))))))))
   
;; 把length 前面的部分，用一种更简单的形式表示
(define Y
  (lambda (le)
    ((lambda (f) (f f))
     (lambda (f)
       (le (lambda (x) ((f f) x)))))))

