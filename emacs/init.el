;; This is a basic init.el file for plain emacs. Save it in ~/.emacs.d/init.el 
;; The packages herein are
;; use-package, which-key and evil as of 2022-12-13_17:18 

(require 'package)

;; include melpa packages 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; use-package 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; evil [ vim mode for emacs ]
(use-package evil
  :ensure t
  :init
  (evil-mode))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.                                                                                                                              
 ;; If you edit it by hand, you could mess it up, so be careful.                                                                                                           
 ;; Your init file should contain only one such instance.                                                                                                                  
 ;; If there is more than one, they won't work right.                                                                                                                      
'(package-selected-packages '(evil which-key use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.                                                                                                                                  
 ;; If you edit it by hand, you could mess it up, so be careful.                                                                                                           
 ;; Your init file should contain only one such instance.                                                                                                                  
 ;; If there is more than one, they won't work right.                                                                                                                      
 '(default ((t (:inherit nil :extend nil :stipple nil :background "unspecified-bg" :foreground "unspecified-fg" :inverse-video nil :box nil :strike-through nil :overline \
nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "Noto Sans Pro")))))
