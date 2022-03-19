#!/bin/bash

# requires pandoc and wkhtmltopdf 

# orig_markdown=~/DONAGHS/personal/earning/earning.html
html_output=~/DONAGHS/personal/earning/earning.html
pdf_output=~/DONAGHS/personal/eaarning/earning.pdf


# pandoc --from=markdown_mmd+yaml_metadata_block --standalone --to=html -V css=style.css --output=$html_output $orig_markdown

# sleep 3

wkhtmltopdf -B 25mm -T 25mm -L 25mm -R 25mm -q -s A4 $html_output $pdf_output
