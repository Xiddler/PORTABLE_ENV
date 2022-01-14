contents = clipboard.get_selection()
contents = contents.replace("\\", '/')
keyboard.send_keys(contents)