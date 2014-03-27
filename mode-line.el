(defun buffer-pos-percent()
  (interactive)
  (let ((max (count-lines (point-min) (point-max))) (pos (line-number-at-pos)))
    (if (and (eq pos 1) (eq (current-column) 0)) 0
      (setq percent (/ (* pos 100) max))
      (if (> percent 100) 100
	percent))))

(setq default-mode-line-format
      (list
       " "
       '(:eval (upcase (format "%s" buffer-file-coding-system)))
       '(:eval (if (> (length buffer-file-name) 0)
		   " | \"%f\" | "
		 " | "))
       '(:eval (format "%s" (buffer-pos-percent)))
       "%%"
       " ("
       "%l,%c) | "
       "["
       'mode-name
       '(:eval (when (not (eq rng-error-count nil))
		 (when (not (eq rng-error-count 0))
		   (format " Errors: %s" rng-error-count))))
       "]"
       " "))

(provide 'mode-line)