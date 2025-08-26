#!/bin/bash
#
# generate workshop html slide show 

pandoc\
 -t revealjs\
 -s\
 -o workshop.html\
 workshop.md\
 -V revealjs-url=https://unpkg.com/reveal.js/\
 --include-in-header=assets/slides.css\
 -V theme=serif

pandoc workshop.md\
 -o workshop.pptx

pandoc\
 -t beamer\
 -o workshop.pdf\
 workshop.md
