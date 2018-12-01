;; no externals - config for native emacs

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; don't ask about adding tags tables when moving to another
;; directory which has its own tags file
(setq tags-add-tables nil)

(setq backup-directory-alist
    `(("." . ,(concat user-emacs-directory "backups"))))




