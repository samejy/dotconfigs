
;; TODO - try to get tags working properly and consistently for multiple languages
;; Could use global/gtags with ctags backend, but this probably requires compiling global
;; manually.
;; Could just use ctags on it's own but possibly not so good for large projects?

;; https://www.reddit.com/r/emacs/comments/6uhtca/i_use_mx_rgrep_all_the_time_when_helping_me/

(setq ggtags-executable-directory "/usr/bin")

(setq ctags-path "/usr/bin/ctags")

;; ;; create ctags file
;; ;; TODO - walk up dir tree to find .git root and creat tags there?
;; ;; use projectile to find root?
;; (defun ctags-create-tags (dir-name)
;;   "Create ctags tags file"
;;   (interactive "DDirectory: ")
;;   (let ((dir (directory-file-name dir-name)))
;;     (shell-command
;;      ;; TODO - this creates the tags file in the directory of the buffer,
;;      ;; not the root directory selected
;;      (format "%s -f TAGS -e -R %s" ctags-path dir))))

(defun ctags-create-tags ()
  "Create ctags tags file"
  (interactive)
  (let* ((dir (projectile-project-root)))
    (shell-command
     (format "%s -f %sTAGS -e -R %s" ctags-path dir dir))))
