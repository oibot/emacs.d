;;; core.el --- Core settings and packages

;;; Commentary:

;;; Code:

(setq gc-cons-threshold 50000000)

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      make-backup-files nil)

(setq ispell-program-name "aspell"
      ispell-dictionary "deutsch8")

(setq-default
 delete-by-moving-to-trash t
 initial-scratch-message ""
 select-enable-clipboard t
 sentence-end-double-space nil)

(use-package flyspell-correct
  :defer t
  :ensure t)

(use-package ranger
  :commands (ranger-override-dired-mode)
  :init (ranger-override-dired-mode t)
  :ensure t)

(use-package linum-relative
  :ensure t
  :config
  (linum-relative-on))

(use-package flycheck
  :ensure t
  :commands 'global-flycheck-mode
  :init
  (global-flycheck-mode))

(use-package ace-window
  :init (setq aw-dispatch-always t)
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package counsel
  :ensure t
  :diminish ivy-mode
  :bind
  ("C-s" . swiper)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-c k" . counsel-ag)
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package avy
  :ensure t
  :config
  (setq avy-background t))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-enable-caching t)
  :diminish projectile-mode
  :config
  (projectile-mode 1)

  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-on)))

(use-package beacon
  :ensure t
  :diminish beacon-mode
  :config
  (beacon-mode))

(use-package company
  :ensure t
  :diminish ""
  :config
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 3)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20))

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config (exec-path-from-shell-initialize))

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character))

(use-package iedit
  :ensure t)

(use-package neotree
  :defer t
  :ensure t
  :init
  (setq
   neo-theme (if (display-graphic-p) 'icons 'arrow)
   neo-autorefresh t
   neo-smart-open t
   neo-force-change-root t
   neo-vc-integration '(face char))
  (add-hook 'neotree-mode-hook
	    (lambda ()
	      (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
	      (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package highlight-symbol
  :ensure t
  :diminish ""
  :config
  (setq-default highlight-symbol-idle-delay 1.5))

(use-package try
  :defer t
  :ensure t)

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode t)
  (custom-set-variables '(git-gutter:update-interval 2))
  (git-gutter:linum-setup))

(use-package paredit
  :ensure t)

(use-package langtool
  :ensure t
  :config
  (setq langtool-language-tool-jar "/usr/local/Cellar/languagetool/3.8/libexec/languagetool-commandline.jar"
        langtool-mother-tongue "de"
	langtool-disabled-rules '("WHITESPACE_RULE"
				  "COMMA_PARENTHESIS_WHITESPACE")))

(use-package org
  :ensure t
  :defer t
  :config
  (setq org-directory "~/Nextcloud/org")
  (setq org-agenda-files '("~/Nextcloud/org"))
  (setq org-log-done 'time)

  (setq org-startup-indented t)
  (setq org-startup-with-inline-images t)
  (setq org-startup-with-latex-preview nil)
  (plist-put org-format-latex-options :scale 1.5)
  (setq org-src-fontify-natively t)

  (use-package ob-ipython
    :ensure t)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((clojure . t)
     (emacs-lisp . t)
     (ditaa . t)
     (python . t)
     (ipython . t)))
  (setq org-babel-clojure-backend 'cider)
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-window-setup 'current-window)

  (add-hook 'org-mode-hook (lambda ()
                             (setq fill-column 90)
                             (turn-on-auto-fill)))

  (setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.10/libexec/ditaa0_10.jar")

  (use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

  (use-package ox-reveal
    :ensure t
    :config
    (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0"))

  (use-package org-journal
    :ensure t
    :init
    (setq org-journal-dir "~/Nextcloud/org/journal")))

(use-package rainbow-mode
  :ensure t
  :diminish rainbow-mode
  :commands rainbow-mode
  :init
  (add-hook 'prog-mode-hook #'rainbow-mode))

(use-package rainbow-delimiters
  :ensure t)

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
      "a" 'avy-goto-word-1
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
      "n" 'neotree-toggle
      ;; ace-window
      "w" 'ace-window))

  (use-package evil-commentary
    :ensure t
    :diminish evil-commentary-mode
    :config
    (evil-commentary-mode t)))

(provide 'core)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; core.el ends here
