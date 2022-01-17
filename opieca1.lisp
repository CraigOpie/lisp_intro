#|  Name:       Craig Opie
    Assignment: 1
    Sources:    https://lisp-lang.org/learn/getting-started/
                https://linux.die.net/man/1/sbcl
                http://www.sbcl.org/manual/#Global-and-Always_002dBound-variables
                https://gigamonkeys.com/book/syntax-and-semantics.html
|#

; declare global constant with my name
(defvar +ID+ "Craig Opie")

; create a start point that asks the user to specify a number value
; this is missing a read from the user which throws off the way the program reads values which may
; result in incorrect behaivor.
(defun start-guess-number ()
  (format t "~%Pick a number between 1 and 100.~%")
  ; calls the function guess-number specifying the small = 1 and big = 101.
  (guess-number 1 101))

; guess the number using 'half-splitting' between the floor and roof - this value starts at 51.
(defun guess-number (small big)
  (format t "~%Is your number ~D? (answer YES, BIGGER, SMALLER, or EXIT): " 
    ; floor divides two values and returns the integer quotient truncated towards negative infinity
    ; + operator is used to add the small and big variables and then floor the value with 2 to get
    ; the lower bound average.
    (floor (+ small big) 2))
  ; gather input from the user to determine if the next function call needs to be lower or upper bound
  ; of the half-split value, or stop if the ansewr was correct, or exit if the user wants.
  (let ((ans (read)))
    (cond
      ; celebrate if the answer was correct
      ((eq ans 'YES) (format t "~%Yay, I got it!~%") t)
      ; call the guess-number function with the lower range if the answer is smaller
      ((eq ans 'SMALLER) (guess-number small (floor (+ small big) 2)))
      ; call the guess-number function with the higher range if the answer is bigger
      ((eq ans 'BIGGER) (guess-number (floor (+ small big) 2) big))
      ; exit if the user wants to exit
      ((eq ans 'EXIT) nil)
      ; call the guess number function with the same values if the response was unexpected
      (t (format t "I don't understand. Please try again.~%") (guess-number small big)))))

