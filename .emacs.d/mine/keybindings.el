;; Configuration for keybindings

; look into https://sam217pa.github.io/2016/09/23/keybindings-strategies-in-emacs/
;(require 'general)
(setq gen-leader1 "C-;")

(global-set-key (kbd "C-i") 'hippie-expand)

(general-define-key :prefix gen-leader1
                    ";" 'evil-toggle-key
                    "f" 'helm-find-files
                    "m" 'helm-mini
                    "h" 'helm-apropos
                    "x" 'helm-M-x
                    "r" 'helm-recentf
                    "l" 'helm-buffers-list
                    "." 'dumb-jump-go
                    "," 'dumb-jump-back
                    "i" 'ibuffer
                    "e" 'eshell

                    ;; common shortcuts
                    "ad" 'kill-this-buffer
                    "at" 'projectile-regenerate-tags
                    ;; doesn't work... wan't to pop up documentation a la company quickhelp, but without autocompletion
                    "ah" 'company-show-doc-buffer

                    ;; text display
                    "tp" 'text-scale-increase
                    "tm" 'text-scale-decrease
                    "tr" 'visual-line-mode
                    "tt" 'toggle-truncate-lines
                    "tl" 'linum-mode
                    "tc" 'comment-line
                    "tw" 'whitespace-mode
                    "tg" 'global-whitespace-mode

                    "jj" 'dumb-jump-go
                    "jb" 'dumb-jump-back
                    "jp" 'dumb-jump-quick-look

                    ;; git
                    "gs" 'magit-status
                    "gl" 'magit-log-buffer-file
                    "gd" 'magit-diff-buffer-file
                    "gb" 'magit-blame

                    ;; run commands
                    "cp" 'projectile-run-async-shell-command-in-root
                    "cc" 'async-shell-command
                    "cr" 'shell-command-on-region
                    "cd" 'dired-do-async-shell-command

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

(general-define-key :keymaps 'lsp-mode-map
		    :prefix gen-leader1
		    :states '(normal visual motion)
		    "d" '(:ignore t)
		    "dt" 'lsp-describe-thing-at-point
                    "dc" 'dap-continue
                    "di" 'dap-step-in
                    "do" 'dap-step-out
		    "dh" 'toggle-lsp-ui-doc
                    "db" 'dap-breakpoint-toggle)

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

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

;; ignore wrapped lines when moving up and down
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; use C-w everywhere for window navigation
(global-set-key (kbd "C-w") 'evil-window-map)
(define-key evil-window-map (kbd "u") 'winner-undo)
(define-key evil-motion-state-map ";" 'evil-ex)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; set intial state for all buffers to be evil mode
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
;; (setq evil-emacs-state-modes nil)

;;autocomplete menu navigation
(define-key evil-insert-state-map "\C-j" 'company-complete)
(define-key evil-insert-state-map "\C-j" 'company-select-next)
(define-key evil-insert-state-map "\C-k" 'company-select-previous)

(define-key evil-emacs-state-map "\C-j" 'company-complete)
(define-key evil-emacs-state-map "\C-j" 'company-select-next)
(define-key evil-emacs-state-map "\C-k" 'company-select-previous)

(define-key evil-emacs-state-map "\C-u" 'evil-scroll-up)
(define-key evil-emacs-state-map "\C-d" 'evil-scroll-down)

(eval-after-load 'popup
   '(progn
     (define-key popup-menu-keymap (kbd "M-j") 'popup-next)
     (define-key popup-menu-keymap (kbd "M-k") 'popup-previous)
     (define-key popup-menu-keymap (kbd "C-j") 'popup-next)
     (define-key popup-menu-keymap (kbd "C-k") 'popup-previous)))

(with-eval-after-load 'evil-vars
  (progn
    (setq evil-want-C-w-in-emacs-state t)
    (setq evil-want-C-d-scroll t)
    (setq evil-want-C-u-scroll t)
    (define-key evil-emacs-state-map "\C-u" 'evil-scroll-up)
    (define-key evil-emacs-state-map "\C-d" 'evil-scroll-down)
    (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
    (evil-set-initial-state 'iESS 'emacs)
    (evil-set-initial-state 'ibuffer-mode 'emacs)
    (evil-set-initial-state 'magit-mode 'emacs)
    (evil-set-initial-state 'magit-log-mode 'emacs)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'shell-mode 'emacs)
    (evil-set-initial-state 'eshell-mode 'emacs)
    (evil-set-initial-state 'comint-mode 'emacs)
    (evil-set-initial-state 'sldb-mode 'emacs)
    (evil-set-initial-state 'slime-repl-mode 'emacs)
    (evil-set-initial-state 'xref--xref-buffer-mode 'emacs)))

;; (add-to-list 'evil-emacs-state-modes 'sldb-mode)
;; (add-to-list 'evil-emacs-state-modes 'xref--xref-buffer-mode)

;; not working:
(global-set-key (kbd "C-.") 'dumb-jump-go)
(global-set-key (kbd "C-,") 'dumb-jump-back)

(defun set-emacs-state ()
  (local-set-key (kbd "C-w") 'evil-window-map)
  (evil-emacs-state))

(defun set-shell-mode-state ()
  (progn
    (set-emacs-state)
    (when (and (fboundp 'company-mode)
             (file-remote-p default-directory))
      (company-mode -1))))

(add-hook 'shell-mode-hook 'set-shell-mode-state)
(add-hook 'eshell-mode-hook 'set-shell-mode-state)
(add-hook 'term-mode-hook 'set-shell-mode-state)
(add-hook 'comint-mode-hook 'set-shell-mode-state)
(add-hook 'magit-mode-hook 'set-emacs-state)
(add-hook 'magit-log-mode-hook 'set-emacs-state)
;; (add-hook 'slime-repl-mode-hook 'set-emacs-state)
(add-hook 'sldb-mode-hook 'set-emacs-state)

;; use emacs mode in slime debugger (TODO what is the correct mode name?)
(add-hook 'xref--xref-buffer-mode 'xref-mode-hook)

(defun xref-mode-hook ()
  (define-key xref--xref-buffer-mode-map (kbd "/") 'evil-forward-search))
