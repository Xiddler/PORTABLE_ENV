
from datetime import date
today = date.today()
d0 = "~/DONAGHS/personal/journal/"
d1 = today.strftime("%Y/%m/")
d2 = today.strftime("%d-%m"+".md")

keyboard.send_keys(d0+d1+d2)
