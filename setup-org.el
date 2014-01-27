;; ------------------------------------------------------------
;; Enable Org mode
;; (require 'org-install)
;; (setq org-agenda-files (list "/home/abusby/org/work.org" "/home/abusby/org/jun.org"))
;; (setq org-todo-keywords '((sequence "TODO" "PENDING" "DONE")))
;; (setq org-directory "~/org")
;; (setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; (setq org-mobile-directory "~/Dropbox/MobileOrg")


;; org-mode colors
(setq org-todo-keyword-faces
      '(
	("INPR" . (:foreground "yellow" :weight bold))
	("DONE" . (:foreground "green" :weight bold))
	("IMPEDED" . (:foreground "red" :weight bold))
	))

(provide 'setup-org)
