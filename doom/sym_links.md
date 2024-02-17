Opened 2024-02-15



# abbrev_defs
ln -s ~/PORTABLE_ENV/doom/abbrev_defs ~/.emacs.d/abbrev_defs

# my headings config.el file

ln -s ~/PORTABLE_ENV/doom/dot_e_m_l_o_config.el ~/.emacs.d/modules/lang/org/config.el

OR
just replace the unwanted, default lines with:

(setq org-todo-keywords
        '((sequence
           "TODO(t)"        ; A task that needs doing & is ready to do
           "PROJ(p)"        ; A project, which usually contains other tasks
           ;"LOOP(r)"       ; A recurring task
           "STRT(s)"        ; A task that is in progress
           "WAIT(w)"        ; Something external is holding up this task
           ;;"HOLD(h)"      ; This task is paused/on hold because of me
           "HAPPENING(h)"   ; This task is happening
           "REPEAT(r)"      ; This task is recurring
           "READING(g)"     ; To promote my renascent reading habit
           "MAINTENANCE(m)" ; For House and IT
           "IDEA(i)"        ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d)"        ; Task successfully completed
           "KILL(k)")       ; Task was cancelled, aborted or is no longer applicable
          (sequence
