(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime(number)
  (loop for n from number when (primep n) return n))

(defun find-all-primes(start-range end-range)
  (loop for n from start-range to end-range 
        if (primep n) 
        do (print n)))

(defmacro do-primes ((var start end) &body body)
  `(do ((ending-value ,end)
        (,var (next-prime ,start) (next-prime (1+ ,var))))
    ((> ,var ,ending-value))
    ,@body))