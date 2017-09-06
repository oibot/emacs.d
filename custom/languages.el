;;; languages.el --- packages that enhance languages
;;
;;; Commentary:
;;
;;; Code:


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
  (add-hook 'clojure-mode-hook
            #'(lambda ()
                (clj-refactor-mode t)
                (cljr-add-keybindings-with-prefix "C-c C-m")
                (yas-minor-mode t))))

(use-package clojure-cheatsheet
  :ensure t)




;; SWIFT

(use-package swift-mode
  :ensure t
  :config
  (use-package flycheck-swift
    :ensure t
    :init
    (setq flycheck-swift-target "arm64-apple-ios10")
    (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS10.2.sdk")
    :config
    (flycheck-swift-setup)))




;; Markdown

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))




;; Python

(use-package elpy
  :ensure t
  :config

  (elpy-enable)

  (use-package company-jedi
    :ensure t
    :config
    (add-to-list 'company-backends 'company-jedi))

  (use-package pyvenv
    :ensure t
    :config
    (setenv "WORKON_HOME" "~/anaconda3/envs/")
    (pyvenv-mode t)))




;; Yaml

(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)))




;; Web

(use-package web-mode
  :ensure t
  :mode "\\.html?\\'")




;; Dockerfile

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")




;; Javascript

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")





(provide 'languages)

;;; languages.el ends here
