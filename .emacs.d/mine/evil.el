;; Configuration for evil mode keybindings

; look into https://sam217pa.github.io/2016/09/23/keybindings-strategies-in-emacs/
(require 'general)
(setq gen-leader1 ",")
(general-define-key :keymaps 'elpy-mode-map
		    :prefix gen-leader1
		    :states '(normal visual motion)
		    "d" '(:ignore t)
		    "dd" 'elpy-goto-definition
		    "dh" 'elpy-doc
		    "db" 'toggle-py-break)

(general-define-key :keymaps 'intero-mode-map
		    :prefix gen-leader1
		    :states '(normal visual motion)
		    "d" '(:ignore t)
		    "dd" 'intero-goto-definition
		    "dh" 'intero-info)

;; (general-define-key :keymaps 'cider-mode-map
;; 		    :prefix gen-leader1
;; 		    :states '(normal visual motion)
;; 		    "d" '(:ignore t)
;; 		    "dd" 'cider-??
;; 		    "dh" 'cider-??)

(general-define-key :keymaps 'org-mode-map
		    :prefix gen-leader1
		    :states '(normal visual motion)
		    "d" '(:ignore t)
		    "c" 'org-cycle)

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
  "m" 'helm-mini
  "h" 'helm-apropos
  "x" 'helm-M-x
  "r" 'helm-recentf
  "l" 'helm-buffers-list
  "s" 'evil-window-split
  "v" 'evil-window-vsplit

  ;; projectile
  "pp" 'helm-browse-project
  "pf" 'helm-projectile-find-file
  "ps" 'helm-projectile-switch-project
  "pa" 'helm-do-ag-project-root
  "pg" 'projectile-grep

  ;; common shortcuts
  "ad" 'kill-this-buffer
  "at" 'projectile-regenerate-tags
  ;; doesn't work... wan't to pop up documentation a la company quickhelp, but without autocompletion
  "ah" 'company-show-doc-buffer

  ;; window/frame
  "wd" 'evil-window-delete
  "wo" 'delete-other-windows
  "wl" 'evil-window-move-far-right
  "wh" 'evil-window-move-far-left
  "wj" 'evil-window-move-very-bottom
  "wk" 'evil-window-move-very-top
  "wu" 'winner-undo
  "wr" 'winner-redo

  ;; text display
  "tp" 'text-scale-increase
  "tm" 'text-scale-decrease
  "tr" 'visual-line-mode
  "tt" 'toggle-truncate-lines
  "tl" 'linum-mode
  "tc" 'comment-line
  "tw" 'whitespace-mode
  "tg" 'global-whitespace-mode

  ;; git
  "gs" 'magit-status
  "gl" 'magit-log-all

  ;; run commands
  "cp" 'projectile-run-async-shell-command-in-root
  "cc" 'async-shell-command
  "cr" 'shell-command-on-region
  "cd" 'dired-do-async-shell-command

  "zc" 'elscreen-create
  "zn" 'elscreen-next
  "zp" 'elscreen-previous
  "zx" 'elscreen-kill
  "zl" 'elscreen-select-and-goto

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
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

;; ignore wrapped lines when moving up and down
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key evil-emacs-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-emacs-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-emacs-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-emacs-state-map (kbd "C-l") 'evil-window-right)

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
(define-key evil-window-map (kbd "u") 'winner-undo)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; set intial state for all buffers to be evil mode
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

;;autocomplete menu navigation
;;(define-key company-mode-map "\C-;" 'helm-company)
(define-key evil-insert-state-map "\C-j" 'company-complete)
(define-key evil-insert-state-map "\C-j" 'company-select-next)
(define-key evil-insert-state-map "\C-k" 'company-select-previous)

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
;; use emacs mode in slime debugger (TODO what is the correct mode name?)
(add-to-list 'evil-emacs-state-modes 'sldb-mode)
(evil-set-initial-state 'sldb-mode 'emacs)

(add-to-list 'evil-emacs-state-modes 'neotree-mode)
(evil-set-initial-state 'neotree-mode 'emacs)
;; (define-key neotree-mode-map (kbd "j") 'neotree-next-line)
;; (define-key neotree-mode-map (kbd "k") 'neotree-previous-line)

(add-to-list 'evil-emacs-state-modes 'xref--xref-buffer-mode)
(evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
;; TODO - maybe also use REPLS in emacs mode? But still want window navigation with C-hjkl? 

;; set jk to escape
;; (require 'key-chord)
;; (key-chord-mode 1)
;; (key-chord-define-global "jk" 'evil-normal-state)
;; ;; is this working? Don't reset from emacs mode with jk 
;; (key-chord-define evil-emacs-state-map "jk" nil)

