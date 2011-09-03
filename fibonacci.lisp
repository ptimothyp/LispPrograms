(defun fib  (n)
  (cond  ((= n 0) 0)
         ((= n 1) 1)
         (t (+ (fib (- n 1))
               (fib (- n 2))))))

(defun fib1 (n)
  (fib-iter 1 0 n))

(defun fib-iter (a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))