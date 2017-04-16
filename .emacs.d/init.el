;; load no externals after everything else
(add-hook 'after-init-hook '(lambda ()
        (load "~/.emacs.d/mine/noexternals.el")))

(load "~/.emacs.d/mine/loadpackages.el")



