(defun factorial (number)
  (if (eql number 0)
      1
      (* number (factorial (- number 1)))))