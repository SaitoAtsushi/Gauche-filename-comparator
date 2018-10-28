(define-library (filename-comparator)
  (export filename-comparator)
  (import (scheme base)
          (scheme char)
          (scheme hash-table)
          (srfi 114))
  (begin
    (define (read-integer port)
      (do ((ch (peek-char port) (peek-char port))
           (acc 0 (+ (* acc 10) (digit-value ch))))
          ((or (eof-object? ch) (not (char-numeric? ch))) acc)
        (read-char port)))

    (define lt -1)
    (define eq 0)
    (define gt 1)
    
    (define (filename-compare str1 str2)
      (let ((port1 (open-input-string str1))
            (port2 (open-input-string str2)))
        (let loop ((ch1 (peek-char port1))
                   (ch2 (peek-char port2)))
          (cond ((eof-object? ch1)
                 (if (eof-object? ch2) eq lt))
                ((eof-object? ch2)
                 gt)
                ((and (char-numeric? ch1) (char-numeric? ch2))
                 (let ((num1 (read-integer port1))
                       (num2 (read-integer port2)))
                   (if (= num1 num2)
                       (loop (peek-char port1) (peek-char port2))
                       (if (< num1 num2) lt gt))))
                ((char-ci=? ch1 ch2)
                 (read-char port1) (read-char port2)
                 (loop (peek-char port1) (peek-char port2)))
                (else
                 (if (char-ci<? ch1 ch2) lt gt))))))

    (define (filename=? x y) (eqv? (filename-compare x y) eq))

    (define filename-comparator
      (make-comparator string?
                       filename=?
                       filename-compare
                       string-hash))
    ))
