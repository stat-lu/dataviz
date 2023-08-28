RDIR = .

EXAMPLES_DIR = ./worked-examples/
EXAMPLES_SRC = $(wildcard $(EXAMPLES_DIR)*.Rmd)
EXAMPLES_OUT = $(EXAMPLES_SRC:.Rmd=.html)

QUIZZES_DIR = $(RDIR)/quizzes-and-assignments/quizzes/
QUIZZES_SRC = $(wildcard $(QUIZZES_DIR)*.Rmd)
QUIZZES_OUT = $(QUIZZES_SRC:.Rmd=.html)
QUIZZES_FILES = $(QUIZZES_SRC:.Rmd=_files)

ASSIGNMENTS_DIR = $(RDIR)/quizzes-and-assignments/assignments/
ASSIGNMENTS_SRC = $(wildcard $(ASSIGNMENTS_DIR)*.Rmd)
ASSIGNMENTS_OUT = $(ASSIGNMENTS_SRC:.Rmd=.html)
ASSIGNMENTS_FILES = $(ASSIGNMENTS_SRC:.Rmd=_files)

PAGES_DIR = ./pages/
PAGES_SRC = $(wildcard $(PAGES_DIR)*.Rmd)
PAGES_OUT = $(PAGES_SRC:.Rmd=.html)

LECTURES_DIR = ./lectures/
LECTURES_SRC = $(wildcard $(LECTURES_DIR)*.Rmd)
LECTURES_OUT = $(LECTURES_SRC:.Rmd=.html)

KNIT = Rscript -e "require(rmarkdown); render('$<')"

all: pages lectures examples assignments quizzes
	echo All files are now up to date

pages: $(PAGES_OUT)
	echo All files are now up to date

assignments: $(ASSIGNMENTS_OUT)
	echo All files are now up to date

quizzes: $(QUIZZES_OUT)
	echo All files are now up to date

lectures: $(LECTURES_OUT)
	echo All files are now up to date

examples: $(EXAMPLES_OUT)
	echo All files are now up to date

clean:
	rm -f $(EXAMPLES_OUT) $(LECTURES_OUT) $(PAGES_OUT) $(ASSIGNMENTS_OUT) $(QUIZZES_OUT)

$(EXAMPLES_DIR)%.html:$(EXAMPLES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "all")'

$(LECTURES_DIR)%.html:$(LECTURES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "all")'

$(PAGES_DIR)%.html:$(PAGES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "all")'

$(ASSIGNMENTS_DIR)%.html:$(ASSIGNMENTS_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "all")'

$(QUIZZES_DIR)%.html:$(QUIZZES_DIR)%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "all")'
