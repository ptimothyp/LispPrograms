(defun say-hello-with-print ()
  (print "Please type your name :")
  (let ((name (read)))
    (print "Nice to meet you, ")
    (print name)))

(defun say-hello ()
  (princ "Please type your name : ")
  (let ((name (read-line)))
    (princ "Nice to meet you, ")
    (princ name)))

(defun add-five ()
  (print "please enter
 a number:")
  (let ((num (read)))
        (print "When I add five I get")
        (print (+ num 5))))

(defun game-read ()
  (let ((cmd (read-from-string
              (concatenate 'string "(" (read-line) ")" ))))
    (flet ((quote-it (x)
             (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))
