;;; core.el --- Core settings and packages

;;; Commentary:

;;; Code:

(setq gc-cons-threshold 50000000)

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

;; Evil:

  (use-package evil
    :ensure t
    :config
    (evil-mode t)

    (setq evil-emacs-state-cursor  '("red" box))
    (setq evil-normal-state-cursor '("gray" box))
    (setq evil-visual-state-cursor '("gray" box))
    (setq evil-insert-state-cursor '("gray" bar))
    (setq evil-motion-state-cursor '("gray" box))

    (use-package evil-surround
      :ensure t
      :config
      (global-evil-surround-mode 1))

    (use-package evil-leader
      :ensure t
      :config
      (global-evil-leader-mode)
      (evil-leader/set-leader "<SPC>")
      (evil-leader/set-key
        ;; avy
        "a1" 'avy-goto-char
        "a2" 'avy-goto-char-2
        "at" 'avy-goto-char-timer
        "al" 'avy-goto-line
        "aw" 'avy-goto-word-1
        ;; paredit
        "pw)" 'paredit-wrap-round
        "pw]" 'paredit-wrap-square
        "pw}" 'paredit-wrap-curly
        "pfs" 'paredit-forward-slurp-sexp
        "pbs" 'paredit-backward-slurp-sexp
        "pfb" 'paredit-forward-barf-sexp
        "pbb" 'paredit-backward-barf-sexp
        ;; windmove
        "h" 'windmove-left
        "j" 'windmove-down
        "k" 'windmove-up
        "l" 'windmove-right
        ;; neotree
        "n" 'neotree-toggle))

    (use-package evil-commentary
      :ensure t
      :diminish evil-commentary-mode
      :config
      (evil-commentary-mode t)))

(provide 'core)

;;; core.el ends here
