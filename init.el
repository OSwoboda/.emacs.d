;; Start shell
(shell)

;; Set load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/macros")
(add-to-list 'load-path "~/.emacs.d/packages")

;; Load external packages
(require 'mode-line)

;; Load external configs
(load "customization")
(load "keymap")
(load "filemap")

;; Load macros
;; (load "emacs-postkonv")
(load "recounts")
;; (load "set-insert")
;; (load "ncx-to-toc")
;; (load "validate")
;; (load "quotes")
;; (load "allmak")
;; (load "normen-em235.el")
;; (load "validator")
(load "~/stuff.el")

(load "theme")

;; Disbale Messages Buffer
(kill-buffer "*Messages*")