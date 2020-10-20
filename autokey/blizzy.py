retCode, userInput = dialog.input_dialog(title='Input required', message='Enter a string', default='My string')

if retCode:
	myMessage = 'Dialog exit code was: ' + str(retCode)
	dialog.info_dialog(title='You cancelled the dialog',
	message=myMessage, width='200') # width is extra Zenity parameter
else:
	dialog.info_dialog(title='The string you entered', message=userInput)

winXOrigin, winYOrigin, winWidth, winHeight = window.get_active_geometry()
winGeometry = 'X-origin: %s\nY-origin: %s\nWidth: %s\nHeight: %s' %(winXOrigin, winYOrigin, winWidth, winHeight)
dialog.info_dialog(title='Window geometry', message=winGeometry) 