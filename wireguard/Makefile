CACHE_DIR   := $(shell pwd)/.latex-cache
SLIDES_SRC   = slides.tex
SLIDES_PDF   = slides.pdf

COMPILE_TEX := latexmk -xelatex -output-directory=$(CACHE_DIR)

slides.pdf: clean-cache $(CACHE_DIR)
	$(COMPILE_TEX) $(notdir $(SLIDES_SRC))
	@cp $(CACHE_DIR)/$(notdir $(SLIDES_PDF)) $(SLIDES_PDF)
	
clean-cache:
	@rm -rf "$(CACHE_DIR)"

$(CACHE_DIR):
	@mkdir -p $(CACHE_DIR)

