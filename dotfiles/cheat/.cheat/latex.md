Opened 2022-03-25

# Latex Extensions to Files

.tex LATEX or TEX input file. Can be compiled with latex.
.sty LATEX Macro package. Load this into your LATEX document using the\usepackage command.
.dtx Documented TEX. This is the main distribution format for LATEX stylefiles. If you process a .dtx file you get documented macro code of the LATEX package contained in the .dtx file.
.ins The installer for the files contained in the matching .dtx file. If you download a LATEX package from the net, you will normally get a .dtx and a .ins file. Run LATEX on the .ins file to unpack the .dtx file. 
.cls Class files define what your document looks like. They are selected with the \documentclass command.
.fd Font description file telling LATEX about new fonts. The following files are generated when you run LATEX on your input file:
.dvi Device Independent File. This is the main result of a classical LATEX compile run. Look at its content with a DVI previewer program or send it to a printer with dvips or a similar application. If you are using pdfLATEX then you should not see any of these files.
.log Gives a detailed account of what happened during the last compiler run.
.toc Stores all your section headers. It gets read in for the next compiler run and is used to produce the table of contents.
.lof This is like .toc but for the list of figures.
.lot And again the same for the list of tables.
.aux Another file that transports information from one compiler run to the next. Among other things, the .aux file is used to store information associated with cross-references.
.idx If your document contains an index. LATEX stores all the words that go into the index in this file. Process this file with makeindex. Refer to section 4.2 on page 74 for more information on indexing.
.ind The processed .idx file, ready for inclusion into your document on the next compile cycle.
.ilg Logfile telling what makeindex did.
