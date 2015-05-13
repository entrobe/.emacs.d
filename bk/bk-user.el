;; fix the PATH variable for GUI launcher
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 20) (height . 20)))

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;;(load-theme 'solarized-dark t)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; better window movements
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-;") 'ace-jump-mode)

;;helm
(global-set-key (kbd "C-M-z") 'helm-mini)

;;disable yas in term mode
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))

;;projectile
(projectile-global-mode)
