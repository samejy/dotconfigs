(load "~/.emacs.d/mine/packages.el")
;; To reload config M-x load-file <enter> ~/.emacs.d/init.el <enter>
 
;;(require 'helm-config)
(require 'org)

(require 'neotree)
(setq neo-smart-open t)

;; neotree key bindings when in the neotree window
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-enter) 
	    (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter) 
		(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter) 
	    (evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-hidden-file-toggle))) 

;; evil leader
;;(require 'evil-leader)
;;(global-evil-leader-mode)
;;(setq evil-leader/in-all-states t)
;;(define-key evil-normal-state-map (kbd "SPC") nil)
;;(define-key evil-motion-state-map (kbd "SPC") nil)
;;(evil-leader/set-leader "<SPC>")
;;(evil-leader/set-key
;; "ff" 'find-file
;; "fn" 'neotree-toggle
;; "fc" 'neotree-find
;; "fd" 'neotree-dir
;; "fr" 'recentf-open-files
;; "bl" 'list-buffers
;; "bn" 'next-buffer
;; "bp" 'previous-buffer
;; "tp" 'text-scale-increase
;; "tm" 'text-scale-decrease
;; "tr" 'visual-line-mode
;; "tl" 'linum
;; "tw" 'global-whitespace-mode
;; "ss" 'slime
;; "sd" 'slime-eval-defun
;; "sb" 'slime-eval-buffer
;; "su" 'slime-undefine-function
;; "sc" 'slime-compile-defun
;; "sk" 'slime-compile-file
;; "sg" 'slime-edit-definition
;; "sh" 'slime-pop-find-definition-stack
;; "s?d" 'slime-describe-symbol
;; "s?f" 'slime-describe-function)
;;;; more leader key stuff to do...

;;(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;;(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;;(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;;(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;(global-set-key (kbd "C-[") 'evil-normal-state)

;; (global-set-key (kbd "C-h") 'evil-window-left)
;; (global-set-key (kbd "C-j") 'evil-window-down)
;; (global-set-key (kbd "C-k") 'evil-window-up)
;; (global-set-key (kbd "C-l") 'evil-window-right)

;;(define-key evil-normal-state-map (kbd "SPC wh") 'evil-window-left)
;;(define-key evil-normal-state-map (kbd "SPC wj") 'evil-window-down)
;;(define-key evil-normal-state-map (kbd "SPC wk") 'evil-window-up)
;;(define-key evil-normal-state-map (kbd "SPC wl") 'evil-window-right)
;;(define-key evil-motion-state-map (kbd "SPC wh") 'evil-window-left)
;;(define-key evil-motion-state-map (kbd "SPC wj") 'evil-window-down)
;;(define-key evil-motion-state-map (kbd "SPC wk") 'evil-window-up)
;;(define-key evil-motion-state-map (kbd "SPC wl") 'evil-window-right)
;;(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
;; set intial state for all buffers to be evil mode
;;(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
;;(setq evil-emacs-state-modes nil)

;;(define-key evil-insert-state-map "\M-j" 'ac-next)
;;(define-key evil-insert-state-map "\M-k" 'ac-previous)
;; TODO - this doesn't seem to work in slime repl. Return also evaluates the input...
;;(define-key evil-insert-state-map "RET" 'ac-complete)
;;(define-key evil-insert-state-map "<return>" 'ac-complete)

;; (eval-after-load 'popup
;;    '(progn
;;      (define-key popup-menu-keymap (kbd "M-j") 'popup-next)
;;      (define-key popup-menu-keymap (kbd "M-k") 'popup-previous)))

;; evil mode
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; set jk to escape
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

;; slime
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

;; emacs speaks statistics
;; (require 'ess-site)

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

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
(define-key slime-repl-mode-map
(read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
