#  activate basic python virtual environment

output = system.exec_command("echo 'source ~/.virtualenvs/basic/bin/activate '")
keyboard.send_keys(output)