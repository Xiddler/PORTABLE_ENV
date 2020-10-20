# to get password info
output = system.exec_command("echo 'cat /media/donagh/3520-FD13/zim/Computer/11SignUps.txt|ag -i -A5 -B4 '")
keyboard.send_keys(output)