(package-require 'ace-jump-mode)

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

(provide 'bk-nav)
