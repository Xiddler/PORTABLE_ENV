;;; package --- Summary
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; Commentary:
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

;; disable org-roam warning ref version2 - added 2021-10-11
;; (setq org-roam-v2-ack t)


;; use avy search in all windows
;;; Code:
(setq avy-all-windows t)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;;; Code:
;; (setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'tsdh-dark )


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/all_org/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
(setq display-line-numbers-type t)

;; use for SLIME lisp
(setq inferior-lisp-program "sbcl")
;; Emacs by default syncs with the system clipboard when cutting or pasting text.
;; This can be really annoying if you do things like paste from the clipboard after a c w in normal mode,
;; because the clipboard will be overwritten before you can paste its contents. The following line should disable this behavior:
(setq select-enable-clipboard nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to this file.
;;      Emacs searches the `load-path' when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; Donaghs - the following keybinding *did* work. :n indicates normal mode
(map! :n "Q" 'org-babel-execute-src-block ) ;; Quantify! or Execute snippet!
(map! :n "SPC d" 'treemacs ) ;; Tree directory for files / folders
(map! :n "tt" 'org-todo )
(map! :n "ts" 'org-schedule )
(map! :n "SPC a" 'org-agenda )
(map! :n "SPC w SPC" 'ido-kill-buffer )
(map! :n "SPC s SPC" 'save-buffer ) ;; even simpler than w
(map! :n "SPC j" 'outline-next-visible-heading )
(map! :n "SPC k" 'outline-previous-visible-heading )
(map! :n "SPC l" 'org-insert-link )
(map! :n "SPC z" '+org/close-all-folds ) ;; z M is such a pain
(map! :n "SPC c SPC" 'calendar) ;; quick calendar
;; (map! :n "SPC v" 'org-agenda) ;; view org-agenda next 14 days

;; change the symbol on collapsed headings
;; (setq org-ellipsis " ▼ ")

;; (after! org
;;   (setq org-hide-leading-stars t
;;         org-startup-indented t))

;; Function to create new scratch buffer in Org

;; ref: https://emacs.stackexchange.com/questions/16492/is-it-possible-to-create-an-org-mode-scratch-buffer

;;(defun org-buffer-new ()
;;"Create a new scratch buffer -- \*hello-world\*"
;;(interactive)
 ;; (let ((n 0)
  ;;      bufname buffer)
   ;; (catch 'done
    ;;  (while t
     ;;   (setq bufname (concat "*org-scratch"
      ;;    (if (= n 0) "" (int-to-string n))
       ;;     "*"))
        ;;(setq n (1+ n))
       ;; (when (not (get-buffer bufname))
        ;;  (setq buffer (get-buffer-create bufname))
         ;; (with-current-buffer buffer
          ;;  (org-mode))
          ;; When called non-interactively, the `t` targets the other window (if it exists).
          ;;(throw 'done (display-buffer buffer t))) ))))

  ;; SPC x is the default doom new scratch buffer key binding
  ;;(global-set-key (kbd "C-c x") 'org-buffer-new)



;; THE FOLLOWING LINES COPIED FROM THE FILE ~/.emacs.d/modules/lang/org/config.el
;; but placed here in case I need it after a new emacs install
;; The only change is that I have added REPT status
;; HACK Face specs fed directly to `org-todo-keyword-faces' don't respect
;;      underlying faces like the `org-todo' face does, so we define our own
;;      intermediary faces that extend from org-todo.
   ;; (with-no-warnings
     ;; (custom-declare-face '+org-todo-active  '((t (:inherit (bold font-lock-constant-face org-todo)))) "")
     ;; (custom-declare-face '+org-todo-project '((t (:inherit (bold font-lock-doc-face org-todo)))) "")
     ;; (custom-declare-face '+org-todo-onhold  '((t (:inherit (bold warning org-todo)))) ""))
   ;; (setq org-todo-keywords
     ;;     '((sequence
     ;;        "TODO(t)"  ; A task that needs doing & is ready to do
     ;;        "PROJ(p)"  ; A project, which usually contains other tasks
     ;;        "STRT(s)"  ; A task that is in progress
     ;;        "WAIT(w)"  ; Something external is holding up this task
     ;;        "HOLD(h)"  ; This task is paused/on hold because of me
     ;;        "REPT(r)" ; Task repeates monthly or annually like Car Tax
     ;;        "|"      ; Items before the bar are active and show up in Org Agenda
        ;;        "DONE(d)"  ; Task successfully completed
            ;; "KILL(k)"); Task was cancelled, aborted or is no longer applicable
           ;; (sequence
            ;; "[ ](T)"   ; A task that needs doing
            ;; "[-](S)"   ; Task is in progress
            ;; "[?](W)"   ; Task is being held up or paused
            ;; "|"
            ;; "[X](D)")) ; Task was completed
         ;; org-todo-keyword-faces
         ;; '(("[-]"  . +org-todo-active)
           ;; ("STRT" . +org-todo-active)
           ;; ("[?]"  . +org-todo-onhold)
           ;; ("WAIT" . +org-todo-onhold)
           ;; ("HOLD" . +org-todo-onhold)
           ;; ("PROJ" . +org-todo-project)
           ;; ("REPT" . +org-todo-project)))
   
;; To refresh config.el --> C-h r r
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; More Donaghs
(setq message-kill-buffer-on-exit t)

;; org-roam dependencies - ref https://www.ianjones.us/own-your-second-brain
; (require 'company-org-roam)
    ; (use-package company-org-roam
      ; :when (featurep! :completion company)
      ; :after org-roam
      ; :config
      ; (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))

; (use-package org-journal
      ; :bind
      ; ("C-c n j" . org-journal-new-entry)
      ; :custom
      ; (org-journal-dir "~/org-roam/")
      ; (org-journal-date-prefix "#+TITLE: ")
      ; (org-journal-file-format "%Y-%m-%d.org")
      ; (org-journal-date-format "%A, %d %B %Y"))
    ; (setq org-journal-enable-agenda-integration t)


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
   '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default))
 '(fci-rule-color "#405A61")
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(objed-cursor-color "#dc322f")
 '(package-selected-packages '(latex-pretty-symbols org-projectile treemacs-projectile))
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
