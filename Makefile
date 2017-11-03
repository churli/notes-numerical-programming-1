# Makefile per la TESI! :)

# vars
#RSYNC_OPTS=--links
BASEDIR=.
OUTDIR=$(BASEDIR)/Out
SECTIONSDIR=$(BASEDIR)/Sections
FILENAME=numerical_programming_1
KINDLEMOD=-kindle
# end vars

init:
	mkdir -p $(OUTDIR)
	touch $(FILENAME).tex
	touch $(FILENAME)$(KINDLEMOD).tex
compile:
	pdflatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME).tex
	xelatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
bibcompile:
	pdflatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME).tex
	bibtex $(OUTDIR)/$(FILENAME).aux
	pdflatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME).tex
	pdflatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME).tex
	xelatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
	bibtex $(OUTDIR)/$(FILENAME)$(KINDLEMOD).aux
	xelatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
	xelatex -output-directory $(OUTDIR) $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
compileauto:
	pdflatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME).tex
	xelatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
bibcompileauto:
	pdflatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME).tex
	bibtex $(OUTDIR)/$(FILENAME).aux
	pdflatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME).tex
	pdflatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME).tex
	xelatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
	bibtex $(OUTDIR)/$(FILENAME)$(KINDLEMOD).aux
	xelatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
	xelatex -output-directory $(OUTDIR) -interaction nonstopmode $(BASEDIR)/$(FILENAME)$(KINDLEMOD).tex
odtcompile:
	latex2html $(BASEDIR)/$(FILENAME).tex -dir $(OUTDIR) -split 0 -no_navigation -info "" -address "" -html_version 4.0,unicode
autocompile:
	./autocompile.loop.sh $(FILENAME)
push:
	git push
sync:
	push
# test:
# 	$(foreach s,$(TEST_FILES),go -m rsync -D -r -i $(s) -o r:~/public_html/etc/development/ phc -- $(RSYNC_OPTS);)
clean:
	rm $(OUTDIR)/*

#EOF
