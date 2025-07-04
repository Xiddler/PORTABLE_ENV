# refs
zim-wiki --> MAJORS:json
# Tools for examining / manipulating json files
Json rules:
    json requires double quotes only
# Sample json file
/home/donagh/files/sample_files/users.json
{
  "users": [
    {
      "userId": 1,
      "firstName": "Krish",
      "lastName": "Lee",
      "phoneNumber": "123456",
      "emailAddress": "krish.lee@learningcontainer.com"
    },
    {
      "userId": 2,
      "firstName": "racks",
      "lastName": "jacson",
      "phoneNumber": "123456",
      "emailAddress": "racks.jacson@learningcontainer.com"
    },
    {
      "userId": 3,
      "firstName": "denial",
      "lastName": "roast",
      "phoneNumber": "33333333",
      "emailAddress": "denial.roast@learningcontainer.com"
    },
    {
      "userId": 4,
      "firstName": "devid",
      "lastName": "neo",
      "phoneNumber": "222222222",
      "emailAddress": "devid.neo@learningcontainer.com"
    },
    {
      "userId": 5,
      "firstName": "jone",
      "lastName": "mac",
      "phoneNumber": "111111111",
      "emailAddress": "jone.mac@learningcontainer.com"
    }
  ]
}
 ----------------------------------------------------------------
# CLI tools
##                   gron
Make JSON greppable!
See zim-wiki LINUX:1Linux Live USB:01installed apps:gron
How many losses did I have?
->%  gron 2programming_repository/python/2python_studies/json_handy/lichess_profile.json | grep loss | gron --ungron
##                   fx 
zim-wiki LINUX:1Linux Live USB:01installed apps:fx
Written in go. Interactive & non-interactive
https://fx.wtf/
https://github.com/antonmedv/fx
sample usage — non-interactive (because of the . after the fx )
->% cat data.json | fx . 'store.label[3].item' 
##                   jq
It's complicated.
zim-wiki LINUX:1Linux Live USB:01installed apps:jq
->%  jq . users.json
##                   python
Sample python file
    #!/usr/sbin/python3
    # encoding: utf-8
    import json
    myfile = 'users.json'
    with open(myfile, 'r') as json_file:
        object = json.load(json_file)
        pretty_object = json.dumps(object, indent=2)
        print(pretty_object)
##                   JSONPath
https://bump.sh/blog/how-to-use-json-path
# Pretty print json output on the CLI
_Example_

->%  ip -j a | python -m json.tool

[
    {
        "ifindex": 1,
        "ifname": "lo",
        "flags": [
            "LOOPBACK",
            "UP",
            "LOWER_UP"
        ],
        "mtu": 65536,
        "qdisc": "noqueue",
        "operstate": "UNKNOWN",
        "group": "default",
        "txqlen": 1000,
        "link_type": "loopback",
        "address": "00:00:00:00:00:00",
        "broadcast": "00:00:00:00:00:00",
        "addr_info": [
            {
                "family": "inet",
                "local": "127.0.0.1",
                "prefixlen": 8,
                "scope": "host",
                "label": "lo",
                "valid_life_time": 4294967295,
                "preferred_life_time": 4294967295
            },
            {
                "family": "inet6",
                "local": "::1",
                "prefixlen": 128,
                "scope": "host",
                "noprefixroute": true,
                "valid_life_time": 4294967295,
                "preferred_life_time": 4294967295
            }
        ]
    },
    {
        "ifindex": 2,
        "ifname": "enp8s0",
        "flags": [
            "NO-CARRIER",
            "BROADCAST",
            "MULTICAST",
            "UP"
        ],
        "mtu": 1500,
        "qdisc": "fq_codel",
        "operstate": "DOWN",
        "group": "default",
        "txqlen": 1000,
        "link_type": "ether",
        "address": "2c:60:0c:8a:6e:4f",
        "broadcast": "ff:ff:ff:ff:ff:ff",
        "altnames": [
            "enx2c600c8a6e4f"
        ],
        "addr_info": []
    },
    {
        "ifindex": 3,
        "ifname": "wlp7s0",
        "flags": [
            "BROADCAST",
            "MULTICAST",
            "UP",
            "LOWER_UP"
        ],
        "mtu": 1500,
        "qdisc": "noqueue",
        "operstate": "UP",
        "group": "default",
        "txqlen": 1000,
        "link_type": "ether",
        "address": "e4:f8:9c:0e:d0:26",
        "broadcast": "ff:ff:ff:ff:ff:ff",
        "altnames": [
            "wlxe4f89c0ed026"
        ],
        "addr_info": [
            {
                "family": "inet",
                "local": "192.168.1.86",
                "prefixlen": 24,
                "broadcast": "192.168.1.255",
                "scope": "global",
                "dynamic": true,
                "noprefixroute": true,
                "label": "wlp7s0",
                "valid_life_time": 65907,
                "preferred_life_time": 65907
            },
            {
                "family": "inet6",
                "local": "fe80::faf:8c71:a877:4f29",
                "prefixlen": 64,
                "scope": "link",
                "noprefixroute": true,
                "valid_life_time": 4294967295,
                "preferred_life_time": 4294967295
            }
        ]
    },
    {
        "ifindex": 4,
        "ifname": "docker0",
        "flags": [
            "NO-CARRIER",
            "BROADCAST",
            "MULTICAST",
            "UP"
        ],
        "mtu": 1500,
        "qdisc": "noqueue",
        "operstate": "DOWN",
        "group": "default",
        "link_type": "ether",
        "address": "02:42:73:df:f0:7e",
        "broadcast": "ff:ff:ff:ff:ff:ff",
        "addr_info": [
            {
                "family": "inet",
                "local": "172.17.0.1",
                "prefixlen": 16,
                "broadcast": "172.17.255.255",
                "scope": "global",
                "label": "docker0",
                "valid_life_time": 4294967295,
                "preferred_life_time": 4294967295
            }
        ]
    }
]
