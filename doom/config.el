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
(setq doom-font (font-spec :family "Source Code Pro" :size 20))
;; use avy search in all windows
;;; Code:
(setq avy-all-windows t)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;;; Code:
(setq doom-theme 'doom-solarized-dark)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org-mode/org/")
;; (setq org-directory "~/PORTABLE_ENV/doom/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
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
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;;; config.el ends here
