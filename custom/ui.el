;; ui.el --- Setting up the UI

;;; Commentary:

;;; Code:

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq ring-bell-function 'ignore)
(setq require-final-newline t)

(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(global-auto-revert-mode t)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'linum-mode)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(scroll-bar-mode -1)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(menu-bar-mode -1)
(show-paren-mode t)

(diminish 'undo-tree-mode)

(cond
 ((eq system-type 'darwin)
  (set-frame-font "Envy Code R 15"))
 ((eq system-type 'gnu/linux)
  (set-frame-font "Source Code Pro 11")))

(use-package atom-one-dark-theme :ensure t)
(use-package zenburn-theme :ensure t)
(use-package solarized-theme
  :ensure t
  :config
  (setq solarized-high-contrast-mode-line t)
  (setq solarized-use-more-italic t)
  (setq x-underline-at-descent-line t))
(use-package spacemacs-theme :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package dracula-theme :ensure t)

(load-theme 'spacemacs-dark)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'utf-8)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-spacemacs-theme))


;;; Old mode line
;; (use-package all-the-icons :ensure t)

;; (use-package spaceline
;;   :ensure t
;;   :config
;;   (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

;; (use-package spaceline-config
;;   :ensure spaceline
;;   :config
;;   (setq-default
;;    powerline-height 50
;;    powerline-default-separator 'utf-8))

;; ;; Stolen from:
;; ;; https://github.com/domtronn/all-the-icons.el/wiki/Spaceline
;; (spaceline-define-segment
;;     ati-mode-icon "An `all-the-icons' segment for the current buffer mode"
;;     (let ((icon (all-the-icons-icon-for-buffer)))
;;       (unless (symbolp icon) ;; This implies it's the major mode
;;         (propertize icon
;;                     'help-echo (format "Major-mode: `%s`" major-mode)
;;                     'display '(raise 0.0)
;;                     'face `(:height 1.0 :family ,(all-the-icons-icon-family-for-buffer) :inherit)))))

;; (spaceline-install
;;   'main
;;   '(
;;     ((buffer-modified) :face highlight-face)
;;     ((remote-host buffer-id) :face highlight-face)
;;     (process :when active)
;;     )
;;   '(
;;     (line-column :when active)
;;     (version-control :when active)
;;     ((ati-mode-icon) :face default-face)
;;     )
;;   )

(provide 'ui)

;;; ui.el ends here
