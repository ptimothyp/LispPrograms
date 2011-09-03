(defun sqrt (x)
  (defun good-enough? (guess x)
    (< (abs (- (square guess) x)) 0.001))

  (defun average (x y)
    (/ (+ x y) 2))
  
  (defun improve (guess x)
    (average guess (/ x guess)))

  (defun sqrt-iter (guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

  (sqrt-iter 1.0 x))