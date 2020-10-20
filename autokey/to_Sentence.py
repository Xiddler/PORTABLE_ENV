# Alt + Shift + L after selecting  Alt S
# make Sentence case 


contents = clipboard.get_selection()
new_contents = contents.capitalize()
keyboard.send_keys(new_contents)