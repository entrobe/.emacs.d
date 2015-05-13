(defun add-hooks (modes func)
  (dolist (mode modes)
        (add-hook (intern (concat (symbol-name mode) "-hook")) func)))

(provide 'bk-defuns)
