# Enter script code
# replace ch with k
# keyboard.send_keys("<ctrl>+a")    # Select all
page = clipboard.get_selection()    # slect the page of text
inchar = "ch"
outchar = "k"
page = page.replace(inchar, outchar) 
keyboard.send_keys(page)
