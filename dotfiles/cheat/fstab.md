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


