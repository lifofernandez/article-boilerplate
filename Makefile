install:
	sudo pacman -S ghc cabal-install pandoc texlive-most plantuml pandoc-crossref 
	make pandoc-plot
	pip install matplotlib
pdf:
	@pandoc README.md \
		--metadata-file=metadata.yaml --mathjax \
        	-F pandoc-plot -F mermaid-filter -F pandoc-crossref --citeproc \
		--highlight-style pygments.theme \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=2 --number-sections --columns=80 \
		-o README.pdf
		brave README.pdf
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

pandoc-plot:
	git clone https://aur.archlinux.org/pandoc-plot-bin.git
	cd ./pandoc-plot-bin;
	makepkg -si
	cd ../;
	rm pandoc-plot-bin -r

mermaid-filter:
	sudo  npm install --global mermaid-filter

	


# wget https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -O plantuml.jar
# pandoc --print-highlight-style pygments > my.theme
# wget raw.githubusercontent.com/citation-style-language/styles/master/ieee.csl
#

