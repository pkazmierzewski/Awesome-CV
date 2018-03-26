.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
PK_DIR = pawel-kazmierzewski
RESUME_DIR = examples/resume
CV_DIR = examples/cv
CV-PK_DIR = pawel-kazmierzewski/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CV-PK_SRCS = $(shell find $(CV-PK_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv-pk.pdf: $(PK_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(PK_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(PK_DIR)/*.pdf
