contents = clipboard.get_selection()
contents = contents.replace(' ', '_')
keyboard.send_keys('+'+contents)
