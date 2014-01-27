;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; In case you need to debug the config file...
(setq debug-on-error t)

;; ;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; ;; Disable mouse interface per https://github.com/magnars/.emacs.d/blob/master/init.el
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; ;; No splash screen
;; (setq inhibit-startup-message t)



;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; General Tweaks
(setq initial-scratch-message nil) ; *scratch* starts empty
(fset 'yes-or-no-p 'y-or-n-p) ; Prompt is y/n not yes/no


;; ------------------------------------------------------------
;; Package management support
(require 'package)
(package-initialize)

;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; MELPA
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/"))

;; ------------------------------------------------------------
;; For non-ELPA packages
;; (let ((default-directory "~/.emacs.d/lisp"))
;;    (normal-top-level-add-subdirs-to-load-path))

;; Some crazy experiment
;; (lambda ()
;;   (push '("<=" . ?≤) prettify-symbols-alist)
;;   (push '("fn" . 955) prettify-symbols-alist)
;;   (push '("defn" . "defλ") prettify-symbols-alist)
;;   )




;; ------------------------------------------------------------
;; Unicode support
(setq local-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; ------------------------------------------------------------
;; Enable support for recently opened files
(recentf-mode)

;; ------------------------------------------------------------
;; Enable some misc. preferences
(setq-default show-trailing-whitespace t)
(setq column-number-mode t)

;; ------------------------------------------------------------
;; Save all backup files to the same location... (So nice)
(setq backup-directory-alist
      '(("." . "~/.emacs_backups")))

;; ------------------------------------------------------------
;; Disable tool and menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))

;; ------------------------------------------------------------
;; Mutt support
;; (autoload 'post-mode "post" "mode for e-mail" t)
;; (add-to-list 'auto-mode-alist
;;              '("\\.*mutt-*\\|.article\\|\\.followup"
;;                 . post-mode))
;; ;; This will automatically load post-mode when editing a message from mutt (and for some other programs). You might also want to set up some other things when editing mails, using a hook:
;; (add-hook 'post-mode-hook
;;   (lambda()
;;     (auto-fill-mode t)
;;     (setq fill-column 72)    ; rfc 1855 for usenet messages
;;     (require 'footnote-mode)
;;     (footmode-mode t)
;;     (require 'boxquote)))

;; ------------------------------------------------------------
;; Enable Org mode
;; (require 'org-install)
;; (setq org-agenda-files (list "/home/abusby/org/work.org" "/home/abusby/org/jun.org"))
;; (setq org-todo-keywords '((sequence "TODO" "PENDING" "DONE")))
;; (setq org-directory "~/org")
;; (setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; (setq org-mobile-directory "~/Dropbox/MobileOrg")

;; ------------------------------------------------------------
;; Enable winner-mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; ------------------------------------------------------------
;; Highlight parenthesis mode
(require 'highlight-parentheses)
(setq hl-paren-colors
      '("red1" "yellow1" "green1" "blue1" "magenta1" "purple1"))

;; ------------------------------------------------------------
;; Setup hide-show mode
(load-library "hideshow")
(defun enable-hs-mode ()  (progn (hs-minor-mode 1)
				 (setq hs-isearch-open t)

				 ;; with point inside the block, use these keys to hide/show
				 (local-set-key "\C-c<"  'hs-hide-block)
				 (local-set-key "\C-c>"  'hs-show-block)))

;; ------------------------------------------------------------
;; Enable minor-modes for clojure-mode, and setup Clojurescript
(add-to-list 'auto-mode-alist        '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist        '("\\.edn$"  . clojure-mode))
(add-hook 'clojure-mode-hook '(lambda ()
				(require 'nrepl) ;; Trying this...
				(paredit-mode 1)
;;				(push '("fn" . "λ") prettify-symbols-alist)
;;				(prettify-symbols-mode)
				(highlight-parentheses-mode)
				(highlight-symbol-mode)
				(enable-hs-mode)))

(add-hook 'c-mode-hook 'enable-hs-mode)

(add-hook 'slime-repl-mode-hook '(lambda ()
				   (paredit-mode 1)
				   (highlight-parentheses-mode)
				   (highlight-symbol-mode)
				   (enable-hs-mode)))

;; ------------------------------------------------------------
;; Used for saving place in files
(setq save-place-file "~/.emacs-places")
(setq-default save-place t)

;; ------------------------------------------------------------
;; For support abbeviations
(setq-default abbrev-mode t)
(cond ((file-exists-p "~/.abbrev_defs")
       (read-abbrev-file "~/.abbrev_defs")))
(setq save-abbrev t)

;; ------------------------------------------------------------
;; Add extra key bindings
;;
(global-set-key "\C-x\C-m"    'execute-extended-command)
(global-set-key "\C-c\C-m"    'execute-extended-command)
(global-set-key "\M-g"        'goto-line)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key "\M-w"        'backward-kill-word)
(global-set-key (kbd "C-c c") 'comment-dwim)
;; (global-set-key [S-right]     'other-window)
;; (global-set-key [S-left]      'other-window)
;; (setq x-alt-keysym 'meta)
;; (global-set-key "\C-x\C-k" 'kill-region)
;; (global-set-key "\C-c\C-k" 'kill-region)

;; Make window control shortcuts easier to use
;;
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M--") 'balance-windows)
(global-set-key (kbd "M-+") 'enlarge-window)

;; For jumping between windows
(windmove-default-keybindings) ;; Shift+direction

;; For supporting emacs in screen sessions
(global-set-key (kbd "M-[ a") 'windmove-up)
(global-set-key (kbd "M-[ b") 'windmove-down)
(global-set-key (kbd "M-[ c") 'windmove-right)
(global-set-key (kbd "M-[ d") 'windmove-left)

;; Add zap-up-to-char
;; and bind it to C-n
;;
(defun zap-up-to-char (arg char)
  "Kill up to, but not including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found.
Ignores CHAR at point."
  (interactive "p\ncZap up to char: ")
  (let ((direction (if (>= arg 0) 1 -1)))
    (kill-region (point)
                 (progn
                   (forward-char direction)
                   (unwind-protect
                       (search-forward (char-to-string char) nil nil arg)
                     (backward-char direction))
                   (point)))))

(global-set-key (kbd "C-n") 'zap-up-to-char)

;; ------------------------------------------------------------
;; Command aliases because I'm a lazy typist...
(defalias 'qr  'query-replace)
(defalias 'qrr 'query-replace-regexp)
(defalias 'cm  'comment-or-uncomment-region)
(defalias 'mc  'comment-or-uncomment-region)
(defalias 'cb  'comment-box)
(defalias 'nt  'indent-region)
(defalias 'sm  'start-kbd-macro)
(defalias 'ms  'end-kbd-macro)
(defalias 'lml 'list-matching-lines)
(defalias 'gf  'grep-find)
(defalias 'dt  'delete-trailing-whitespace)
(defalias 'sh  'shell)
(defalias 'ss  'flyspell-mode)
;; (defalias 'sc  'slime-connect)
;; (defalias 'sd  'slime-disconnect)
;; (defalias 'cji 'clojure-jack-in)
;; (defalias 'cji 'nrepl-ritz-jack-in)
;; (defalias 'cji 'nrepl-jack-in)
(defalias 'cji 'cider-jack-in)
(defalias 'vtt 'visit-tags-table)
(defalias 'rof 'recentf-open-files)
;; (defalias 'sro 'sr-speedbar-toggle)
(defalias 'gr 'gist-region-private)
(defalias 'git 'magit-status)

;; ------------------------------------------------------------
;; Enable NREPL-RITZ support
;; (when (not package-archive-contents)
;;   (package-refresh-contents))
;; (defvar my-packages '(clojure-mode
;;                       nrepl
;;                       nrepl-ritz))
;; (dolist (p my-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))

;; Manually require this as we're using the Alan modified version to support popwin
;; (require 'clojure-mode)
;; (require 'nrepl)

;; nREPL customizations
;; (setq nrepl-popup-stacktraces nil)                                         ; Don't aggresively popup stacktraces
(setq nrepl-popup-stacktraces-in-repl t)                                   ; except when it's in the repl...
;; (setq nrepl-popup-on-error nil) ;; NEVER pop up a stack trace...
;; (setq nrepl-hide-special-buffers t) ; Don't list buffers that I don't care about
(setq nrepl-use-pretty-printing t) ; Use pretty printing for output by default

;; (add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
;; (defun my-nrepl-mode-setup ()
;;   (require 'nrepl-ritz))

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)          ; Enable eldoc - shows fn argument list in echo area
(add-hook 'nrepl-mode-hook 'paredit-mode)                                  ; Use paredit in *nrepl* buffer


(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)                      ; Per the github README's recommendation
(add-hook 'cider-mode-hook 'paredit-mode)                                  ; Use paredit in cider buffer
;; (setq cider-repl-print-length 100) ;; limit number of lines to print for a result...
;; (setq cider-repl-wrap-history t) ; To adjust the maximum number of items kept in the REPL history:
;; (setq cider-repl-history-size 1000) ; the default is 500 
;; (setq cider-repl-history-file "~/.emacs.d/cider_history.txt") ; To store the REPL history in a file:
(setq cider-toggle-pretty-printing t) ; Use pretty printing for output by default



;; (add-to-list 'same-window-buffer-names "*nrepl*")                          ; Make C-c C-z switch to *nrepl*

;; ------------------------------------------------------------
;; Mutt/E-mail support

;; Make mutt buffers use mail-mode
(add-to-list 'auto-mode-alist
             '("/tmp/mutt.*$"
               . mail-mode))

;; Chomp quoted signatures
(defun mutt-mail-mode-hook ()
  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*")
  (not-modified)
  (mail-text)
  (setq make-backup-files nil))

(add-hook 'mail-mode-hook          'mutt-mail-mode-hook)
;; (add-hook 'mail-mode-hook          'turn-on-font-lock)
;; (add-hook 'mail-mode-hook          'mail-abbrevs-setup)
(add-hook 'mail-mode-hook          'flyspell-mode)

;; ------------------------------------------------------------
;; Maintain a list of recently accessed files
(recentf-mode)
(setq recentf-save-file "~/.emacs.d/.recentf")

;; ------------------------------------------------------------
;; Maintain emacs state from one session to another
;; (desktop-save-mode t)

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

;; ------------------------------------------------------------
;; Anything, simple mechanism to find buffers/files/bookmarks/etc
(require 'anything)
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate))
(global-set-key "\C-xa" 'anything)

;; Override the nrepl code so that it uses popwin
;; (defun nrepl-popup-buffer-display (popup-buffer &optional select)
;;   "Display POPUP-BUFFER.
;;    If SELECT is non-nil, select the newly created window"
;;   (popwin:popup-buffer popup-buffer))
