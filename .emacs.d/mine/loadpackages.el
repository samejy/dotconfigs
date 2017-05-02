(load "~/.emacs.d/mine/packages.el")
;; To reload config M-x load-file <enter> ~/.emacs.d/init.el <enter>
 
;; (load-theme 'yoshi :no-confirm)
;; (load-theme 'solarized-dark :no-confirm)

(require 'helm-config)
(helm-mode 1)
;; see helm.el for helm key bindings
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)

(require 'org)

(load "~/.emacs.d/mine/evil.el")

;; Get neotree to change it's directory root when projectile project changes
(setq projectile-switch-project-action 'neotree-projectile-action)

(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "<return>") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)

(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;; (setq projectile-project-root-files-functions '())

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; autocomplete
(ac-config-default)

;; which key
(require 'which-key)
(which-key-mode)
(setq which-key-allow-evil-operators t)

;; powerline
(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-light t)
;; (load-theme 'airline-base16-shell-dark t)

;; emacs speaks statistics
(require 'ess-site)

(elpy-enable)
;; (setq elpy-rpc-python-command "python3")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(require 'whitespace)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(require 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp-server-executable-path "F:\\bin\\omnisharp\\Omnisharp.exe")

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
(define-key slime-repl-mode-map
(read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
