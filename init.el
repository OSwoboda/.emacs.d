;; Start shell
(shell)

;; Set load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/macros")
(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'load-path "~/normen/normen")

;; Load external packages
(require 'mode-line)

(setq nxml-mode-file "/home/raster/.emacs.d/modes/nxml-mode.el")
(load nxml-mode-file)
(eval-after-load 'rng-loc
  '(add-to-list 'rng-schema-locating-files "~/.schema/schemas.xml"))

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
;; (load "validator")
(load "~/stuff.el")
(load "allmak")
(load "hub-makros")
(load "tr3000-makros")

(load "theme")

;; Disbale Messages Buffer
(kill-buffer "*Messages*")
