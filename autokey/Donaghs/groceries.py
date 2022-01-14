# https://groups.google.com/forum/#!topic/AutoKey-users/AZ0Dx4zZz_4

retCode, gitem = dialog.input_dialog("Add to groceries", "What would you like to pick up at the grocery store?")

output = system.exec_command("date '+ - %a %b %d '")

gitem2 = "\n" + gitem
myfile = '/home/ubuntu/Documents/groceries.txt'

try:
    if p.exists(myfile):
        with open(myfile, 'a' ) as f:
            f.write (gitem2)
            f.write (output)        
        # fileHandle = open(myfile, 'a' )
        # fileHandle.write (gitem2)
        # fileHandle.write (output)
        # fileHandle.close()
    else:
        dialog.info_dialog(title='Warning', message="problem with groceries.txt")
except:
    print "Could not access groceries.txt"