;; ------------------------------------------------------------
;; Package management support
(require 'package)

;; Add the original Emacs Lisp Package Archive
; (add-to-list 'package-archives
;              '("elpa" . "http://tromey.com/elpa/"))

;; Add the user-contributed repository
; (add-to-list 'package-archives
;              '("marmalade" . "http://marmalade-repo.org/packages/"))

;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defun packages-install (packages)
  (--each packages
	  (when (not (package-installed-p it))
	    (package-install it)))
  (delete-other-windows))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
    (if (package-installed-p package min-version)
	t
      (if (or (assoc package package-archive-contents) no-refresh)
	  (package-install package)
	(progn
	  (package-refresh-contents)
	          (require-package package min-version t)))))


(provide 'setup-package)
