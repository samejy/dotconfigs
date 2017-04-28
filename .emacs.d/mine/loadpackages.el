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


;; evil leader
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states t)
(define-key evil-normal-state-map (kbd "SPC") nil)
(define-key evil-motion-state-map (kbd "SPC") nil)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 ; "ff" 'find-file
 ; "fn" 'neotree-toggle
 ; "fc" 'neotree-find
 ; "fd" 'neotree-dir
 ; "fr" 'recentf-open-files
  "l" 'buffer-menu
  "j" 'next-buffer
  "k" 'previous-buffer
  "tp" 'text-scale-increase
  "tm" 'text-scale-decrease
  "tr" 'visual-line-mode
  "tl" 'linum
  "s" 'evil-window-split
  "v" 'evil-window-vsplit
 ; "tw" 'global-whitespace-mode
 ; "ss" 'slime
 ; "sd" 'slime-eval-defun
 ; "sb" 'slime-eval-buffer
 ; "su" 'slime-undefine-function
 ; "sc" 'slime-compile-defun
 ; "sk" 'slime-compile-file
 ; "sg" 'slime-edit-definition
 ; "sh" 'slime-pop-find-definition-stack
 ; "s?d" 'slime-describe-symbol
 ; "s?f" 'slime-describe-function
  )
;; more leader key stuff to do...

;;(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;;(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;;(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;;(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; use C-w everywhere for window navigation
;; evil-want-C-w-in-emacs-state doesn't appear to be working
;; but this does.
(global-set-key (kbd "C-w") 'evil-window-map)

;; (global-set-key (kbd "C-h") 'evil-window-left)
;; (global-set-key (kbd "C-j") 'evil-window-down)
;; (global-set-key (kbd "C-k") 'evil-window-up)
;; (global-set-key (kbd "C-l") 'evil-window-right)

; (define-key evil-normal-state-map (kbd "SPC wh") 'evil-window-left)
; (define-key evil-normal-state-map (kbd "SPC wj") 'evil-window-down)
; (define-key evil-normal-state-map (kbd "SPC wk") 'evil-window-up)
; (define-key evil-normal-state-map (kbd "SPC wl") 'evil-window-right)
; (define-key evil-motion-state-map (kbd "SPC wh") 'evil-window-left)
; (define-key evil-motion-state-map (kbd "SPC wj") 'evil-window-down)
; (define-key evil-motion-state-map (kbd "SPC wk") 'evil-window-up)
; (define-key evil-motion-state-map (kbd "SPC wl") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)


;; set intial state for all buffers to be evil mode
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

(define-key evil-insert-state-map "\M-j" 'ac-next)
(define-key evil-insert-state-map "\M-k" 'ac-previous)
(define-key evil-insert-state-map "\C-j" 'ac-next)
(define-key evil-insert-state-map "\C-k" 'ac-previous)
;; TODO - this doesn't seem to work in slime repl. Return also evaluates the input...
(define-key evil-insert-state-map "RET" 'ac-complete)
(define-key evil-insert-state-map "<return>" 'ac-complete)

(eval-after-load 'popup
   '(progn
     (define-key popup-menu-keymap (kbd "M-j") 'popup-next)
     (define-key popup-menu-keymap (kbd "M-k") 'popup-previous)
     (define-key popup-menu-keymap (kbd "C-j") 'popup-next)
     (define-key popup-menu-keymap (kbd "C-k") 'popup-previous)))

;; evil mode
;; see also https://github.com/wasamasa/dotemacs/blob/master/init.org#evil

(with-eval-after-load 'evil-vars
  (setq evil-want-C-w-in-emacs-state t))

(with-eval-after-load 'evil-maps
  (define-key evil-insert-state-map (kbd "C-w") 'evil-window-map))

(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo))

(setq evil-want-C-w-in-emacs-state t)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(add-to-list 'evil-emacs-state-modes 'iESS)
(evil-set-initial-state 'iESS 'emacs)

;; set jk to escape
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

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
