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

(defun copy-mode-hackery ()
  "Remove everything in the file except is what is in the region, then save and quit"
  (interactive)
  (progn
    (kill-region 1 2 3)
    (beginning-of-buffer)
    (yank)
    (set-mark (point)) ;; (set-mark-command)
    (end-of-buffer)
    (kill-region 1 2 3)
    (save-buffer)
    (save-buffers-kill-terminal)))

(global-set-key "\C-c\C-z" 'copy-mode-hackery)

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
(defalias 'cji 'my-cider-jack-in)
(defalias 'vtt 'visit-tags-table)
(defalias 'rof 'recentf-open-files)
;; (defalias 'sro 'sr-speedbar-toggle)
(defalias 'gr 'gist-region-private)
(defalias 'git 'magit-status)





(provide 'key-bindings)
