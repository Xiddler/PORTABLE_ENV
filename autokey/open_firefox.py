#start firefox or switch to firefox
import subprocess
command = 'wmctrl -l'
output = system.exec_command(command, getOutput=True)

if 'Firefox' in output:
    window.activate('Firefox',switchDesktop=True)

else:
    subprocess.Popen(["/usr/bin/firefox"])
#