(load "~/.emacs.d/mine/packages.el")
(load "~/.emacs.d/mine/evil.el")

(elscreen-start)
(setq elscreen-display-tab nil)

(server-start)
;; To reload config M-x load-file <enter> ~/.emacs.d/init.el <enter>
(color-theme-approximate-on)

;; on mac and linux, set up emacs environment variables
;; from those reported by a shell so they match
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
 
;; TODO - look into display-buffer-alist to specify where new windows appear (e.g. slime debugger to appear below repl? or in place of repl? rather than splitting some random window vertically)
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

(helm-flx-mode +1)
(setq helm-flx-for-helm-locate t
      helm-flx-for-helm-find-files t)

;; Org mode
(require 'org)
;; languages which can be executed in code blocks within org files
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (lisp . t)
   (C . t)))

(setq org-M-RET-may-split-line nil)
(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)
;; allow override of width of inline images
(setq org-image-actual-width nil)
(setq org-src-fontify-natively t)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;; add template for #+TITLE: block (type <t and TAB)
(add-to-list 'org-structure-template-alist '("t" "#+TITLE:?"))
(add-to-list 'org-structure-template-alist '("sp" "#+BEGIN_SRC python :session :results output\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("ip" "#+BEGIN_SRC ipython :session :results raw drawer :async t\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("f" "#+NAME: fig:figure name\n#+CAPTION: figure name\n#+ATTR_ORG: :width 600\n#+ATTR_LATEX: :width 2.0in\n#+ATTR_HTML: :width 600px\n?"))

;; (add-to-list 'company-backends 'company-ob-ipython)

;; Set default browser to qutebrowser for opening links
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")

(setq split-width-threshold 40)

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(require 'evil-magit)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)
(setq company-minimum-prefix-length 2)

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))

(setq company-global-modes '(not magit-mode))

(require 'which-key)
(which-key-mode)
(setq which-key-allow-evil-operators t)

(require 'powerline)
;; (require 'airline-themes)
;; (load-theme 'yoshi t)

;; emacs speaks statistics
(require 'ess-site)

;; Python/elpy
(require 'ein)
(elpy-enable)
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(setq gud-pdb-command-name "python3 -m pdb")

(require 'whitespace)

;; Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'my/enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'my/enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'my/enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'my/enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'my/enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'my/enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'my/enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(defun my/enable-paredit-mode ()
  (progn
    (enable-paredit-mode)
    (show-paren-mode +1)))

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
(require 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
(setq flycheck-check-syntax-automatically '(save mode-enabled))

(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "octave")
