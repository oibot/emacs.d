(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

(use-package linum-relative
  :ensure t
  :config
  (linum-relative-on))

(use-package flycheck
  :ensure t
  :commands 'global-flycheck-mode
  :init
  (global-flycheck-mode))

(provide 'core)

;;; core.el ends here
