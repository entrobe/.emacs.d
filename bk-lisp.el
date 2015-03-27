(setq bk-lisp-modes
      '(emacs-lisp-mode
        lisp-mode
        clojure-mode))

(defun add-lisp-hook (func)
    (add-hooks bk-lisp-modes func))

(require 'smartparens)
(require 'smartparens-config)

(smartparens-global-mode t)
(add-lisp-hook 'smartparens-strict-mode)

(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-S-<right>") 'sp-backward-barf-sexp)
(define-key sp-keymap (kbd "C-S-<left>") 'sp-backward-slurp-sexp)

(define-key sp-keymap (kbd "M-s") 'sp-unwrap-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(sp-pair "(" nil :bind "M-(")

(show-smartparens-global-mode t)




