# Makefile; see License.txt for copyright and terms of use

# Makefile for delta/test.
# Daniel S. Wilkerson dsw@cs.berkeley.edu

DIRS := delta0 multidelta0
.SUFFIXES:
.PHONY: check clean
check:; for D in $(DIRS); do $(MAKE) -C $$D $@ || exit 1; done
clean:; for D in $(DIRS); do $(MAKE) -C $$D $@; done
