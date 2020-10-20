#  activate flask python virtual environment

output = system.exec_command("echo 'source ~/.virtualenvs/flask/bin/activate '")
keyboard.send_keys(output)