;;; package --- Summary
;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
;;; Code:
;;; Commentary:
;; To install a package in Doom that does not come with default Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; NOTE: (Added by Donagh McCarthy on 2022-06-23). doom does not use packages.el at all - Wait, that's not true, look at rec-mode
;; NOTE: (Added by Donagh McCarthy on 2022-12-13) . Doom has it's own packages. Install packages from melpa using this file - like rec-mode below.

;; The only line that is uncommented is at the very end - (provide 'packages)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
;; EXAMPLE
; (package! rec-mode)
;; then doom sync
;; nov.el Major mode for reading novels -https://depp.brause.cc/nov.el/
(package! nov.el)


;; DONAGHS
;; add theme not available in default doom. Note: remember to call it in config.el
;; (package! spacemacs-theme) ;; it displays the *** in org-mode - yuk

;;
;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;;; ANOTHER EXAMPLE from /home/donagh/.emacs.d/core/packages.el
;; core-packages.el
; (package! straight
;   :type 'core
;   :recipe `(:host github
;             :repo "raxod502/straight.el"
;             :branch ,straight-repository-branch
;             :local-repo "straight.el"
;             :files ("straight*.el"))
;   :pin "e2de88ea0e7ccf9f4846e9e756f86e0dcf469c44")
;; END EXAMPLE

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
(provide 'packages)
;;; packages.el ends here
