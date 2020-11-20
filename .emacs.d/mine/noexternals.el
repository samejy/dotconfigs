;; no externals - config for native emacs

(server-start)

(global-hl-line-mode)

(set-face-attribute  'mode-line
                 nil
                 :foreground "gray80"
                 :background "gray25"
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil
                 :foreground "gray30"
                 :background "white"
                 :box '(:line-width 1 :style released-button))

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'winner-mode) (winner-mode 1))

(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 100)

;; don't ask about adding tags tables when moving to another
;; directory which has its own tags file
(setq tags-add-tables nil)

(setq backup-directory-alist
    `(("." . ,(concat user-emacs-directory "backups"))))

;; make dired use same buffer when moving between directories
;; but this doesn't seem to work?
(put 'dired-find-alternate-file 'disabled nil)

(setq-default indent-tabs-mode nil)

(setq truncate-lines nil)

;; this does work
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    ;; use find-alternate-file instead of dired-up-directory
    ;; to open it in the same buffer
    (lambda () (interactive) (find-alternate-file "..")))))
