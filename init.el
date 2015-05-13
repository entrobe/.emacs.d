;; Through victory, my chains are broken

;; When I was a child, I spake as a child,
;; I understood as a child, I thought as a child:
;; but when I became a man, I put away childish things.
;;   -- 1 Corinthians, 13:11
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; backup file settings
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(require 'package)
(dolist (source '(("melpa" . "http://melpa.org/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Add .emacs.d/bk to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "bk"))

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(setq bk-pkgs
      '(bk-defuns
        bk-codestyle
        bk-snippets
        bk-ido
        bk-lisp
        bk-clojure
        bk-jsp
        bk-elixir))

;; Now load other things
(dolist (file bk-pkgs)
  (require file))

(load "~/.emacs.d/user.el")

(defvar my-packages '( idle-highlight-mode
                      find-file-in-project
                      magit
                      scpaste
                      solarized-theme
                      ace-jump-mode
                      popup
                      projectile
                      helm))

(dolist my-packages
  (package-require))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
