(defun foo ()
  #+allegro (output-message "allegro")
  #+sbcl (output-message "sbcl")
  #+clisp (output-message "clisp")
  #+cmu (output-message "cmu")
  #-(or allegro sbcl clisp cmu) (error "Not implemented"))


(defun output-message (message)
  (defvar message-format nil)
  (setf message-format "This is a hello from ~a ~%")
  (format t message-format message))

(defun component-present-p (value)
  (and value (not (eql value :unspecific))))

