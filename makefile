pdf:
	@pandoc -F pandoc-plot README.md \
		--metadata-file=metadata.yaml --mathjax \
        -F mermaid-filter -F pandoc-crossref --citeproc \
		--highlight-style pygments.theme \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=2 --number-sections --columns=80 \
		-o README.pdf
crossref:
	@pandoc crossref.md \
		--mathjax \
        -F pandoc-crossref --citeproc \
		--highlight-style pygments.theme \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=2 --number-sections --columns=80 \
		-o crossref.pdf
apendice:
	@pandoc -F pandoc-plot APENDICE.md \
		--metadata-file=metadata.yaml --mathjax \
        -F mermaid-filter -F pandoc-crossref --citeproc \
		--highlight-style pygments.theme \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=2 --number-sections --columns=80 \
		-o APENDICE.pdf

# install:
#  	sudo pacman -S pandoc texlive-most 
# 	wget raw.githubusercontent.com/citation-style-language/styles/master/ieee.csl
#   pandoc --print-highlight-style pygments > my.theme
#  	pandoc-plot
 

# pandoc-plot:
# 	git clone https://aur.archlinux.org/pandoc-plot-bin.git
# 	cd pandoc-plot-bin/
# 	makepkg -si
#   pip install matplotlib
#   wget https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -O plantuml.jar

