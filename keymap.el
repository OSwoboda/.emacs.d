; Unset accidentally close through Ctrl+X Ctrl+C
(global-set-key (kbd "\C-x\C-c") 'nil)

; F-Keys
(global-set-key (kbd "<f1>") 'nil)
(global-set-key (kbd "<f2>") 'undo)
(global-set-key (kbd "<f3>") 'find-file)
(global-set-key (kbd "<f4>") 'nil)
(global-set-key (kbd "<f5>") 'nil)
(global-set-key (kbd "<f6>") 'nil)
(global-set-key (kbd "<f7>") 'save-buffer)
(global-set-key (kbd "<f8>") 'sgml-mark-element)
(global-set-key (kbd "<f9>") 'nil)
(global-set-key (kbd "<f10>") 'font-lock-mode)
(global-set-key (kbd "<f11>") 'font-lock-fontify-buffer)
(global-set-key (kbd "<f12>") 'kill-this-buffer)

(global-set-key (kbd "<M-f11>") 'uncomment-region)
(global-set-key (kbd "<S-f11>") 'comment-region)

; Buffer Control 
(global-set-key (kbd "<M-home>") 'previous-buffer)
(global-set-key (kbd "<M-end>") 'next-buffer)
(global-set-key (kbd "<S-tab>") 'bury-buffer)
(global-set-key (kbd "<C-tab>") 'other-window)
(define-key minibuffer-local-map [C-tab] 'other-window)

; Movement
(global-set-key (kbd "\C-a") 'beginning-of-line-text)
(global-set-key (kbd "<C-up>") '(lambda () (interactive) (previous-line) (previous-line) (previous-line) (previous-line) (previous-line)))
(global-set-key (kbd "<C-down>") '(lambda () (interactive) (next-line) (next-line) (next-line) (next-line) (next-line)))
(global-set-key "\M-g" 'goto-line) ; kbd only reacts on second input, dunno why...

; Workflow
(global-set-key (kbd "<s-SPC>") 'non-breaking-space)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "\C-k") 'kill-and-join-forward)
(global-set-key (kbd "\C-c\C-r") 'sgml-tag-region)
(global-set-key (kbd "C-y") 'better-yank)

(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
    (kill-line arg)))

(defun better-yank(&optional arg)
  (interactive "P")
  (if (not (use-region-p))
      (yank arg)
    (if delete-selection-mode
	(progn
	  (delete-region (region-beginning) (region-end))
	  (yank arg)
	  )
      (kill-region (region-beginning) (region-end))
      (if arg
	  (yank (1+ arg))
	(yank 2)
	)
      )
    )
  )
