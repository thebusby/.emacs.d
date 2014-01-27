;; Subtler highlight
(set-face-background 'magit-item-highlight "#121212")
(set-face-background 'diff-file-header "#121212")
(set-face-foreground 'diff-context "#666666")
(set-face-foreground 'diff-added "#00cc33")
(set-face-foreground 'diff-removed "#ff0000")

(set-default 'magit-stage-all-confirm nil)
(set-default 'magit-unstage-all-confirm nil)

(eval-after-load 'ediff
  '(progn
     (set-face-foreground 'ediff-odd-diff-B "#ffffff")
     (set-face-background 'ediff-odd-diff-B "#292521")
     (set-face-foreground 'ediff-even-diff-B "#ffffff")
     (set-face-background 'ediff-even-diff-B "#292527")

     (set-face-foreground 'ediff-odd-diff-A "#ffffff")
     (set-face-background 'ediff-odd-diff-A "#292521")
     (set-face-foreground 'ediff-even-diff-A "#ffffff")
     (set-face-background 'ediff-even-diff-A "#292527")))



;; -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- --  -- -
;; ignore whitespace

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)



(provide 'setup-magit)
