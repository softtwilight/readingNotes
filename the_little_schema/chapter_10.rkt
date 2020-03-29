#lang sicp

;实现map
(define helper
  (lambda (name names values entry-f)
    (cond ((null? names) (entry-f name))
          ((eq? name (car names)) (car values))
          (else
           (helper name (cdr names) (cdr values) entry-f)))))

(define first car)
(define second cadr)
(define lookup-in-entry
  (lambda (name entry entry-f)
    (helper name
            (first entry)
            (second entry)
            entry-f)))


(define lookup-in-table
  (lambda (name table table-f)
    (cond ((null? table) (table-f name))
          (else
           (lookup-in-entry
            name
            (car table)
            (lambda (name)
              (lookup-in-table name
                               (cdr table)
                               table-f)))))))

                