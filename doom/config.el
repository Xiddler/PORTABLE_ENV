;;; package --- Summmary
;;; Commentary:
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;; Code:
(setq user-full-name "Donagh McCarthy"
      user-mail-address "xiddler@gmail.com")
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 20))
;;; Code:
;; (setq doom-font (font-spec :family "Source Code Pro" :size 20))
(setq doom-font (font-spec :family "Liberation Mono" :size 20))
;; use avy search in all windows
;;; Code:
(setq avy-all-windows t)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;;; Code:
;; (setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'tsdh-dark)

;;; org-roam
(setq org-roam-directory "~/org-roam")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org-mode/org/")
;; (setq org-directory "~/PORTABLE_ENV/doom/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; Donaghs - the following keybinding *did* work. :n indicates normal mode
(map! :n "Q" 'org-babel-execute-src-block ) ;; Quantify!
(map! :n "SPC d" 'treemacs ) ;; Directory for files / folders
(map! :n "tt" 'org-todo )
(map! :n "ts" 'org-schedule )
(map! :n "SPC a" 'org-agenda )
(map! :n "SPC w SPC" 'save-buffer )
(map! :n "SPC s SPC" 'save-buffer ) ;; even simpler than w
(map! :n "SPC j" 'outline-next-visible-heading )
(map! :n "SPC k" 'outline-previous-visible-heading )
(map! :n "SPC l" 'org-insert-link )


;; To refresh config.el --> C-h r r
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;; More Donaghs
(setq message-kill-buffer-on-exit t)

;; (require 'neotree)
(setq neo-window-fixed-size nil)
(provide 'config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#00212B" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(custom-safe-themes
   (quote
    ("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default)))
 '(fci-rule-color "#405A61")
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(objed-cursor-color "#dc322f")
 '(package-selected-packages (quote (org-projectile treemacs-projectile)))
 '(pdf-view-midnight-colors (cons "#839496" "#002b36"))
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(vc-annotate-background "#002b36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#859900")
    (cons 40 "#959300")
    (cons 60 "#a58e00")
    (cons 80 "#b58900")
    (cons 100 "#bc7407")
    (cons 120 "#c35f0e")
    (cons 140 "#cb4b16")
    (cons 160 "#cd4439")
    (cons 180 "#d03d5d")
    (cons 200 "#d33682")
    (cons 220 "#d63466")
    (cons 240 "#d9334a")
    (cons 260 "#dc322f")
    (cons 280 "#ba3f41")
    (cons 300 "#994d54")
    (cons 320 "#775b67")
    (cons 340 "#405A61")
    (cons 360 "#405A61")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;;; config.el ends here
