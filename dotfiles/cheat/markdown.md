# headers
h1 header
=========
h2 header
---------

# blockquotes
> first level and paragraph
>> second level and first paragraph
>
> first level and second paragraph

# lists
## unordered - use *, +, or -
        * Red
        * Green
        * Blue

## ordered
        1. First
        2. Second
        3. Third

# code - use 4 spaces/1 tab
regular text
        code code code
or:
Use the `printf()` function

# hr's - three or more of the following
***
---
___

# markdown links

Rem: Square    Brackets -->  []  ()
This is [an example](http://example.com "Title") inline link.

 image
 Rem: Imagine banging the title into the file -->  Image ! Text Filepath
![Alt Text](/path/to/file.png)
 Example
![Backpacking items](/run/media/donagh/c60cbdfc-37a8-4e08-b2dd-6286d16beb3d/SD35-BACKUP/1donaghs-stuff/OUTDOOR/Images/00_Galtee_Overnighter_Sept2020/IMG_20200910_124754.jpg


# formatting
*em* _em_
**strong** __strong__
~~strikethrough~~

# markdown editors
marker      # simple and works well in Manjaro                   << PREFERRED usage -> % apostrophe <filename.md>
Ghostwriter # good, simple and works well in Manjaro
apostrophe  # lightweight and works on manjaro
marktext    # difficulty instally on manjaro / npm issues etc.
Abricotine  # difficulty instally on manjaro / npm issues etc.
Obsidian    # allows live preview of markdown files and has vim keybindings available

# markdown in vim - remove offending highlighting if visible 

:hi link markdownError Normal

# convert file.md to file.html

multimarkdown file.md > file.html

# multimarkdown is available in AUR; note added 2022-11-05;  
# https://fletcher.github.io/MultiMarkdown-6/MMD_Users_Guide.html

# styling markdown in vim with modified miramare theme

see /home/donagh/PORTABLE_ENV/vim/dotvim/pack/colorschemes/start/miramare/

To change the colors of the markdown headings got to the Pallette section of 
~/PORTABLE_ENV/vim/dotvim/pack/colorschemes/start/miramare/colors/miramare.vim
and make the color changes here. I don't know of another way. Donagh McCarthy 2024-10-03

# H1 Notes

## H2 Dub

### H3 Dub

#### H4 Dub

##### H5 Sub

###### H6 Mad

# MARKDOWN TOOLS

## myst-parser

https://myst-parser.readthedocs.io/en/latest/intro.html
https://www.sphinx-doc.org/en/master/usage/markdown.html#markdown

MyST is an extension of CommonMark Markdown, that includes a rich additional syntax for technical authoring, and can integrate with Docutils and Sphinx.
For example, MyST includes role and directive extensions points, to allow for richer features, such as admonitions and figures.

->% pip install myst-parser
We can now use the myst-docutils-demo CLI tool that came with the installed package to parse a file from markdown to HTML.

## pandoc

converts markdown files to other formats






