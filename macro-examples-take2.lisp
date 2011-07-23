(defun primep (number)
    (when (> number 1)
      (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))
