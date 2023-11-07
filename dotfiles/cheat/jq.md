Opened 2023-11-01


# jq - json query utility

## Usage
->% jq . <filename.json>

### Access the value at key "foo"
jq '.foo'

### Access first list item
jq '.[0]'

### Slice & Dice
jq '.[2:4]'
jq '.[:3]'
jq '.[-2:]'



