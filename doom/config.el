;;; package --- Summary
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; To refresh config.el --> C-h r r

;;; Commentary:
;; Place your private configuration here!
;; Remember, you do not need to run 'doom sync' after modifying this file!
;; DM - I use this file mainly for adding new key-bindings


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
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 20))
;;; Code:
;;; The fonts have to be available: fc-cache -l
;; (setq doom-font (font-spec :family "Source Code Pro" :size 20))
(setq doom-font (font-spec :family "Liberation Mono" :size 20))
;; Needs to be installed from PORTABLE_ENV
;;
;; org-capture - locations for captures
;;
;; (setq org-capture-templates
      ;; '(("t" "Todo" entry (file+headline "~/zArchive/Todo.org" "00 INBOX")
         ;; "* TODO %? \n %i ")
        ;; ("n" "Story Note" entry (file+headline "writing/story_note.org" "Story Inbox")
         ;; "* %?  \n  %i\n  %a ")))
         ;;
         ;
;;see https://orgmode.org/manual/Capture-templates.html
(setq org-capture-templates
      '(("u" "Todo" entry (file+headline "~/DONAGHS/personal/6_Ur_Journal.org" "Items")
         "* %?\n  %i\n  %a")
        ("v" "Ur_Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

;; Improve org mode looks : https://lucidmanager.org/productivity/ricing-org-mode/ :: added 2023-08-02
(setq org-startup-indented t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300))

;; added 2023-04-07
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
;; abbrev-mode
;; (setq abbrev-mode t)

;;
;;(setq org-todo-keywords
;;   '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
;;      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))
;;
;; For actual keywords I was using /home/donagh.emacs.d/modules/lang/org/config.el WRONGLY
;; (setq org-todo-keywords
;;         '((sequence
;;            "TODO(t)"  ; A task that needs doing & is ready to do
;;            "PROJ(p)"  ; A project, which usually contains other tasks
;;            ;"LOOP(r)"  ; A recurring task
;;            "STRT(s)"  ; A task that is in progress
;;            "WAIT(w)"  ; Something external is holding up this task
;;            ;"HOLD(h)"  ; This task is paused/on hold because of me
;;            "HAPPENING(h)"  ; This task is happening
;;            "REPEAT(r)"  ; This task is recurring
;;            "READING(g)"  ; To promote my renascent reading habit
;;            "MAINTENANCE(m)"  ; For House and IT
;;            "IDEA(i)"  ; An unconfirmed and unapproved task or notion
;;            "|"
;;            "DONE(d)"  ; Task successfully completed
;;            "KILL(k)") ; Task was cancelled, aborted or is no longer applicable
;;           (sequence
;;            "[ ](T)"   ; A task that needs doing
;;            "[-](S)"   ; Task is in progress
;;            "[?](W)"   ; Task is being held up or paused
;;            "|"
;;            "[X](D)")  ; Task was completed
;;           (sequence
;;            "|"
;;            "OKAY(o)"
;;            "YES(y)"
;;            "NO(n)"))
;;         org-todo-keyword-faces
;;         '(("[-]"  . +org-todo-active)
;;           ("STRT" . +org-todo-active)
;;           ("[?]"  . +org-todo-onhold)
;;           ("WAIT" . +org-todo-onhold)
;;           ("HOLD" . +org-todo-onhold)
;;           ("PROJ" . +org-todo-project)
;;           ("NO"   . +org-todo-cancel)
;;           ("KILL" . +org-todo-cancel)))
(setq org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; A project, which usually contains other tasks
           ;"LOOP(r)"  ; A recurring task
           "STRT(s)"  ; A task that is in progress
           "WAIT(w)"  ; Something external is holding up this task
           ;;"HOLD(h)"  ; This task is paused/on hold because of me
           "HAPPENING(h)"  ; This task is happening
           "REPEAT(r)"  ; This task is recurring
           "READING(g)"  ; To promote my renascent reading habit
           "MAINTENANCE(m)"  ; For House and IT
           "IDEA(i)"  ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d)"  ; Task successfully completed
           "KILL(k)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[X](D)")  ; Task was completed
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)"))
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STRT" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("NO"   . +org-todo-cancel)
          ("KILL" . +org-todo-cancel)))


;;
;; count words
;; no -enable-word-count available for the following. How come?
;; (setq doom-modeline-enable-word-count t)
;; could use M-x count-words g C-g OR higlight region (using V ) and M-= outputs to buffer

;; Emacs dictionary (sudo pamac install  dictionary and restart emacs)
;; For dictionary.el to have a side bar -  mandatory, as the dictionary misbehaves!
;; (setq switch-to-buffer-obey-display-actions t) ;; this function call does not exist in Doom
;; (add-to-list 'display-buffer-alist
   ;; '("^\\*Dictionary\\*" display-buffer-in-side-window
     ;; (side . left)
     ;; (width . 50)))
