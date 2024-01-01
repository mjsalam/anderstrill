#!/bin/sh


IFS=$'\n'
blog="/Users/msalam/Documents/hugo/mjsalam.com"
  
cd $blog
git add --all
git commit -m 'conversion from Obsidian vault'
git push