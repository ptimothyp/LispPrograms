(defun test-+ ()
  (check 
    (= (+ 1 2) 3)
    (= (+ 1 2 3) 6)
    (= (+ -1 -5) -6)))

(defun report-result (result form)
  (format t "~:[FAIL~;pass~] .... ~a~%" result form)
  result)

(defmacro check(&body forms)
  `(combine-results
     ,@(loop for f in forms collect `(report-result ,f ',f))))

(defmacro combine-results (&body forms)
  (with-gensysms (result)
    `(let ((,result t))
       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))


(defun ping-unit-test-framework (text)
  (format t "~a~%" text))