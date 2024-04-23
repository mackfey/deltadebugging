# Makefile; see License.txt for copyright and terms of use

VERSION := 2003.7.14

.SUFFIXES:
.PHONY: all dist check clean

all:; $(MAKE) -C src all

# Make a distribution.
dist:
	cvs export -D now delta
	$(MAKE) -C delta dist_build
	tar cvzf delta-$(VERSION).tar.gz delta

# Clean the distribution.
dist_clean:
	rm -rf delta
	rm -f delta-$(VERSION).tar.gz

dist_build:
	$(MAKE) -C src dist_build

check:; $(MAKE) -C test check

clean:
	$(MAKE) -C src clean
	$(MAKE) -C test clean
