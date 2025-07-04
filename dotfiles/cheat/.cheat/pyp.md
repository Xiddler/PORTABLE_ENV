Opened 2023-09-24
https://github.com/hauntsaninja/pyp

Use python on the CLI
->% source /home/donagh/.virtualenvs/pypyp/bin/activate 

# pyp


# Calculator  - pyp like bc
pyp 'sqrt(5)'


# pyp like 
echo "The quick brown fox jumps over the lazy dog "  | pyp 'len(stdin.read())'
Output
45

# pyp like awk
seq 1 5 | pyp 'sum(map(int, lines))'
Output
15

# pyp like ${x##*.} - Xpath
ls | pyp 'Path(x).suffix'

# pyp like tail
ls | pyp 'lines[-10:]'


# others / math

pyp 'sin(69)'
-0.11478481378318722

pyp 'sin(45)'
0.8509035245341184

 pyp 'pi'
3.141592653589793

pyp 'e'
2.718281828459045
