Opened 2023-09-26

cat  /etc/fstab 

# Sample /etc/fstab file from Linux From Scratch
https://www.linuxfromscratch.org/lfs/view/stable/chapter10/fstab.html

# file system  mount-point    type     options             dump  fsck
#                                                                order

/dev/sda2      /              ext4     defaults            1     1
/dev/sda5      swap           swap     pri=1               0     0
proc           /proc          proc     nosuid,noexec,nodev 0     0
sysfs          /sys           sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts       devpts   gid=5,mode=620      0     0
tmpfs          /run           tmpfs    defaults            0     0
devtmpfs       /dev           devtmpfs mode=0755,nosuid    0     0
tmpfs          /dev/shm       tmpfs    nosuid,nodev        0     0
cgroup2        /sys/fs/cgroup cgroup2  nosuid,noexec,nodev 0     0


# Toshiba 2023-09-26
> cat /etc/fstab
# <file system> <mount point> <type> <options> <dump> <pass>

UUID=A16A-C2B5  /boot/efi       vfat    umask=0077      0       2
UUID=84d59e5e-7d46-4fc1-8fbc-71016bc12e43       /       ext4    defaults,noatime        0       1
UUID=a6bf7937-eedc-4a29-983f-8a4799fa0415       swap    swap    defaults,noatime        0       2

# Get UUID of a device
 blkid -t TYPE=ext4 -sUUID
## Sample output ( Toshiba 2023-09-29_14:39 )
/dev/sdb1: UUID="8cb3ffa6-2891-4a3d-b94c-80b6b7cb8c9b"
/dev/sda2: UUID="84d59e5e-7d46-4fc1-8fbc-71016bc12e43"

> blkid
/dev/sdb1: UUID="8cb3ffa6-2891-4a3d-b94c-80b6b7cb8c9b" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="c3072e18-01"
/dev/sda2: UUID="84d59e5e-7d46-4fc1-8fbc-71016bc12e43" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="66f7a009-e6e2-f44b-b8cb-cce8ad325478"
/dev/sda3: UUID="a6bf7937-eedc-4a29-983f-8a4799fa0415" TYPE="swap" PARTUUID="0fd2cce0-1f51-984a-8736-4135a4be1398"
/dev/sda1: UUID="A16A-C2B5" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="c88afc0c-1ec0-7244-a5f8-947b38b04b65"

# fstab entry for USB128GB on 2023-09-29
UUID=8cb3ffa6-2891-4a3d-b94c-80b6b7cb8c9b  /run/media/donagh/USB128GB ext4  defaults,noatime  0 	2
See zim-wiki  Linux:commands:fstab for webrefs etc.


# contents of /etc/fstab on 2023-09-29
> cat /etc/fstab
# <file system> <mount point> <type> <options> <dump> <pass>

UUID=A16A-C2B5  /boot/efi       vfat    umask=0077      0       2
UUID=84d59e5e-7d46-4fc1-8fbc-71016bc12e43       /       ext4    defaults,noatime        0       1
UUID=a6bf7937-eedc-4a29-983f-8a4799fa0415       swap    swap    defaults,noatime        0       2
UUID=8cb3ffa6-2891-4a3d-b94c-80b6b7cb8c9b  /run/media/donagh/USB128GB ext4  defaults,noatime  0       2
