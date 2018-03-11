;; Configuration for evil mode keybindings

; look into https://sam217pa.github.io/2016/09/23/keybindings-strategies-in-emacs/
;(require 'general)
;(setq gen-leader1 ",")
; (general-define-key :keymaps 'python-mode-map
	;	    :prefix gen-leader1
	;	    "dd" 'jedi:show-doc)

;; evil leader
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states t)

(define-key evil-normal-state-map (kbd ",") nil)
(define-key evil-normal-state-map (kbd "\\") nil)
(define-key evil-motion-state-map (kbd ",") nil)
(define-key evil-motion-state-map (kbd "\\") nil)

(evil-leader/set-leader ",")
 (evil-leader/set-key
  "f" 'helm-find-files
  "b" 'helm-buffers-list
  "pp" 'helm-browse-project
  "pf" 'helm-projectile-find-file
  "ps" 'helm-projectile-switch-project
  "n" 'neotree-toggle
  "m" 'helm-mini
  "h" 'helm-apropos
  "ad" 'kill-this-buffer
  "at" 'projectile-regenerate-tags
  "ac" 'evil-window-delete
  "x" 'helm-M-x
  "r" 'helm-recentf
  "l" 'helm-buffers-list
  "tp" 'text-scale-increase
  "tm" 'text-scale-decrease
  "tr" 'visual-line-mode
  "tl" 'linum
  "tc" 'comment-line
  "tw" 'whitespace-mode
  "tg" 'global-whitespace-mode
  "s" 'evil-window-split
  "v" 'evil-window-vsplit
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

;; TODO - is it possible to bind leader keys in different modes to an entire key map
;; so e.g. <leader>d is bound to some map of keys for python in one map,
;; and a different set of keys for haskell defined in another map?
; (evil-leader/set-key-for-mode 'python-mode (kbd "d") 'jedi:show-doc)
  ;'python-mode "d" 'elpy-mode-map)

;; (defun jedi-config:setup-keys ()
;;   (local-set-key (kbd "C-c /") 'jedi:get-in-function-call))

;; https://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
;; Quit anything:
(defun minibuf-keyboard-quit ()
  "Abort recursive edit"
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuf-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuf-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuf-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuf-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuf-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)
(define-key evil-normal-state-map (kbd "C-g") 'evil-normal-state)

;; C-hjkl for quick window navigation
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)

;; \n and \p for quick buffer navigation
(define-key evil-normal-state-map (kbd "\\n") 'evil-next-buffer)
(define-key evil-motion-state-map (kbd "\\n") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "\\p") 'evil-prev-buffer)
(define-key evil-motion-state-map (kbd "\\p") 'evil-prev-buffer)

;; use C-w everywhere for window navigation
;; evil-want-C-w-in-emacs-state doesn't appear to be working
;; but this does.
(global-set-key (kbd "C-w") 'evil-window-map)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; set intial state for all buffers to be evil mode
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

;; autocomplete navigation
(define-key evil-insert-state-map "\M-j" 'ac-next)
(define-key evil-insert-state-map "\M-k" 'ac-previous)
(define-key evil-insert-state-map "\C-j" 'ac-next)
(define-key evil-insert-state-map "\C-k" 'ac-previous)

;; TODO - this doesn't seem to work in slime repl. Return also evaluates the input...
;; (define-key evil-insert-state-map (kbd "RET") 'ac-complete)
;(define-key evil-insert-state-map "<return>" 'ac-complete)

(eval-after-load 'popup
   '(progn
     (define-key popup-menu-keymap (kbd "M-j") 'popup-next)
     (define-key popup-menu-keymap (kbd "M-k") 'popup-previous)
     (define-key popup-menu-keymap (kbd "C-j") 'popup-next)
     (define-key popup-menu-keymap (kbd "C-k") 'popup-previous)))

;; bind ";" to command (e.g. make it the same as ":")
(define-key evil-motion-state-map ";" 'evil-ex)
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
