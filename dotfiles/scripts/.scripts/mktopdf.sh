#!/bin/bash
# 2019-03-10
# This script takes a markdown file as argument and make a .pdf version of it. 

# If there is no style sheet specified use the default.

style_css='/media/donagh/3520-FD13/2programming_repository/css/stylesheets/default_pdf.css'

if [ ! -f $style_css ]; then
    echo "Creating new file ./style.css";
    [ $(touch './style.css') ];
else
    echo "Default css file WAS found! Creating pdf...";
fi

orig_markdown=$1
base_name=$(echo "$1" | cut -f 1 -d '.')
html_output=$base_name'.html'
pdf_output=$base_name'.pdf'

echo "Working on it..."

pandoc --from=markdown_mmd+yaml_metadata_block --standalone --to=html -V css=$style_css --output=$html_output $orig_markdown

sleep 1

wkhtmltopdf -B 25mm -T 25mm -L 25mm -R 25mm -q -s A4 $html_output $pdf_output

# If you don't want to keep the intermediate .html file, then uncomment the next line.
# rm $base_name.html
