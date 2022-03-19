Opened 2021-12-22
Edited: 2022-01-14 (fresh reinstall)
Edited: 2022-02-22 Added some details


This is a helper file when dealing with a full reinstall like I did in ~Dec 2021~ Jan 2022.

I had a timeshift snapshot but for some reason the kernel and the boot process did not see eye-to-eye.
Now, to do a timeshift restore, install the Manjaro 2022 USB drive as a live Linux, open Timeshift from there and do the restore.

The file /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/full_manjaro_reinstall_Jan2022.md  has notes I took while reinstalling
manjaro over the course of almost 2 days.

I used the following command to archive this file PORTABLE_ENV
rsync -a ~/SD64/full_manjaro_reinstall_Jan2022.md .              NOTE: that the final . is the current folder! and is required for the command
NOTE: maybe add this file to .gitignore. GOOD IDEA.



The only glitch I could not easily fix was caffeine-ng. This is resolved using a KDE utility that "Inhibits automatic sleep and screen locking"

END - 2022-02-22_11:12


