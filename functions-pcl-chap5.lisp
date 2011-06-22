(defun verbose-sum (x y)
  "Sum any two numbers after printing a message"
  (format t "Summing ~d and ~d.~%" x y)
  (+ x y))

(defun optional-arguments (a b &optional (c 5 c-supplied-p) (d a)) (list a b c d c-p))

(defun plot (fn min max step)
  (loop for i from min to max by step do
       (loop repeat (funcall fn i) do (format t "*"))
       (format t "~%")))
       
	    