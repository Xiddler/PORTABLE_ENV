# FRONTMATTER
various commands to get system info

/home/donagh/PORTABLE_ENV/dotfiles/cheat/.cheat/system_info.md

# architecture

-%> uname -a
Toshiba
Linux donagh-satellitep50c 6.1.187-2-MANJARO #1 SMP PREEMPT_DYNAMIC Fri Sep  4 16:39:01 UTC 2026 x86_64 GNU/Linux

donagh@raspberrypi ~ 1m 40s
❯ uname -a
Linux raspberrypi 6.12.93+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.12.93-1+rpt1 (2026-06-12) aarch64 GNU/Linux

LenManjaro
❯ uname -a
Linux LenManjaro 6.12.108-1-MANJARO #1 SMP PREEMPT_DYNAMIC Sat, 05 Sep 2026 01:29:32 +0000 x86_64 GNU/Linux


Also:
-%> ls /boot
x86 --▷ vmlinuz-6.1-x86_64

## fastfetch

### Toshiba — 2026-09-15 

❯ fastfetch
██████████████████  ████████    donagh@donagh-satellitep50c
██████████████████  ████████    ---------------------------
██████████████████  ████████    OS: Manjaro Linux x86_64
██████████████████  ████████    Host: SATELLITE P50-C (PSPTSE-00L003DU)
████████            ████████    Kernel: Linux 6.1.187-2-MANJARO
████████  ████████  ████████    Uptime: 7 days, 19 hours, 47 mins
████████  ████████  ████████    Packages: 2274 (pacman)[stable], 2 (snap)
████████  ████████  ████████    Shell: zsh 5.9.2
████████  ████████  ████████    Display (CMN15CB): 1920x1080 in 16", 60 Hz [Built-in]
████████  ████████  ████████    Desktop Environment: KDE Plasma 6.7.4
████████  ████████  ████████    Window Manager: KWin (Wayland)
████████  ████████  ████████    WM Theme: Breeze
████████  ████████  ████████    Theme: breeze (BreathLight) [Qt], Breath [GTK2/3]
████████  ████████  ████████    Icons: breeze [Qt], breeze [GTK2/3/4]
                                Font: Noto Sans (10pt) [Qt], Noto Sans (10pt) [GTK2/3/4]
                                Cursor: Breeze (24px)
                                Terminal: tmux 3.7c
                                CPU: Intel(R) Core(TM) i7-5500U (4) @ 3.00 GHz
                                GPU 1: NVIDIA GeForce 930M [Discrete]
                                GPU 2: Intel HD Graphics 5500 @ 0.95 GHz [Integrated]
                                Memory: 2.07 GiB / 7.68 GiB (27%)
                                Swap: 1.28 GiB / 8.80 GiB (14%)
                                Disk (/): 476.54 GiB / 906.86 GiB (53%) - ext4
                                Disk (/run/media/donagh/USB128GB): 34.95 GiB / 114.17 GiB (31%) - ext4 [External]
                                Local IP (wlp7s0): 192.168.1.86/24
                                Battery (PA5184U-1BRS): 100% [AC Connected]
                                Locale: en_US.UTF-8
### LenManjaro — 2026-09-15 

❯ fastfetch
██████████████████  ████████    donagh@LenManjaro
██████████████████  ████████    -----------------
██████████████████  ████████    OS: Manjaro Linux x86_64
██████████████████  ████████    Host: 81MT (Lenovo V145-15AST)
████████            ████████    Kernel: Linux 6.12.108-1-MANJARO
████████  ████████  ████████    Uptime: 1 day, 3 hours, 26 mins
████████  ████████  ████████    Packages: 1541 (pacman)[stable]
████████  ████████  ████████    Shell: zsh 5.9.2
████████  ████████  ████████    Display (CMN15D5): 1920x1080 in 16", 60 Hz [Built-in]
████████  ████████  ████████    Desktop Environment: KDE Plasma 6.7.4
████████  ████████  ████████    Window Manager: KWin (Wayland)
████████  ████████  ████████    WM Theme: Breeze
████████  ████████  ████████    Theme: Breeze (BreathDark) [Qt], Breeze-Dark [GTK2], Breeze [GTK3]
████████  ████████  ████████    Icons: breeze [Qt], breeze [GTK2/3/4]
                                Font: Noto Sans (10pt) [Qt], Noto Sans (10pt) [GTK2/3/4]
                                Cursor: breeze (24px)
                                Terminal: tmux 3.7c
                                CPU: AMD A9-9425 RADEON R5, 5 COMPUTE CORES 2C+3G (2) @ 3.10 GHz
                                GPU: AMD Radeon R5 Graphics [Integrated]
                                Memory: 3.54 GiB / 7.23 GiB (49%)
                                Swap: 612.21 MiB / 8.80 GiB (7%)
                                Disk (/): 70.83 GiB / 229.38 GiB (31%) - btrfs
                                Local IP (wlp2s0): 192.168.1.51/24
                                Battery (PABAS0241231): 95% [AC Connected]
                                Locale: en_US.UTF-8

# cat 
$ cat /etc/os-release
$ cat /etc/issue

# lsb

$ lsb_release -a

# with systemd installed

$ hostnamectl

# get the kernel details 

$ uname -a
$ uname -r
$ uname -m


# INXI utility

see $ inxi -h and /or man inxi e.g. $ inxi -u for UUIDS

$ inxi

# hardware

sudo lshw
sudo lshw -short

# cpu

lscpu

# block devices

lsblk

# pci

lspci       # 00:00.0 PCI bridge: Broadcom Limited Device 2711 (rev 10)
            # 01:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host Controller (rev 01)

Most of the above commands use files in the /proc directory to extract system information.


# system monitoring - the state of system at a glance

btop        # cool
glances

# find number of processors on this machine

nproc
4




