pdf:
	@pandoc README.md --mathjax \
		-F mermaid-filter -F pandoc-crossref --citeproc \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=3 --number-sections --columns=80 \
		-o README.pdf
# 
# install:
# 	sudo pacman -S \
# 	pandoc pandoc-citeproc pandoc-crossref \
# 	texlive-core texlive-music pygmentize 
# 	wget raw.githubusercontent.com/citation-style-language/styles/master/ieee.csl
# 	pip install pygments jinja2 yaml
# 
