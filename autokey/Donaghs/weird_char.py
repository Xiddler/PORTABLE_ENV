OldClipboard=clipboard.get_clipboard()
TextToType="┐(´-｀)┌"
clipboard.fill_clipboard(TextToType)
keyboard.send_keys("<ctrl>+v")
time.sleep(0.1)
clipboard.fill_clipboard(OldClipboard)