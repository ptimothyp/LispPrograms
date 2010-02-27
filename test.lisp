(defun hello-world() 
  "This says hello world" 
  (format t "hello, world"))

(defun foo(a b &optional (c 10 c-p) &rest values)
  (list a b c  c-p values))
;  (dolist (value values)
;    (format t "value : ~a" value)))

(defun foorest(&rest values)
  (dolist (value values)
    (format t "value : ~a" value)))
    

(defun plot (fn min max step)
  (loop for i from min to max by step do
       (loop repeat (funcall fn i) do (format t "*"))
       (format t "~%")))

(defun primep(number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime(number)
  (loop for n from number when (primep n) return n))

(defun list-primes(end-range)
  (do ((p (next-prime 0) (next-prime (1+ p))))
      ((> p 19))
    (format t "~d " p)))

(defun do-test()
  (do ((n 0 (1+ n))
       (cur 0 next)
       (next 1 (+ cur next)))
       ((= 10 n) cur)))