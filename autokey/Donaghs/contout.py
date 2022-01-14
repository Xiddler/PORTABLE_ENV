# Enter script code
# to get contact info
output = system.exec_command("echo 'cat /media/donagh/3520-FD13/zim/Business/CONTACTS/Contacts.txt | ag -i -A18 -B2 '")
keyboard.send_keys(output)
