;gnu clisp 2.49

(setf state (list '(2 3 9) '(0 6 5) '(8 4 1)))
(print state)

(defun get-pos (a l &optional (pos 0))
    (cond
        ((null l) nil)
        ((eql a (car l)) pos)
        (t (get-pos a (cdr l) (+ 1 pos)))
    )
)
 
(defun get-coord (ls)
    (do 
        (
         (i 0 (+ i 1)) 
         (j ())
         (pos ())
        ) 
        ((numberp j) pos) 
        ((lambda(ls) (setf j (get-pos 0 (nth i ls))) (setf pos (list i j)) ) ls)
    )
)


(setf position (get-coord state))
(print position)

(defun direction (pos) 
    (let ((drc ()))
         (cond 
             ((equal '(0 0) pos)(setf drc '(up left)))
             ((equal '(0 1) pos)(setf drc '(up right left)))
             ((equal '(0 2) pos)(setf drc '(up right)))
             ((equal '(1 0) pos)(setf drc '(up down left)))
             ((equal '(1 1) pos)(setf drc '(up right down left)))
             ((equal '(1 2) pos)(setf drc '(up down left)))
             ((equal '(2 0) pos)(setf drc '(down left)))
             ((equal '(2 1) pos)(setf drc '(right down left)))
             ((equal '(2 2) pos)(setf drc '(right down)))
         )
         (progn drc)
    )
    
)

(setf direction (direction position))
(print direction)

;tmp is swapping element
;i and j are indexes

(defun up(st pos)
    (let ((i ()) (j ()) (tmp ()) (s ()))
         
        (setf s (copy-tree st))
        (setf i (first pos))
        (setf j (second pos))
         
        ;get upping element - tmp
        (setf tmp (nth j (nth (+ i 1) s)))
        (print tmp)
         
        ;swapping 0 and tmp
        (setf (nth j (nth i s)) tmp)
        (setf (nth j (nth (+ i 1) s)) 0)
        
        (progn s);to return new state
    )
)

(setf new-s-1(up state position))

(print "returned state")
(print new-s-1)
(print "basic state")
(print state)





