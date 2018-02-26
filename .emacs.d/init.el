;; load no externals after everything else

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'after-init-hook '(lambda ()
        (load "~/.emacs.d/mine/noexternals.el")))

(load "~/.emacs.d/mine/loadpackages.el")



