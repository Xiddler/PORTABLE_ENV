;;; package --- Summary
;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
;;; Code:
;;; Commentary:
;; To install a package in Doom that does not come with default Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; NOTE: (Added by Donagh McCarthy on 2022-12-13) . Doom has it's own packages. Install packages from melpa using this file - like rec-mode below.
;; NOTE: (Added by Donagh McCarthy on 2022-06-23). doom uses packages.el to install packages that doom-emacs doesn't have access to
;; NOTE: doom-private-dir: Where your private configuration is located --> "/home/donagh/.doom.d/" (SPC f p )
;;
;;Example of use of packages.el and config.el
;; in doom-private-dir/packages.el the following will "ask" doom sync to fetch the package
;; UNCOMMENT (package! subtitle-mode :recipe (:local-repo "subtitle-mode"))
;; in doom-private-dir/config.el
;; check use-package documentation to associate the mode with srt files if necessary
;; UNCOMMENT (use-package subtitle-mode)
;; and then doom sync
;;
;; To fetch directly from github :
;; UNCOMMENT (package! subtitle-mode :recipe (:host github :repo "naokiri/subtitle-mode"))



;; Full example of getting a github package into doom emacs (2020)

    ;; Clone subtitle-mode to ~/.doom.d/lisp/subtitle-mode
    ;; Add this to ~/.doom.d/packages.el:

;; UNCOMMENT  (package! subtitle-mode
  ;; UNCOMMENT :recipe (:local-repo "lisp/subtitle-mode" :no-byte-compile t))

    ;; Run doom sync
    ;; Restart Emacs


;; Second example of getting a github package into doom emacs (2019)

;; in ~/.doom.d/packages.el
;; UNCOMMENT  (package! ttl-mode
  ;; UNCOMMENT  :recipe (:host github :repo "jeeger/ttl-mode"))

;; in ~/.doom.d/config.el
;; UNCOMMENT  (use-package! ttl-mode
  ;; UNCOMMENT  :mode "\\.n3$"
  ;; UNCOMMENT  :mode "\\.ttl$")



;; package! is specific to doom (it registers the package so that subsequent doom sync fetch and builds the package).
;; It does the downloading, and only downloading following the recipe in the macro

;; use-package configures the package, optionally including downloading the package.

;; webref: https://github.com/doomemacs/doomemacs/issues/3842


;; ;; One line that is uncommented is at the very end - (provide 'packages)
;; This will allow doom sync to search this file for packages to install


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
;; EXAMPLE
; (package! rec-mode)
;; then doom sync
;; nov.el Major mode for reading novels -https://depp.brause.cc/nov.el/
;; (package! nov.el)

;; The long lost string manipulation tool for emacs
;; https://github.com/magnars/s.el
;; dependency for origami
(package! s)

;; Dash
;; dependency for origami
(package! dash)

;; origami - folding in markdown and other filetypes : https://github.com/gregsexton/origami.el
(package! origami)

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
