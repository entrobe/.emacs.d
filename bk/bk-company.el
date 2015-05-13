(package-require 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-z") 'company-complete)

(provide 'bk-company)
