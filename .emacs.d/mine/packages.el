
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defvar required-packages
  '(evil
    evil-leader
    helm
    org
    elpy
    jedi
    epc
    slime
    which-key
    projectile
    powerline
    auto-complete
    whitespace
    key-chord
    airline-themes
    paredit
    ess)
  "list of required packages")

(require 'cl)

(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Refreshing packages ...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
