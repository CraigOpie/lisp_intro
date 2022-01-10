;;; This a comment

(defun start-guess-number ()
  (format t "~%Pick a number between 1 and 100.~%")
  (guess-number 1 101))

(defun guess-number (small big)
  (format t "~%Is your number ~D? (answer YES, BIGGER, SMALLER, or EXIT): " 
    (floor (+ small big) 2))
  (let ((ans (read)))
    (cond
     ((eq ans 'YES) (format t "~%Yay, I got it!~%") t)
     ((eq ans 'SMALLER) (guess-number small (floor (+ small big) 2)))
     ((eq ans 'BIGGER) (guess-number (floor (+ small big) 2) big))
     ((eq ans 'EXIT) nil)
     (t (format t "I don't understand. Please try again.~%") (guess-number small big)))))