(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

(use-package linum-relative
  :ensure t
  :config
  (linum-relative-on))

(provide 'core)
