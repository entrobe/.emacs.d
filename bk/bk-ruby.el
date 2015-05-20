(package-require 'inf-ruby)
(package-require 'projectile-rails)

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'bk-ruby)
