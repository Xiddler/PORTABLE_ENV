import subprocess
command = 'wmctrl -l'
output = system.exec_command(command, getOutput=True)

if 'zim' in output:
    window.activate('zim',switchDesktop=True)

else:
    subprocess.Popen(["/usr/bin/zim"])
#