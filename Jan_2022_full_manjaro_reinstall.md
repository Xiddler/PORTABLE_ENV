Opened 2021-01-13
Title: Jan_2022_full_manjaro_reinstall.md



This file is saved on the SD64 card as  Jan_2022_full_manjaro_reinstall.md
It is an update on the Dec_2021 full install

# NOTE: you can speed up downloads by commenting out the following line in /etc/pacman.conf.pacnew
# ParallelDownloads = 5
# to
ParallelDownloads = 10 

# Now to update Manjaro using pacman
sudo pacman -Syyu

# install Nvidia Graphics drivers

In Hardware Configuration right click on the Nvidia card and select Install

 ------------------------------------------------------------------------------
# RECOVER Manjaro

see: cheat reinstall, zim-wiki LINUX:booting Manjaro for ideas on how to proceed.

also: Use a LiveUSB with Timeshift pre-installed e.g. Linux Mint ( I made a new LiveUSB today 2022-01-15 for this purpose)
Open Timeshift and restore from the laptop's /timeshift (yes, it's in root) 


Some issue with the mirror sites... not fixed by me at this point.s

# ------------------------------------------------------------------------------
ATTEMPTED SOLUTIONS
1. Reinstall without deleting everything                <-- DID NOT WORK -->
2. Reinstall selecting option to delete everything      <-- (ABOUT TO DO THIS) This worked. It is now 15.03 on 14/Jan/2022 -->

Note: 
Lines 4 - 446 relate to attempts to reinstall from a Live USB (failed: did a complete clean reinstall 14/Jan/2022)
Lines 446 - End relate to installing personal software preferences


# ------------------------------------------------------------------------------

CLI Commands
sudo fdisk -l
sudo fsck -f /dev/sda SHOULD BE sudo fsck -f /dev/sda2 and sudo fsck -f /dev/sda3 and reboot
I rebooted and it did not boot up. 

To chroot into your system boot a live ISO and apply in a terminal window - but not sure what to do next
sudo manjaro-chroot -a

# ------------------------------------------------------------------------------
System info. referring to https://forum.manjaro.org/t/failed-to-mount-boot-efi/36794/4

