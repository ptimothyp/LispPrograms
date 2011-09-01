(defun loop-test ()
  ;; Loop to iterated arithematically
  (loop
   for i from 1 to 10 by 1
     do
       (format t "i : ~d~%" i) )
  (loop
     for i from 1 upto 10 by (* 2 2)
     do
       (format t "i : ~d~%" i))
  (loop
     for i from 20 downto 10
     do
       (format t "i : ~d~%" i))
  (let ((i 0))(loop
     repeat 10
     do
       (setq i (+ i 1))
                   (format t "~d) Hello world!! ~%" i)))

  (loop for i in (list 10 20 30 40)
     do
       (format t "Hello world ~d~%" i))
  (loop repeat 5
     for x = 0 then y
     for y = 1 then (+ x y)
       do
       (format t "~d, " y)))

(defun loop-accumulator-test ()
  (let ((random (loop repeat 100 collect (random 10000))))
    (loop for i in random
       counting (evenp i) into evens
       counting (oddp i) into odds
       summing i into total
       maximizing i into max
       minimizing i into min
       finally (return (list min max total evens odds)))))