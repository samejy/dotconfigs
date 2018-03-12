(load "~/.emacs.d/mine/packages.el")
(load "~/.emacs.d/mine/evil.el")

;; To reload config M-x load-file <enter> ~/.emacs.d/init.el <enter>
 
;; (load-theme 'yoshi :no-confirm)
;; (load-theme 'solarized-dark :no-confirm)

;; Helm
(require 'helm-config)
(helm-mode 1)
;; see helm.el for helm key bindings
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(setq helm-mode-fuzzy-match t)
(setq helm-candidate-number-limit 100)
;; open helm taking up the full frame every time...
;; this might do for now until can get it opening nicely at the bottom
(setq helm-full-frame t)

;; this attempts to always open helm in a horizontal split at the bottom
;; i.e. above the minibuffer. it still messes up other windows depending
;; on which one you are currently in
;; (add-to-list 'display-buffer-alist
;;                     `(,(rx bos "*helm" (* not-newline) "*" eos)
;;                          (display-buffer-in-side-window)
;;                          (inhibit-same-window . t)
;;                          (window-height . 0.4)))

(helm-flx-mode +1)
(setq helm-flx-for-helm-locate t
      helm-flx-for-helm-find-files t)
      

;; Org mode
(require 'org)
;; languages which can be executed in code blocks within org files
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (lisp . t)
   (C . t)))
(setq org-babel-python-command "python3")
;; add template for #+TITLE: block (type <t and TAB)
(add-to-list 'org-structure-template-alist '("t" "#+TITLE:?"))
(add-to-list 'org-structure-template-alist '("sp" "#+BEGIN_SRC python :results output\n?\n#+END_SRC\n"))

(setq split-width-threshold 40)

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;; (setq projectile-project-root-files-functions '())

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; remove autocomplete 
;; ;; autocomplete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (global-auto-complete-mode)
;; (setq ac-show-menu-immediately-on-auto-complete t)


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

;; Python/elpy
;(require 'jedi)
(elpy-enable)
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
;; (add-to-list 'ac-sources 'ac-source-jedi-direct)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; (setq jedi:get-in-function-call-delay 50)
;; todo look into jedi:server-args
;; set sys path?
;; (add-hook 'python-mode-hook 'jedi-config:setup-keys)

(require 'whitespace)


;; Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
    (define-key slime-repl-mode-map
	(read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;; C# (!!)
(require 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp-server-executable-path "F:\\bin\\omnisharp\\Omnisharp.exe")

;; Haskell
(require 'haskell-interactive-mode)
(require 'haskell-process)
;; default to interactive mode for all haskell buffers:
;; (add-hook ’haskell-mode-hook ’interactive-haskell-mode)
