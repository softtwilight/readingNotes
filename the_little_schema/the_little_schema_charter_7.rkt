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

(set? (list 'a 3 (list 'a 'b 'a) 3))

;; 去重
(define (makeset lat)
  (cond ((null? lat) '())
        ((member? (car lat) (cdr lat))
         (makeset (cdr lat)))
        (else (cons (car lat)
                    (makeset (cdr lat))))))
(makeset (list 'a '() 'd 'a))

;; 判断是否是子集
(define (subset? s1 s2)
  (cond ((null? s1) #t)
        (else (and (member? (car s1) s2)
                   (subset? (cdr s1) s2)))))

;; 是否相等
(define (eqset? s1 s2)
  (and (subset? s1 s2)
       (subset? s2 s1)))

;; 交集判断
(define (intersect? s1 s2)
  (cond ((null? s1) #f)
        (or (member? (car s1) s2)
            (intersect? (cdr s1) s2))))
;; 交集
(define (intersect s1 s2)
  (cond ((null? s1) '())
        ((member? (car s1) s2)
         (cons (car s1) (intersect (cdr s1) s2)))
        (else (intersect (cdr s1) s2))))
;; 并集
(define (union s1 s2)
  (cond ((null? s1) s2)
        ((member? (car s1) s2)
         (union (cdr s1) s2))
        (else (cons (car s1)
                    (union (cdr s1) s2)))))
;; 多个set的并集
(define (intersectall lat)
  (cond ((null? (cdr lat)) (car lat))
        (else (intersect (car lat)
                         (intersectall (cdr lat))))))
;; 取pairset的第一个
(define (firsts lat)
  (cond ((null? lat) '())
        (else (cons (car (car lat))
                    (firsts (cdr lat))))))

(define (fun? rel)
  (set? (firsts rel)))

;; 交换fun的子元素顺序
;; 可读性非常差，用一个revpair方法怎样？
(define (revrel lat)
  (cond ((null? lat) '())
        (else (cons (cons (car (cdr (car rel)))
                          (cons 
                           (car (car rel))
                           '()))
                    (revrel (cdr rel))))))

