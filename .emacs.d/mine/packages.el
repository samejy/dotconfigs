
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defvar required-packages
  '(evil
    evil-leader
    general
    which-key
    key-chord
    ; tmux interaction
    emamux
    ; finding/project
    helm
    projectile
    helm-projectile
    helm-flx
    magit
    evil-magit
    ; org mode
    org
    ; haskell
    ;haskell-mode
    ;ghc
    intero
    ; python
    elpy
    ein
    ob-ipython
    ;jedi
    ;epc
    ; lisp
    slime
    paredit
    clojure-mode
    cider
    ; ui
    powerline
;    auto-complete
    whitespace
    company-quickhelp
    helm-company
    ; themes
    color-theme-approximate
    airline-themes
    yoshi-theme
    solarized-theme
    ; R
    ess
    ; C#
    csharp-mode
    omnisharp
    matlab-mode)
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
