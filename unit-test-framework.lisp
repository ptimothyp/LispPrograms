(defvar *test-name* nil)

(defun report-result (result form)
  (format t "~:[FAIL~;pass~] .... ~a: ~a~%" result *test-name* form)
  result)

(defmacro combine-results (&body forms)
  (with-gensyms (result)
    `(let ((,result t))
      ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
      ,result)))

(defmacro check(&body forms)
  `(combine-results
    ,@(loop for f in forms collect `(report-result ,f ',f))))


(defmacro deftest (name parameters &body body)
  `(defun ,name , parameters
    (let ((*test-name* ',name))
      ,@body)))


(defun test-+ ()
  (check 
   (= (+ 1 2) 3)
   (= (+ 1 2 3) 6)
   (= (+ -1 -5) -6)))


(defun ping-unit-test-framework (text)
  (format t "~a~%" text))