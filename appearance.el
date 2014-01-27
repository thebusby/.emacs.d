;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; Disable tool and menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)

;; Misc
(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
;  (blink-cursor-mode -1)
  )

;; Some crazy experiment
; (lambda ()
;   (push '("<=" . ?≤) prettify-symbols-alist)
;   (push '("fn" . 955) prettify-symbols-alist)
;   (push '("defn" . "defλ") prettify-symbols-alist)
;   )

;; ;; Unclutter the modeline
;; (require 'diminish)
;; (eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
;; (eval-after-load "eldoc" '(diminish 'eldoc-mode))
;; (eval-after-load "paredit" '(diminish 'paredit-mode))
;; (eval-after-load "tagedit" '(diminish 'tagedit-mode))
;; (eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
;; (eval-after-load "skewer-mode" '(diminish 'skewer-mode))
;; (eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
;; (eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
;; (eval-after-load "smartparens" '(diminish 'smartparens-mode))
;; (eval-after-load "guide-key" '(diminish 'guide-key-mode))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
	(setq mode-name ,new-name))))

(rename-modeline "clojure-mode" clojure-mode "Clj")

(provide 'appearance)
