# Alt + Shift + L after selecting Alt L
# make lowercase


contents = clipboard.get_selection()
new_contents = contents.lower()
keyboard.send_keys(new_contents)