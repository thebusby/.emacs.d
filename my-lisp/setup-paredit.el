(require 'paredit)
(require 'highlight-parentheses)
;; (require 'highlight-symbol)

;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ;
;;          ENABLE FOR VARIOUS MODES
;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ;

(add-hook 'clojure-mode-hook '(lambda ()
				(paredit-mode 1)
				(highlight-parentheses-mode)
				;; (highlight-symbol-mode)
				))

(add-hook 'cider-repl-mode-hook '(lambda ()
				   (paredit-mode 1)
				   (highlight-parentheses-mode)
				   ;; (highlight-symbol-mode)
				   ))

(add-hook 'emacs-lisp-mode-hook '(lambda ()
				   (paredit-mode 1)
				   (highlight-parentheses-mode)
				   ;; (highlight-symbol-mode)
				   ))


;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ;
;;          KEYBINDS FOR THIS MODE
;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ; ;; ;

;; ...


(provide 'setup-paredit)
