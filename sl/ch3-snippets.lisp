(defun factorial (x)
  (if (eql x 0)
      1
      (* x (factorial (- x 1)))))