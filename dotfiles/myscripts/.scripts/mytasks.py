#!/usr/bin/python3
# encoding: utf-8

import csv

from rich.console import Console
from rich.table import Column, Table
from rich.text import Text # maybe not used

from rich import print
from rich.panel import Panel

console = Console()

csvfile = "/home/donagh/sd64/TODO/CSV/TODO.csv"

with open(csvfile, mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    line_count = 0
    table = Table(show_header=True, header_style="bold blue")
    table.add_column("*", style="bold red")
    table.add_column("S", justify="center", style="bold green")
    table.add_column("O", justify="center", style="bold cyan")
    table.add_column("D", justify="center", style="bold")
    table.add_column("#")
    table.add_column("TODO - DEFINED", width=60)
    table.add_column("#")
    table.add_column("TODO - OTHER", style="dim", width=60)
    for row in csv_reader:
        line_count += 1
        text0 = row["*"]
        text1 = Text(str(row["TODO"]))
        # table.add_row(row["*"], row["S"], row["O"], row["D"], row["#"], row["TODO"], row["##"], row["TODO lesser"]) # good 
        if row["TODO"] == "TODO – NOT-SO-NICE BUT NECESSARY":
            table.add_row('', '', '', '','',  '_________________________________________', '', '_________________________________________')
        # if line_count > 12: 
        if row["O"] == "O":
            text1.stylize(0, 61, style="bold cyan")
        # table.add_row(row["*"],  row["S"], row["O"], row["D"], row["#"], Panel(text1),  row["##"], row["TODO lesser"]) # Panel usage
        table.add_row(row["*"],  row["S"], row["O"], row["D"], row["#"], text1,  row["##"], row["TODO lesser"]) # good 
    console.print(table)



# print(Panel("Hello, [red]World!"))
