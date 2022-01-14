# swaps k in for ch - sample file
page = clipboard.get_selection()    # slect the page of text
inchar = "ch"
outchar = "k"
page = page.replace(inchar, outchar) 
keyboard.send_keys(page)
