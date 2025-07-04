Opened 2024-06-25


# nushell
A new type of cross-platform shell
Installed on Toshiba AND Lenovo (today 2024-06-25)

# configure

-> $nu.config-path

# usage
->% nu .

-> ls | where type == "dir" | sort-by modified --reverse


# using which 

which alacritty                                                               06/25/2024 04:27:31 PM

╭───┬───────────┬──────────────────────────────────────────┬──────────╮

│ # │  command  │                   path                   │   type   │

├───┼───────────┼──────────────────────────────────────────┼──────────┤

│ 0 │ alacritty │ C:\Program Files\Alacritty\alacritty.exe │ external │

╰───┴───────────┴──────────────────────────────────────────┴──────────╯



# sort by name
-> ls | sort



# list directories by size - ncdu replacement

->%  ls -d|where type == dir|sort-by size|reverse|format filesize GB size

(can take a short while)


# stats 

->% if $nu.history-enabled { open $nu.history-path | lines | uniq --count | sort-by --reverse count | first 5 | rename command amount } else { print --stderr "History is disabled!" }
