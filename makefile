install:
	sudo pacman -S \
	pandoc pandoc-citeproc pandoc-crossref \
	texlive-core texlive-music pygmentize 
	# pip install pygments jinja2 yaml
	
pdf:
	@pandoc README.md --mathjax \
		-F pandoc-crossref --citeproc -F mermaid-filter \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=3 --number-sections --columns=80 \
		-o README.pdf
#-F pandoc-crossref \
