# FRONTMATTER
Opened 2025-08-14
Filepath /home/donagh/PORTABLE_ENV/dotfiles/cheat/.cheat/virtualisation.md

# Virtualisation
# =============================================================================================================

Your computer (CPU) must support virtualization technology. 

For Intel processors, it is called VT-x (can also be Intel VT or Intel Virtualization Technology)
For AMD processors, it is called AMD-V.

Note: this could also be used to check which CPU / ISA is on the machine.

To check Linux machine supports virtualisation:

TOSHIBA
donagh@donagh-satellitep50c ~
->%  rg -c '(vmx|svm)' /proc/cpuinfo
8                                                                           :: if greater than 0 then virtualisation is enabled

donagh@donagh-satellitep50c ~
❯ lscpu G Virt
Address sizes:                        39 bits physical, 48 bits virtual
Virtualization:                       VT-x                                  :: enabled


LENOVO-Arch
Arch%> 


Raspberry Pi
donagh@raspberrypi ~
❯ lscpu G virt
                                                                            :: no virtualisation (not surprised); 
donagh@raspberrypi ~





# =============================================================================================================
# FOOTNOTES

