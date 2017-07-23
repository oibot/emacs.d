;;; languages.el --- packages that enhance languages
;;
;;; Commentary:
;;
;;; Code:


;; CLOJURE

;; TODO: Put hooks in the use-package of target (https://github.com/jwiegley/use-package/issues/228)
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
    :defer
    :init
    (setq flycheck-swift-target "arm64-apple-ios10")
    (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS10.2.sdk")
    :config
    (flycheck-swift-setup)))



(provide 'languages)

;;; languages.el ends here
