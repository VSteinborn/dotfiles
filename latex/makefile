REQUIRED_FILES = preamble_beamer.tex	\
	sample_beamer.tex	\
	sample_beamer.bib	\

sample_beamer.pdf:$(REQUIRED_FILES)
	latexmk -pdf sample_beamer.tex && latexmk -c sample_beamer.tex

clean:
	latexmk -C