Opened 2024-05-27



# Emacs REPL == ielm

To open the REPL: M-x ielm
[Sample usage]

ELISP> (* 33.07 -555.0111)
-18354.21707

# Simple function

EXAMPLE1
(defun add_nums (a b) (+ a b))

(add_nums 44 33)
> 77


EXAMPLE2
(defun meaningoflife(ans)
    (message "The meaning of life is %d" ans)

(meaningoflife 42)

> "The meaning of life is 42)

