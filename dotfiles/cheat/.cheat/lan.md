Opened 2024-12-07


# IP Addresses of LAN devices

2024-12-07
|-------------------|-------------------|
|                   |                   |
|  Device           |  IP Address       |
|                   |                   |
|-------------------|-------------------|
| Lenovo Win11      | 192.168.1.49      |
| Toshiba laptop    | 192.168.1.86      |
| Raspberry Pi      | 192.168.1.24 & 25 |
| Oppo smartphone   | 192.168.1.104     |
| Brother Printer   | 192.168.1.111     |
| Huawei phone      | 192.168.1.162     |
| Samsung Tablet    | 192.168.1.199     |
| Chromebook        | 192.168.1.51      |
|___________________|___________________|

## ip a

->% ip a

also to return json format

->% ip -j a

To parse the output of `ip -j a` do this python's json.tool: 
->% ip -j a | python -m json.tool 

or use the jq utility
->% ip -j a | jq '.[]'





## nmap on 2024-12-07
❯  nmap -sn 192.168.1.0/24
Starting Nmap 7.95 ( https://nmap.org ) at 2024-12-07 13:50 GMT
Nmap scan report for home (192.168.1.1)
Host is up (0.011s latency).
Nmap scan report for raspberrypi.home (192.168.1.24)
Host is up (0.013s latency).
Nmap scan report for donagh-satellitep50c.home (192.168.1.86)
Host is up (0.000060s latency).
Nmap scan report for BRW30F7722454B3.home (192.168.1.111)
Host is up (0.039s latency).
Nmap scan report for Galaxy-Tab-A.home (192.168.1.199)
Host is up (0.061s latency).
Nmap done: 256 IP addresses (5 hosts up) scanned in 6.36 seconds


# External IP Address

## 2025-07-04
->% ipe                 ◁-- Command (alias) to get external IP Address of router

88.87.169.214

## 2024-12-07

->% ipe                 ◁-- Command to get external IP Address of router

88.87.184.97
