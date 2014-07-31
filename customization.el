;;; ~/.emacs.d/customization.el

;; Global Variables
(custom-set-variables
 '(auto-save-default nil)			; no automatic save of files
 '(case-fold-search nil)			; stop searching when reached EOF
 '(column-number-mode t)			; show column number in status bar
 '(font-lock-maximum-size nil)
 '(global-font-lock-mode t nil (font-lock))	; enable global syntax highlighting
 '(global-linum-mode t)				; show line numbers on the left side
 '(gnus-inhibit-startup-message t)		; inhibit the startup message in gnu emacs
 '(history-delete-duplicates t)
 '(initial-scratch-buffer nil)                  ; inhibit the initial scratch buffer
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)			; inhibit the startup screen in emacs
 '(indent-tabs-mode nil)			; use space instead of tabs
 '(initial-scratch-message nil)			; dont show the initial scratch message
 '(line-number-display-limit nil)
 '(make-backup-files nil)			; dont create backup files (file.ext~)
 '(menu-bar-mode nil nil (menu-bar))		; dissable the menu bar
 '(message-log-max nil)
 '(minibuffer-electric-default-mode t)
 '(resize-mini-windows t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)				; dissable the scroll bar
 '(show-paren-mode t nil (paren))		; highlight parens that belong together
 '(split-height-threshold 0)
 '(split-width-threshold 100)
 '(tool-bar-mode nil nil (tool-bar))		; disable tool bar
 '(transient-mark-mode t)			; highlight marked text
 '(visible-bell t)				; dissable sound bell
 '(x-stretch-cursor t)				; highlight tabs as whole
 '(x-select-enable-clipboard t)
 )

;; Activate narrowing
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(set-process-query-on-exit-flag (get-process "shell") nil)

(fset 'yes-or-no-p 'y-or-n-p)

(defun indentation()
  (interactive)
  (let ((initial-mode major-mode))
    (if (not (use-region-p))
	(indent-according-to-mode)
      (sgml-mode)
      (indent-region (region-beginning) (region-end))
      (funcall initial-mode))))

(defun rng-find-error()
  (interactive)
  (when (eq (rng-previous-error 1) nil)
    (rng-next-error 1)))

(defun validate()
  (interactive)
  (sgml-validate (concat "onsgmls -w xml -s -E30000 -f /home/oswoboda/temp.txt -D /home/journal/Journal-base/lib/xml/ " (buffer-name) " ; grep -v 'non SGML character\\|Nicht-SGML-Zeichen' /home/oswoboda/temp.txt")))

(defun html-local-keymap()
  (local-set-key (kbd "\C-c\C-v") 'validate)
  (local-set-key (kbd "\C-c\C-n") 'rng-find-error)
  (local-set-key (kbd "C-c v") 'rng-validate-mode)
  (local-set-key (kbd "TAB") 'indentation)
  (setq line-number-display-limit nil)
  (setq paragraph-start "\f\\|[ 	]*$")
  (setq paragraph-seperate "[ 	\f]*$")
  (rng-validate-mode)
  )

(add-hook 'html-mode-hook 'html-local-keymap)
