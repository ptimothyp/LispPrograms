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

(defun directory-pathname-p  (p)
  (and
   (not (component-present-p (pathname-name p)))
   (not (component-present-p (pathname-type p)))
   p))

(defun pathname-as-directory (name)
  (let ((pathname (pathname name)))
    (when (wild-pathname-p pathname)
      (error "Can't reliably convert wild pathnames."))
    (if (not (directory-pathname-p name))
      (make-pathname
       :directory (append (or (pathname-directory pathname) (list :relative))
                          (list (file-namestring pathname)))
       :name      nil
       :type      nil
       :defaults pathname)
      pathname)))

(defun directory-wildcard (dirname)
  (make-pathname
   :name :wild
   :type #-clisp :wild #+clisp nil
   :defaults (pathname-as-directory dirname)))

