# see also: ip.md; 

# check open ports
lsof -Pni4 | grep LISTEN

# list port numbers (and grep too)
cat /etc/services | grep -i SSH

# list devices on LAN  (or use AngryIP-scanner)
sudo arp-scan 192.168.1.0/26

nmap -sP "192.168.*.*" # comprehensive, slow 

# list of ports
->% cat /etc/services 

# smartphone use Fing App
# List of devices on LAN on 2024-06-01
RASPBERRYPI             :: 192.168.1.24  SBC attached to TV
LENOVO_LEGION           :: 192.168.1.49  Windows Laptop
DONAGH_SATELLITYP50C    :: 192.168.1.86  Toshiba Laptop
Oppo A53s               :: 192.168.1.104 smartphone 
BRW3OF7722454BB         :: 192.168.1.111 Brother Printer    DCP-J412ODW
Mobile (Huawei)         :: 192.168.1.162 smartphone  
Galaxy-Tab-A            :: 192.168.1.199 Tablet



