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
  (envrc-global-mode))

;; --- language specific packages ---

;; nix
(use-package nix-mode
  :mode "\\.nix\\'")

;; python
(use-package python-mode)

;; rust
(use-package rust-mode)

;; haskell
(use-package haskell-mode)

;; ----------------------------------

;; theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox t))

;; use Iosevka at 14pt size
(add-to-list 'default-frame-alist
	     '(font . "Iosevka-14"))

;; disable splash-screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)

;; disable tool bar and menu bar, and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; show column number next to line number
(setq column-number-mode t)

;; display relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
