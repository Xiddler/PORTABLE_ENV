Opened 2023-11-01
Edited 2023-11-08

See zim-wiki  LINUX:1Linux Live USB:01installed apps:jq

# jq - json query utility

## Understanding

JSON Objects and Arrays

REM: A JSON file/document/entity can be an OBJECT { ... }  or an ARRAY [ ... ]

### JSON Object

A JSON object has a collection of key/value pairs inside { ... }

To get a specific element use . notation eg  ->% echo <json_object> | jq ' .name'



### JSON Array

A JSON array is a list inside [ .. ]

To get a specific element in the array, give jq an index:  eg ->% echo <json_array> | jq '.[4]'

## Usage examples

The simplest filter is the identity filter which returns all its input (.)

### OBJECT { ... }  - One object key = key 1, value = object { ... }

->% echo '{"key1":{"key2":"value1"}}' | jq '.'
Output
{
  "key1": {
	"key2": "value1"
  }
}

->% echo '{"key1":{"key2":"value1"}}' | jq '.["key1"]'
Output
{
  "key2": "value1"
}


### ARRAY [ ... ] — two items in the array: here item 1 is object with key/value pair  key = "key1" and the value an object { key/value } etc.

->% echo '[{"key1":{"key2":"value1"}}, {"key3":{"key4":"value2"}}]' | jq '.'
Output
[
  {
	"key1": {
	  "key2": "value1"
	}
  },
  {
	"key3": {
	  "key4": "value2"
	}
  }
]

->% echo '[{"key1":{"key2":"value1"}}, {"key3":{"key4":"value2"}}]' | jq '.[0]'
{
  "key1": {
	"key2": "value1"
  }
}


## General usage

->% jq . <filename.json>

### Access the value at key "foo"
jq '.foo'

### Access first list item
jq '.[0]'

### Slice & Dice
jq '.[2:4]'
jq '.[:3]'
jq '.[-2:]'



