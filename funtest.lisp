(defun for-loop-test ()
  (loop for i from 1 to 10 by 1 do
        (format t "~a. Hello ~%" i)))

(defun repeat-loop-test()
  (loop repeat 10 do (format t "Hello ~%")))

(defun dotimes-loop-test()
  (dotimes (x 10) (format t "~d. Hello~%" (+ x 1))))

(defun let-test()
  (let* ((x 10)
        (y (+ x 10)))
    (format t "~a. Hello ~a~%" x y)))
