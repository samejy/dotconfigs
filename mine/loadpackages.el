(load "~/.emacs.d/mine/packages.el")

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
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states t)
(define-key evil-normal-state-map (kbd "SPC") nil)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "ff" 'find-file
 "fn" 'neotree-toggle
 "fc" 'neotree-find
 "fd" 'neotree-dir
 "fr" 'recentf-open-files
 "bl" 'list-buffers
 "bn" 'next-buffer
 "bp" 'previous-buffer
 "tp" 'text-scale-increase
 "tm" 'text-scale-decrease
 "tw" 'visual-line-mode
 "ss" 'slime
 "sd" 'slime-eval-defun
 "sc" 'slime-eval-buffer
 "s?d" 'slime-describe-symbol
 "s?f" 'slime-describe-function)
;; more leader key stuff to do...


(define-key evil-normal-state-map (kbd "SPC wh") 'evil-window-left)
(define-key evil-normal-state-map (kbd "SPC wj") 'evil-window-down)
(define-key evil-normal-state-map (kbd "SPC wk") 'evil-window-up)
(define-key evil-normal-state-map (kbd "SPC wl") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

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
(require 'ess-site)
