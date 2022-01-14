
# import os.path as p
# import subprocess
import csv

retCode, gitem = dialog.input_dialog("Retrieve password", "Input the URL-nick")

req_url_nick = str(gitem)


with open('$HOME/common_passwords.csv', 'rb') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    for line in csv_reader:
        # line['url-nick'] = str(line['url-nick'].lower())
        if line['url-nick'].startswith(req_url_nick) or line['url-nick'] == gitem:
            # dialog.info_dialog(title=gitem, message='bah')
            # dialog.info_dialog(title='Input data') #, message=line['url-nick']) #.lower())
            dialog.info_dialog(message=gitem.lower())
            # dialog.info_dialog(title='Data required', message=line['url-nick']+' \n '+line['email']+' \n '+line['password']+' \n '+ line['user'])
        else:
            continue
		