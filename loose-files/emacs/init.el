(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file)

;; add MELPA package list
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; enable use-package, installed from nix in this case
(require 'use-package)
;; always ensure packages listed below are installed
(setq use-package-always-ensure t)

;; git client
(use-package magit)

;; completion
(use-package company
  :config
  (global-company-mode))

;; for direnv
(use-package envrc
  :config
  (envrc-global-mode)
  (add-hook 'envrc-mode-hook
	    (lambda ()
	      (when (getenv "PATH")
		(setq-local exec-path
			    (append (parse-colon-path (getenv "PATH"))
				    (list exec-directory)))))))

;; the dark side
(use-package evil
  :config
  (evil-mode 1))

;; required for evil
(use-package goto-chg)

;; lsp mode
;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (
;;     (rust-mode . lsp-deferred)
;;     (python-mode . lsp-deferred)
;;     ;; if you want which-key integration
;;     (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   (setq lsp-response-timeout 10)
;;   :commands lsp)

;; lsp-ui
;; (use-package lsp-ui)

(use-package eglot
  :hook
  (python-mode . eglot-ensure)
  (rustic-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
	       '(python-mode . ("ty" "server"))))

;; flycheck for lsp-mode
;; (use-package flycheck
;;   :config
;;   (add-hook 'after-init-hook #'global-flycheck-mode))

;; --- language specific packages ---

;; nix
(use-package nix-mode
  :mode "\\.nix\\'")

;; python
(use-package python-mode)

;; rust
(use-package rustic
  :config
  (setq rustic-lsp-client 'eglot)
  (setq rustic-format-on-save t)
  :custom
  (rustic-cargo-use-last-stored-arguments t))

;; haskell
(use-package haskell-mode)

;; plantuml mode
(use-package plantuml-mode
  :after envrc
  :mode "\\.plantuml\\'"
  :config
  (setq plantuml-executable-path "plantuml")
  (setq plantuml-default-exec-mode 'executable))

;; ----------------------------------

;; theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox t))

;; additional solarized theme for whenever i want a nice light theme
(use-package solarized-theme)

;; use Iosevka at 14pt size
(add-to-list 'default-frame-alist
	     '(font . "Iosevka-14"))

;; disable splash-screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)

;; disable tool bar, menu bar and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; show column number next to line number
(setq column-number-mode t)

;; display relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

