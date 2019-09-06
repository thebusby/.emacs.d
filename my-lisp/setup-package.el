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
             '("melpa" . "https://melpa.milkbox.net/packages/"))

;; MELPA STABLE
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa-stable.milkbox.net/packages/"))

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))


;; Taken from https://github.com/magnars/dash.el/blob/master/dash.el
(defmacro !cdr (list)
  "Destructive: Sets LIST to the cdr of LIST."
    `(setq ,list (cdr ,list)))

;; Taken from https://github.com/magnars/dash.el/blob/master/dash.el
(defmacro --each (list &rest body)
  "Anaphoric form of `-each'."
  (declare (debug t))
  (let ((l (make-symbol "list")))
    `(let ((,l ,list)
	   (it-index 0))
       (while ,l
	 (let ((it (car ,l)))
	   ,@body)
	 (setq it-index (1+ it-index))
	          (!cdr ,l)))))

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
