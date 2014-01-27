;; ------------------------------------------------------------
;; Popwin, so you don't have to permanently split buffers...
(require 'popwin)
;; (popwin-mode t)
(setq display-buffer-function 'popwin:display-buffer)

(setq popwin:special-display-config
      '(("*Help*"  :height 30)
        ("*Completions*" :noselect t)
        ("*Messages*" :noselect t :height 30)
        ("*compilation*" :noselect t)
        ("*Backtrace*" :height 30)
        ("*Messages*" :height 30)
        ("*Occur*" :noselect t)
        ("*Ido Completions*" :noselect t :height 30)
        ("*magit-commit*" :noselect t :height 40 :width 80 :stick t)
        ("*magit-diff*" :noselect t :height 40 :width 80)
        ("*magit-edit-log*" :noselect t :height 15 :width 80)
        ("\\*ansi-term\\*.*" :regexp t :height 30)
        ("*shell*" :height 30)
        (".*overtone.log" :regexp t :height 30)
        ("*gists*" :height 30)
        ("*sldb.*":regexp t :height 30)
        ("*nrepl-error*" :height 30 :stick t)
        ("*nrepl-error*" :height 30 :stick t)
        ("*nrepl-doc*" :height 30 :stick t)
        ("*nrepl-src*" :height 30 :stick t)
        ("*nrepl-result*" :height 30 :stick t)
        ("*nrepl-macroexpansion*" :height 30 :stick t)
        ("*Kill Ring*" :height 30)
        ("*Compile-Log*" :height 30 :stick t)
        ("*git-gutter:diff*" :height 30 :stick t)))

;; (when (require 'popwin)
;;   (setq display-buffer-function 'popwin:display-buffer)
;;   (setq popwin:popup-window-height 0.4)
;;   (setq anything-samewindow nil)
;;   (push '("*anything*" :height 20) popwin:special-display-config)
;;   (push '(dired-mode :position top) popwin:special-display-config)
;;   ;; (push '("anything" :regexp t :height 0.5) popwin:special-display-config)
;;   ;; (push '("*anything*" :height 20) popwin:special-display-config)
;;   (push '("*magit-edit-log*" :height 0.5) popwin:special-display-config)
;;   (push '("*nrepl-doc*" :height 0.5 :stick t) popwin:special-display-config)
;;   (push '("*nrepl-src*" :height 0.5 :stick t) popwin:special-display-config)
;;   (push '("*nrepl-error*" :height 0.5 :stick t) popwin:special-display-config))

;; Override the nrepl code so that it uses popwin
;; (defun nrepl-popup-buffer-display (popup-buffer &optional select)
;;   "Display POPUP-BUFFER.
;;    If SELECT is non-nil, select the newly created window"
;;   (popwin:popup-buffer popup-buffer))

(provide 'setup-popwin)
