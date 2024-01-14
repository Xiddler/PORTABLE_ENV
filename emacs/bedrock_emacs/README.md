Opened 2024-01-06


# bedrock emacs

https://sr.ht/~ashton314/emacs-bedrock/

## description

This is a minimal Emacs starter kit. Like, really minimal. Here's the short of the philosophy:

    Focus on using default, built-in Emacs behavior

    Yes, we all love our fancy third-party packages. This starter kit focuses on what is built-in to Emacs. Why? Because there are too many good packages and picking and choosing the best is a joy we leave to the user.

    Explain every customization and encourage modification

    The goal of this starter kit is to encourage end-user adaptation and growth. All of the .el files should be legible and, more importantly, justify in plain English the rationale for adding the configuration they do.

    No magic

    We keep things crushingly simple here. That means no fancy loadable modules or whatnot. Everything is as straight-forward as can be.

There are two files of interest: early-init.el and init.el.



## install
(Note: emacs 29.1 or above needs to be installed as a dependency)

Clone this repository wherever. Then you should copy early-init.el, init.el, and (optionally, recommended) extras/ into your ~/.emacs.d/ repository:

git clone https://git.sr.ht/~ashton314/emacs-bedrock
mkdir -p ~/.emacs.d/
cp emacs-bedrock/early-init.el ~/.emacs.d/
cp emacs-bedrock/init.el ~/.emacs.d/
cp -r emacs-bedrock/extras ~/.emacs.d/

Fire up Emacs and you're good to go!

## init.el

I have amended this file so that 

evil-mode is enabled
key-chord will be installed to allow 'jk' to switch to normal state


