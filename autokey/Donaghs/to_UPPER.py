# Alt + Shift + U after selecting = Alt U
# tmake UPPERCASE 


contents = clipboard.get_selection()
new_contents = contents.upper()
keyboard.send_keys(new_contents)