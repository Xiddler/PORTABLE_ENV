#Enter scri
page = clipboard.get_selection()    # slect the page of text
inchar = "/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS"
outchar = "$HOME/DONAGHS"
page = page.replace(inchar, outchar)
keyboard.send_keys(page)
