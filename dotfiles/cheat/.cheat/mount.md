# Actual example of mounting a USB device on Linux

## find device on system

### ->% lsblk
### _output_
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0   104M  1 loop /var/lib/snapd/snap/core/16928
loop1         7:1    0 104.2M  1 loop /var/lib/snapd/snap/core/17200
loop2         7:2    0  10.7M  1 loop /var/lib/snapd/snap/websters1913/3
sda           8:0    0 931.5G  0 disk
├─sda1        8:1    0   300M  0 part /boot/efi
├─sda2        8:2    0 922.4G  0 part /
└─sda3        8:3    0   8.8G  0 part [SWAP]
sdb           8:16   1 116.6G  0 disk
└─sdb1        8:17   1 116.6G  0 part /run/media/donagh/USB128GB
sdc           8:32   1  28.7G  0 disk
└─sdc1        8:33   1  28.7G  0 part
mmcblk0     179:0    0  59.5G  0 disk
└─mmcblk0p1 179:1    0  59.5G  0 part



### ->% sudo fdisk -l
### _output_ (partial 2024-09-26)

Disk /dev/sdc: 28.67 GiB, 30784094208 bytes, 60125184 sectors
Disk model: Cruzer Blade
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device     Boot Start      End  Sectors  Size Id Type
/dev/sdc1          32 60125183 60125152 28.7G  c W95 FAT32 (LBA)

## create mount point

->% mkdir /home/donagh/BACKUPS/SHED_BU_28GB_USB

## mount the device

->% sudo mount /dev/sdc1 /home/donagh/BACKUPS/SHED_BU_28GB_USB


NOTE:
->%  sudo mount /dev/sdc1 ~/BACKUPS/SHED_BLUE_28GB_USB
_output_
mount: (hint) your fstab has been modified, but systemd still uses
       the old version; use 'systemctl daemon-reload' to reload.
       ->% sudo systemctl daemon-reload 
       Now check
       ->% lsblk and the device should now be mounted automatically

## check the mount has worked

->% mount | grep sdc1

### _output_
/dev/sdc1 on /home/donagh/BACKUPS/SHED_BU_28GB_USB type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro)

## add data to the device

->% cd  /home/donagh/BACKUPS/SHED_BU_28GB_USB

->% touch my_first_file.txt



## permanent USB Mount in Linux

### get UUID of the device
->%  ls -l /dev/disk/by-uuid/*
### _output_
lrwxrwxrwx 1 root root 10 Sep 26 09:22 /dev/disk/by-uuid/B12A-5A3B -> ../../sdc1
### edit fstab file

->% sudo vim /etc/fstab
add the following line
UUID= B12A-5A3B  /mnt/SHED_BU_28GB_USB ext4  defaults,noatime  0     2





## write to my USB drive after mounting it?

Try remounting with write permissions using 

->% sudo mount -o remount,rw /mnt/usb.



# ---------------------------------------
# sudo mount
sudo mount /dev/sdb1 /mnt/Tiny_USB_SanDisk



#  -o means options

#  umount to UNMOUNT; see ->% man umount 
#  sudo umount /dev/sdb1

# To mount / partition as read-write in repair mode:
mount -o remount,rw /

# Bind mount path to a second location
mount --bind /origin/path /destination/path

# To mount Usb disk as user writable:
#                                   <device> <mount_point>
mount -o uid=username,gid=usergroup /dev/sdx /mnt/xxx


# To mount a remote NFS directory
mount -t nfs example.com:/remote/example/dir /local/example/dir

# To mount an ISO
mount -o loop disk1.iso /mnt/disk

# findmnt
# The findmnt command makes it easy to positively identify a device you’ve just plugged in, making the overwriting process much safer
-> % findmnt 
-> % findmnt -l
# This command tells findmnt to monitor new mounts for 30 seconds.
-> % findmnt -p --timeout 30000
# This command tells findmnt to monitor for new mounts until it sees one new mount point created.
-> %  findmnt -p --first-only


#***************************************************
# mount the SD64 card to /run/media/donagh/XXXX/ 
#***************************************************
# from ->% mount ==> /dev/mmcblk0p1 on /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68 type ext4 (rw,nosuid,nodev,relatime,errors=remount-ro,uhelper=udisks2)
# try this: 2023-08-05
sudo mount /dev/mmcblk0p1 /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68 
# First maybe create /run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68 ? Or mount to a different location?
