install:
	sudo pacman -S ghc cabal-install pandoc texlive-most plantuml pandoc-crossref 
	make pandoc-plot
	pip install matplotlib

pdf:
	make lite
	cat article/*.md extra/md-pandoc.md extra/crossref.md  > README.md
	@pandoc README.md \
		--pdf-engine=lualatex \
		--metadata-file=metadata.yaml --mathjax \
        	-F pandoc-plot \
	        -F pandoc-crossref --citeproc \
		--highlight-style vendor/pygments.theme \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=2 --number-sections --columns=80 \
		-o README.pdf
		brave README.pdf

lite:
	cat ./article/*.md  > ./README-lite.md
	@pandoc ./README-lite.md -f markdown \
		--metadata-file=./metadata.yaml --mathjax \
	        -F pandoc-crossref --citeproc \
		--highlight-style ./vendor/pygments.theme \
		--template=plantilla --pdf-engine-opt=-shell-escape \
		-s --toc --toc-depth=2 --number-sections --columns=80 \
		-o ./README-lite.pdf

pandoc-plot:
	git clone https://aur.archlinux.org/pandoc-plot-bin.git
	cd ./pandoc-plot-bin;
	makepkg -si
	cd ../;
	rm pandoc-plot-bin -r

# crossref:
# 	@pandoc extra/crossref.md \
# 		--mathjax \
#         	-F pandoc-crossref --citeproc \
# 		--highlight-style vendor/pygments.theme \
# 		--pdf-engine-opt=-shell-escape \
# 		-s --columns=80 \
# 		-o extra/crossref.pdf
# apendice:
# 	@pandoc extra/md-pandoc.md
# 		--mathjax \
#         	-F pandoc-crossref --citeproc \
# 		--highlight-style vendor/pygments.theme \
# 		--pdf-engine-opt=-shell-escape \
# 		-s --columns=80 \
#        		-o extra/md-pandoc.pdf
# concat:
# 	pdfunite README.pdf extra/md-pandoc.pdf extra/crossref.pdf concat.pdf
# 
# 
# 
# mermaid-filter:
# 	sudo  npm install --global mermaid-filter
# 
# 
#--include-after-body=extra/md-pandoc.tex \
	#cat article/*.md extra/md-pandoc.md extra/crossref.md > README.md
	


# wget https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -O plantuml.jar
# pandoc --print-highlight-style pygments > my.theme
# wget raw.githubusercontent.com/citation-style-language/styles/master/ieee.csl


#https://github.com/raghur/mermaid-filter
#librsvg
