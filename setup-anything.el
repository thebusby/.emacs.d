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


(provide 'setup-anything)
