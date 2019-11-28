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

(add-hook 'cider-mode-hook 'eldoc-mode)                      ; Per the github README's recommendation

(setq cider-repl-use-pretty-printing t)                                    ; Enable pretty printing in REPL by default
(setq cider-repl-print-length 100) ;; limit number of lines to print for a result...
;; (setq cider-repl-wrap-history t) ; To adjust the maximum number of items kept in the REPL history:
;; (setq cider-repl-history-size 1000) ; the default is 500
;; (setq cider-repl-history-file "~/.emacs.d/cider_history.txt") ; To store the REPL history in a file:



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
;; (setq cider-repl-pop-to-buffer-on-connect nil)
;; (setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-pop-to-buffer-on-connect 'display-only)


;; Use C-g to kill the cider error buffer
;; (add-hook 'cider-popup-buffer-mode-hook
;; 	  '(lambda ()
;; 	     (local-set-key "\C-g" 'cider-popup-buffer-quit)))

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

(defun my-cider-insert-defun-in-repl (&optional arg)
  "Does cider-insert-defun-in-repl, but ignores (comment ...) if that's the top-level"
  (interactive "P")
  (if (clojure-top-level-form-p "comment")
      (let ((my-initial-position (point))
	    (start-pos (condition-case nil ;; Swiped from clojure-mode.el's clojure-beginning-of-defun-function
			   (save-match-data
			     (let ((original-position (point))
				   clojure-comment-start clojure-comment-end)
			       (beginning-of-defun)
			       (setq clojure-comment-start (point))
			       (end-of-defun)
			       (setq clojure-comment-end (point))
			       (beginning-of-defun)
			       (forward-char 1) ;; skip paren so we start at comment
			       (clojure-forward-logical-sexp) ;; skip past the comment form itself
			       (if-let ((sexp-start (clojure-find-first (lambda (beg-pos)
									  (< beg-pos original-position))
									(clojure-sexp-starts-until-position
									 clojure-comment-end))))
				   sexp-start
				 (progn (goto-char sexp-start) t)
				 (beginning-of-defun n))))
			 (scan-error (beginning-of-defun n)))))
	(goto-char start-pos)
	(clojure-forward-logical-sexp) ;; skip past the comment form itself
	(let ((last-sexp-val (cider-last-sexp)))
	  (goto-char my-initial-position)
	  (cider-insert-in-repl last-sexp-val nil)))
    (cider-insert-defun-in-repl)))

;; Now make this my favorite key
(define-key cider-mode-map (kbd "C-c C-c") 'my-cider-insert-defun-in-repl)


;; (defun get-buffers-by-regex (regex)
;;   "Return list of buffers who's name matched the provided regex"
;;   (delq nil (mapcar (lambda (x) (if (string-match regex (buffer-name x))
;; 				    x))
;; 		    (buffer-list))))


;; Execute cider-jack-in, and when it's complete make the REPL buffer the current buffer
;; (defun my-cider-jack-in ()
;;   (interactive)
;;   (cider-jack-in)
;;   (sleep-for 3)
;;   (setq secs 3)
;;   (while (< secs 30)
;;     (let ((repl-buffer (car (get-buffers-by-regex "^*cider-repl "))))
;;       (if repl-buffer
;; 	  (progn
;; 	    (switch-to-buffer (buffer-name repl-buffer))
;; 	    (setq secs 3000))
;; 	(progn
;; 	  (sleep-for 1)
;; 	  (setq secs (1+ secs)))))))



;; (run-at-time 1 1 )

;; ------------

;; TODO: Loot more stuff from:
;;  - https://github.com/overtone/emacs-live/blob/master/packs/dev/clojure-pack/config/paredit-conf.el


(provide 'setup-clojure-mode)