inxi -Fza 
sudo parted -l
sudo manjaro-chroot -a
ls /boot/*
mhwd-kernel -li
exit ( end chroot 


sudo manjaro-chroot -a
mhwd-kernel -r linux57
mhwd-kernel -r linux58
mkinitcpio -P
update-grub
exit ( for end chroot )

I think you didn’t create a uefi partition separately for manjaro or your uefi partition with 100mb is not sufficient. 
Go to Manjaro UEFI install guide and refer ’ switching from bios to uefi ’
( to summerize it recommends uefi partition be at least 200mb and ways to create it.)


[manjaro@manjaro ~]$ inxi -Fza 
System:    Kernel: 5.8.16-2-MANJARO x86_64 bits: 64 compiler: N/A 
           parameters: BOOT_IMAGE=/boot/vmlinuz-x86_64 lang=en_US keytable=us tz=UTC driver=free nouveau.modeset=1 
           i915.modeset=1 radeon.modeset=1 misobasedir=manjaro misolabel=MANJARO_KDEM_2012 quiet systemd.show_status=1 
           apparmor=1 security=apparmor 
           Desktop: KDE Plasma 5.19.5 tk: Qt 5.15.1 wm: kwin_x11 dm: SDDM Distro: Manjaro Linux 
Machine:   Type: Laptop System: TOSHIBA product: SATELLITE P50-C v: PSPTSE-00L003DU serial: <filter> 
           Mobo: FF50 model: 06F2 v: Type2 - Board Version serial: <filter> UEFI: INSYDE v: 5.20 date: 01/11/2016 
Battery:   ID-1: BAT1 charge: 28.5 Wh condition: 28.5/31.7 Wh (90%) volts: 15.9/14.4 model: LGC PA5184U-1BRS type: Li-ion 
           serial: N/A status: Full cycles: 7 
CPU:       Topology: Dual Core model: Intel Core i7-5500U bits: 64 type: MT MCP arch: Broadwell family: 6 model-id: 3D (61) 
           stepping: 4 microcode: 2F L2 cache: 4096 KiB 
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 19161 
           Speed: 2248 MHz min/max: 500/3000 MHz Core speeds (MHz): 1: 2398 2: 2396 3: 2395 4: 2398 
           Vulnerabilities: Type: itlb_multihit status: KVM: VMX disabled 
           Type: l1tf mitigation: PTE Inversion; VMX: conditional cache flushes, SMT vulnerable 
           Type: mds mitigation: Clear CPU buffers; SMT vulnerable 
           Type: meltdown mitigation: PTI 
           Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via prctl and seccomp 
           Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer sanitization 
           Type: spectre_v2 mitigation: Full generic retpoline, IBPB: conditional, IBRS_FW, STIBP: conditional, RSB filling 
           Type: srbds mitigation: Microcode 
           Type: tsx_async_abort status: Not affected 
Graphics:  Device-1: Intel HD Graphics 5500 vendor: Toshiba driver: i915 v: kernel bus ID: 00:02.0 chip ID: 8086:1616 
           Device-2: NVIDIA GM108M [GeForce 930M] vendor: Toshiba driver: nouveau v: kernel bus ID: 09:00.0 chip ID: 10de:1346 
           Display: x11 server: X.Org 1.20.9 compositor: kwin_x11 driver: intel,nouveau unloaded: modesetting 
           alternate: fbdev,nv,vesa display ID: :0 screens: 1 
           Screen-1: 0 s-res: 1920x1080 s-dpi: 96 s-size: 508x285mm (20.0x11.2") s-diag: 582mm (22.9") 
           OpenGL: renderer: Mesa Intel HD Graphics 5500 (BDW GT2) v: 4.6 Mesa 20.1.8 direct render: Yes 
Audio:     Device-1: Intel Broadwell-U Audio vendor: Toshiba driver: snd_hda_intel v: kernel bus ID: 00:03.0 
           chip ID: 8086:160c 
           Device-2: Intel Wildcat Point-LP High Definition Audio vendor: Toshiba driver: snd_hda_intel v: kernel 
           bus ID: 00:1b.0 chip ID: 8086:9ca0 
           Sound Server: ALSA v: k5.8.16-2-MANJARO 
Network:   Device-1: Intel Wireless 3160 driver: iwlwifi v: kernel port: 6040 bus ID: 07:00.0 chip ID: 8086:08b3 
           IF: wlp7s0 state: up mac: <filter> 
           Device-2: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet vendor: Toshiba driver: r8169 v: kernel port: 4000 
           bus ID: 08:00.0 chip ID: 10ec:8168 
           IF: enp8s0 state: down mac: <filter> 
Drives:    Local Storage: total: 1.09 TiB used: 23.44 GiB (2.1%) 
           ID-1: /dev/mmcblk0 model: SR64G size: 59.48 GiB block size: physical: 512 B logical: 512 B serial: <filter> 
           scheme: MBR 
           SMART Message: Unknown smartctl error. Unable to get data. 
           SMART Message: Unable to run smartctl. Root privileges required. 
           ID-2: /dev/sda vendor: Toshiba model: MQ02ABD100H size: 931.51 GiB block size: physical: 4096 B logical: 512 B 
           speed: 6.0 Gb/s rotation: 5400 rpm serial: <filter> rev: 3M scheme: GPT 
           ID-3: /dev/sdb type: USB vendor: SanDisk model: Ultra Fit size: 114.56 GiB block size: physical: 512 B 
           logical: 512 B serial: <filter> rev: 1.00 scheme: MBR 
           SMART Message: Unknown USB bridge. Flash drive/Unsupported enclosure? 
           ID-4: /dev/sdc type: USB vendor: SanDisk model: Cruzer Blade size: 14.59 GiB block size: physical: 512 B 
           logical: 512 B serial: <filter> rev: 1.00 scheme: MBR 
           SMART Message: Unknown USB bridge. Flash drive/Unsupported enclosure? 
Partition: ID-1: / raw size: N/A size: 5.77 GiB used: 192.3 MiB (3.3%) fs: overlay source: ERR-102 
Swap:      Alert: No Swap data was found. 
Sensors:   System Temperatures: cpu: 45.0 C mobo: N/A 
           Fan Speeds (RPM): N/A 
Info:      Processes: 196 Uptime: 1h 09m Memory: 7.69 GiB used: 1.66 GiB (21.6%) Init: systemd v: 246 Compilers: gcc: N/A 
           Packages: pacman: 1054 lib: 282 Shell: Bash v: 5.0.18 running in: konsole inxi: 3.1.05 


     
     
           
[manjaro@manjaro ~]$ sudo parted -l
Model: ATA TOSHIBA MQ02ABD1 (scsi)
Disk /dev/sda: 1000GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system     Name  Flags
 1      2097kB  317MB   315MB   fat32                 boot, esp
 2      317MB   991GB   990GB   ext4
 3      991GB   1000GB  9449MB  linux-swap(v1)        swap

 
 
 
 
[manjaro@manjaro ~]$ sudo manjaro-chroot -a
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
==> Mounting (ManjaroLinux) [/dev/sda2]
 --> mount: [/mnt]
 --> mount: [/mnt/boot/efi]
[manjaro /]# ls /boot/*
/boot/initramfs-5.10-x86_64-fallback.img  /boot/initramfs-5.4-x86_64-fallback.img  /boot/intel-ucode.img       /boot/linux54-x86_64.kver  /boot/vmlinuz-5.4-x86_64
/boot/initramfs-5.10-x86_64.img           /boot/initramfs-5.4-x86_64.img           /boot/linux510-x86_64.kver  /boot/vmlinuz-5.10-x86_64

/boot/efi:
EFI

/boot/grub:
fonts  grub.cfg  grubenv  themes  x86_64-efi

/boot/memtest86+:
memtest.bin
[manjaro /]# 




[manjaro /]# mhwd-kernel -li
Currently running: 5.8.16-2-MANJARO (linux58)
The following kernels are installed in your system:
   * linux510
   * linux54
[manjaro /]# 



[manjaro /]# exit
exit
 --> umount: [/mnt/boot/efi]
 --> umount: [/mnt]
[manjaro@manjaro ~]$ 



[manjaro /]# mhwd-kernel -r linux57                                                 <-- error should have been 510 - see next
Error: Kernel not installed.
Currently running: 5.8.16-2-MANJARO (linux58)
The following kernels are installed in your system:
   * linux510
   * linux54
[manjaro /]# 




[manjaro /]# mhwd-kernel -r linux510
checking dependencies...

Packages (1) linux510-5.10.89-1

Total Removed Size:  78.34 MiB

:: Do you want to remove these packages? [Y/n] 
OUTPUT
:: Running pre-transaction hooks...
(1/1) Removing linux initcpios...
:: Processing package changes...
(1/1) removing linux510                                                                                          [####################################################################] 100%
:: Running post-transaction hooks...
(1/3) Arming ConditionNeedsUpdate...
(2/3) Updating module dependencies...
(3/3) Updating Grub-Bootmenu
Generating grub configuration file ...
Found theme: /usr/share/grub/themes/manjaro/theme.txt
Found linux image: /boot/vmlinuz-5.4-x86_64
Found initrd image: /boot/intel-ucode.img /boot/initramfs-5.4-x86_64.img
Found initrd fallback image: /boot/initramfs-5.4-x86_64-fallback.img
Warning: os-prober will be executed to detect other bootable partitions.
Its output will be used to detect bootable binaries on them and create new boot entries.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
Adding boot menu entry for UEFI Firmware Settings ...
Found memtest86+ image: /boot/memtest86+/memtest.bin
done



[manjaro /]# mhwd-kernel -r linux54 
checking dependencies...

Packages (1) linux54-5.4.169-1

Total Removed Size:  77.24 MiB

:: Do you want to remove these packages? [Y/n] 
:: Running pre-transaction hooks...
(1/1) Removing linux initcpios...
:: Processing package changes...
(1/1) removing linux54                                                                                           [####################################################################] 100%
:: Running post-transaction hooks...
(1/3) Arming ConditionNeedsUpdate...
(2/3) Updating module dependencies...
(3/3) Updating Grub-Bootmenu
Generating grub configuration file ...
Found theme: /usr/share/grub/themes/manjaro/theme.txt
Warning: os-prober will be executed to detect other bootable partitions.
Its output will be used to detect bootable binaries on them and create new boot entries.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
Adding boot menu entry for UEFI Firmware Settings ...
Found memtest86+ image: /boot/memtest86+/memtest.bin
done



[manjaro /]# mkinitcpio -P
==> ERROR: No presets found in /etc/mkinitcpio.d

SO i checked...
[manjaro /]# ls /etc/
ImageMagick-7           cron.d         fuse.conf     jack            lvm                                    ndctl                passwd-           sensors.d          tlp.conf
ModemManager            cron.daily     gai.conf      kernel          machine-id                             ndctl.conf.d         pinentry          sensors3.conf      tlp.d
NetworkManager          cron.deny      gemrc         keyutils        mail.rc                                netconfig            pkcs11            services           tmpfiles.d
UPower                  cron.hourly    geoclue       krb5.conf       mailcap                                nfs.conf             polkit-1          shadow             trusted-key.key
X11                     cron.monthly   group         ksysguarddrc    makepkg.conf                           nfsmount.conf        ppp               shadow-            ts.conf
acpi                    cron.weekly    group-        ld.so.cache     man_db.conf                            nginx                profile           shells             udev
adjtime                 crypttab       grub.d        ld.so.conf      manjaro-firefox-developer-edition.ini  nscd.conf            profile.d         signon-ui          udisks2
alsa                    ctdb           gshadow       ld.so.conf.d    manjaro-firefox-kde.ini                nsswitch.conf        protocols         signond.conf       usb_modeswitch.conf
anacrontab              daxctl.conf.d  gshadow-      libaudit.conf   manjaro-firefox.ini                    ntp.conf             pulse             skel               usb_modeswitch.d
appstream.conf          dbus-1         gss           libblockdev     manjaro-release                        openldap             rc_keymaps        slsh.rc            usb_modeswitch.setup
arch-release            dconf          gssproxy      libinput        manjaro-thunderbird.ini                openmpi              rc_maps.cfg       smartd.conf        vconsole.conf
audit                   default        gtk-3.0       libnl           mdadm.conf                             openswap.conf        request-key.conf  ssh                vdpau_wrapper.cfg
avahi                   depmod.d       healthd.conf  libpaper.d      mhwd-x86_64.conf                       openvpn              request-key.d     ssl                vimrc
bash.bash_logout        dhcpcd.conf    host.conf     libva.conf      mime.types                             os-release           resolv.conf       sudo.conf          vpnc
bash.bashrc             dnsmasq.conf   hostname      lirc            mke2fs.conf                            pacman-mirrors.conf  resolvconf.conf   sudo_logsrvd.conf  wgetrc
bindresvport.blacklist  e2scrub.conf   hosts         locale.conf     mkinitcpio.conf                        pacman.conf          rpc               sudoers            wpa_supplicant
binfmt.d                environment    idmapd.conf   locale.gen      mkinitcpio.conf.pacnew                 pacman.conf.pacnew   rsyncd.conf       sudoers.d          xattr.conf
bluetooth               ethertypes     initcpio      localtime       mkinitcpio.d                           pacman.d             samba             sysctl.d           xdg
ca-certificates         exports        inputrc       login.defs      modprobe.d                             pam.d                sddm.conf         systemd            xinetd.d
cifs-utils              exports.d      iproute2      logrotate.conf  modules-load.d                         pamac.conf           sddm.conf.d       texmf              xml
conf.d                  fonts          iptables      logrotate.d     mtab                                   papersize            securetty         timeshift          zsh
cpufreq-bench.conf      fstab          issue         lsb-release     nanorc                                 passwd               security          timezone
[manjaro /]# ls /etc/mkinitcpio.d
linux510.preset.pacsave  linux54.preset.pacsave  linux58.preset.pacsave









# ------------------------------------------------------------------------------

[manjaro@manjaro ~]$ manjaro-chroot -a
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
==> Mounting (ManjaroLinux) [/dev/sda2]
 --> mount: [/mnt]
mount: /mnt: /dev/sda2 already mounted on /mnt.
 --> mount: [/mnt/boot/efi]


 
[manjaro@manjaro ~]$ sudo umount -f /dev/sda2
[manjaro@manjaro ~]$ ls /mnt
[manjaro@manjaro ~]$ manjaro-chroot -a
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
grub-probe: error: cannot find a GRUB drive for /dev/sdc1.  Check your device.map.
==> Mounting (ManjaroLinux) [/dev/sda2]
 --> mount: [/mnt]
 --> mount: [/mnt/boot/efi]
[manjaro /]# echo $SHELL
/bin/sh
[manjaro /]# whoami
root
[manjaro /]# 

 
# ------------------------------------------------------------------------------

Using USB Manjaro i ran fsck

[manjaro@manjaro ~]$ sudo fsck /dev/sda
fsck from util-linux 2.36
e2fsck 1.45.6 (20-Mar-2020)
ext2fs_open2: Bad magic number in super-block
fsck.ext2: Superblock invalid, trying backup blocks...
fsck.ext2: Bad magic number in super-block while trying to open /dev/sda

The superblock could not be read or does not describe a valid ext2/ext3/ext4
filesystem.  If the device is valid and it really contains an ext2/ext3/ext4
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
 or
    e2fsck -b 32768 <device>

/dev/sda contains `DOS/MBR boot sector; partition 1 : ID=0xee, start-CHS (0x0,0,2), end-CHS (0x3ff,255,63), startsector 1, 1953525167 sectors, extended partition table (last)' data
[manjaro@manjaro ~]$ sudo e2fsck -b 8193 /dev/sda
e2fsck 1.45.6 (20-Mar-2020)
e2fsck: Bad magic number in super-block while trying to open /dev/sda

The superblock could not be read or does not describe a valid ext2/ext3/ext4
filesystem.  If the device is valid and it really contains an ext2/ext3/ext4
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
 or
    e2fsck -b 32768 <device>

/dev/sda contains `DOS/MBR boot sector; partition 1 : ID=0xee, start-CHS (0x0,0,2), end-CHS (0x3ff,255,63), startsector 1, 1953525167 sectors, extended partition table (last)' data
[manjaro@manjaro ~]$ sudo e2fsck -b 32768 /dev/sda
e2fsck 1.45.6 (20-Mar-2020)
e2fsck: Bad magic number in super-block while trying to open /dev/sda

The superblock could not be read or does not describe a valid ext2/ext3/ext4
filesystem.  If the device is valid and it really contains an ext2/ext3/ext4
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
 or
    e2fsck -b 32768 <device>
    
# ------------------------------------------------------------------------------ CORRECT

[manjaro@manjaro ~]$ sudo fsck -f /dev/sda2
fsck from util-linux 2.36
e2fsck 1.45.6 (20-Mar-2020)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/sda2: 549085/60456960 files (0.4% non-contiguous), 8754711/241805828 block

# ------------------------------------------------------------------------------

sudo fdisk -l
Disk /dev/sda: 931.51 GiB, 1000204886016 bytes, 1953525168 sectors
Disk model: TOSHIBA MQ02ABD1
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: C9E81B02-6EB4-A645-9A5D-FC53B2B45DC1

Device          Start        End    Sectors   Size Type
/dev/sda1        4096     618495     614400   300M EFI System
/dev/sda2      618496 1935065125 1934446630 922.4G Linux filesystem
/dev/sda3  1935065126 1953520064   18454939   8.8G Linux swap

Partition 3 does not start on physical sector boundary.


Disk /dev/loop0: 20.83 MiB, 21839872 bytes, 42656 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 319.91 MiB, 335446016 bytes, 655168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 1.2 GiB, 1287385088 bytes, 2514424 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop3: 630.15 MiB, 660762624 bytes, 1290552 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mmcblk0: 59.48 GiB, 63864569856 bytes, 124735488 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x1b11fe85

Device         Boot Start       End   Sectors  Size Id Type
/dev/mmcblk0p1      32768 124735487 124702720 59.5G 83 Linux


Disk /dev/sdb: 114.56 GiB, 123010547712 bytes, 240254976 sectors
Disk model: Ultra Fit       
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device     Boot Start       End   Sectors   Size Id Type
/dev/sdb1          32 240353279 240353248 114.6G  c W95 FAT32 (LBA)


Disk /dev/sdc: 14.59 GiB, 15669919744 bytes, 30605312 sectors
Disk model: Cruzer Blade
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device     Boot   Start     End Sectors  Size Id Type
/dev/sdc1  *         64 4636279 4636216  2.2G  0 Empty
/dev/sdc2       4636280 4644471    8192    4M ef EFI (FAT-12/16/32)


# ------------------------------------------------------------------------------

Warnings on sourcing ¬/.zshrc
/home/donaghm/.zshrc:source:19: no such file or directory: /home/donaghm/.profile
/home/donaghm/.zshrc:source:41: no such file or directory: /home/donaghm/.fzf/shell/key-bindings.zsh
/home/donaghm/.zshrc:source:145: no such file or directory: /home/donaghm/.oh-my-zsh/oh-my-zsh.sh
/home/donaghm/.zshrc:327: command not found: zoxide

Vim: turn off underline highlighting:: 
:hi link markdownError Normal



# ------------------------------------------------------------------------------

$HOME folders

list of symlinks in ~/PORTABLE_ENV/symlinks


all_org/                :: Files are on Dropbox, so dropbox needs to be installed; backed up to RPi
Applications/           :: e.g. jumpapp, 
BACKUPS/                :: various rsync_ directories -- cf po/scripts/borg_weekly?
DONAGHS/
Downloads/
Dropbox/                :: required for orgmode / orgzly on the Smartphone
PORTABLE_ENV/           :: git repo
REPOS/                  :: 'almost' everything I've done
SAFE/                   :: SAFE_borg_backup --> Raspberry Pi
TESTING/
zArchive/
ZIM/


# ------------------------------------------------------------------------------

Notes:
It is worth searching for "utils" to get
moreutils
netutils
coreutils
dnsutils  incl. dig for private cmds ipe and ipi == spi bind
net-tools
etc.

# ------------------------------------------------------------------------------



This is a list of things I did to get Manjaro up and running after a new Manjaro install

git config --global user.email "xiddler@gmail.com" &&   git config --global user.name "Donagh"

$ mkdir -p ~/Applications
for jumpapp, cheat, etc



git clone https://github.com/Xiddler/PORTABLE_ENV.git

sudo pamac install zim
sudo chmod -R 777 DONAGHS 
& REPOSITORIES

sudo pamac install python-pip

sudo pip install cheat
(Note: last install of 2022-01-13 has been tricky / fail? )
if installed manually... not that straightforward... see zim-wiki....


DOT_FILES
remove existing ~/.vimrc ~/.zshrc ~/.bashrc and make the appropriate symlinks from PORTABLE_ENV
(One mistake - i should have backed up the existing .zshrc as the prompt was quite nice - this was powerlevel10k)

# install powerlevel10k (if not already installed)
sudo pamac install powerlevel10k 

# Query: Do i need .oh-my-zsh at all? For what? Ans: 2022-03-19 no (because Manjaro provides powerlevel10k). 
# But maybe consider antibody instead. 
# the command d which shows recent directories
# the command take which I have made into a .zsh_aliases entry - homemade version. It works!
# no need to install .oh-my-zsh
# sudo curl -L http://install.ohmyz.sh | sh

install jumpapp-git  using pamac-manager with AUR allowed
on 2022-01-13_23:30 I used pamac-manager with AUR selected :: may need a reboot to make functional?
installed dependencies ie make, pandoc and wmctrl
Note: pandoc is large ~250MB                        <-- huge?-->
Note2: Need to install make if not available
Note3: Need to install wmctrl
and then make && sudo make install 


/home/donagh/REPOS/01BACKUPS/Custom_Shortcuts_confg/backup_2021-11-04.khotkeys
or
/home/donagh/PORTABLE_ENV/manjaro/Custom_Shortcuts_Manjaro.khotkeys ← git repo
May need a restart for these to work  - is this correct?
NOT WORKING?
WORKING?


created the symlinks for ~/DONAGHS and ~/REPOSITORIES

installed clipit for use with realpath (but not working. ???) 
NOT WORKING
(tried xclip, xclipboard etc...)

vim stuff
symlink crcandy_theme into .oh-my-zsh/themes  -- only if oh-my-zsh is installed which is not essential
stellarized into ~/.vim/pack/nightsense/start
Other vim plugins can happen as and when
Now 2021-12-21_17:59

autokey-qt
sudo pamac install autokey-qt autokey-common

check zim-wiki (hint allow AUR) 




# utilities
ripgrep
fd
fzf see the zim-wiki on this incl. sourcing the keybindings
mcfly - modern bash history - see zim-wiki 


# doom-emacs
install emacs (remove .emacs for .doom - see zim-wiki)
git clone doom-emacs into ~/.emacs.d
make the symlinks for config.el etc
run doom sync and 
font Liberation Mono (or disable this in the config files?)
install it from --> /home/donagh/PORTABLE_ENV/fonts/liberation_mono.zip
zim-wiki fonts will help


# Dropbox
Need Dropbox to access my main files
install
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
->% echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p
~/.dropbox-dist/dropboxd

start doom-emacs :: yakuake cd ~/.emacs.d/bin && doom run


install xorg-xinput to disable the touchpad or use the system settings -> Hardware -> Input -> disable touchpad
(can also be done in KDE System Settings)

install ratbagd to enable the Logitech "Mighty" mouse
also ref piper (Linux magazine helped here!)

install ranger
(shortcut is -> % ra)
# Don't forget: ranger --copy-config=all 


# Maybe no need as the Manjaro prompt is fine
# install prompt for terminals ???
# sudo pamac install powerlevel10k

rust / cargo
install
-> % curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

Set up Firefox how I like it
Extensions
UBlock Origin
Vimium FF
Dark Reader
DuckDuckGo Privacy Essentials
Ask where to save downloads

install fbreader

Terminals?
konsole is fine why Terminator or Kitty?
konsole does splits!


install tree

the vim plugins from PORTABLE_ENV/vim/dotvim
my vim plugins are recorded in .vimrc (last entries)
REM: dotvim is symlinked to ~/.vim 
(but are these up to date? - do this
cd .vim
-> % tree -L 4

install copyq

install caffeine-ng to keep the computer from going asleep 
Solution shown below 


directories for $HOME
for backup scripts to work

install borg for backups and for retrieval
REM: e.g.
zim-wiki/LINUX:1Linux Live USB:01installed apps:borg
export BORG_PASSPHRASE='theboysoffairhill'


install glances to see the system resource usage
pip install glances     (I do use this)


need to set up the cifs_backup to the RPi
not shure about this... 2021-12-21_21:49

install coreutils
install moreutils
install inetutils


install flameshot :: great for screen capturing

install ncdu    :: CLI how big is the directory

install feh     :: handy image viewer on the CLI

install imagemagick
usually installed on linux

install nushell :: requires rust/cargo)

install qalc! 

install speedcrunch :: a Qt calculator to rival Qalc)

install Obsidian (an Electron app) :: portal to my .md files 

install timeshift (not sure how great / valuable it is - Dec2021 I had to reinstall Manjaro)

sudo pamac install vlc  :: watch mpegs etc.

sudo pamac install xnviewmp :: old, familiar image viewer/ processor

lastly???
vim plugins?
:Goya   OK


the credential in ~/.ssh are gone
Meaning I need to create new ones to ssh into the RPear
OOPS!
DONE!

install thunderbird
and add my email accounts (gandi & gmail mainly)

change theme to Breeze dark (or similar) - Settings > 
done

cifs-share to allow backups to the RPi
needs samba, I think
done

borg backups using the borgz command alias
not done yet see problem 6. below
done


rsync backups: refer to ~/PORTABLE_ENV/backups/README.md
DONE -> % rsyncz

git 
set --global defaults 
email
user
defaultBranch main
git init zim/Computer as backup


fix rp() function in zsh_aliases if not working properly
ie use clipcopy

install signal desktop
installed size 348MB - I kid you not
done





#---------------------------------------------------------#
Problems / Issues
#---------------------------------------------------------#
1. after I rebooted the new install all the contents of my /home/donagh/ folder are appearing as icons on my desktop
Is this because I remove ~/Desktop ? It had a sub-folder called .directory. What does this do?
Solution: In Desktop Settings - Plasma select from Layout menu : Desktop (instead of Folder)

Status: FIXED

----------------------------------------------------------
2. Logitech mouse not being scanned by laptop for ratbagd
Issue of Jan 2022 install. Not working. How come?

Piper GUI is not working?
I removed piper and installed piper-git. Not sure if this did anything

Solution: Changed the setting on the underside of the mouse from 2 to 3 and then clicked on
Bluetooth icon and the MX Master was showing. Clicked Next and it was working. Magic.

Status: NOT RESOLVED 

----------------------------------------------------------
3. caffeine-ng is not working? Wrong python version?
Tried: remove caffeine-ng and sudo pamac install caffeine - did not work
Seems to be an issue with new Python3.9

Workaround: KDE provides an option "Inhibit automatic sleep and screen locking" in the Batter and Power icon in the systray.

Status: RESOLVED

----------------------------------------------------------
4. Problem with org-mode file. 
Not up-to-date. What are my latest saved/archived org-mode files? Where are they?
Only needed Dropbox as that is where I store my orgmode files.

Status: FIXED

----------------------------------------------------------
5. cifs_share
This is for the borg backup to the USB attached to the RPi.
Refer to zim/Computer/MAJORS/cifs_share for info
The connection from the RPi to the laptop was not working.

Status: FIXED

----------------------------------------------------------
6. borg backup

Not working. Mixed up about which folder to initialize and be consistent with
the script /home/donagh/PORTABLE_ENV/scripts/borg_backup_weekly

Problem with different versions of borg on RPi and newly installed on laptop

Status: NOT RESOLVED

----------------------------------------------------------
7. ~/BACKUPS

Need notes to describe what I need here.
The safety net is that RPi has stuff in RSYNCED for my safety. Could be a little better.

8. clipcopy
I use this to paste the "realpath" output onto the system clipboard; now I can't find it in the AUR;


----------------------------------------------------------
NOTES ON CREATING SSH KEYS (Put this into cheat at some stage)
# Creating
ssh-keygen -t rsa -b 4096 -N "" -C "" -f keyname
mv keyname* ~/.ssh

# Setting access rights
chmod 700 ~/.ssh && chmod 600 ~/.ssh/*

# ~/.ssh/config
Host github
HostName github.com
User git
IdentityFile ~/.ssh/keyname

# This logs into the server, and copies the public key to it.
ssh-copy-id -i ~/.ssh/keyname user@remote_machine

# Checking the ssh procesd
ssh -T git@github.com
eval $(ssh-agent -s)
ssh-add ~/.ssh/keyname
ssh -T git@github.com

# HARDWARE

MX Master Logitech Mouse
sudo pamac install libratbag
sudo pamac install piper
LONG Press on the 123 button and then Bluetooth Add New Device with ratbagd in active state



# Timeshift

sudo pamac install timeshift

see cheat reinstall, zim-wiki/LINUX:booting Manjaro/
see RECOVER Manjaro at the top of this file

# d == dirjump allows directory history 
search github

# zsh-syntax-highlighting w/o oh-my-zsh
sudo pamac install zsh-syntax-highlighting

