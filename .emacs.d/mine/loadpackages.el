(server-start)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 100)

(straight-use-package 'helm)
(straight-use-package 'powerline)
(straight-use-package 'whitespace)
(straight-use-package 'which-key)
(straight-use-package 'projectile)
(straight-use-package 'helm-projectile)
(straight-use-package 'helm-flx)
(straight-use-package 'magit)
(straight-use-package 'general)
(straight-use-package 'evil)

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(setq helm-mode-fuzzy-match t)
(setq helm-candidate-number-limit 100)
(setq helm-full-frame t)

(helm-flx-mode +1)
(setq helm-flx-for-helm-locate t
      helm-flx-for-helm-find-files t)


;; (require 'which-key)
(which-key-mode)
(setq which-key-allow-evil-operators t)

(require 'powerline)
(require 'whitespace)

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-java)
(straight-use-package 'gradle-mode)
		      
(straight-use-package 'company)
(straight-use-package 'company-lsp :ensure t)
(straight-use-package 'lsp-ui :ensure t)


(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)
(tooltip-mode 1)

;; (condition-case nil
;;     (require 'use-package)
;;   (file-error
;;    (require 'package)
;;    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;    (package-initialize)
;;    (package-refresh-contents)
;;    (package-install 'use-package)
;;    (require 'use-package)))

(add-to-list 'lsp-file-watch-ignored "deployments")
(add-to-list 'lsp-file-watch-ignored "build")
(add-to-list 'lsp-file-watch-ignored "stacks")

;; (use-package projectile :ensure t)
;; (use-package yasnippet :ensure t)
;; (use-package lsp-mode :ensure t)
;; (use-package hydra :ensure t)
;; (use-package company-lsp :ensure t)
;; (use-package lsp-ui :ensure t)

;; (use-package lsp-java :ensure t :after lsp
;;   :config (add-hook 'java-mode-hook 'lsp))

;; ;; disable large ui pop ups
(setq lsp-ui-doc-enable nil)
(setq lsp-keep-workspace-alive nil)
(setq lsp-enable-file-watchers nil)
(setq lsp-log-max 20000)
(setq gc-cons-threshold (* 1024 1024 100))
(setq read-process-output-max (* 1024 1024))

;; (straight-use-package dap-mode
;;   :ensure t :after lsp-mode
;;   :config
;;   (dap-mode t)
;;   (dap-ui-mode t))

;;  (require 'dap-java)
;;  (straight-use-package dap-java :after (lsp-java))

;; ;; dap seems to expect the lsp java server to be in a different location to lsp java
;; ;; maybe a recent change so just overriding the location here
;; (setq dap-java-test-runner "/Users/byrnej85/.emacs.d/.cache/lsp/eclipse.jdt.ls/java-test/server/lib/junit-platform-console-standalone-1.3.2.jar")

(add-hook 'java-mode-hook (lambda () (setq c-basic-offset 4)))
(add-hook 'java-mode-hook (lambda () (setq tab-width 4)))
(add-hook 'js-mode-hook (lambda () (setq c-basic-offset 2)))
(add-hook 'js-mode-hook (lambda () (setq tab-width 2)))
(add-hook 'js-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;(require 'gradle-mode)
(gradle-mode 1)
(setq gradle-executable-path "/usr/local/bin/gradle")

(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(projectile-register-project-type 'java '("build.gradle")
                  :compile "gradle build"
                  :test "gradle test"
                  :run "gradle run"
                  :test-suffix "Test")

;; (color-theme-approximate-on)

;; ;; on mac and linux, set up emacs environment variables
;; ;; from those reported by a shell so they match
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
 
;; ;; TODO - look into display-buffer-alist to specify where new windows appear (e.g. slime debugger to appear below repl? or in place of repl? rather than splitting some random window vertically)
;; ;; Helm
;; (require 'helm-config)
;; (helm-mode 1)
;; ;; see helm.el for helm key bindings
;; (define-key helm-map (kbd "C-j") 'helm-next-line)
;; (define-key helm-map (kbd "C-k") 'helm-previous-line)
;; (setq helm-mode-fuzzy-match t)
;; (setq helm-candidate-number-limit 100)
;; ;; open helm taking up the full frame every time...
;; ;; this might do for now until can get it opening nicely at the bottom
;; (setq helm-full-frame t)

;; (dumb-jump-mode)
;; ;;(setq dumb-jump-selector 'helm)

;; (helm-flx-mode +1)
;; (setq helm-flx-for-helm-locate t
;;       helm-flx-for-helm-find-files t)

;; ;; Org mode
;; (require 'org)
;; ;; languages which can be executed in code blocks within org files
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((python . t)
;;    (ipython . t)
;;    (lisp . t)
;;    (http . t)
;;    (C . t)))

;; (setq org-M-RET-may-split-line nil)
;; (setq org-babel-python-command "python3")
;; (setq org-confirm-babel-evaluate nil)
;; ;; allow override of width of inline images
;; (setq org-image-actual-width nil)
;; (setq org-src-fontify-natively t)

;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;; ;; add template for #+TITLE: block (type <t and TAB)
;; (add-to-list 'org-structure-template-alist '("t" "#+TITLE:?"))
;; (add-to-list 'org-structure-template-alist '("sp" "#+BEGIN_SRC python :session :results output\n?\n#+END_SRC\n"))
;; (add-to-list 'org-structure-template-alist '("ip" "#+BEGIN_SRC ipython :session :results raw drawer :async t\n?\n#+END_SRC\n"))
;; (add-to-list 'org-structure-template-alist '("f" "#+NAME: fig:figure name\n#+CAPTION: figure name\n#+ATTR_ORG: :width 600\n#+ATTR_LATEX: :width 2.0in\n#+ATTR_HTML: :width 600px\n?"))

;; ;; (add-to-list 'company-backends 'company-ob-ipython)

;; ;; Set default browser to qutebrowser for opening links
;; (let ((browser (if (executable-find "qutebrowser")
;;                   "qutebrowser"
;;                   "open")))
;;   (setq browse-url-browser-function 'browse-url-generic
;;         browse-url-generic-program browser))

;; (setq split-width-threshold 40)


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;(company-quickhelp-mode)
(setq company-minimum-prefix-length 2)

;; (eval-after-load 'company
;;   '(progn
;;      (define-key company-mode-map (kbd "C-:") 'helm-company)
;;      (define-key company-active-map (kbd "C-:") 'helm-company)))

(setq company-global-modes '(not magit-mode))

;; (require 'which-key)
;; (which-key-mode)

;; (require 'powerline)

;; ;; emacs speaks statistics
;; (require 'ess-site)

;; ;; Python/elpy
;; (require 'ein)
;; (elpy-enable)
;; (setq python-shell-interpreter "ipython3"
;;       python-shell-interpreter-args "-i --simple-prompt")
;; (setq elpy-rpc-python-command "python3")
;; (setq elpy-rpc-backend "jedi")
;; (setq gud-pdb-command-name "python3 -m pdb")

;; ;; Paredit
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'my/enable-paredit-mode)
;; (add-hook 'clojure-mode-hook          #'my/enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'my/enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'my/enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'my/enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'my/enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'my/enable-paredit-mode)
;; (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; (defun my/enable-paredit-mode ()
;;   (progn
;;     (enable-paredit-mode)
;;     (show-paren-mode +1)))

;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (setq slime-contribs '(slime-fancy))

;; ;; Stop SLIME's REPL from grabbing DEL,
;; ;; which is annoying when backspacing over a '('
;; (defun override-slime-repl-bindings-with-paredit ()
;;     (define-key slime-repl-mode-map
;; 	(read-kbd-macro paredit-backward-delete-key) nil))
;; (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;; ;; C# (!!)
;; (require 'omnisharp)
;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
;; (setq omnisharp-server-executable-path "F:\\bin\\omnisharp\\Omnisharp.exe")

;; ;; Haskell
(straight-use-package 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
(setq flycheck-check-syntax-automatically '(save mode-enabled))

;; (autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;; (add-to-list
;;  'auto-mode-alist
;;  '("\\.m$" . matlab-mode))
;; (setq matlab-indent-function t)
;; (setq matlab-shell-command "octave")

;; (add-hook 'json-mode-hook (lambda ()
;;                             (make-local-variable 'js-indent-level)
;;                             (setq js-indent-level 2)))
