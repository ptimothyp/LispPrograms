(defun factorial (number)
  (if (eql number 0)
      1
      (* number (factorial (- number 1)))))

(defun test ()
  (setf hello "hello world")
  (format t "~a~%" hello))


(defun foo ()
  #+allegro (do-one-thing)
  #+sbcl (do-another-thing)
  #+clisp (something-else)
  #+cmu (yet-another-version)
  #-(or allegro sbcl clisp cmu) (error "Not implemented"))
  

(defun test ()
	(format t "Hello world"))


