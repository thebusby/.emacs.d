;; *scratch* starts empty
(setq initial-scratch-message nil)

;; Prompt is y/n not yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
; (global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
; (setq global-auto-revert-non-file-buffers t)
; (setq auto-revert-verbose nil)

;; Show keystrokes in progress
; (setq echo-keystrokes 0.1)


;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Unicode support
(setq local-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)


;; Remove text in active region if inserting text
; (delete-selection-mode 1)


;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
; (setq fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent
; (setq recentf-save-file "~/.emacs.d/.recentf")


;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Enable winner-mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
; (setq undo-tree-mode-lighter "")
; (require 'undo-tree)
; (global-undo-tree-mode)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
; (setq eval-expression-print-level nil) 

(provide 'my-defaults)
