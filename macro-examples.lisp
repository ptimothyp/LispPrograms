(defun primep(number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime(number)
  (loop for n from number when (primep n) return n))

(defun macro-test-implement(number)
  (do ((p (next-prime 0) (next-prime (1+ p))))
      ((> p number))
    (format t "~d " p)))

(defun fibanacci(number)
  (do ((n 0  (1+ n))
       (cur 0 next)
       (next 1 (+ cur next)))
      ((= number n) cur)
    (print cur)))
    
(defmacro do-primes ((var start end) &body body)
  `(do ((,var (next-prime ,start)(next-prime (1+ ,var))))
    ((> ,var ,end))
    ,@body))