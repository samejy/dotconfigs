; load no externals after everything else

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/mine/noexternals.el")
			      (load "~/.emacs.d/mine/functions.el")))

(load "~/.emacs.d/mine/loadpackages.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clojure-mode ein intero omnisharp csharp-mode ess paredit solarized-theme yoshi-theme airline-themes key-chord powerline helm-projectile projectile which-key slime jedi elpy helm haskell-mode evil-leader evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

