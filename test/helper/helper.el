(defun test/skip-chars-backward= ()
  (interactive)
  (skip-chars-backward "[[:alpha:]]"))

(defun test/look-test ()
  (interactive)
  (cond ((looking-at "[[:alnum:]]")
         (message "looking at an alpha"))
        (t (message "did not work"))))

(defun test/print-point ()
  (interactive)
  (princ (point)))

(defun test/is_upper ()
  (interactive)
  (let ((case-fold-search nil))
    (cond ((looking-at "[[:upper:]]")
           (save-excursion
             (forward-char)
             (insert "_")))
          (t
           (message "it is NOT upper")))))

(defun test/bounds ()
  (interactive)
  (princ (bounds-of-thing-at-point 'WORD)))

;; A_B_cd