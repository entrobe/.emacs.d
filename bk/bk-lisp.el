(setq bk-lisp-modes
      '(emacs-lisp-mode
        lisp-mode
        clojure-mode))

(defun add-lisp-hook (func)
  (add-hooks bk-lisp-modes func))

(package-require 'smartparens)
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

;; Add newline and position cursor appropriately when starting a
;; curly brace block in C like modes

(defun sp--my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-with-modes '(c-mode c++-mode js-mode js2-mode java-mode
                        typescript-mode perl-mode)
  (sp-local-pair "{" nil :post-handlers
                 '((sp--my-create-newline-and-enter-sexp "RET"))))

(show-smartparens-global-mode t)

(provide 'bk-lisp)
