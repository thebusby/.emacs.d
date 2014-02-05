(require 'clojure-mode)

;; (defadvice clojure-test-run-tests (before save-first activate)
;;   (save-buffer))

;; (defadvice nrepl-load-current-buffer (before save-first activate)
;;   (save-buffer))

;; (require 'clj-refactor)

;; (cljr-add-keybindings-with-modifier "C-s-")
;; (define-key clj-refactor-map (kbd "C-x C-r") 'cljr-rename-file)

;; (add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))

;; (define-key clojure-mode-map (kbd "C->") 'cljr-thread)
;; (define-key clojure-mode-map (kbd "C-<") 'cljr-unwind)

;; (define-key clojure-mode-map (kbd "s-j") 'clj-jump-to-other-file)

;; (define-key clojure-mode-map (kbd "C-.") 'clj-hippie-expand-no-case-fold)

;; (defun clj-hippie-expand-no-case-fold ()
;;   (interactive)
;;   (let ((old-syntax (char-to-string (char-syntax ?/))))
;;     (modify-syntax-entry ?/ " ")
;;     (hippie-expand-no-case-fold)
;;     (modify-syntax-entry ?/ old-syntax)))


;; Misc old NREPL commands
; (setq nrepl-popup-stacktraces-in-repl t)
; (setq nrepl-use-pretty-printing t) ; Use pretty printing for output by default
; (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)          ; Enable eldoc - shows fn argument list in echo area
; (add-hook 'nrepl-mode-hook 'paredit-mode)                                  ; Use paredit in *nrepl* buffer


(require 'cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)                      ; Per the github README's recommendation
(add-hook 'cider-mode-hook 'paredit-mode)                                  ; Use paredit in cider buffer
;; (setq cider-repl-print-length 100) ;; limit number of lines to print for a result...
;; (setq cider-repl-wrap-history t) ; To adjust the maximum number of items kept in the REPL history:
;; (setq cider-repl-history-size 1000) ; the default is 500 
;; (setq cider-repl-history-file "~/.emacs.d/cider_history.txt") ; To store the REPL history in a file:
;; (setq cider-toggle-pretty-printing t) ; Use pretty printing for output by default (Doesn't seem to work)
(custom-set-variables '(cider-toggle-pretty-printing t)) ; Will this work?


;; (define-key cider-repl-mode-map (kbd "<home>") nil)
;; (define-key cider-repl-mode-map (kbd "C-,") 'complete-symbol)
;; (define-key cider-mode-map (kbd "C-,") 'complete-symbol)
;; (define-key cider-mode-map (kbd "C-c C-q") 'nrepl-close)
;; (define-key cider-mode-map (kbd "C-c C-Q") 'cider-quit)

;; ;; Indent and highlight more commands
;; (put-clojure-indent 'match 'defun)

;; ;; Hide nrepl buffers when switching buffers (switch to by prefixing with space)
;; (setq nrepl-hide-special-buffers t)

;; Enable error buffer popping also in the REPL:
(setq cider-repl-popup-stacktraces t)

;; Specify history file
(setq cider-history-file "~/.emacs.d/nrepl-history")

;; auto-select the error buffer when it's displayed
(setq cider-auto-select-error-buffer t)

;; Prevent the auto-display of the REPL buffer in a separate window after connection is established
(setq cider-repl-pop-to-buffer-on-connect nil)



;; Cycle between () {} []

;; (defun live-delete-and-extract-sexp ()
;;   "Delete the sexp and return it."
;;   (interactive)
;;   (let* ((begin (point)))
;;     (forward-sexp)
;;     (let* ((result (buffer-substring-no-properties begin (point))))
;;       (delete-region begin (point))
;;       result)))

;; (defun live-cycle-clj-coll ()
;;   "convert the coll at (point) from (x) -> {x} -> [x] -> (x) recur"
;;   (interactive)
;;   (let* ((original-point (point)))
;;     (while (and (> (point) 1)
;; 		(not (equal "(" (buffer-substring-no-properties (point) (+ 1 (point)))))
;; 		(not (equal "{" (buffer-substring-no-properties (point) (+ 1 (point)))))
;; 		(not (equal "[" (buffer-substring-no-properties (point) (+ 1 (point))))))
;;       (backward-char))
;;     (cond
;;      ((equal "(" (buffer-substring-no-properties (point) (+ 1 (point))))
;;       (insert "{" (substring (live-delete-and-extract-sexp) 1 -1) "}"))
;;      ((equal "{" (buffer-substring-no-properties (point) (+ 1 (point))))
;;       (insert "[" (substring (live-delete-and-extract-sexp) 1 -1) "]"))
;;      ((equal "[" (buffer-substring-no-properties (point) (+ 1 (point))))
;;       (insert "(" (substring (live-delete-and-extract-sexp) 1 -1) ")"))
;;      ((equal 1 (point))
;;       (message "beginning of file reached, this was probably a mistake.")))
;;     (goto-char original-point)))

;; (define-key clojure-mode-map (kbd "C-´") 'live-cycle-clj-coll)

;; Warn about missing nREPL instead of doing stupid things

(defun nrepl-warn-when-not-connected ()
  (interactive)
  (message "Oops! You're not connected to an nREPL server. Please run M-x cji, M-x cider, or M-x cider-jack-in to connect."))

(define-key clojure-mode-map (kbd "C-x C-e") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-k") 'nrepl-warn-when-not-connected)
;; (define-key clojure-mode-map (kbd "C-M-x")   'nrepl-warn-when-not-connected)
;; (define-key clojure-mode-map (kbd "C-c C-e") 'nrepl-warn-when-not-connected)
;; (define-key clojure-mode-map (kbd "C-c C-l") 'nrepl-warn-when-not-connected)
;; (define-key clojure-mode-map (kbd "C-c C-r") 'nrepl-warn-when-not-connected)
;; (define-key clojure-mode-map (kbd "C-c C-z") 'nrepl-warn-when-not-connected)
;; (define-key clojure-mode-map (kbd "C-c C-n") 'nrepl-warn-when-not-connected)


;; ------------

;; TODO: Loot more stuff from:
;;  - https://github.com/overtone/emacs-live/blob/master/packs/dev/clojure-pack/config/paredit-conf.el


(provide 'setup-clojure-mode)
