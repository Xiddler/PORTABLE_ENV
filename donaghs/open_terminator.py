# Enter script code
import subprocess
command = 'wmctrl -l'
output = system.exec_command(command, getOutput=True)

if 'terminator' in output:
    window.activate('zim',switchDesktop=True)

else:
    subprocess.Popen(["/usr/bin/terminator"])
#