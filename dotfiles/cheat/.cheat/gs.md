# To reduce the size of a pdf file:
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output.pdf input.pdf

# produce a high-security redacted PDF with 300dpi full color
#
Using the mupdf command line tools:
-%> mutool draw -o output.pdf -F ocr.pdf -c rgb -r 300 in.pdf
will produce a high-security redacted PDF with 300dpi full color renderings of the page.

Using ghostscript:
```
-%> gs -o output.pdf -sDEVICE=pdfocr24 -r300 in.pdf
```
will do the same.

