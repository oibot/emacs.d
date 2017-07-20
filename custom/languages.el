;; CLOJURE

(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'show-paren-mode))

(use-package cider
  :ensure t
  :config
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

(use-package clj-refactor
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'(lambda ()
                                   (clj-refactor-mode t)
                                   (cljr-add-keybindings-with-prefix "C-c C-m")
                                   (yas-minor-mode t))))

(use-package clojure-cheatsheet
  :ensure t)

(provide 'languages)
