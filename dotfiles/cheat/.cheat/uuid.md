# FRONTMATTER
Opened 2025-07-20
Filepath 

# UUID
# =============================================================================================================

Ways to get the UUID of devices (USB / partition)  on the system

->% blkid

->%  systemd-mount --list | column | awk '{print $1 " "  $NF}'

->% lsblk -o +UUID

->% cat /etc/fstab







# =============================================================================================================
# FOOTNOTES

