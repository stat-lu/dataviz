RDIR = .

EXAMPLES_DIR = ./worked-examples/
EXAMPLES_SRC = $(wildcard $(EXAMPLES_DIR)*.Rmd)
EXAMPLES_OUT = $(EXAMPLES_SRC:.Rmd=.html)

PAGES_DIR = ./pages/
PAGES_SRC = $(wildcard $(PAGES_DIR)*.Rmd)
PAGES_OUT = $(PAGES_SRC:.Rmd=.html)

LECTURES_DIR = ./lectures/
LECTURES_SRC = $(wildcard $(LECTURES_DIR)*.Rmd)
LECTURES_OUT = $(LECTURES_SRC:.Rmd=.html)

KNIT = Rscript -e "require(rmarkdown); render('$<')"

all: pages
	echo All files are now up to date

pages: $(PAGES_OUT)
	echo All files are now up to date

lectures: $(LECTURES_OUT)
	echo All files are now up to date

examples: $(EXAMPLES_OUT)
	echo All files are now up to date

clean:
	rm -f $(EXAMPLES_OUT) $(LECTURES_OUT)

$(EXAMPLES_DIR)%.html:$(EXAMPLES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<")'

$(LECTURES_DIR)%.html:$(LECTURES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<")'

$(PAGES_DIR)%.html:$(PAGES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<")'
