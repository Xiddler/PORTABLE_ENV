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
