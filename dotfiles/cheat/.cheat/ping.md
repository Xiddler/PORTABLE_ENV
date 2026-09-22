# 
Accessed 2026-08-31 

# ping a host with a total count of 15 packets overall.    
ping -c 15 www.example.com

# ping a host with a total count of 15 packets overall, one every .5 seconds (faster ping). 
ping -c 15 -i .5 www.example.com

# test if a packet size of 1500 bytes is supported (to check the MTU for example)
ping -s 1500 -c 10 -M do www.example.com

# typical output of -> % ping -c4 8.8.8.8 (aliased to png) on 2022-02-21
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=112 time=15.5 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=112 time=26.9 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=112 time=15.5 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=112 time=17.2 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 15.489/18.774/26.887/4.733 ms

# ping all link-local devices on an interface:
Manj%> ping ff02::1%wlp2s0

_output_

64 bytes from fe80::ac7f:90db:8e1a:4879%wlp2s0: icmp_seq=1 ttl=64 time=0.045 ms
64 bytes from fe80::5e64:8eff:fe77:2f80%wlp2s0: icmp_seq=1 ttl=64 time=1.46 ms
64 bytes from fe80::c5f9:4fb6:f12a:8851%wlp2s0: icmp_seq=1 ttl=64 time=1.46 ms
64 bytes from fe80::faf:8c71:a877:4f29%wlp2s0: icmp_seq=1 ttl=64 time=4.24 ms
64 bytes from fe80::a48b:6bff:fe73:6465%wlp2s0: icmp_seq=1 ttl=64 time=164 ms
