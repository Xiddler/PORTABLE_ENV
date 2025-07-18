# info

[usb](https://www.beyondlogic.org/usbnutshell/usb1.shtml)

zim-wiki --▷ MAJORS:USB

# Prepare a USB stick as a bootable drive with an ISO file

# if there is something on the USB, here's how to remove it
-> %  lsblk                                                                                                                                                  ✔ 
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0  99.4M  1 loop /var/lib/snapd/snap/core/11993
loop1         7:1    0 160.1M  1 loop /var/lib/snapd/snap/wekan/1941
loop2         7:2    0 110.5M  1 loop /var/lib/snapd/snap/core/12603
sda           8:0    0 931.5G  0 disk 
├─sda1        8:1    0   300M  0 part /boot/efi
├─sda2        8:2    0 922.4G  0 part /run/timeshift/backup
│                                     /
└─sda3        8:3    0   8.8G  0 part [SWAP]
sdb           8:16   1 114.6G  1 disk 
└─sdb1        8:17   1 114.6G  1 part 
sdc           8:32   1  14.6G  0 disk 
└─sdc1        8:33   1  14.6G  0 part 
mmcblk0     179:0    0  59.5G  0 disk 
└─mmcblk0p1 179:1    0  59.5G  0 part /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68



In the above the drive is /dev/sdc 
To remove partitions:

-> % sudo fdisk /dev/sdc
and
d for each partition then
w to write
DONE
To create a new partition use gparted or -> % sudo fdisk /dev/sdc

Q. For the following dd command does the usb need to be mounted or not?
A. yes

# to flash an ISO file to the USB

-> % sudo dd bs=4M if=<source of ISO file> of=/dev/sdc conv=fdatasync status=progress

where /dev/sdc is the USB blk you want to flash to

Here is a command I ran on 2022-01-29

-> %  sudo dd  bs=4M if=/home/donagh/Applications/ISO_Files/manjaro-xfce-21.2.2-minimal-220123-linux515.iso of=/dev/sdc conv=fdatasync status=progress


sudo            :: You need to be a superuser to issue dd commands. You will be prompted for your password.
dd              :: The name of the command we’re using.
bs=4M           :: The -bs (blocksize) option defines the size of each chunk that is read from the input file and wrote to the output device. 4 MB is a good choice because it gives decent throughput and it is an exact multiple of 4 KB, which is the blocksize of the ext4 filesystem. This gives an efficient read and write rate.
`if=<path-to-ISO :: The -if (input file) option requires the path and name of the Linux ISO image you are using as the input file.
of=/dev/sdb     :: The -of (output file) is the critical parameter. This must be provided with the device that represents your USB drive. This is the value we identified by using the lsblk command previously. in our example it is sdb, so we are using /dev/sdb. Your USB drive might have a different identifier. Make sure you provide the correct identifier.
conv=fdatasync  :: The conv parameter dictates how dd converts the input file as it is written to the output device. dd uses kernel disk caching when it writes to the USB drive. The fdatasync modifier ensure the write buffers are flushed correctly and completely before the creation process is flagged as having finished.
status=progress :: option that provides updates on the process once per second.  F
`




# lsusb

->% lsusb 
(2025-06-27)

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:8001 Intel Corp. Integrated Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 8087:07dc Intel Corp. Bluetooth wireless interface
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 002: ID 0781:55b1 SanDisk Corp. SanDisk 3.2 Gen1


to get details on a specific device (eg The SanDisk USB Stick)
->% ls -d 0781:55b1 -v

