
ifeq ($(IEAD_TOOLS_ROOT),)
$(error Environment variable "IEAD_TOOLS_ROOT" is unset)
endif

TMP_DIR := tmp
TOKENS_DIR := tmp/tokens

BIN_DIR := $(IEAD_TOOLS_ROOT)/bin
XSDVALID := $(BIN_DIR)/xsdvalid
PROCESS_DOC = $(BIN_DIR)/process-doc

DOC_NAME = hlva
DOC_SRC = $(DOC_NAME).xml
DOC_DEST_HTML = $(DOC_NAME).html
DOC_DEST_TEXT = $(DOC_NAME).txt

XML_PASS := $(wildcard examples/*.pass/*.xml)
XML_PASS_XSD_VALID_TOKENS := $(patsubst %,$(TOKENS_DIR)/xml-pass-xsd-valid/%,$(XML_PASS))

VALID_TOKENS := $(XML_PASS_XSD_VALID_TOKENS)

DEPEND_MK = tmp/dependencies.mk

default:
	@echo Bravely doing nothing.
	@ $(MAKE) help

-include $(DEPEND_MK)

help:
	@echo targets:
	@echo ' ' all: generate all files
	@echo ' ' doc: regenerate the HTML
	@echo ' ' clean: clean up temporaries and junk
	@echo ' ' distclean: clean up everything that could be generated
	@echo ' ' valid: validate test instances against schemas

all: $(DOC_DEST_HTML) $(DOC_DEST_TEXT)

$(DOC_DEST_HTML): $(DOC_SRC) $(DOC_HTML_REQUIRED_FILES)
	$(PROCESS_DOC) -html -in $< -out $@
	$(RM) tmp.$(DOC_SRC).html $(DOC_SRC).xhtml

$(DOC_DEST_TEXT): $(DOC_SRC) $(DOC_TEXT_REQUIRED_FILES)
	$(PROCESS_DOC) -plaintext -in $< -out $@

valid: $(VALID_TOKENS) conformance-report.txt

$(TOKENS_DIR)/xml-pass-xsd-valid/%: %
	$(XSDVALID) -catalog xsd/catalog.xml $<
	mkdir -p $(dir $@)
	touch $@

.PHONY: xsd-html
xsd-html: mpd-catalog.html

.PHONY: mpd-catalog.html
mpd-catalog.html: 
	mkdir -p tmp
	$(BIN_DIR)/markup-schemas -out $@ -tmp tmp -title 'MPD catalog' $(shell find xsd -type f -name '*.xsd' -print)

.PHONY: conformance-report.txt
conformance-report.txt: 
	$(HOME)/working/ndr3/bin/validate --make xsd/mpd-catalog-3.0.xsd > $@ 

.PHONY: clean
clean:
	$(RM) $(wildcard *~) $(wildcard tmp.*) 
	$(RM) -rf $(wildcard tmp)
	$(RM) -f $(wildcard *.sch.text.xsl)
	find . -type f -name '*~' -print0 | xargs -0 $(RM)
	find . -type f -name '#*' -print0 | xargs -0 $(RM)
	find -L . -name '.#*' -print0 | xargs -0 $(RM)

.PHONY: distclean
distclean: clean
	$(RM) $(DOC_DEST_HTML) $(DOC_SRC).xhtml

.PHONY: doc
doc: $(DOC_DEST_HTML)

.PHONY: depend
depend: $(DEPEND_MK)

$(DEPEND_MK): $(DOC_SRC)
	mkdir -p $(dir $@)
	$(PROCESS_DOC) -makedepend -in $< -out $@

img/%.png.width.txt:
	touch $@

.PHONY: widths
widths:
	cd img; \
	for f in *.png; do identify -format '%w\n' $$f > $$f.width.txt; done

