;;; Personal configuration -*- lexical-binding: t -*-
;;; made by https://emacs.amodernist.com/generate 

;; Save the contents of this file under ~/.emacs.d/init.el
;; Do not forget to use Emacs' built-in help system:
;; Use C-h C-h to get an overview of all help commands.  All you
;; need to know about Emacs (what commands exist, what functions do,
;; what variables specify), the help system can provide.

;; Load a custom theme
;; Requires Emacs 29
;; (load-theme 'leuven-dark t)

;; Set default font face
(set-face-attribute 'default nil :font "Liberation Mono 20")

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; Completion framework
(unless (package-installed-p 'vertico)
  (package-install 'vertico))

;; Enable LSP support by default in programming buffers
(vertico-mode t)

;; Enable line numbering in `prog-mode'
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Automatically pair parentheses
(electric-pair-mode t)

;; Git client
(unless (package-installed-p 'magit)
  (package-install 'magit))

;; Bind the `magit-status' command to a convenient key.
(global-set-key (kbd "C-c g") #'magit-status)

;; Indication of local VCS changes
(unless (package-installed-p 'diff-hl)
  (package-install 'diff-hl))

;; Enable `diff-hl' support by default in programming buffers
(add-hook 'prog-mode-hook #'diff-hl-mode)

;; Markdown support
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;; Outline-based notes management and organizer
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)

;; Additional Org-mode related functionality
(unless (package-installed-p 'org-contrib)
  (package-install 'org-contrib))

;; Vim Emulation
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Miscellaneous options
(setq major-mode (lambda () ; guess major mode from file name
                   (unless buffer-file-name
                     (let ((buffer-file-name (buffer-name)))
                       (set-auto-mode)))))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
