;; This is a basic init.el file for plain emacs. Save it in ~/.emacs.d/init.el 
;; The packages herein are
;; use-package, which-key and evil as of 2022-12-13_17:18 
;; the theme is gruvbox from packages-install from Melpa
 
(package-initialize)
 
(require 'package)
 
;; include melpa packages 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
 
;; ========================== PACKAGES ===============================
;; use-package 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
 
;; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode))
 
; evil [ vim mode for emacs ]
(use-package evil
  :ensure t
  :init
  (evil-mode))
 
;; ensure theme (gruvbox) is loaded 
(add-hook 'after-init-hook (lambda () (load-theme 'gruvbox)))
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruvbox)))
 '(custom-safe-themes
   (quote
    ("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" default)))
 '(package-selected-packages (quote (gruvbox-theme evil which-key use-package))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
