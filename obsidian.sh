#!/bin/sh


IFS=$'\n'
blog="/Users/msalam/Documents/hugo/Anders Trill.com"
dir="/Users/msalam/Documents/hugo/Anders Trill.com/content/posts"
obs="/Users/msalam/Library/Mobile Documents/com~apple~CloudDocs/MS Cloud/Vaults/MSalam.2023/"
static="/Users/msalam/Documents/hugo/Anders Trill.com/static/"
  
  
cd $dir ; grep -rl 'publish: true' $obs |xargs -I {} cp {} $dir
for file in $(find ${dir} -type f -name "*.md"); do
	for priloha in $(perl -p -e 's/\%(\w\w)/chr hex $1/ge' ${file} | grep "\[.*\]\(.*\)" | perl -ne 'm/\[\[(.*)\]\]/ && print $1."\n"' | grep -v ".md$"); do
		find $obs -name $priloha |xargs -I {} cp {} $static
	done
	perl -p -i -e 's/\[\[(\w+)\]\]/\[image\]\(\/obsidian\/$1\)/g' ${file}
	sed -i -e "/\[\w+]\(\w+\)/ s/ /%20/g" ${file}
done
  
# cd $blog
# git add --all
# git commit -m 'conversion from Obsidian vault'
# git push