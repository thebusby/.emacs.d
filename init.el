;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; In case you need to debug the config file...
; (setq debug-on-error t) ;; windmove complains :(

;; Set up load path
(setq my-lisp-dir
      (expand-file-name "my-lisp" user-emacs-directory))
(add-to-list 'load-path my-lisp-dir)
(setq my-lisp-dir
      (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path my-lisp-dir)

;; Do this early, to prevent horrible UI...
(require 'appearance)



;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; General Tweaks

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; For support abbeviations
; (setq-default abbrev-mode t)
; (cond ((file-exists-p "~/.abbrev_defs")
;        (read-abbrev-file "~/.abbrev_defs")))
; (setq save-abbrev t)



;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; Install packages
(require 'setup-package)

(defun init--install-packages ()
  (packages-install
   '(anything
;     auto-dim-other-buffers ;; Not available in mepla-stable :(
;     anything-config
;     anything-git
     cider
;     cider-trace
     clojure-mode
     company
     gh
     gist
     git-commit-mode
     git-rebase-mode
     guide-key
     highlight-parentheses
     highlight-symbol
     magit
     org
     paredit
     popwin
     xclip
     auto-dim-other-buffers
;     move-text
;     htmlize
;     visual-regexp
;     flycheck
;     flx
;     flx-ido
;     yasnippet
;     ido-vertical-mode
;     ido-at-point
;     simple-httpd
;     highlight-escape-sequences
;     whitespace-cleanup-mode
;     elisp-slime-nav
;     gitconfig-mode
;     gitignore-mode
;     prodigy
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


;; Enable my preferred defaults
(require 'my-defaults)


;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Enable auto-dim-other-buffers-mode by default
(add-hook 'after-init-hook (lambda ()
			     (when (fboundp 'auto-dim-other-buffers-mode)
			       (auto-dim-other-buffers-mode t))))

;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; Setup extensions
; (eval-after-load 'ido   '(require 'setup-ido))
(eval-after-load 'org   '(require 'setup-org))
; (eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
; (eval-after-load 'grep  '(require 'setup-rgrep))
; (eval-after-load 'shell '(require 'setup-shell))
(require 'setup-paredit)
(require 'setup-popwin)
(require 'setup-mutt)
(require 'setup-anything)

;; Setup language/tool specific extensions
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
; (eval-after-load 'ruby-mode    '(require 'setup-ruby-mode))


;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; Highlight parenthesis mode
(require 'highlight-parentheses)
(setq hl-paren-colors
      '("red1" "yellow1" "green1" "blue1" "magenta1" "purple1"))


;; Visual regexp
; (require 'visual-regexp)
; (define-key global-map (kbd "M-&") 'vr/query-replace)
; (define-key global-map (kbd "M-/") 'vr/replace)



;; ------------------------------------------------------------
;; Setup hide-show mode
(load-library "hideshow")
(defun enable-hs-mode ()  (progn (hs-minor-mode 1)
				 (setq hs-isearch-open t)

				 ;; with point inside the block, use these keys to hide/show
				 (local-set-key "\C-c<"  'hs-hide-block)
				 (local-set-key "\C-c>"  'hs-show-block)))

;; ------------------------------------------------------------
;; Enable find-on-github mode
(require 'find-on-github)


;; ------------------------------------------------------------
;; Enable minor-modes for clojure-mode, and setup Clojurescript
(add-to-list 'auto-mode-alist        '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist        '("\\.edn$"  . clojure-mode))


;; ------------------------------------------------------------
;; Enable company-mode in all buffer
(add-hook 'after-init-hook 'global-company-mode)


;; Setup my key bindings
(require 'key-bindings)