;; did not work!

;; To make Emacs use your local server instead of a remote one, customize dictionary-server to localhost:
(setq dictionary-server "localhost")
;; worked!

;; Maximize the window upon startup.
(setq initial-frame-alist '((top . 52) (left . 52) (width . 154) (height . 40)))

;; Disable exit confirmation.
(setq confirm-kill-emacs nil) ;; quick exit

;; use zsh in the vterm terminal
(setq vterm-shell "/usr/sbin/zsh")

;; reduce delay on pressing SPC
(setq which-key-idle-delay 0.25)

;; collapse outline when not at heading. See https://github.com/tkf/org-mode/blob/master/lisp/org.el#L963
(setq org-cycle-emulate-tab 'white)

;; use avy search in all windows
(setq avy-all-windows t)

;; THEMES
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;;; Code:
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-ir-black-brighter-comments )
;; (setq doom-theme 'spacemacs-dark )
;;
;; 2022-01-01 current preferred theme:
;;
;; (setq doom-theme 'tsdh-dark )
(setq doom-theme 'doom-acario-dark ) ;; the purple for diary.org is not the nicest otherwise a nice theme
;; (setq doom-theme 'spacemacs-theme-dark ) ;; it keeps the * in org-mode - yuk

;; ORG-DIRECTORY
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/all_org/org")

;; Set which files will be found by org-agenda commands
(setq org-agenda-files (list "/home/donagh/all_org/org/worksearch.org"
                             "/home/donagh/all_org/org/money.org"
                             "/home/donagh/all_org/org/org.org"
                             "/home/donagh/all_org/org/todos.org"))

;; hide emphasis markers in //italic// in org mode. Works!
(setq org-hide-emphasis-markers t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;; (setq display-line-numbers-type t)

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
;;
;; Install use-package because that installs everything else
;; (unless (package-installed-p 'use-package)
  ;; (package-refresh-contents)
  ;; (package-install 'use-package))

;; (require 'use-package)
;;
;;Added 2023-07-10
(defun now ()
  "Insert string for the current time formatted like '2:34 PM' or 1507121460"
  (interactive)                 ; permit invocation in minibuffer
  ;; (insert (format-time-string "%D %-I:%M %p")))
  ;; (insert (format-time-string "%D %-I:%M %p")))
  ;; (insert (format-time-string "%02y%02m%02d%02H%02M%02S")))
  (insert (format-time-string "%02y-%02m-%02d_%02H:%02M")))

(defun today ()
  "Insert string for today's date nicely formatted in American style,
  e.g. Sunday, September 17, 2000 or standard 17-09-2000."
  (interactive)       ; permit invocation in minibuffer
  ;; (insert (format-time-string "%A, %B %e, %Y")))
  (insert (format-time-string "%Y-%m-%d")))

;; (use-package 'origami)
;; (require 'origami)
;; (require 'origami)
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to this file.
;;      Emacs searches the `load-path' when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; DONAGHS KEYBINDINGS
;; The following keybinding *do* work. :n indicates normal mode. :i is insert mode.
(map! :n "Q" '@q) ; shortcut for @q to run a recorded macro
;; (map! :n "Q" 'org-babel-execute-src-block ) ;; Quantify! or Execute snippet!
(map! :n "SPC d" 'treemacs ) ;; Tree directory for files / folders
;; (map! :n "SPC t d" 'treemacs-quit ) ;; Quit treemacs - added 2022-12-17 -- Use SPC b k to kill buffer
(map! :n "tt" 'org-todo )
(map! :n "ts" 'org-schedule )
(map! :n "ta" 'org-agenda )
(map! :n "SPC w w" 'kill-buffer ) ;; like vim
(map! :n "SPC s SPC" 'save-buffer ) ;; even simpler than w, like vim
(map! :n "SPC j" 'outline-next-visible-heading )
(map! :n "SPC k" 'outline-previous-visible-heading )
(map! :n "SPC l" 'org-insert-link )
(map! :n "SPC z" '+org/close-all-folds ) ;; z M is such a pain
(map! :n "SPC c SPC" 'calendar) ;; quick calendar
(map! :n ",c" 'calendar) ;; quick calendar;
(map! :n "j" 'evil-next-visual-line) ;; use j to go down one visual line instead of default
(map! :n "k" 'evil-previous-visual-line) ;; use k to go up one visual line instead of default
(map! :n "SPC i Y" 'clipboard-yank) ;; paste from system clipboard; Note: SPC i y (lowercase) pastes from emacs yank
(map! :n ",p" 'clipboard-yank) ;; paste from system clipboard; Note: SPC i y (lowercase) pastes from emacs yank
(map! :n "E" 'evil-end-of-line)
(map! :n "B" 'evil-beginning-of-line)
(map! :n ",/" 'evil-avy-goto-char) ;; similar to vim-easymotion; also 'avy-goto-char and 'avy-goto-char-2
(map! :n "SPC w 3" 'split-window-right) ;; similar to C-x 3 which is the emacs way and SPC w r is taken
(map! :n "SPC b SPC" 'org-mark-ring-goto) ;; go back to where link started from
(map! :n "SPC s w" 'dictionary-search) ;; use "dict" i.e. Webster's et al. dictionaries (same as -> % dict <word>)
;; (map! :n "z o" 'evil-open-fold) ;; for some reason z o -> +org/open-fold is not functioning - added 2022-12-18
(map! :n "z ;" '+org/toggle-fold) ;; for some reason z o -> +org/open-fold is not functioning - added 2022-12-18
(map! :n "SPC b L" 'bookmark-bmenu-list) ;; list files/locations bookmarked in a buffer. SPC RET to quick access bookmarks
(map! :n "SPC c h" 'org-ctrl-c-ctrl-c) ;; ch for check the box
(map! :i "C-c d" 'today) ;; works 2023-07-10; qq also works
(map! :i "C-c t" 'now) ;; 23-07-10_10:05; qa also works

;; NOTE about jk for esc
;; file --> ~/.emacs.d/modules/editor/evil/config.el
;; 329:        evil-escape-key-sequence "jk"


;; Mappings to change
;; (map! :n "nm" 'display-line-numbers-mode)
;; (map! :n "mf" 'menu-set-font "URW Gothic Book 14" )
;; (map! :n "mt" 'load-theme "doom-homage-white" )
;; try


;; (map! :n "SPC v" 'org-agenda) ;; view org-agenda next 14 days
;;
;;------------------------------------------------
;; abbrev from https://github.com/ymarco/doom-emacs-config/blob/master/abbrevs.el
;;
;; (define-abbrev-table 'org-mode-abbrev-table
;;   '(("html" "HTML" nil :count 0)
;;     ("katex" "KaTeX" nil :count 0)
;;     ("latex" "LaTeX" nil :count 0)
;;     ("mathjax" "MathJax" nil :count 0)
;;     ("pdfl" "=PDFLaTeX=" nil :count 0)
;;     ("polyg" "=polyglossia" nil :count 0)
;;     ("svg" "SVG" nil :count 0)
;;     ("taht" "that" nil :count 1)
;;     ("teh" "the" nil :count 0)
;;     ("tex" "TeX" nil :count 0)
;;     ("tikz" "TikZ" nil :count 0)
;;     ("xel" "=XeLaTeX=" nil :count 0)
;;     ("xetex" "=XeTeX=" nil :count 0)
;;    ))

;; (map! "C-x '"
;;       (cmd! (define-abbrev-table)
;;             ))
;; from https://www.reddit.com/r/emacs/comments/zwmgf6/how_can_i_make_abbreviations_expand_instantly/:w
;; THIS WORKS! 2023-09-06
;;
(defun abbrev-or-insert ()
  (interactive)
  (self-insert-command 1)
  (expand-abbrev))

(define-abbrev-table 'global-abbrev-table
  '(
("HH" "---~" nil :case-fixed t :count 0)
("FOO" "facing our orriblenesses" nil :case-fixed t :count 0)
("goo" "googling green glasses" nil :case-fixed t :count 0)
("ii" "I" nil :case-fixed t :count 0)
(" i " "I" nil :case-fixed t :count 0)

))
;; not sure what this is supposed to do
;; (global-set-key (kbd "SPC y") 'abbrev-or-insert)




;; -----------------------------------
;; Sample function as an example of elisp functionality
;; Keybinding to delete the previous line
;; (map! "C-u"
      ;; (cmd! (previous-line)
            ;; (kill-line)
            ;; (forward-line)))
;; -----------------------------------

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



;; I have now saved this file ~/PORTABLE_ENV/doom/dot_e_m_l_o_config.el and symlinked it to ~/.emacs.d/modules/lang/org/config.el

;; To refresh config.el --> C-h r r
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; More Donaghs
(setq message-kill-buffer-on-exit t)
;;
;;
;; https://github.com/domtronn/all-the-icons.el
;; Instructions to install the fancy icons from the above webref
;; download the above using in doom: M-x all-the-icons-install-fonts
;; add to  $PATH the following: ~/.local/share/fonts and
(when (display-graphic-p)
  (require 'all-the-icons))
;; or
;; (use-package all-the-icons
  ;; :if (display-graphic-p))
  ;;
(all-the-icons-faicon  "cogs")         ;; FontAwesome icon for cogs


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
