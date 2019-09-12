CMD := latexmk -verbose -pdf
PDFLATEX := "pdflatex -interaction=nonstopmode -halt-on-error -shell-escape"

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.
slide: slide.tex
	$(CMD) -pdflatex=$(PDFLATEX) $^

clean:
	latexmk -c

all: slide

.PHONY: clean
