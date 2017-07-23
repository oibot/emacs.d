(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq gc-cons-threshold 50000000)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(defvar emacs-root (file-name-directory load-file-name)
  "The root directory of emacs")
(defvar custom-dir (expand-file-name "custom" emacs-root)
  "The directory with my custom tweaks")
(add-to-list 'load-path custom-dir)

(require 'core)
(require 'languages)
(require 'ui)
