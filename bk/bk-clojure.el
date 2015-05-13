(defvar my-clojure-packages '(clojure-mode
                              cider))

(dolist (p my-clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))

(eval-after-load "clojure-mode" '(require 'cider))
