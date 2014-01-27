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


(provide 'setup-mutt)
