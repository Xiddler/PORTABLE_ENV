# to display pretty output

cat data.csv | column -t -s, | less -S

# tools for manipulating csv

csvkit: cslook,,
xsv: cat <file.csv> | xsv table

# use python to convert data to csv

data = [

    (1, 2, 3),

    (4, 5, 6),

    (7, 8, 9)

]



with open('output.csv', 'w') as f:

    for row in data:

        print(*row, sep=',', file=f)


Note the * operator it the "splat" operator;

