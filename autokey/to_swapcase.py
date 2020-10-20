# Alt + Shift + W after selecting. sWap  Alt W
# sWap case 


contents = clipboard.get_selection()
new_contents = contents.swapcase()
keyboard.send_keys(new_contents)