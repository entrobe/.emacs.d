;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;;(load-theme 'solarized-dark t)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Tab indentation is a disease; a cancer of this planet.
(set-default 'indent-tabs-mode nil)

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)
;; Default indentation
(setq-default tab-width 4)
;; Javascript
(setq-default js2-basic-offset 2)
;; JSON
(setq-default js-indent-level 2)
;; Coffeescript
(setq coffee-tab-width 2)
;; Typescript
(setq typescript-indent-level 2
      typescript-expr-indent-offset 2)
;; Python
(setq-default py-indent-offset 2)
;; XML
(setq-default nxml-child-indent 2)
;; Default formatting style for C based modes
(setq c-default-style "java")
(setq-default c-basic-offset 2)

;; I mean, _seriously_...
(setq sentence-end-double-space nil)

(provide 'bk-codestyle)
